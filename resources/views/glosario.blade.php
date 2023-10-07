@extends('adminlte::page')

@section('title', 'Glosario | Accubys')

@section('content_header')
{{-- CONTENIDO ESTÁTICO --}}
<section>
    <div class="row">
        {{-- y aca se puede poner algo mas --}}
    </div>
</section>
@stop

@section('content')
{{-- //acá está inserto el componente Livewire para el intercambio con ajax --}}
@livewire('glos')
@endsection