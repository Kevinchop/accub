<div>
    {{-- Carga de items especiales --}}
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="form-row">
                        <input class="form-control col-sm-10" type="text" placeholder="[Institucion]: Ej.: Columbia"
                            wire:model='institucion_tabla'>
                        <button class="btn btn-success col-sm-2" wire:click='guardarInstitucion'>
                            <i class="far fa-save"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="form-row">
                        <input class="form-control col-sm-10" type="text"
                            placeholder="[Categoria]: Ej.: Escritorio Remoto" wire:model='categoria_tabla'>
                        <button class="btn btn-info col-sm-2" wire:click='guardarCategoria'>
                            <i class="far fa-save"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="form-row">
                        <input class="form-control col-sm-10" type="text" placeholder="Para cargar algo mas..."
                            wire:model='' disabled>
                        <button class="btn btn-primary col-sm-2" wire:click='' disabled>OK</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Carga de las Credenciales y Busqueda --}}
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-user-circle mr-1"></i>
                    Credenciales de Acceso
                </div>
                <div class="card-body">
                    {{-- 1era linea de carga --}}
                    <div class="form-row">
                        <div class="form-group col-sm-4">
                            <label for="">Usuario</label>
                            <input type="text" class="form-control" wire:model='user'
                                placeholder="Ej.: juan.perez" />
                            @error('user')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="">Clave</label>
                            <input type="text" class="form-control" wire:model='pass' placeholder="Contraseña" />
                            @error('pass')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="col-sm-4">
                            <label for="">Comparte Clave?</label>
                            <select class="form-control" wire:model='tipo'>
                                <option value="u">NO</option>
                                <option value="s">SI</option>
                            </select>
                        </div>
                    </div>

                    {{-- 2da linea de carga --}}
                    <div class="form-row">
                        <div class="form-group col-sm-6">
                            <label for="">Categoria</label>
                            <select class="form-control" wire:model='categoria'>
                                @foreach ($categorias as $categoria)
                                    <option value="{{ $categoria->id }}">{{ $categoria->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="descripcion_credencial">Institucion</label>
                            <select class="form-control" wire:model='institucion'>
                                @foreach ($instituciones as $institucion)
                                    <option value="{{ $institucion->id }}">{{ $institucion->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    {{-- 3ra linea de carga --}}
                    <div class="form-row">
                        <div class="form-group col-sm-12">
                            <label for="descripcion_credencial">Descripcion</label>
                            <input name="descripcion_credencial" type="text" class="form-control"
                                wire:model='descripcion' placeholder="Ej.: 10.253.2.34 (o direccion web)" />
                            @error('descripcion')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="d-flex">
                        <button class="btn btn-secondary ml-auto" wire:click='guardarCredencial'>Agregar</button>
                    </div>
                </div>
            </div>
        </div>

        {{-- ESTE ES EL BUSCADOR DE CLAVES --}}
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <nav class="navbar justify-content-between m-0 p-0">
                        <a class="navbar-brand">
                            <div class="badge my-1">({{ $cantCredenciales }}) Credenciales cargadas</div>
                        </a>
                        <div class="form-inline">
                            <input class="form-control" type="search" placeholder="Buscar credencial..." aria-label="Search"
                                wire:model.live='consulta'>
                        </div>
                    </nav>
                </div>
                <div class="card-body overflow-auto p-0 list-group-flush" style="min-height: 340px; max-height: 340px;">
                    @foreach ($credenciales as $credencial)
                        <li class="list-group-item list-group-item-action">
                            <div class="row">
                                <span class="mr-2">
                                    <img class="rounded" style="width: 40px; height: auto;" src="assets/img/ico_aplicaciones/{{ $credencial->categoria->imagen }}" title="{{ $credencial->categoria->nombre }}">
                                </span>
                                <div class="ml-2">
                                    <h6 class="py-0 my-0 text-dark font-bold">{{ $credencial->institucion->nombre }}</h6>
                                    <small class="text-muted">{{ $credencial->user . " | " . $credencial->password }}</small>
                                </div>
                            </div>
                        </li>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
