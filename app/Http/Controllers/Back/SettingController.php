<?php

namespace App\Http\Controllers\Back;

use Illuminate\Http\Request;

use App\{Http\Controllers\Controller, Models\App};

class SettingController extends Controller
{

    /**
     * Show the form for updating resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function social()
    {
        return view('back.settings.social',[
            'google_url' => url('/auth/google/callback'),
            'facebook_url' => preg_replace("/^http:/i", "https:", url('/auth/facebook/callback'))
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $request->validate([
            'facebook_check'      => 'nullable',
            'facebook_client_id'      => 'nullable|max:191|string',
            'facebook_client_secret'   => 'nullable|string|max:191',
            'google_check'      => 'nullable',
            'google_client_id'      => 'nullable|max:191|string',
            'google_client_secret'   => 'nullable|string|max:191'
        ]);
        $where = array();
        $where['group'] = 'social';
        if ($request->input('facebook_check')) {
            $where['name'] = 'facebook_check';
            $insert['value'] = $request->facebook_check;
            App::updateOrInsert($where, $insert);
        }else{
            $where['name'] = 'facebook_check';
            $insert['value'] = 0;
            App::updateOrInsert($where, $insert);
        }

        if ($request->input('facebook_client_id')) {
            $where['name'] = 'facebook_client_id';
            $insert['value'] = $request->facebook_client_id;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('facebook_client_secret')) {
            $where['name'] = 'facebook_client_secret';
            $insert['value'] = $request->facebook_client_secret;
            App::updateOrInsert($where, $insert);
        }

        if ($request->input('google_check')) {
            $where['name'] = 'google_check';
            $insert['value'] = $request->google_check;
            App::updateOrInsert($where, $insert);
        }else{
            $where['name'] = 'google_check';
            $insert['value'] = 0;
            App::updateOrInsert($where, $insert);
        }

        if ($request->input('google_client_id')) {
            $where['name'] = 'google_client_id';
            $insert['value'] = $request->google_client_id;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('google_client_secret')) {
            $where['name'] = 'google_client_secret';
            $insert['value'] = $request->google_client_secret;
            App::updateOrInsert($where, $insert);
        }

        return redirect()->back()->with('success-alert', 'Information updated successful.');
    }
}
