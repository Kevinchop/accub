@extends('layouts.indexa')

@section('titulo', '::: Landing Accubys')

@section('brander')
<a class="navbar-brand" href="#">INTRANET</a>
@endsection

@section('items_nav')
<li class="nav-item">
    <a class="nav-link" href="{{ route ('login') }}">Iniciar Sesion</a>
</li>
<li class="nav-item">
    <a class="nav-link" href="{{ route ('register') }}">Registrarse</a>
</li>
@endsection

@section('hero')
<img class="img-fluid" src="assets/img/logo_soft.svg" alt="Accubys">
@endsection

@section('descripcion')
Este desarrollo es de uso personal en fase beta.
@endsection

