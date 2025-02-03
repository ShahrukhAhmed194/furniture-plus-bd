<?php

namespace App\Http\Controllers\Back;

use App\{
    Models\EmailTemplate,
    Http\Controllers\Controller,
};
use App\Models\App;
use Illuminate\Http\Request;

class EmailSettingController extends Controller
{

    /**
     * Constructor Method.
     */
    public function __construct()
    {

    }

    /**
     * Show the form for updating resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function email()
    {
        return view('back.settings.email',[
            'datas' => EmailTemplate::get()
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(EmailTemplate $template)
    {
        return view('back.email_template.edit',compact('template'));
    }

    public function emailUpdate(Request $request)
    {

        $request->validate([
            "email_host" => "required:max:200",
            "email_port" => "required|max:10",
            "email_encryption" => "required|max:10",
            "email_user" => "required|max:100",
            "email_pass" => "required|max:100",
            "email_from" => "required|max:100",
            "email_from_name" => "required|max:100",
            "contact_email" => "required|max:100",
        ]);
        $where = array();
        $where['group'] = 'email';
        if ($request->input('smtp_check')) {
            $where['name'] = 'smtp_check';
            $insert['value'] = $request->smtp_check;
            App::updateOrInsert($where, $insert);
        }else{
            $where['name'] = 'smtp_check';
            $insert['value'] = 0;
            App::updateOrInsert($where, $insert);
        }

        if ($request->input('email_host')) {
            $where['name'] = 'email_host';
            $insert['value'] = $request->email_host;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_port')) {
            $where['name'] = 'email_port';
            $insert['value'] = $request->email_port;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_encryption')) {
            $where['name'] = 'email_encryption';
            $insert['value'] = $request->email_encryption;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_user')) {
            $where['name'] = 'email_user';
            $insert['value'] = $request->email_user;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_pass')) {
            $where['name'] = 'email_pass';
            $insert['value'] = $request->email_pass;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_from')) {
            $where['name'] = 'email_from';
            $insert['value'] = $request->email_from;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('email_from_name')) {
            $where['name'] = 'email_from_name';
            $insert['value'] = $request->email_from_name;
            App::updateOrInsert($where, $insert);
        }
        if ($request->input('contact_email')) {
            $where['name'] = 'contact_email';
            $insert['value'] = $request->contact_email;
            App::updateOrInsert($where, $insert);
        }

        return redirect()->back()->withSuccess(__('Data Updated Successfully.'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,EmailTemplate $template)
    {
        $template->update($request->all());
        return redirect()->route('back.setting.email')->withSuccess(__('Email Template Updated Successfully.'));
    }


}
