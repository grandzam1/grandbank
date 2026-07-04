<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateCardSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (! Schema::hasTable('card_settings')) {
            Schema::create('card_settings', function (Blueprint $table) {
                $table->bigIncrements('id');
                $table->decimal('standard_fee', 16, 2)->default(0);
                $table->decimal('gold_fee', 16, 2)->default(0);
                $table->decimal('platinum_fee', 16, 2)->default(0);
                $table->decimal('black_fee', 16, 2)->default(0);
                $table->decimal('monthly_fee', 16, 2)->default(0);
                $table->decimal('topup_fee_percentage', 8, 2)->default(0);
                $table->boolean('is_enabled')->default(true);
                $table->decimal('max_daily_limit', 16, 2)->default(10000);
                $table->decimal('min_daily_limit', 16, 2)->default(100);
                $table->text('description')->nullable();
                $table->timestamps();
            });
        }

        if (DB::table('card_settings')->count() === 0) {
            DB::table('card_settings')->insert([
                'standard_fee' => 10,
                'gold_fee' => 25,
                'platinum_fee' => 50,
                'black_fee' => 100,
                'monthly_fee' => 5,
                'topup_fee_percentage' => 0,
                'is_enabled' => true,
                'max_daily_limit' => 10000,
                'min_daily_limit' => 100,
                'description' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('card_settings');
    }
}
