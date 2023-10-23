<div>
    <div class="row">
        <div class="col-md-12">
            <div class="card pos-f-t">
                <!-- El NAVDARK va primero para que el contenido se desplegue hacia abajo -->
                <nav class="navbar navbar-dark bg-gradient-secondary">
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <!-- <span class="navbar-toggler-icon"></span> -->
                        <i class="fas fa-file-code"></i>
                    </button>
                    <div class="form-inline">
                        <label for="tipo_conversion" class="mr-2 text-light">({{$cantFuentes}}) Fuentes</label>
                        <div class="btn-group bootstrap-select ml-2 linea_botones_inf col-md-4">
                            <input type="text" class="form-control" wire:model.live='q_fuente'
                                placeholder="Nombre o etiqueta..." />
                            <div class="dropdown-menu" id="resultado_tareas">
                                <!-- RESULTADOS DE LA BUSQUEDA DE TAREAS -->
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- CONTENIDO A DESPLEGARSE -->
                <div class="collapse" id="navbarToggleExternalContent">
                    <!-- CONTENIDO OCULTO PARA AHORRAR ESPACIO -->
                    <div class="container">
                        <div class="card-body">
                            <div class="form-row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombre_fuente">Nombre</label>
                                        <input class="form-control" name="nombre_fuente" wire:model="nombre_fuente"
                                            type="text" placeholder="Ej.: SP validacion montos">
                                        @error('nombre_fuente')
                                        {{-- cuando no es un componente x-adminlte, no hay que ponerle el @error() --}}
                                        <small class="text-danger">{{ $message }}</small>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="lenguaje_a_usar">Lenguaje</label>
                                        <select class="form-control" name="lenguaje_a_usar" id="lenguaje_a_usar"
                                            wire:model='lenguaje_a_usar'>
                                            @foreach ($lenguajes as $lenguaje)
                                            <option value="{{$lenguaje->id}}">{{$lenguaje->nombre}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombre_fuente">Etiqueta</label>
                                        <input class="form-control" name="etiqueta_fuente" wire:model="etiqueta_fuente"
                                            type="text" placeholder="Ej.: Lo usamos para...">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="desarrollo_fuente">Descripcion</label>
                                <textarea class="form-control" name="desarrollo_fuente" wire:model="desarrollo_fuente"
                                    rows="4" placeholder="begin..."></textarea>
                                @error('desarrollo_fuente')
                                {{-- cuando no es un componente x-adminlte, no hay que ponerle el @error() --}}
                                <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="form-group d-flex mb-0">
                                <button class="btn btn-success ml-auto" name="agregarFuente"
                                    wire:click="agregarFuente">Agregar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-7">
            <div class="card">
                <div class="card-body overflow-auto pl-1 py-0" style="min-height: 300px; max-height: 300px;">
                    {{-- algo de la busqueda --}}
                    @foreach ($fuentes as $fuente)
                    <!-- Este DIV d-flex, oficia de ITEM de fuente, por lo cual se puede repetir tantas veces como items haya -->
                    <div class="form-row border-bottom py-1 detalle_fuente">
                        <div class="align-self-center text-center col-md-2 py-1">
                            @if ($editing_id == $fuente->id)
                                <select class="form-control" id="lenguaje_fuente_upd" wire:model='lenguaje_fuente_upd'>
                                @foreach ($lenguajes as $lenguaje)
                                    <option value="{{$lenguaje->id}}">{{$lenguaje->nombre}}</option>
                                @endforeach
                                </select>
                            @else
                                {{-- accedemos a la tabla relacionada a traves del doble método --}}
                                <img class="rounded" style="width: 70px; height: auto;" src="assets\img\ico_lenguajes\{{$fuente->lenguaje->imagen}}" title="{{$fuente->lenguaje->nombre}}">
                            @endif
                        </div>

                        <div class="align-self-center col-md-3 py-1">
                            @if ($editing_id == $fuente->id)
                            <input type="text" wire:model="nombre_fuente_upd" class="form-control">
                            @else
                            <h6 class="d-inline-block mb-0">{{$fuente->nombre}}</h6>
                            <small class="text-muted" title="{{$fuente->desarrollo}}">
                                {Desarrollo del fuente}
                            </small>
                            @endif
                        </div>

                        

                        <div class="align-self-center col-md-5 py-1">
                            @if ($editing_id == $fuente->id)
                            <textarea class="form-control" rows="5" wire:model='desarrollo_fuente_upd'></textarea>
                            @else
                            {{-- Prueba de juntar componentes --}}
                            @endif
                        </div>

                        {{-- // Si ponemos como ml-auto al que esta a la izquierda, empuja a todos los otros contra el
                        borde
                        derecho --}}
                        <div class="align-self-center ml-auto py-1">
                            @if ($editing_id == $fuente->id)
                            <button wire:click="update({{ $fuente->id }})" class="btn btn-success btn-sm mr-1">
                                <i class="fa fa-check"></i>
                            </button>
                            <button wire:click="editClose()" class="btn btn-danger btn-sm">
                                <i class="fa fa-times"></i>
                            </button>
                            @else
                            <button wire:click="editing({{ $fuente->id }})" class="btn btn-primary btn-sm mr-1">
                                <i class="fa fa-edit"></i>
                            </button>
                            @endif
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="card">
                <div class="card-header">
                    <h5>Ej. sp_efmin_proc.sql</h5>
                </div>
                <div class="card-body">
                    <textarea disabled class="form-control" name="" id="" cols="30" rows="5"></textarea>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Lineas: 1500 / Caracteres: 2000</small>
                </div>
            </div>
        </div>
    </div>

</div>