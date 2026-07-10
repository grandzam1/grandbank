<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIrsRefundSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('irs_refund_settings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->decimal('min_amount', 12, 2)->default(0);
            $table->decimal('max_amount', 12, 2)->default(10000);
            $table->decimal('processing_fee', 5, 2)->default(0);
            $table->unsignedInteger('processing_time')->default(5);
            $table->text('instructions')->nullable();
            $table->boolean('enable_refunds')->default(true);
            $table->boolean('require_verification')->default(true);
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
        Schema::dropIfExists('irs_refund_settings');
    }
}
