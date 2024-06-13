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
        Schema::create('logbook', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->foreignUuid('mahasiswa_id')->references('id')->on('mahasiswa')->onUpdate('cascade');
            $table->string('week');
            $table->string('mounth');
            $table->string('gambar')->nullable();
            $table->text('keterangan');
            $table->string('tool_used')->nullable();
            $table->string('safety_key_point')->nullable();
            $table->string('problem_solf')->nullable();
            $table->string('hyarihatto')->nullable();
            $table->string('point_to_remember')->nullable();
            $table->string('self_evaluation')->nullable();
            $table->string('mentor_eveluation')->nullable();
            $table->string('komentar_mentor')->nullable();
            $table->enum('status',['pending','accept','reject'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('logbook');
    }
};
