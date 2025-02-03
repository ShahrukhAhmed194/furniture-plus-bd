<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sms', function (Blueprint $table) {
            $table->id();
            $table->string('name', 191)->nullable();
            $table->string('msisdn', 191)->nullable();
            $table->string('phone_number', 50);
            $table->string('sms_type', 20)->nullable();
            $table->text('message');
            $table->text('info')->nullable();
            $table->boolean('status')->default(false);
            $table->boolean('is_sent')->default(false);
            $table->integer('try')->default(false);
            $table->string('relationable_type',191)->nullable();
            $table->unsignedBigInteger('relationable_id')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->string('ip', 50)->nullable();
            $table->text('browser')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sms');
    }
};
