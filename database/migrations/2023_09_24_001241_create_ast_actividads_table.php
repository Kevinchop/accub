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
        //[28-09-2023] [AST 102170 - 1 - 1] [CAPACITACIÓN-TALLER TRAINING SOFT SKILLS]
        Schema::create('ast_actividads', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('sprint_id');
            $table->date('fecha')->nullable();
            $table->string('prefijo', 10)->default('AST');
            $table->string('id_tarea', 10)->nullable();
            $table->string('id_sec', 10)->default('1 - 1');
            $table->string('nombre', 100)->nullable();
            $table->integer('horas')->nullable();
            $table->string('concepto', 20); //Hs Trabajo Remoto | Hs Calendario
            $table->bigInteger('user_id')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ast_actividads');
    }
};
