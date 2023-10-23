@extends('adminlte::page')

@section('title', 'Miscelaneas de sistema | Accubys')

@section('content_header')
{{-- Acá estamos llamando al Controlador Dash, y dentro del controlador se llama a la vista livewire.dash
    que es el archivo que hicimos dentro de /resources/views/livewire/ --}}
@livewire('Dash') 
@stop

@section('content')
{{-- POR AHORA ESTO QUEDA LIBRE --}}
@stop