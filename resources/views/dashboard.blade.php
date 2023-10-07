@extends('adminlte::page')

@section('title', 'Miscelaneas de sistema | Accubys')

@section('content_header')
{{-- Acá podemos meter algo. Por las dudas, si falla, lo del content, estaba header --}}
<section>
    <div class="row">
        {{-- HEADER --}}
    </div>
</section>
@stop

@section('content')
{{-- Acá estamos llamando al Controlador Dash, y dentro del controlador se llama a la vista livewire.dash
    que es el archivo que hicimos dentro de /resources/views/livewire/ --}}
@livewire('Dash') 
@stop