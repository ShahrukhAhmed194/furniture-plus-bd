<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Info;
use View;

class Controller extends BaseController
{
    public function __construct() {
        /*$data = cache()->remember('general_settings', (60 * 60 * 24 * 90), function()
        {
            return Info::SettingsGroupKey('general');
        });
        View::share ('settings_g', $data);*/

        /*$template = 0;
        $template2 = cache()->remember('template', (60 * 60 * 24 * 90), function()
        {
            return Info::settings('general','template');
        });
        if(isset($template2)) $template = $template2;
        View::share ('template', $template);*/
        View::share ('container', 'container-sm mx-auto px-2 md:px-10');
    }

    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
