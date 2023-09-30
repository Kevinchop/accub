@extends('adminlte::page')

<script type="text/javascript" language="javascript">
$(document).ready(function(){

})
</script>

@section('title', 'Miscelaneas de sistema | Accubys')

@section('content_header')
<h1 class="m-0 text-dark">Actividades</h1>
@stop

@section('content')
<div class="w-100">
    <div class="card">
        <div class="card-body">
            <div class="form-row">
                <div class="col-md-2">
                    {{-- componente de fecha --}}
                    @php
                    // $config = ['format' => 'DD/MM/YYYY HH:mm']; //Est es con Horas y Minutos
                    $config = ['format' => 'DD/MM/YYYY'];
                    @endphp
                    <x-adminlte-input-date name="idLabel" :config="$config" placeholder="Elegi la fecha"
                        label="Fecha" label-class="text-dark">
                        <x-slot name="prependSlot">
                            <x-adminlte-button class="text-lightblue" icon="fas fa-lg fa-calendar-alt"
                                title="Set to Birthday" />
                        </x-slot>
                    </x-adminlte-input-date>
                </div>
                <div class="col-md-2">
                    {{-- Si o si tiene que tener la propiedad name --}}
                    <x-adminlte-input name="id_tarea" id="id_tarea" label="ID Tarea" placeholder="Ej.: 101665"
                        label-class="text-dark">
                        <x-slot name="prependSlot">
                            <div class="input-group-text">
                                <i class="fas fa-sort-numeric-down text-lightblue"></i>
                            </div>
                        </x-slot>
                    </x-adminlte-input>
                </div>
                <div class="col-md-5">
                    <x-adminlte-input name="nombre_tarea" id="nombre_tarea" label="Actividad"
                        placeholder="Ej.: CAPACITACIÓN-TALLER TRAINING SOFT SKILLS" label-class="text-dark">
                        <x-slot name="prependSlot">
                            <div class="input-group-text">
                                <i class="fas fa-file-code text-lightblue"></i>
                            </div>
                        </x-slot>
                    </x-adminlte-input>
                </div>
                <div class="col-md-1">
                    <label for="concepto_tarea">Hs/Min</label>
                    @php
                        //FOR que construye el Select
                        $select = null;
                        $h = null;
                        for($h = 0; $h < 15; $h++){
                            $m = 0;
                            for ($c = 0; $c < 4; $c++) {
                                $select .= "<option value=\"" . $h . "." . $m ."\">" . $h . "h " . $m ."'</option>";
                                $m = $m + 15;
                            }
                        }
                    @endphp
                    <select id="horas_tarea" class="form-control">
                        @php
                            echo $select;
                        @endphp
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="concepto_tarea">Concepto</label>
                    <select id="concepto_tarea" class="form-control">
                        <option value="Hs Presenciales">Hs Calendario</option>
                        <option value="Hs Trabajo Remoto">Hs Trabajo Remoto</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-2 ml-auto">
                    {{-- <label for="id_tarea"> </label> --}}
                    <button id="btAgregarTarea" class="form-control btn-success">
                        <i class="fas fa-sign-in-alt"></i>
                        Agregar
                    </button>
                </div>

            </div>
        </div>
    </div>

</div>
<div class="card">
    <div class="card-body">
        {{-- COMPONENTE DATATABLE para traer los datos de la base --}}
        <x-adminlte-datatable id="table1" :heads="$heads" striped head-theme="dark" with-buttons>
            @foreach($actividades as $actividad)
            <tr>
                <td>{{ $actividad->created_at }}</td>
                <td>{{ $actividad->id_tarea }}</td>
                <td>{{ $actividad->nombre }}</td>
                <td>{{ $actividad->asignada }}</td>
            </tr>
            @endforeach
        </x-adminlte-datatable>
    </div>
</div>
@stop