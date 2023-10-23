<div>
    {{-- Knowing others is intelligence; knowing yourself is true wisdom. --}}
    <div class="row">

    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-user-circle mr-1"></i>
                    Credenciales de Acceso
                </div>
                <div class="card-body">
                    <div class="form-row">
                        <div class="form-group col-sm-4">
                            <label for="">Usuario</label>
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="">Clave</label>
                            <input type="text" class="form-control" />
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="">Categoria</label>
                            <select name="" id="" class="form-control">
                                {{-- @foreach ($categorias as $categoria)
                                    <option value=""></option>
                                @endforeach --}}
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-12">
                            <div class="label">Descripcion</div>
                            <input type="text" class="form-control" />
                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="d-flex">
                        <button class="btn btn-secondary ml-auto">Agregar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>