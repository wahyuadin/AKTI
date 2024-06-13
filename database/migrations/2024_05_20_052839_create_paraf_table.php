<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('parafs', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('mentor_id')->references('id')->on('mentors')->cascadeOnUpdate();
            $table->string('ttd')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('paraf');
    }
};
