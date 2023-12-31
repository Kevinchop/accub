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
        Schema::create('credenciales', function (Blueprint $table) {
            $table->id();
            $table->string('user', 50);
            $table->string('password', 50);
            $table->bigInteger('categoria_id')->default(1);
            $table->bigInteger('institucion_id')->default(1);
            $table->string('descripcion', 250);
            $table->string('tipo', 1)->default('u');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('credenciales');
    }
};
