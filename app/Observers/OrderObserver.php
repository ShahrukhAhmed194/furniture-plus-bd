<?php

namespace App\Observers;

use App\Models\Order\Order;
use App\Traits\SMSTrait;

class OrderObserver
{
    use SMSTrait;
    /**
     * Handle events after all transactions are committed.
     *
     * @var bool
     */
    public $afterCommit = true;

    /**
     * Handle the Order "created" event.
     *
     * @param  \App\Models\Order\Order  $order
     * @return void
     */
    public function created(Order $order)
    {
        try {
            // Send Order SMS
            $parameter = [
                "{name}" => $order->full_name,
                "{order_id}" => $order->id,
                "{web_url}" => env('APP_WEB_URL')
            ];
            $smsBody = $this->sMSTemplate('New Order', $parameter);

            if($smsBody){
                //$phone_code = $user->Country->phonecode ?? null;
                $this->smsStore($smsBody, $order->mobile_number, "\App\Models\Order\Order",$order->id);
            }
        }catch (\Exception $exception){
            logger($exception->getMessage());
        }

    }

    /**
     * Handle the Order "updated" event.
     *
     * @param  \App\Models\Order\Order  $order
     * @return void
     */
    public function updated(Order $order)
    {
        //
    }

    /**
     * Handle the Order "deleted" event.
     *
     * @param  \App\Models\Order\Order  $order
     * @return void
     */
    public function deleted(Order $order)
    {
        //
    }

    /**
     * Handle the Order "restored" event.
     *
     * @param  \App\Models\Order\Order  $order
     * @return void
     */
    public function restored(Order $order)
    {
        //
    }

    /**
     * Handle the Order "force deleted" event.
     *
     * @param  \App\Models\Order\Order  $order
     * @return void
     */
    public function forceDeleted(Order $order)
    {
        //
    }
}
