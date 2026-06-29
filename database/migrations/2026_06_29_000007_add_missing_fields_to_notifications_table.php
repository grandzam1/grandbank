<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMissingFieldsToNotificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('notifications', function (Blueprint $table) {
            if (! Schema::hasColumn('notifications', 'title')) {
                $table->string('title')->nullable()->after('user_id');
            }
            if (! Schema::hasColumn('notifications', 'type')) {
                $table->string('type')->nullable()->after('message');
            }
            if (! Schema::hasColumn('notifications', 'icon')) {
                $table->string('icon')->nullable()->after('type');
            }
            if (! Schema::hasColumn('notifications', 'link')) {
                $table->string('link')->nullable()->after('icon');
            }
            if (! Schema::hasColumn('notifications', 'data')) {
                $table->json('data')->nullable()->after('link');
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
        Schema::table('notifications', function (Blueprint $table) {
            if (Schema::hasColumn('notifications', 'data')) {
                $table->dropColumn('data');
            }
            if (Schema::hasColumn('notifications', 'link')) {
                $table->dropColumn('link');
            }
            if (Schema::hasColumn('notifications', 'icon')) {
                $table->dropColumn('icon');
            }
            if (Schema::hasColumn('notifications', 'type')) {
                $table->dropColumn('type');
            }
            if (Schema::hasColumn('notifications', 'title')) {
                $table->dropColumn('title');
            }
        });
    }
}
