<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class MakeCryptoAccountBalancesNullable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (! Schema::hasTable('crypto_accounts')) {
            return;
        }

        $columns = ['btc', 'eth', 'ltc', 'xrp', 'link', 'bat', 'aave', 'usdt', 'xlm', 'bch'];

        foreach ($columns as $column) {
            if (Schema::hasColumn('crypto_accounts', $column)) {
                DB::statement("ALTER TABLE `crypto_accounts` MODIFY `{$column}` DOUBLE(8,2) NULL DEFAULT NULL");
            }
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        if (! Schema::hasTable('crypto_accounts')) {
            return;
        }

        $columns = ['btc', 'eth', 'ltc', 'xrp', 'link', 'bat', 'aave', 'usdt', 'xlm', 'bch'];

        foreach ($columns as $column) {
            if (Schema::hasColumn('crypto_accounts', $column)) {
                DB::statement("ALTER TABLE `crypto_accounts` MODIFY `{$column}` DOUBLE(8,2) NOT NULL");
            }
        }
    }
}
