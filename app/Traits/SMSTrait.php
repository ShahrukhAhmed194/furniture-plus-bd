<?php

namespace App\Traits;
use App\Models\App;
use App\Models\Sms;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

trait SMSTrait
{
    protected function commonFields(): array
    {
        $request = \request();
        return [
            'ip' => $request->ip(),
            'browser' => $request->userAgent(),
            'created_by' => auth()->id() ?? null,
            'updated_by' => auth()->id() ?? null,
        ];
    }

    protected function storeMetadata(Request $request): array
    {
        return [
            'ip' => $request->ip(),
            'browser' => $request->userAgent(),
            'created_by' => auth()->id() ?? null,
        ];
    }

    protected function updateMetadata(Request $request): array
    {
        return [
            'updated_by' => auth()->id() ?? null,
        ];
    }
    public static function web($group, $column){
        $query = App::where('group', $group)->where('name', $column)->where('status', 1)->first();

        if ($query){
            return $query->value;
        }else{
            return null;
        }
    }
    public static function send($body, $to, $phone_code = null){
        if (self::web('sms', 'smsProvider') == 'infobuzzer') {
            $mySMSArray = array();
            // Create a json array of your sms
            $row_array['trxID'] = (new static)->udate('YmdHisu');
            $row_array['trxTime'] = date('Y-m-d H:i:s');

            $mySMSArray[0]['smsID'] = (new static)->udate('YmdHisu');
            $mySMSArray[0]['smsSendTime'] = date('Y-m-d H:i:s');
            $mySMSArray[0]['mask'] = 'maskName';
            // Generate Number
            if ($phone_code) {
                if ($phone_code != 880) {
                    $smsNumber = '00' . str_replace('+', '', $phone_code) . $to;
                } else {
                    $smsNumber = $to;
                }
            } else {
                $smsNumber = $to;
            }
            $mySMSArray[0]['mobileNo'] = $smsNumber;
            $mySMSArray[0]['smsBody'] = $body;

            $row_array['smsDatumArray'] = $mySMSArray;
            $myJSonDatum = json_encode($row_array);
            return (new static)->sendSMS($myJSonDatum);
        } elseif (self::web('sms', 'smsProvider') == 'mshastra') {
            $local = false;
            // Generate Number
            if ($phone_code) {
                // Change Phone Code
                if ($phone_code == 880) {
                    $phone_code = 88;
                }

                if ($phone_code == 966) {
                    $local = true;
                }
            }

            $allNumbers = $phone_code . $to;

            // Send SMS
            $username = self::Web('sms', 'username');
            $password = self::Web('sms', 'password');
            $masking = ($local) ? 'MOBSMS' : 'GlobalSMS';
            $url = "http://mshastra.com/sendurlcomma.aspx?user=" . $username . "&pwd=" . $password . "&senderid=" . $masking . "&mobileno=" . $allNumbers . "&msgtext=" . urlencode($body) . "&CountryCode=ALL";
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $curl_scraped_page = curl_exec($ch);
            curl_close($ch);
            return ['success' => 1];
        }
        elseif (self::web('sms', 'smsProvider') =="103.69.149.50"){
            return self::sentSmsCustom($body, $to, $phone_code);
        }
        return ['success' => 0];
    }

    // UDate
    public function udate($format, $utimestamp = null)
    {
        $m = explode(' ', microtime());
        list($totalSeconds, $extraMilliseconds) = array($m[1], (int)round($m[0] * 1000, 3));
        return date("YmdHis", $totalSeconds) . sprintf('%03d', $extraMilliseconds);
    }

    // Infobazar SMS API
    public function sendSMS($myJSonDatum, $custom_username = null, $custom_password = null)
    {
        // Specify the url
        $url = "http://api.infobuzzer.net/v3.1/SendSMS/sendSmsInfoStore";

        if ($ch = curl_init($url)) {
            //Your valid username & Password ----------Please update those field
            $username = $custom_username ?? self::web('sms', 'username');
            $password = $custom_password ?? self::web('sms', 'password');

            curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
            curl_setopt($ch, CURLOPT_USERPWD, $username . ':' . $password);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json', 'Content-Length: ' . strlen($myJSonDatum)));
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $myJSonDatum);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 300);
            curl_exec($ch);
            curl_close($ch);
            return ['success' => 1];
        }
    }

    //103.69.149.50 sms sent

    public static function sentSmsCustom($body, $to, $phone_code = null)
    {
        try {
            $apiKey = self::web('sms', 'username');
            $apiSecret = self::web('sms', 'password');
            if ($phone_code) {
                // Change Phone Code
                if ($phone_code == 880) {
                    $phone_code = 88;
                }

                if ($phone_code == 966) {
                    $local = true;
                }
            }else{
                if (Str::length($to) == 11) $to = '88'.$to;
            }

            $allNumbers = $phone_code . $to;

            // Specify the url
            //$response = Http::get("http://103.69.149.50/api/v2/SenderId?ApiKey=".$apiKey."&ClientId=".$apiSecret.");
            $response = Http::get('http://103.69.149.50/api/v2/SenderId', [
                'ApiKey' => $apiKey,
                'ClientId' => $apiSecret,
            ]);
            $data = $response->json();
            $senderId = $data['Data'][0]['SenderId'];

            $response = Http::get('http://103.69.149.50/api/v2/SendSMS', [
                'ApiKey' => $apiKey,
                'ClientId' => $apiSecret,
                'SenderId' => $senderId,
                'Message' => $body,
                'MobileNumbers' => $allNumbers,
            ]);
            return ['success' => 1];
        }catch (\Exception $e){
            return ['success' => 0];
        }
    }

    public static function sMSTemplate($name, $parameter){

        $query = App::where('group', 'smsTemplate')->where('name', $name)->where('status',1)->first();

        if(isset($query->id) && $query->value){
            $text = str_replace(
                array_keys($parameter),
                array_values($parameter),
                $query->value
            );

            return $text;
        }
        return null;
    }

    private function smsStore($message,$phone_number, $relation_type=null, $relation_id=null)
    {
        $data =[
            'name'=>'',
            'msisdn'=>'',
            'phone_number'=>$phone_number,
            'sms_type'=>'eng',
            'message'=>$message,
            'status'=>0,
            'is_sent'=>0,
            'try'=>0,
            'relationable_type'=>$relation_type,
            'relationable_id'=>$relation_id,
        ]+self::commonFields();
        Sms::create($data);
    }
}
