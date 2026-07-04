<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMissingColumnsToCardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cards', function (Blueprint $table) {
            if (! Schema::hasColumn('cards', 'card_holder_name')) {
                $table->string('card_holder_name')->nullable();
            }
            if (! Schema::hasColumn('cards', 'expiry_month')) {
                $table->string('expiry_month', 2)->nullable();
            }
            if (! Schema::hasColumn('cards', 'expiry_year')) {
                $table->string('expiry_year', 4)->nullable();
            }
            if (! Schema::hasColumn('cards', 'card_type')) {
                $table->string('card_type')->nullable();
            }
            if (! Schema::hasColumn('cards', 'card_level')) {
                $table->string('card_level')->nullable();
            }
            if (! Schema::hasColumn('cards', 'currency')) {
                $table->string('currency', 10)->default('USD');
            }
            if (! Schema::hasColumn('cards', 'balance')) {
                $table->decimal('balance', 16, 2)->default(0);
            }
            if (! Schema::hasColumn('cards', 'last_four')) {
                $table->string('last_four', 4)->nullable();
            }
            if (! Schema::hasColumn('cards', 'bin')) {
                $table->string('bin', 8)->nullable();
            }
            if (! Schema::hasColumn('cards', 'card_pan')) {
                $table->text('card_pan')->nullable();
            }
            if (! Schema::hasColumn('cards', 'card_token')) {
                $table->string('card_token')->nullable();
            }
            if (! Schema::hasColumn('cards', 'reference_id')) {
                $table->string('reference_id')->nullable()->index();
            }
            if (! Schema::hasColumn('cards', 'application_date')) {
                $table->timestamp('application_date')->nullable();
            }
            if (! Schema::hasColumn('cards', 'approval_date')) {
                $table->timestamp('approval_date')->nullable();
            }
            if (! Schema::hasColumn('cards', 'rejection_reason')) {
                $table->text('rejection_reason')->nullable();
            }
            if (! Schema::hasColumn('cards', 'billing_address')) {
                $table->string('billing_address')->nullable();
            }
            if (! Schema::hasColumn('cards', 'daily_limit')) {
                $table->decimal('daily_limit', 16, 2)->nullable();
            }
            if (! Schema::hasColumn('cards', 'monthly_limit')) {
                $table->decimal('monthly_limit', 16, 2)->nullable();
            }
            if (! Schema::hasColumn('cards', 'is_virtual')) {
                $table->boolean('is_virtual')->default(true);
            }
            if (! Schema::hasColumn('cards', 'is_physical')) {
                $table->boolean('is_physical')->default(false);
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cards', function (Blueprint $table) {
            $columns = [
                'card_holder_name',
                'expiry_month',
                'expiry_year',
                'card_type',
                'card_level',
                'currency',
                'balance',
                'last_four',
                'bin',
                'card_pan',
                'card_token',
                'reference_id',
                'application_date',
                'approval_date',
                'rejection_reason',
                'billing_address',
                'daily_limit',
                'monthly_limit',
                'is_virtual',
                'is_physical',
            ];

            $existing = array_filter($columns, function ($column) {
                return Schema::hasColumn('cards', $column);
            });

            if (! empty($existing)) {
                $table->dropColumn($existing);
            }
        });
    }
}
