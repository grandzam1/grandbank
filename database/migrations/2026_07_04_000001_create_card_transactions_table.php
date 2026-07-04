<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCardTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (Schema::hasTable('card_transactions')) {
            return;
        }

        Schema::create('card_transactions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('card_id');
            $table->unsignedBigInteger('user_id')->nullable();
            $table->decimal('amount', 16, 2);
            $table->string('currency', 10)->default('USD');
            $table->string('transaction_type')->nullable(); // purchase, refund, fee, topup, deduction
            $table->string('transaction_reference')->nullable();
            $table->string('merchant_name')->nullable();
            $table->string('merchant_category')->nullable();
            $table->string('merchant_city')->nullable();
            $table->string('merchant_country')->nullable();
            $table->string('status')->default('completed'); // pending, completed, failed, disputed
            $table->text('description')->nullable();
            $table->timestamp('transaction_date')->nullable();
            $table->timestamp('settlement_date')->nullable();
            $table->timestamps();

            $table->index('card_id');
            $table->index('user_id');
            $table->index('transaction_date');
            $table->index('transaction_reference');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('card_transactions');
    }
}
