<?php

namespace App\Http\Controllers\User;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Laravel\Socialite\Facades\Socialite;
use App\{Models\User, Http\Controllers\Controller, Traits\SMSTrait};
use Illuminate\Http\Request;

class SocialLoginController extends Controller
{
    use SMSTrait;
    public function __construct()
    {
      Config::set('services.google.client_id', $this->web('social', 'google_client_id'));
      Config::set('services.google.client_secret', $this->web('social', 'google_client_secret'));
      Config::set('services.google.redirect', url('/auth/google/callback'));

      Config::set('services.facebook.client_id', $this->web('social', 'facebook_client_id'));
      Config::set('services.facebook.client_secret', $this->web('social', 'facebook_client_secret'));
      Config::set('services.facebook.redirect', preg_replace("/^http:/i", "https:", url('/auth/facebook/callback')));
    }

    public function redirectToProvider($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

    public function handleProviderCallback($provider)
    {

        try
        {
            $socialUser = Socialite::driver($provider)->user();
        }
        catch(\Exception $e)
        {
            dd($e);
            //return redirect('/');
        }
   

            if(User::where('email',$socialUser->email)->exists())
            {
                $auser = User::where('email',$socialUser->email)->first();
                Auth::login($auser);
                return redirect()->route('auth.dashboard');
            }else{
                $name = $this->split_name($socialUser->name);
                $user = new User;
                $user->email = $socialUser->email;
                $user->first_name = $name[0];
                $user->last_name = $name[1];
                $user->save();
    
               
               /* Notification::create([
                    'user_id' => $user->id
                ]);
    
                $emailData = [
                    'to' => $user->email,
                    'type' => "Registration",
                    'user_name' => $user->displayName(),
                    'order_cost' => '',
                    'transaction_number' => '',
                    'site_title' => env('APP_Name'),
                ];*/
    
                //$email = new EmailHelper();
            }
            //create a new user and provider
        Auth::login($user);
        return redirect()->route('auth.dashboard');

    }

    function split_name($name) {
        $name = trim($name);
        $last_name = (strpos($name, ' ') === false) ? '' : preg_replace('#.*\s([\w-]*)$#', '$1', $name);
        $first_name = trim( preg_replace('#'.$last_name.'#', '', $name ) );
        return array($first_name, $last_name);
    }

}
