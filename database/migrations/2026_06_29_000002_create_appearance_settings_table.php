<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class CreateAppearanceSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('appearance_settings', function (Blueprint $table) {
            $table->id();
            $table->string('primary_color')->default('#0ea5e9');
            $table->string('primary_color_dark')->default('#0369a1');
            $table->string('primary_color_light')->default('#38bdf8');
            $table->string('secondary_color')->default('#14b8a6');
            $table->string('secondary_color_dark')->default('#0f766e');
            $table->string('secondary_color_light')->default('#5eead4');
            $table->string('text_color')->default('#111827');
            $table->string('bg_color')->default('#f9fafb');
            $table->string('sidebar_bg_color')->default('#1e293b');
            $table->string('sidebar_text_color')->default('#ffffff');
            $table->string('card_bg_color')->default('#ffffff');
            $table->boolean('use_gradient')->default(true);
            $table->string('gradient_direction')->default('to right');
            $table->text('custom_css')->nullable();
            $table->boolean('disable_animations')->default(false);
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        DB::table('appearance_settings')->insert([
            'primary_color' => '#0ea5e9',
            'primary_color_dark' => '#0369a1',
            'primary_color_light' => '#38bdf8',
            'secondary_color' => '#14b8a6',
            'secondary_color_dark' => '#0f766e',
            'secondary_color_light' => '#5eead4',
            'text_color' => '#111827',
            'bg_color' => '#f9fafb',
            'sidebar_bg_color' => '#1e293b',
            'sidebar_text_color' => '#ffffff',
            'card_bg_color' => '#ffffff',
            'use_gradient' => true,
            'gradient_direction' => 'to right',
            'custom_css' => null,
            'disable_animations' => false,
            'notes' => 'Default appearance settings',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('appearance_settings');
    }
}
