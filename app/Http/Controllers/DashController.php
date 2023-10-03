<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ast_actividad;

class DashController extends Controller
{
    public function index()
    {
        return view('dashboard');
    }
}
