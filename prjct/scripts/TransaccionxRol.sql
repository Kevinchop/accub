declare @w_rol int

 

select @w_rol = 138   --> colocar aqui el nro de rol para conocer las transacciones que la tienen asignada

 

select 
tn_trn_code,
tn_descripcion,
ro_rol,
ro_descripcion,
ro_estado
from cobis..cl_ttransaccion, cobis..ad_rol, cobis..aw_func_rol, cobis..aw_tr_func
where ro_rol         = @w_rol
and   ro_rol         = fr_rol 
and   fr_func        = tf_func
and   tf_transaccion = tn_trn_code


 

go