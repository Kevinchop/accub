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
        Schema::create('lenguajes', function (Blueprint $table) {
            $table->id();
            $table->string('nombre', 30);
            $table->string('descripcion', 1000)->nullable();
            $table->string('imagen', 40)->default('lenguaje_generico.svg');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lenguajes');
    }
};
