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

    Route::get('/bdconocimientos', function(){
        return view('bdconocimiento');
    });

    Route::get('/glosario', function(){
        return view('glosario');
    });

    Route::get('/usuario', function(){
        return view('usuario');
    });

    Route::get('/claves', function(){
        return view('credenciales.claves'); //ejemplo de una ruta con subcarpetas en la vista
    });

    // Route::get('/codfuente', function(){
    //     return view('codfuente');
    // });
});

// Auth::routes();
// Habia una ruta acá que me llevaba a un Home que no existia cuando daba Login desde afuera (por WAN)
// Auth::routes();

// Route::get('/home', function() {
//     return view('dashboard');
// })->name('dashboard')->middleware('auth');
