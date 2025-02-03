<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\PasswordReset;
use App\Models\User;
use App\Traits\SMSTrait;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Hash;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;
    use SMSTrait;
    public function forgetPass(Request $request)
    {
        return view('front.auth.forget-password');
    }

    public function sentVerificationCode(Request $request)
    {
        $data = validator($request->all(),[
            'phone_number'=>'required|string|exists:users,mobile_number'
        ])->validate();
        $chk = PasswordReset::where('email',$data['phone_number'])->whereDate('created_at',Carbon::today())->count();
        if ($chk > 7) return redirect()->back()->with(['error'=>'You requested too many time pleas try again after few time']);
        $otp = rand(111111,999999);
        PasswordReset::create(['email'=>$data['phone_number'],'token'=>$otp,'created_at'=>now()]);
        $message = "Your verification code is ".$otp;

        //$this->smsStore($message,$data['phone_number']);
        $this->send($message,$data['phone_number']);
        return redirect('forget-password?phone_number='.$data['phone_number']."&otp=true")->with(['success'=>'Verification code sent to your phone number']);
    }

    public function verifyOtp(Request $request)
    {
        $data = validator($request->all(),[
            'phone_number'=>'required|string|exists:users,mobile_number',
            'otp'=>'required|string|max:6|min:6',
        ])->validate();
        $pwd = PasswordReset::where(['email'=>$data['phone_number'],'token'=>$data['otp']])->where('created_at','>=',Carbon::now()->subMinutes(5))->first();
        if (isset($pwd->email)) {
            $rand_val = uniqid();
            Cache::put($data['phone_number'],$rand_val,5000);
            return redirect('forget-password/set/new/pass/'.$data['phone_number'].'/'.$rand_val);
        }
        return redirect()->back()->with(['error'=>'Invalid verification code or expire']);
    }

    public function passwordSetPage(Request $request, $phone_number, $uid)
    {
        if (!Cache::get($phone_number) ) return redirect('/')->with(['error'=>'Invalid request']);
        if (Cache::get($phone_number) != $uid ) return redirect('/')->with(['error'=>'Invalid request']);
        return view('front.auth.new-password',compact('phone_number','uid'));
    }

    public function passSetNew(Request $request, $phone_number, $uid)
    {
        $data = validator($request->all(),[
            'password'=>'required|string|min:6|max:191|confirmed',
        ])->validate();
        if (!Cache::get($phone_number) ) return redirect('/')->with(['error'=>'Invalid request']);
        if (Cache::get($phone_number) != $uid ) return redirect('/')->with(['error'=>'Invalid request']);

        User::where('mobile_number',$phone_number)->update(['password'=>Hash::make($data['password'])]);
        Cache::forget($phone_number);

        return  redirect()->route('login')->with(['success'=>"Password change successfully"]);
    }
}
