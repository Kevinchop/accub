<?php

use App\Http\Controllers\DashController;
use App\Http\Controllers\IndexController;
use App\Models\ast_actividad;
use App\Models\ast_sprint;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', IndexController::class);

// Route::get('/', function () {
//     return view('welcome');
// });

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', [DashController::class, 'index'])->name('dashboard');
    /*
    Route::get('/dashboard', function () {
        //Obtenemos los Sprint de la base de datos
        $actividades = ast_actividad::all();

        //AST 102170 - CAPACITACIÓN-TALLER TRAINING SOFT SKILLS
        //Asignamos las cabeceras del DataTable
        $heads = [
            'Fecha',
            'ID',
            'Actividad',
            'Cant. Hs',
            'Concepto'
        ];

        //si uno de los parametros es un vector, en vez de var_name, va var_names
        return view('dashboard', compact('actividades', 'heads'));
    })->name('dashboard');*/

    Route::get('/bdconocimientos', function(){
        return view('bdconocimiento');
    });

    Route::get('/glosario', function(){
        return view('glosario');
    });

    // Route::get('/codfuente', function(){
    //     return view('codfuente');
    // });
});

// Auth::routes();
// Habia una ruta acá que me llevaba a un Home que no existia cuando daba Login desde afuera (por WAN)
// Auth::routes();

Route::get('/home', function() {
    return view('dashboard');
})->name('dashboard')->middleware('auth');
