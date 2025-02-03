<?php

namespace App\Console\Commands;

use Exception;
use App\Models\Sms;
use App\Traits\SMSTrait;
use Illuminate\Console\Command;

class SendSms extends Command
{
    use SMSTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'send:sms';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $smses = Sms::where(['try'=>0])->limit(50)->get(['id','phone_number','message', 'msisdn']);
        $success=[];
        $fails=[];
        Sms::whereIn('id',$smses->pluck('id'))->update(['try'=>1]);
        foreach ($smses as $sms) {
            try {
                $data = $this->send($sms->message,$sms->phone_number);
                if ($data['success'] && $data['success'] = 1) {
                    $success[] = $sms->id;
                }
            } catch (Exception $e) {
                logger($e->getMessage());
                $fails[] = $sms->id;
                //$sms->update(['try'=>1]);
            }
        }
        if(count($success)) Sms::whereIn('id',$success)->update(['is_sent'=>1,'status'=>1]);
        //Sms::whereIn('id',$fails)->update(['is_sent'=>1]);
    }
}
