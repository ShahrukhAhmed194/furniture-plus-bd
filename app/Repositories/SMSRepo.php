<?php

namespace App\Repositories;
use Illuminate\Support\Facades\Http;

class SMSRepo {
    public static function sendJaduSMS($mobile_number, $sms_body, $type = 'non-masking'){
        // non-masking
        // masking
        try {
            $url = 'https://portal.jadusms.com/smsapi/' . $type;

            $response = Http::withoutVerifying()->get($url, [
                'api_key' => '$2y$10$XDSGiAF7N/UEbbwwJ.Rs/OmAfchQvDtbu8gmq6JfbcYJ5nYnQ2FA2',
                'mobileNo' => '88' . $mobile_number,
                'smsContent' => $sms_body,
                'maskingID' => 'LTM',
                'smsType' => 'text',
            ]);
            $statusCode = $response->status();
            $body = $response->body();
            dd($body);

            return true;
        } catch (\Exception $e) {
            return false;
        }

        return false;
    }
}
