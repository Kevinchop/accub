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
        Schema::create('ast_sprints', function (Blueprint $table) {
            $table->id();
            $table->string(column: 'descripcion');
            $table->string(column: 'estado');
            $table->date(column: 'fecha_creacion');
            $table->string(column: 'hora_creacion');
            $table->timestamps();
            

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ast_sprints');
    }
};
