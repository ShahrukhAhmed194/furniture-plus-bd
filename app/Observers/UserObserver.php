<?php

namespace App\Observers;

use App\Models\User;
use App\Traits\SMSTrait;

class UserObserver
{
    use SMSTrait;
    /**
     * Handle events after all transactions are committed.
     *
     * @var bool
     */
    public $afterCommit = true;

    /**
     * Handle the User "created" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function created(User $user)
    {
        try {
            // Send Order SMS
            $parameter = [
                "{mobile}" => $user->mobile_number,
                "{web_url}" => env('APP_WEB_URL')
            ];
            $smsBody = $this->sMSTemplate('New User', $parameter);

            if($smsBody){
                //$phone_code = $user->Country->phonecode ?? null;
                $this->smsStore($smsBody, $user->mobile_number, "\App\Models\User",$user->id);
            }
        }catch (\Exception $exception){
            logger($exception->getMessage());
        }

    }

    /**
     * Handle the User "updated" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function updated(User $user)
    {
        //
    }

    /**
     * Handle the User "deleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function deleted(User $user)
    {
        //
    }

    /**
     * Handle the User "restored" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function restored(User $user)
    {
        //
    }

    /**
     * Handle the User "force deleted" event.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    public function forceDeleted(User $user)
    {
        //
    }
}
