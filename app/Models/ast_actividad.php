<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ast_actividad extends Model
{
    use HasFactory;
    use SoftDeletes; //esto me paso Facu para tener un campo de borrado y que no se pieda el registro
}
