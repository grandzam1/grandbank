<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class MakeCardsUserColumnNullable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (! Schema::hasColumn('cards', 'user')) {
            return;
        }

        // Legacy `user` column is required but the app now uses `user_id`.
        DB::statement('ALTER TABLE `cards` MODIFY `user` INT(11) NULL DEFAULT NULL');

        DB::table('cards')
            ->whereNull('user')
            ->whereNotNull('user_id')
            ->update(['user' => DB::raw('user_id')]);

        DB::table('cards')
            ->whereNotNull('user')
            ->whereNull('user_id')
            ->update(['user_id' => DB::raw('user')]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        if (! Schema::hasColumn('cards', 'user')) {
            return;
        }

        DB::table('cards')->whereNull('user')->update(['user' => 0]);
        DB::statement('ALTER TABLE `cards` MODIFY `user` INT(11) NOT NULL');
    }
}
