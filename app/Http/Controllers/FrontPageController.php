<?php

namespace App\Http\Controllers;

use App\Landing;
use App\Repositories\FBConversionRepo;
use Illuminate\Http\Request;

class FrontPageController extends Controller
{
    public function fbTrackLanding($id, Request $request){
        $landing = Landing::first($id);

        if($landing->server_track == 'Yes' && $landing->pixel_id && $landing->pixel_access_token){
            if(count((array)$request->data)){
                return FBConversionRepo::track($request->track_type, $landing->pixel_id, $landing->pixel_access_token, ((array)$request->data));
            }
            return FBConversionRepo::track($request->track_type, $landing->pixel_id, $landing->pixel_access_token);
        }

        return 'false';
    }
}
