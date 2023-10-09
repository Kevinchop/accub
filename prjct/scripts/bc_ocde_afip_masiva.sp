use cob_bcradgi
go

if exists (select 1
         from sysobjects
         where name = 'sp_fatca_ocde_carga_masiva')
begin
  drop proc sp_fatca_ocde_carga_masiva
end
go

/*
<summary>
CARGA MASIVA DE FATCA

Nombre Físico: bc_ocde_afip_masiva.sp
</summary>

<historylog>
<log LogType="Refactor" revision="1.1" date="18/09/2023" email="jose.barrera@accusys.com.ar">AST 101066</log>
</historylog>
*/

create proc sp_fatca_ocde_carga_masiva (
--<parameters>
@s_user                 varchar(8)     = null, --<param required ="no" description="NOMBRE DEL USUARIO REGISTRADO QUE EJECUTA LA TRANSACCION (LOGIN)."/>
@s_ssn                  int            = null, --<param required ="no" description="NUMERO SECUENCIAL UNICO DADO POR EL MONITOR TRANSACCIONAL PARA LA TRANSACCION."/>
@s_sesn                 int            = null, --<param required ="no" description="NUMERO DE LA SESION O DE REGISTRO DEL USUARIO QUE EJECUTA LA TRANSACCION."/>
@s_term                 varchar(30)    = null, --<param required ="no" description="NOMBRE O IDENTIFICACION DE LA TERMINAL DONDE SE EJECUTO LA TRANSACCION."/>
@s_date                 datetime       = null, --<param required ="no" description="FECHA DE PROCESO DEL SERVIDOR EN QUE SE EJECUTA LA TRANSACCION."/>
@s_srv                  varchar(30)    = null, --<param required ="no" description="NOMBRE DEL SERVIDOR DONDE SE ORIGINA LA TRANSACCION."/>
@s_lsrv                 varchar(30)    = null, --<param required ="no" description="NOMBRE DEL SERVIDOR DONDE SE ENCUENTRA LA TRANSACCION."/>
@s_rol                  smallint       = null, --<param required ="no" description="NUMERO DEL ROL CON EL CUAL SE ENCUENTRA REGISTRADO EL USUARIO."/>
@s_ofi                  smallint       = null, --<param required ="no" description="NUMERO DE LA OFICINA DONDE SE ENCUENTRA REGISTRADO EL USUARIO QUE EJECUTA LA TRANSACCION."/>
@s_org_err              char(1)        = null, --<param required ="no" description="ORIGEN DEL ERROR SI EXISTIERA: [A]PLICACION  [S]ISTEMA"/>
@s_error                int            = null, --<param required ="no" description="NUMERO DE ERROR GENERADO."/>
@s_sev                  tinyint        = null, --<param required ="no" description="SEVERIDAD DEL ERROR: [0] - NO ROLLBACK  [1] - SI ROLLBACK"/>
@s_msg                  descripcion    = null, --<param required ="no" description="TEXTO DESCRIPTIVO DEL ERROR PRODUCIDO."/>
@s_org                  char(1)        = null, --<param required ="no" description="ORIGEN DE LA TRANSACCION:  [L] - LOCAL  [R] - RESUBMIT  [S] - SUBMIT"/>
@t_debug                char(1)        = 'N' , --<param required ="no" description="INDICA SI LA TRANSACCION DEBE SER EJECUTADA EN MODO DE DEPURACION: [S]I  [N]O"/>
@t_file                 varchar(10)    = null, --<param required ="no" description="NOMBRE DEL ARCHIVO QUE CONTENDRA LOS RESULTADOS ENVIADOS EN MODO DE DEBUG."/>
@t_from                 varchar(32)    = null, --<param required ="no" description="STORED PROCEDURE DESDE EL QUE FUE LLAMADO EL PROGRAMA ACTUAL."/>
@t_trn                  smallint       = null, --<param required ="no" description="CODIGO UNICO DE TRANSACCION COBIS."/>
@i_c_operacion          char(1)        = '',   --<param required ="SI" description="OPERATORIA"/>
@i_c_periodo            char(4)        = null, --<param required ="SI" description="PERIODO EJECUCION"/>
@i_c_secuencia          char(2)        = null, --<param required ="SI" description="SECUENCIA EJECUCION"/>
@i_k_filas              int            = 0,    --<param required ="NO" description="CANTIDAD DE FILAS A RETORNAR">
@i_d_observacion        varchar(255)   = '',   --<param required ="NO" description="DETALLE A TENER EN CUENTA PARA EL LOGUEO">
@i_logueo_por_lote      char(1)        = 'N',  --<param required ="NO" description="DETALLE A TENER EN CUENTA PARA EL LOGUEO">
@i_n_registros          int            = null, --<param required ="SI" description="CANTIDAD DE REGISTROS ENVIADOS DESDE FE"/>
@i_d_reg_1              varchar(255)   = null, --<param required ="SI" description="REGISTRO 1"/>
@i_d_reg_2              varchar(255)   = null, --<param required ="SI" description="REGISTRO 2"/>
@i_d_reg_3              varchar(255)   = null, --<param required ="SI" description="REGISTRO 3"/>
@i_d_reg_4              varchar(255)   = null, --<param required ="SI" description="REGISTRO 4"/>
@i_d_reg_5              varchar(255)   = null, --<param required ="SI" description="REGISTRO 5"/>
@i_d_reg_6              varchar(255)   = null, --<param required ="SI" description="REGISTRO 6"/>
@i_d_reg_7              varchar(255)   = null, --<param required ="SI" description="REGISTRO 7"/>
@i_d_reg_8              varchar(255)   = null, --<param required ="SI" description="REGISTRO 8"/>
@i_d_reg_9              varchar(255)   = null, --<param required ="SI" description="REGISTRO 9"/>
@i_d_reg_10             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_11             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_12             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_13             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_14             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_15             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_16             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_17             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_18             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_19             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_20             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_21             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_22             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_23             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_24             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_25             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_26             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_27             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_28             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_29             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_30             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_31             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_32             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_33             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_34             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_35             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_36             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_37             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_38             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_39             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_40             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_41             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_42             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_43             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_44             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_45             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_46             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_47             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_48             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_49             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_50             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_51             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_52             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_53             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_54             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_55             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_56             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_57             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_58             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_59             varchar(255)   = null, --<param required ="SI" description="REGISTRO 10"/>
@i_d_reg_60             varchar(255)   = null  --<param required ="SI" description="REGISTRO 10"/>
--</parameters>
)
as
declare
@w_d_sp_name            varchar(30),
@w_d_msg                varchar(132),
@w_d_dato               char(1),
@w_n_registros          int,
@w_n_error              int,
@w_n_return             int,
@w_n_siguiente          int,
@w_n_cabecera           tinyint,
@w_d_campo1             varchar(4),
@w_d_campo2             varchar(8),
@w_d_campo3             varchar(2),
@w_d_campo4             varchar(11),
@w_d_campo5             varchar(50),
@w_d_campo6             varchar(15),
@w_d_campo7             varchar(20),
@w_d_campo8             varchar(20),
@w_d_campo9             varchar(30),
@w_d_campo10            varchar(50),
@w_d_campo11            varchar(50),
@w_d_campo12            varchar(20),
@w_d_campo13            varchar(30),
@w_d_campo14            varchar(20),
@w_d_campo15            varchar(20),
@w_d_campo16            varchar(60),
@w_d_campo17            varchar(50),
@w_d_campo18            varchar(30),
@w_d_campo19            varchar(30),
@w_d_campo20            varchar(30),
@w_d_campo21            varchar(30),
@w_d_campo22            varchar(30),
@w_d_campo23            varchar(30),
@w_d_campo24            varchar(50),
@w_d_campo25            varchar(30),
@w_d_campo26            varchar(50),
@w_d_campo27            varchar(30),
@w_d_campo28            varchar(30),
@w_d_campo29            varchar(30),
@w_d_campo30            varchar(30),
@w_d_campo31            varchar(30),
@w_d_campo32            varchar(30),
@w_d_campo33            varchar(30),
@w_d_campo34            varchar(8) ,
@w_d_campo35            varchar(30),
@w_d_campo36            varchar(30),
@w_d_campo37            varchar(30),
@w_d_campo38            varchar(30),
@w_d_campo39            varchar(2) ,
@w_d_campo40            varchar(30),
@w_d_campo41            varchar(6) ,
@w_d_campo42            varchar(8) ,
@w_d_campo43            varchar(14),
@w_d_campo44            varchar(8) ,
@w_d_campo45            varchar(14),
@w_d_campo46            varchar(14),
@w_d_campo47            varchar(14),
@w_aux_varchar          varchar(8),
@w_aux_money            money,
@w_aux_int              int,
@w_n_max                int,
@w_n_id                 int,
@w_n_id_cancel          int,
@w_n_id_cta             int,
@w_n_id_pj              int,
@w_n_saldo_cta          money,
@w_n_monto_bruto        money,
@w_n_cant1              smallint,
@w_n_cant2              smallint,
@w_c_cant1              varchar(3),
@w_c_cant2              varchar(3),
@w_d_reg                varchar(600),
@w_n_pos                int,
@w_c_separ              char(1),
@w_n_lote               int,
@w_n_desde              int,
@w_n_hasta              int,
@w_d_sql                varchar(500),
@w_d_valor              varchar(60),
@w_d_error              varchar(135)

select
   @w_d_sp_name   = 'sp_fatca_ocde_carga_masiva',
   @w_d_dato      = '',
   @w_d_msg       = '',
   @w_n_error     = 0

if @s_date is null
begin
   select @s_date = fp_fecha
   from cobis..ba_fecha_proceso
end

if @i_c_operacion = 'C'
begin --> INICIO DEL PROCESO FATCA

   delete from cob_bcradgi..bc_errores_batch
   where eb_sp = @w_d_sp_name

   if @@error != 0
   begin
      select @w_d_msg = 'ERROR AL DEPURAR LA TABLA cob_bcradgi..bc_errores_batch: EL PROCESO CONTINUA...'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   select @w_d_msg = '--> INICIO PROCESO CARGA MASIVA FATCA - PERIODO: ' + @i_c_periodo + ' / SECUENCIA: ' + @i_c_secuencia

   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'

   select @w_d_msg = 'INICIO OPERACION C'

   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'

   --> LIMPIAMOS LA TABLA DE CARGA MASIVA
   truncate table cob_bcradgi..cl_fatca_carga_masiva

   if @@rowcount != 0
   begin
      select @w_d_msg = 'SE ELIMINARON LOS REGISTROS DE LA TABLA cob_bcradgi..cl_fatca_carga_masiva'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   --> LIMPIAMOS LA TABLA TEMPORAL DE CUENTAS
   truncate table cob_bcradgi..cl_fatca_cta

   if @@rowcount != 0
   begin
      select @w_d_msg = 'SE ELIMINARON LOS REGISTROS DE LA TABLA cob_bcradgi..cl_fatca_cta'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   --> VERIFICA SI YA FUE PROCESADO EL PERIODO/SECUENCIA
   if exists (select 1
            from cob_bcradgi..bc_d_ocde_afip_cab
            where oa_n_periodo   = @i_c_periodo
            and   oa_n_secuencia = @i_c_secuencia)
   begin
      select @w_d_msg = 'EXISTE EL PERIODO/SECUENCIA INGRESADO: VERIFICAR SI CONTINUA CON EL PROCESO...'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'

      select 'S'
   end
   else
      select 'N'

   select @w_d_msg = 'FIN OPERACION C'

   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'

   return 0

end --> INICIO DEL PROCESO FATCA
else

if @i_c_operacion = 'I'
begin --> INSERCION DE REGISTROS EN LA TABLA cob_bcradgi..cl_fatca_carga_masiva

   if exists (select 1
            from cob_bcradgi..bc_errores_batch
            where eb_sp = @w_d_sp_name
            and   eb_observacion like '%INICIO OPERACION I')
   begin
      select @w_d_msg = ''
   end
   else
   begin
      select @w_d_msg = 'INICIO OPERACION I'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   truncate table cob_bcradgi..cl_fatca_parametros

   if @@rowcount != 0
   begin
      select @w_d_msg = 'SE ELIMINARON LOS REGISTROS DE LA TABLA cob_bcradgi..cl_fatca_parametros'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   select @w_n_cant1 = 1,
          @w_c_separ = '|',
          @w_n_lote  = 0

   --> RECORREMOS HASTA EL ULTIMO PARAMETRO
   while @w_n_cant1 <= @i_n_registros
   begin
      --> INSERTAMOS EN LA TABLA cob_bcradgi..cl_fatca_parametros LOS PARAMETROS INGRESADOS
      select @w_c_cant1 = convert(varchar(3), @w_n_cant1)
      select @w_d_sql   = 'insert into cob_bcradgi..cl_fatca_parametros values ('+ @w_c_cant1 +', @i_d_reg_' + @w_c_cant1 +')'
      exec(@w_d_sql)

      if @@error != 0
      begin
         select @w_d_msg   = 'ERROR AL INSERTAR EN LA TABLA cob_bcradgi..cl_fatca_parametros',
                @w_n_error = 1

         goto ERROR
      end

      --> OBTENEMOS EL REGISTRO INSERTADO
      select @w_d_reg = registro
      from cob_bcradgi..cl_fatca_parametros
      where nro_param = @w_n_cant1

      if len(@w_d_reg) is not null
      begin
         truncate table cob_bcradgi..cl_fatca_campos

         if @@rowcount != 0
         begin
            select @w_d_msg = 'SE ELIMINARON LOS REGISTROS DE LA TABLA cob_bcradgi..cl_fatca_campos'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end

         select @w_n_cant2 = 1,
                @w_n_pos   = 1

         --> PARSEAMOS EL REGISTRO PARA OBTENER CADA UNO DE LOS CAMPOS
         while @w_n_pos < len(@w_d_reg)
         begin
            --> INSERTAMOS EN LA TABLA cob_bcradgi..cl_fatca_campos CADA UNO DE LOS CAMPOS DEL REGISTRO
            select @w_c_cant2 = convert(varchar(3),@w_n_cant2)
            if charindex(@w_c_separ, @w_d_reg, @w_n_pos) != 0
            begin
               select @w_d_valor = substring(@w_d_reg, @w_n_pos, (charindex(@w_c_separ, @w_d_reg, @w_n_pos)) - @w_n_pos)
               select @w_n_pos   = charindex(@w_c_separ, @w_d_reg, @w_n_pos) + 1
            end
            else
            begin
               select @w_d_valor = rtrim(ltrim(substring(@w_d_reg, @w_n_pos, 3)))
               select @w_n_pos   = len(@w_d_reg)
            end

            select @w_d_sql = 'insert into cob_bcradgi..cl_fatca_campos values ('+ @w_c_cant2 +', "'+ @w_d_valor +'")'
            exec(@w_d_sql)

            if @@error != 0
            begin
               select @w_d_msg   = 'ERROR AL INSERTAR EN LA TABLA cob_bcradgi..cl_fatca_campos',
                      @w_n_error = 1

               goto ERROR
            end

            select @w_n_cant2 = @w_n_cant2 + 1
         end

         if @@error = 0
         begin
            select @w_n_cant2 = 1

            select @w_n_max = isnull(max(nro_campo),0)
            from cob_bcradgi..cl_fatca_campos

            --> RECORREMOS LA TABLA cob_bcradgi..cl_fatca_campos PARA CAPTURAR CADA UNO DE LOS CAMPOS DE CADA REGISTRO
            while @w_n_cant2 <= @w_n_max
            begin
               select @w_c_cant2 = convert(varchar(3), @w_n_cant2)
               select @w_d_sql   = 'select @w_d_campo'+ @w_c_cant2 +' = isnull(valor,"") from cob_bcradgi..cl_fatca_campos where nro_campo = '+ @w_c_cant2
               exec(@w_d_sql)

               select @w_n_cant2 = @w_n_cant2 + 1
            end

            select @w_n_siguiente = isnull(max(cm_n_secuen),0) + 1
            from cob_bcradgi..cl_fatca_carga_masiva

            --> INSERTAMOS EN LA TABLA TEMPORAL PREVIA A LAS DEFINITIVAS
            insert into cob_bcradgi..cl_fatca_carga_masiva (
               cm_n_secuen,  cm_d_campo1,  cm_d_campo2,  cm_d_campo3,  cm_d_campo4,
               cm_d_campo5,  cm_d_campo6,  cm_d_campo7,  cm_d_campo8,  cm_d_campo9,
               cm_d_campo10, cm_d_campo11, cm_d_campo12, cm_d_campo13, cm_d_campo14,
               cm_d_campo15, cm_d_campo16, cm_d_campo17, cm_d_campo18, cm_d_campo19,
               cm_d_campo20, cm_d_campo21, cm_d_campo22, cm_d_campo23, cm_d_campo24,
               cm_d_campo25, cm_d_campo26, cm_d_campo27, cm_d_campo28, cm_d_campo29,
               cm_d_campo30, cm_d_campo31, cm_d_campo32, cm_d_campo33, cm_d_campo34,
               cm_d_campo35, cm_d_campo36, cm_d_campo37, cm_d_campo38, cm_d_campo39,
               cm_d_campo40, cm_d_campo41, cm_d_campo42, cm_d_campo43, cm_d_campo44,
               cm_d_campo45, cm_d_campo46, cm_d_campo47, cm_c_proceso )
            values (
               @w_n_siguiente,          isnull(@w_d_campo1, ''),  isnull(@w_d_campo2, ''),  isnull(@w_d_campo3, '0'), isnull(@w_d_campo4, ''),
               isnull(@w_d_campo5, ''), isnull(@w_d_campo6, ''),  isnull(@w_d_campo7, ''),  isnull(@w_d_campo8, ''),  isnull(@w_d_campo9, ''),
               isnull(@w_d_campo10, ''),isnull(@w_d_campo11, ''), isnull(@w_d_campo12, ''), isnull(@w_d_campo13, ''), isnull(@w_d_campo14, ''),
               isnull(@w_d_campo15, ''),isnull(@w_d_campo16, ''), isnull(@w_d_campo17, ''), isnull(@w_d_campo18, ''), isnull(@w_d_campo19, ''),
               isnull(@w_d_campo20, ''),isnull(@w_d_campo21, ''), isnull(@w_d_campo22, ''), isnull(@w_d_campo23, ''), isnull(@w_d_campo24, ''),
               isnull(@w_d_campo25, ''),isnull(@w_d_campo26, ''), isnull(@w_d_campo27, ''), isnull(@w_d_campo28, ''), isnull(@w_d_campo29, ''),
               isnull(@w_d_campo30, ''),isnull(@w_d_campo31, ''), isnull(@w_d_campo32, ''), isnull(@w_d_campo33, ''), isnull(@w_d_campo34, ''),
               isnull(@w_d_campo35, ''),isnull(@w_d_campo36, ''), isnull(@w_d_campo37, ''), isnull(@w_d_campo38, ''), isnull(@w_d_campo39, ''),
               isnull(@w_d_campo40, ''),isnull(@w_d_campo41, ''), isnull(@w_d_campo42, ''), isnull(@w_d_campo43, ''), isnull(@w_d_campo44, ''),
               isnull(@w_d_campo45, ''),isnull(@w_d_campo46, ''), isnull(@w_d_campo47, ''), 'N' )

            select @w_n_error = @@error, @w_n_lote = @@rowcount + @w_n_lote

            if @w_n_error != 0
            begin
               select @w_d_msg   = 'ERROR AL INSERTAR EN LA TABLA cob_bcradgi..cl_fatca_carga_masiva',
                      @w_n_error = 1

               goto ERROR
            end
         end
      end

      select @w_n_cant1 = @w_n_cant1 + 1
   end

   if exists (select 1
            from cob_bcradgi..bc_errores_batch
            where eb_sp = @w_d_sp_name
            and   eb_observacion like '%FIN OPERACION I')
   begin
      select @w_d_msg = ''
   end
   else
   begin
      select @w_d_msg = 'FIN OPERACION I'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

end --> INSERCION DE REGISTROS EN LA TABLA TEMPORAL
else

if @i_c_operacion = 'O'
begin --> ALTA DE TABLAS OCDE-AFIP

   select @w_d_msg = 'INICIO OPERACION O'

   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'

   select
      cm_d_campo1
   into #control_periodo
   from cob_bcradgi..cl_fatca_carga_masiva
   group by cm_d_campo1

   select @w_n_cant1 = isnull(count(1),0)
   from #control_periodo

   if @w_n_cant1 > 1
   begin
      select 'N'
      select @w_d_msg   = 'SE INGRESO MAS DE UN PERIODO: VERIFIQUE EL ARCHIVO DE ORIGEN'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'

      return 0
   end

   select
      cm_d_campo2
   into #control_secuencia
   from cob_bcradgi..cl_fatca_carga_masiva
   group by cm_d_campo2

   select @w_n_cant1 = isnull(count(1),0)
   from #control_secuencia

   if @w_n_cant1 > 1
   begin
      select 'N'
      select @w_d_msg   = 'SE INGRESO MAS DE UNA SECUENCIA PARA EL PERIODO: VERIFIQUE EL ARCHIVO DE ORIGEN'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'

      return 0
   end

   select @w_n_registros = 0,
          @w_n_id        = 0,
          @w_n_id_cta    = 0,
          @w_n_id_pj     = 0

   --> BUSCAMOS EL REGISTRO DE CABECERA 01
   if exists (select 1
            from cob_bcradgi..cl_fatca_carga_masiva
            where cm_d_campo1 != ''
            and   cm_d_campo2 != ''
            and   cm_d_campo3  = '01'
            and   cm_c_proceso = 'N')
   begin
      select @w_n_cabecera = 1
   end
   else
   begin
      --> NO EXISTE EL REGISTRO DE CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_cab --, cob_bcradgi..cl_fatca_carga_masiva
               where oa_n_periodo   = @i_c_periodo
               and   oa_n_secuencia = @i_c_secuencia)
      begin
         select @w_n_cabecera = 2
      end
      else
      --> ABORTAMOS EL PROCESO POR NO EXISTIR REGISTRO DE CABECERA
      begin
         select @w_d_msg   = 'NO EXISTE REGISTRO DE CABECERA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cab PARA EL PERIODO Y SECUENCIA INGRESADOS',
                @w_n_error = 1

         goto ERROR
      end
   end

   --> OBTENEMOS EL ID DE LA CABECERA PARA RELACION EN LAS DEMAS TABLAS
   if @w_n_cabecera != 0
   begin
      select @w_n_id = oa_n_id
      from cob_bcradgi..bc_d_ocde_afip_cab --, cob_bcradgi..cl_fatca_carga_masiva
      where oa_n_periodo   = @i_c_periodo
      and   oa_n_secuencia = @i_c_secuencia
   end

   select @w_n_id = isnull(@w_n_id,0)

   -- PREVIO A ELIMINAR VERIFICAMOS SI ES EL 1ER LOTE A EJECUTAR
   if exists (select 1
            from cob_bcradgi..cl_fatca_carga_masiva
            where cm_c_proceso = 'S')
   begin
      select @w_n_error = 0
   end
   else
   begin
      --> ESTRUCTURA 02: VERIFICAMOS EXISTENCIA DE REGISTROS PARA EL ID.CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_cta
               where oc_n_id = @w_n_id)
      begin
         --> ELIMINAMOS CTA. POR ID.CABECERA
         delete from cob_bcradgi..bc_d_ocde_afip_cta
         where oc_n_id = @w_n_id

         select @w_n_error = @@error, @w_n_registros = @@rowcount

         if @w_n_error != 0
         begin
            select @w_d_msg = 'ERROR AL ELIMINAR DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta'

            goto ERROR
         end

         if @w_n_registros != 0
         begin
            select @w_d_msg = 'SE ELIMINARON '+convert(varchar(10),@w_n_registros)+' REGISTROS DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end
      end

      --> ESTRUCTURA 03: VERIFICAMOS EXISTENCIA DE REGISTROS PARA EL ID.CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_pf
               where pf_n_id = @w_n_id)
      begin
         --> ELIMINAMOS PERSONA FISICA POR ID.CABECERA
         delete from cob_bcradgi..bc_d_ocde_afip_pf
         where pf_n_id = @w_n_id

         select @w_n_error = @@error, @w_n_registros = @@rowcount

         if @w_n_error != 0
         begin
            select @w_d_msg = 'ERROR AL ELIMINAR DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf'

            goto ERROR
         end

         if @w_n_registros != 0
         begin
            select @w_d_msg = 'SE ELIMINARON '+convert(varchar(10),@w_n_registros)+' REGISTROS DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end
      end

      --> ESTRUCTURA 04: VERIFICAMOS EXISTENCIA DE REGISTROS PARA EL ID.CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_pj
               where pj_n_id = @w_n_id)
      begin
         --> ELIMINAMOS PERSONA JURIDICA POR ID.CABECERA
         delete from cob_bcradgi..bc_d_ocde_afip_pj
         where pj_n_id = @w_n_id

         select @w_n_error = @@error, @w_n_registros = @@rowcount

         if @w_n_error != 0
         begin
            select @w_d_msg = 'ERROR AL ELIMINAR DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj'

            goto ERROR
         end

         if @w_n_registros != 0
         begin
            select @w_d_msg = 'SE ELIMINARON '+convert(varchar(10),@w_n_registros)+' REGISTROS DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end
      end

      --> ESTRUCTURA 05: VERIFICAMOS EXISTENCIA DE REGISTROS PARA EL ID.CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_pc
               where pc_n_id = @w_n_id)
      begin
         --> ELIMINAMOS PERSONA CONTROLADORA POR ID.GRAL, ID.CTA Y NRO.CUIL
         delete from cob_bcradgi..bc_d_ocde_afip_pc
         where pc_n_id = @w_n_id

         select @w_n_error = @@error, @w_n_registros = @@rowcount

         if @w_n_error != 0
         begin
            select @w_d_msg = 'ERROR AL ELIMINAR DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pc'

            goto ERROR
         end

         if @w_n_registros != 0
         begin
            select @w_d_msg = 'SE ELIMINARON '+convert(varchar(10),@w_n_registros)+' REGISTROS DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pc'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end
      end

      --> ESTRUCTURA 06: VERIFICAMOS EXISTENCIA DE REGISTROS PARA EL ID.CABECERA
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_pagos
               where pa_n_id = @w_n_id)
      begin
         --> ELIMINAMOS PAGOS POR ID.GRAL, ID.CTA. Y TIPO PAGO
         delete from cob_bcradgi..bc_d_ocde_afip_pagos
         where pa_n_id = @w_n_id

         select @w_n_error = @@error, @w_n_registros = @@rowcount

         if @w_n_error != 0
         begin
            select @w_d_msg = 'ERROR AL ELIMINAR DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos'

            goto ERROR
         end

         if @w_n_registros != 0
         begin
            select @w_d_msg = 'SE ELIMINARON '+convert(varchar(10),@w_n_registros)+' REGISTROS DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos'

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end
      end
   end

   --> SI NO EXISTE EL REGISTRO DE CABECERA EN LA TABLA OPERATIVA Y SI EN LA TABLA MASIVA INSERTAMOS LA MISMA
   if @w_n_id = 0 and @w_n_cabecera = 1
   begin
      --> BUSCAMOS LOS VALORES PARA EL REGISTRO DE CABECERA
      select
         @w_d_campo1 = cm_d_campo1,
         @w_d_campo2 = cm_d_campo2,
         @w_d_campo3 = cm_d_campo3,
         @w_d_campo4 = cm_d_campo4,
         @w_d_campo5 = cm_d_campo5,
         @w_d_campo6 = cm_d_campo6,
         @w_d_campo7 = cm_d_campo7,
         @w_d_campo8 = cm_d_campo8,
         @w_d_campo9 = cm_d_campo9
      from cob_bcradgi..cl_fatca_carga_masiva
      where cm_d_campo3 = '01'

      --> INSERTAMOS LA CABECERA CON LOS DATOS ENVIADOS
      exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
      @t_trn                  = 29330,
      @i_c_operacion          = 'I',
      @i_n_opcion             = 1,
      @i_n_periodo            = @w_d_campo1,
      @i_n_secuencia          = @w_d_campo2,
      @i_c_tipo_registro_cab  = @w_d_campo3,
      @i_n_cuit_informante    = @w_d_campo4,
      @i_n_formulario         = @w_d_campo5,
      @i_c_version            = @w_d_campo6,
      @i_c_impuesto           = @w_d_campo7,
      @i_c_concepto           = @w_d_campo8,
      @i_m_ctas_declaradas    = '1',
      @i_m_control_secuencia  = 'N',
      @i_m_quien_llama        = 'B',
      @s_user                 = @s_user,
      @o_s_id                 = @w_n_id out

      if @w_n_error != 0
      begin
         select @w_d_msg   = 'ERROR AL INSERTAR LA CABECERA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cab',
                @w_n_error = 1

         goto ERROR
      end

      select @w_d_msg = 'SE INSERTO CON EXITO LA CABECERA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cab'

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'

      --> VERIFICAMOS SI HAY UNA SECUENCIA VIGENTE PARA EL PERIODO
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_cab
               where oa_n_periodo    = @i_c_periodo
               and   oa_n_secuencia != @i_c_secuencia
               and   oa_e_registro   = 'V')
      begin
         --> MARCAMOS COMO CANCELADA LA ULTIMA SECUENCIA VIGENTE PARA EL PERIODO
         select @w_n_id_cancel = isnull(oa_n_id,0)
         from cob_bcradgi..bc_d_ocde_afip_cab
         where oa_n_periodo    = @i_c_periodo
         and   oa_n_secuencia != @i_c_secuencia
         and   oa_e_registro   = 'V'

         update cob_bcradgi..bc_d_ocde_afip_cab set
         oa_e_registro = 'C',
         oa_f_modif    = getdate(),
         oa_u_modif    = @s_user
         where oa_n_id = @w_n_id_cancel
         and   oa_e_registro = 'V'

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cab',
                   @w_n_error = 1

            goto ERROR
         end

         update cob_bcradgi..bc_d_ocde_afip_cta set
         oc_e_registro = 'C',
         oc_f_modif    = getdate(),
         oc_u_modif    = @s_user
         where oc_n_id = @w_n_id_cancel
         and   oc_e_registro = 'V'

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cta',
                   @w_n_error = 1

            goto ERROR
         end

         update cob_bcradgi..bc_d_ocde_afip_pf set
         pf_e_registro  = 'C',
         pf_f_modif     = getdate(),
         pf_u_modif     = @s_user
         where pf_n_id  = @w_n_id_cancel
         and   pf_e_registro = 'V'

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_pf',
                   @w_n_error = 1

            goto ERROR
         end

         update cob_bcradgi..bc_d_ocde_afip_pj set
         pj_e_registro = 'C',
         pj_f_modif    = getdate(),
         pj_u_modif    = @s_user
         where pj_n_id = @w_n_id_cancel
         and   pj_e_registro = 'V'

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_pj',
                   @w_n_error = 1

            goto ERROR
         end

         update cob_bcradgi..bc_d_ocde_afip_pagos set
         pa_e_registro = 'C',
         pa_f_modif    = getdate(),
         pa_u_modif    = @s_user
         where pa_n_id = @w_n_id_cancel
         and   pa_e_registro = 'V'

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos',
                   @w_n_error = 1

            goto ERROR
         end
      end
   end
   else
   begin
      --> VERIFICAR SI HAY UNA CABECERA VIGENTE PARA EL PERIODO
      if exists (select 1
               from cob_bcradgi..bc_d_ocde_afip_cab
               where oa_n_periodo    = @i_c_periodo
               and   oa_n_secuencia != @i_c_secuencia
               and   oa_e_registro   = 'V')
      begin
         --> EL USUARIO NO CANCELO LA SECUENCIA VIGENTE PARA EL PERIODO
         select @w_d_msg   = 'ERROR: EL USUARIO DEBE CANCELAR LA SECUENCIA VIGENTE PREVIO AL REPROCESO DEL ARCHIVO',
                @w_n_error = 1

         goto ERROR
      end
      else
      begin
         --> MARCAMOS COMO VIGENTE EL PERIODO/SECUENCIA REPROCESADO
         update cob_bcradgi..bc_d_ocde_afip_cab set
         oa_e_registro = 'V',
         oa_f_modif    = getdate(),
         oa_u_modif    = @s_user
         where oa_n_periodo   = @i_c_periodo
         and   oa_n_secuencia = @i_c_secuencia

         if @@error != 0
         begin
            select @w_d_msg   = 'ERROR AL ACTUALIZAR LA VIGENCIA PARA EL PERIODO/SECUENCIA EN LA TABLA cob_bcradgi..bc_d_ocde_afip_cab',
                   @w_n_error = 1

            goto ERROR
         end
      end
   end

   --> RECORREMOS LA TABLA DE CARGA MASIVA
   select @w_n_siguiente = isnull(min(cm_n_secuen),0)
   from cob_bcradgi..cl_fatca_carga_masiva

   select @w_n_max = isnull(max(cm_n_secuen),0)
   from cob_bcradgi..cl_fatca_carga_masiva

   while @w_n_siguiente <= @w_n_max
   begin
      select
         @w_d_campo1 = isnull(cm_d_campo1,''),    @w_d_campo2 = isnull(cm_d_campo2,''),    @w_d_campo3 = isnull(cm_d_campo3,''),
         @w_d_campo4 = isnull(cm_d_campo4,''),    @w_d_campo5 = isnull(cm_d_campo5,''),    @w_d_campo6 = isnull(cm_d_campo6,''),
         @w_d_campo7 = isnull(cm_d_campo7,''),    @w_d_campo8 = isnull(cm_d_campo8,''),    @w_d_campo9 = isnull(cm_d_campo9,''),
         @w_d_campo10 = isnull(cm_d_campo10,''),  @w_d_campo11 = isnull(cm_d_campo11,''),  @w_d_campo12 = isnull(cm_d_campo12,''),
         @w_d_campo13 = isnull(cm_d_campo13,''),  @w_d_campo14 = isnull(cm_d_campo14,''),  @w_d_campo15 = isnull(cm_d_campo15,''),
         @w_d_campo16 = isnull(cm_d_campo16,''),  @w_d_campo17 = isnull(cm_d_campo17,''),  @w_d_campo18 = isnull(cm_d_campo18,''),
         @w_d_campo19 = isnull(cm_d_campo19,''),  @w_d_campo20 = isnull(cm_d_campo20,''),  @w_d_campo21 = isnull(cm_d_campo21,''),
         @w_d_campo22 = isnull(cm_d_campo22,''),  @w_d_campo23 = isnull(cm_d_campo23,''),  @w_d_campo24 = isnull(cm_d_campo24,''),
         @w_d_campo25 = isnull(cm_d_campo25,''),  @w_d_campo26 = isnull(cm_d_campo26,''),  @w_d_campo27 = isnull(cm_d_campo27,''),
         @w_d_campo28 = isnull(cm_d_campo28,''),  @w_d_campo29 = isnull(cm_d_campo29,''),  @w_d_campo30 = isnull(cm_d_campo30,''),
         @w_d_campo31 = isnull(cm_d_campo31,''),  @w_d_campo32 = isnull(cm_d_campo32,''),  @w_d_campo33 = isnull(cm_d_campo33,''),
         @w_d_campo34 = isnull(cm_d_campo34,''),  @w_d_campo35 = isnull(cm_d_campo35,''),  @w_d_campo36 = isnull(cm_d_campo36,''),
         @w_d_campo37 = isnull(cm_d_campo37,''),  @w_d_campo38 = isnull(cm_d_campo38,''),  @w_d_campo39 = isnull(cm_d_campo39,''),
         @w_d_campo40 = isnull(cm_d_campo40,''),  @w_d_campo41 = isnull(cm_d_campo41,''),  @w_d_campo42 = isnull(cm_d_campo42,''),
         @w_d_campo43 = isnull(cm_d_campo43,''),  @w_d_campo44 = isnull(cm_d_campo44,''),  @w_d_campo45 = isnull(cm_d_campo45,''),
         @w_d_campo46 = isnull(cm_d_campo46,''),  @w_d_campo47 = isnull(cm_d_campo47,'')
      from cob_bcradgi..cl_fatca_carga_masiva
      where cm_n_secuen  = @w_n_siguiente
      -- and   cm_c_proceso = 'N'

      if @w_d_campo3 = '02'
      begin --> TABLA CUENTA

         select @w_n_saldo_cta = isnull(convert(money, @w_d_campo12),0)

         --> VALIDAMOS EL CAMPO oc_c_tipo_cta
         if exists (select 1
                  from cobis..cl_tabla T, cobis..cl_catalogo C
                  where T.tabla  = 'bc_ocde_tipo_cta'
                  and   C.tabla  = T.codigo
                  and   C.codigo = isnull(@w_d_campo5, ''))
         begin
            --> VALIDAMOS EL CAMPO oc_e_cta
            if exists (select 1
                     from cobis..cl_tabla T, cobis..cl_catalogo C
                     where T.tabla  = 'bc_ocde_estado_cta'
                     and   C.tabla  = T.codigo
                     and   C.codigo = isnull(@w_d_campo6, ''))
            begin
               --> VALIDAMOS EL CAMPO oc_c_formato_cta
               if exists (select 1
                        from cobis..cl_tabla T, cobis..cl_catalogo C
                        where T.tabla  = 'bc_ocde_form_nro_cta'
                        and   C.tabla  = T.codigo
                        and   C.codigo = isnull(@w_d_campo10, ''))
               begin
                  --> VALIDAMOS EL CAMPO oc_c_moneda
                  if exists (select 1
                           from cobis..cl_tabla T, cobis..cl_catalogo C
                           where T.tabla  = 'bc_monedas_swift'
                           and   C.tabla  = T.codigo
                           and   C.codigo = isnull(@w_d_campo13, ''))
                  begin
                     select @w_n_error = 0

                     --> VALIDAMOS EL CAMPO oc_n_cta
                     if @w_d_campo11 != ''
                        select @w_d_campo11 = rtrim(ltrim(@w_d_campo11))
                     else
                     begin
                        select @w_d_msg   = 'EL VALOR DEL CAMPO oc_n_cta DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta NO PUEDE SER NULO',
                               @w_n_error = 1

                        exec cob_bcradgi..sp_errores_batch
                        @i_sp          = @w_d_sp_name,
                        @i_campo       = @s_date,
                        @i_dato        = @w_d_dato,
                        @i_observacion = @w_d_msg,
                        @i_secuenciar  = 'S'
                     end
                  end
                  else
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO oc_c_moneda DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end
               end
               else
               begin
                  select @w_d_msg   = 'EL VALOR DEL CAMPO oc_c_formato_cta DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta NO PUEDE SER NULO',
                         @w_n_error = 1

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO oc_e_cta DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
         else
         begin
            select @w_d_msg   = 'EL VALOR DEL CAMPO oc_c_tipo_cta DE LA TABLA cob_bcradgi..bc_d_ocde_afip_cta NO PUEDE SER NULO',
                   @w_n_error = 1

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end

         if @w_n_error = 0
         begin
            --> SI NO EXISTE INSERTAMOS EN TABLA cob_bcradgi..bc_d_ocde_afip_cta
            exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
            @t_trn                  = 29331,
            @i_c_operacion          = 'I',
            @i_n_opcion             = 2,
            @i_n_id                 = @w_n_id,
            @i_c_tipo_registro_cta  = @w_d_campo3,
            @i_c_tipo_cta           = @w_d_campo5,
            @i_e_cta                = @w_d_campo6,
            @i_m_indocumentada      = @w_d_campo7,
            @i_m_apertura_cierre    = @w_d_campo8,
            @i_m_inactiva           = @w_d_campo9,
            @i_c_formato_cta        = @w_d_campo10,
            @i_n_cta                = @w_d_campo11,
            @i_i_saldo_cta          = @w_n_saldo_cta,
            @i_c_moneda             = @w_d_campo13,
            @i_n_secuencia          = @w_d_campo2,
            @i_n_periodo            = @w_d_campo1,
            @i_m_quien_llama        = 'B',
            @s_user                 = @s_user,
            @o_s_id_cta             = @w_n_id_cta out

            if @w_n_error = 0
            begin
               --> INSERTAMOS EN LA TABLA TEMPORAL DE CUENTAS EL ID.CTA. ASIGNADO AL NRO.CUIL/NRO.CUENTA
               insert into cob_bcradgi..cl_fatca_cta (
                  ct_n_id,
                  ct_n_id_cta,
                  ct_n_nro_cuil,
                  ct_n_nro_cta,
                  ct_c_persona )
               select
                  @w_n_id,
                  @w_n_id_cta,
                  cm_d_campo4,
                  cm_d_campo11,
                  'N'
               from cob_bcradgi..cl_fatca_carga_masiva
               where cm_d_campo3 = '02'
               and   cm_n_secuen = @w_n_siguiente

               if @@error != 0
               begin
                  select @w_d_msg   = 'ERROR AL INSERTAR EN LA TABLA cob_bcradgi..cl_fatca_cta',
                         @w_n_error = 1

                  goto ERROR
               end
            end
            else
            begin
               --> ERROR AL EJECUTAR cob_bcradgi..sp_bc_ocde_afip_proc
               select @w_d_msg = mensaje
               from cobis..cl_errores
               where numero = @w_n_error

               select @w_d_msg = @w_d_msg+' - TABLA: cob_bcradgi..bc_d_ocde_afip_cta - ID.CAB: '+convert(varchar(10),@w_n_id)+' - ID.CTA: '+convert(varchar(15),@w_n_id_cta)

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
      end --> TABLA CUENTA

      if @w_d_campo3 = '03'
      begin --> TABLA PERSONA FISICA

         --> VALIDAMOS EL CAMPO pf_c_motivo
         if exists (select 1
                  from cobis..cl_tabla T, cobis..cl_catalogo C
                  where T.tabla  = 'bc_ocde_motivos'
                  and   C.tabla  = T.codigo
                  and   C.codigo = isnull(@w_d_campo7, ''))
         begin
            --> VALIDAMOS EL CAMPO pf_c_tipo_nombre
            if exists (select 1
                     from cobis..cl_tabla T, cobis..cl_catalogo C
                     where T.tabla  = 'bc_ocde_tipo_nombre'
                     and   C.tabla  = T.codigo
                     and   C.codigo = isnull(@w_d_campo15, ''))
            begin
               --> VALIDAMOS EL CAMPO pf_c_tipo_domicilio
               if exists (select 1
                        from cobis..cl_tabla T, cobis..cl_catalogo C
                        where T.tabla  = 'bc_ocde_tipo_domic'
                        and   C.tabla  = T.codigo
                        and   C.codigo = isnull(@w_d_campo22, ''))
               begin
                  select @w_n_error = 0

                  --> VALIDAMOS EL CAMPO pf_n_cuil
                  if @w_d_campo4 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_n_cuil DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_c_pais_residencia_1
                  if @w_d_campo5 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_pais_residencia_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_c_jurisdiccion_1
                  if @w_d_campo8 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_jurisdiccion_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_d_primer_nombre
                  if @w_d_campo17 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_d_primer_nombre DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_d_apellido
                  if @w_d_campo20 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_d_apellido DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_c_pais_domicilio
                  if @w_d_campo31 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_pais_domicilio DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_c_nacionalidad
                  if @w_d_campo32 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_nacionalidad DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pf_c_pais_nacimiento
                  if @w_d_campo36 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_pais_nacimiento DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end
               end
               else
               begin
                  select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_tipo_domicilio DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                         @w_n_error = 1

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_tipo_nombre DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
         else
         begin
            select @w_d_msg   = 'EL VALOR DEL CAMPO pf_c_motivo DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pf NO PUEDE SER NULO',
                   @w_n_error = 1

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end

         if @w_n_error = 0
         begin
            --> BUSCAMOS PARA EL NRO.CUIL DE PF. EL ID.CTA. DE LA TABLA TEMPORAL QUE NO HA SIDO INSERTADO
            select @w_n_id_cta = isnull(ct_n_id_cta,0)
            from cob_bcradgi..cl_fatca_cta
            where ct_n_id        = @w_n_id
            and   ct_n_nro_cuil  = @w_d_campo4
            and   ct_c_persona   = 'N'
            order by ct_n_id_cta

            if @w_n_id_cta != 0
            begin
               --> INSERTAMOS EN TABLA cob_bcradgi..bc_d_ocde_afip_pf
               exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
               @t_trn                     = 29330,
               @i_c_operacion             = 'I',
               @i_n_opcion                = 3,
               @i_n_id                    = @w_n_id,
               @i_n_id_cta                = @w_n_id_cta,
               @i_c_tipo_registro_pf      = @w_d_campo3,
               @i_n_secuencia             = @w_d_campo2,
               @i_n_cuil                  = @w_d_campo4,
               @i_c_pais_residencia_1     = @w_d_campo5,
               @i_c_nif_1                 = @w_d_campo6,
               @i_c_motivo                = @w_d_campo7,
               @i_c_jurisdiccion_1        = @w_d_campo8,
               @i_c_pais_residencia_2     = @w_d_campo9,
               @i_c_nif_2                 = @w_d_campo10,
               @i_c_jurisdiccion_2        = @w_d_campo11,
               @i_c_pais_residencia_3     = @w_d_campo12,
               @i_c_nif_3                 = @w_d_campo13,
               @i_c_jurisdiccion_3        = @w_d_campo14,
               @i_c_tipo_nombre           = @w_d_campo15,
               @i_c_titulo                = @w_d_campo16,
               @i_d_primer_nombre         = @w_d_campo17,
               @i_d_segundo_nombre        = @w_d_campo18,
               @i_c_prefijo               = @w_d_campo19,
               @i_d_apellido              = @w_d_campo20,
               @i_c_sufijo                = @w_d_campo21,
               @i_c_tipo_domicilio        = @w_d_campo22,
               @i_d_calle                 = @w_d_campo23,
               @i_c_numero                = @w_d_campo24,
               @i_c_piso_dto_oficina      = @w_d_campo25,
               @i_c_distrito              = @w_d_campo26,
               @i_c_casilla_postal        = @w_d_campo27,
               @i_c_postal                = @w_d_campo28,
               @i_c_ciudad                = @w_d_campo29,
               @i_c_estado_provincia      = @w_d_campo30,
               @i_c_pais_domicilio        = @w_d_campo31,
               @i_c_nacionalidad          = @w_d_campo32,
               @i_f_nacimiento            = @w_d_campo33,
               @i_c_ciudad_nacimiento     = @w_d_campo34,
               @i_c_provincia_nacimiento  = @w_d_campo35,
               @i_c_pais_nacimiento       = @w_d_campo36,
               @i_d_nombre_pais           = @w_d_campo37,
               @i_m_fin_registro          = @w_d_campo38,
               @i_m_quien_llama           = 'B',
               @s_ssn                     = @s_ssn,
               @s_user                    = @s_user

               if @w_n_error = 0
               begin
                  --> ACTUALIZAMOS EL CAMPO QUE MARCA QUE EL ID.CTA. FUE INSERTADO EN PF.
                  update cob_bcradgi..cl_fatca_cta set
                  ct_c_persona = 'S'
                  where ct_n_id        = @w_n_id
                  and   ct_n_id_cta    = @w_n_id_cta
                  and   ct_n_nro_cuil  = @w_d_campo4
                  and   ct_c_persona   = 'N'

                  if @@error != 0
                  begin
                     select @w_d_msg   = 'ERROR AL ACTUALIZAR LA TABLA cob_bcradgi..cl_fatca_cta',
                            @w_n_error = 1

                     goto ERROR
                  end
               end
               else
               begin
                  --> ERROR AL EJECUTAR cob_bcradgi..sp_bc_ocde_afip_proc
                  select @w_d_msg = mensaje
                  from cobis..cl_errores
                  where numero = @w_n_error

                  select @w_d_msg = @w_d_msg+' - TABLA: cob_bcradgi..bc_d_ocde_afip_pf - ID.CAB: '+convert(varchar(10),@w_n_id)+' - ID.CTA: '+convert(varchar(10),@w_n_id_cta)+' - NRO.CUIL: '+@w_d_campo4

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               --> NO EXISTE EL ID.CTA. PARA PF.
               select @w_d_msg = 'TABLA: cob_bcradgi..bc_d_ocde_afip_pf - NO EXISTE EL ID.CTA PARA EL ID.CAB: '+convert(varchar(10),@w_n_id)+' Y NRO.CUIL: '+@w_d_campo4

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
      end --> TABLA PERSONA FISICA

      if @w_d_campo3 = '04'
      begin --> TABLA PERSONA JURIDICA

         --> VALIDAMOS EL CAMPO pj_c_tipo_entidad
         if exists (select 1
                  from cobis..cl_tabla T, cobis..cl_catalogo C
                  where T.tabla  = 'bc_ocde_tipo_entidad'
                  and   C.tabla  = T.codigo
                  and   C.codigo = isnull(@w_d_campo5, ''))
         begin
            --> VALIDAMOS EL CAMPO pj_c_motivo
            if exists (select 1
                     from cobis..cl_tabla T, cobis..cl_catalogo C
                     where T.tabla  = 'bc_ocde_motivos'
                     and   C.tabla  = T.codigo
                     and   C.codigo = isnull(@w_d_campo9, ''))
            begin
               --> VALIDAMOS EL CAMPO pj_c_tipo_nombre
               if exists (select 1
                        from cobis..cl_tabla T, cobis..cl_catalogo C
                        where T.tabla  = 'bc_ocde_tipo_nombre'
                        and   C.tabla  = T.codigo
                        and   C.codigo = isnull(@w_d_campo14, ''))
               begin
                  select @w_n_error = 0

                  --> VALIDAMOS EL CAMPO pj_c_pais_residencia_fiscal_1
                  if @w_d_campo6 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pj_c_pais_residencia_fiscal_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end

                  --> VALIDAMOS EL CAMPO pj_c_jurisdiccion_1
                  if @w_d_campo10 = ''
                  begin
                     select @w_d_msg   = 'EL VALOR DEL CAMPO pj_c_jurisdiccion_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj NO PUEDE SER NULO',
                            @w_n_error = 1

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end
               end
               else
               begin
                  select @w_d_msg   = 'EL VALOR DEL CAMPO pj_c_tipo_entidad DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj NO PUEDE SER NULO',
                         @w_n_error = 1

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pj_c_motivo DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pj NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end

         if @w_n_error = 0
         begin
            --> BUSCAMOS PARA EL NRO.CUIL DE PJ. EL ID.CTA. DE LA TABLA TEMPORAL QUE NO HA SIDO INSERTADO
            select @w_n_id_cta = isnull(ct_n_id_cta,0)
            from cob_bcradgi..cl_fatca_cta
            where ct_n_id        = @w_n_id
            and   ct_n_nro_cuil  = @w_d_campo4
            and   ct_c_persona   = 'N'
            order by ct_n_id_cta

            if @w_n_id_cta != 0
            begin
               --> SI NO EXISTE EL REGISTRO INSERTAMOS EN TABLA cob_bcradgi..bc_d_ocde_afip_pj
               exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
               @t_trn                        = 29333,
               @i_c_operacion                = 'I',
               @i_n_opcion                   = 4,
               @i_n_id                       = @w_n_id,
               @i_n_id_cta                   = @w_n_id_cta,
               @i_n_secuencia                = @w_d_campo2,
               @i_c_tipo_registro_pj         = @w_d_campo3,
               @i_n_cuil                     = @w_d_campo4,
               @i_c_tipo_entidad             = @w_d_campo5,
               @i_c_pais_residencia_fiscal_1 = @w_d_campo6,
               @i_c_nif_1                    = @w_d_campo7,
               @i_c_tipo_nif_1               = @w_d_campo8,
               @i_c_motivo                   = @w_d_campo9,
               @i_c_jurisdiccion_1           = @w_d_campo10,
               @i_c_nif_2                    = @w_d_campo11,
               @i_c_tipo_nif_2               = @w_d_campo12,
               @i_c_jurisdiccion_2           = @w_d_campo13,
               @i_c_tipo_nombre              = @w_d_campo14,
               @i_d_denominacion             = @w_d_campo15,
               @i_c_calle                    = @w_d_campo16,
               @i_c_numero                   = @w_d_campo17,
               @i_c_piso_dto_oficina         = @w_d_campo18,
               @i_c_distrito                 = @w_d_campo19,
               @i_c_casilla_postal           = @w_d_campo20,
               @i_c_postal                   = @w_d_campo21,
               @i_c_ciudad                   = @w_d_campo22,
               @i_c_estado_provincia         = @w_d_campo23,
               @i_c_pais_domicilio           = @w_d_campo24,
               @i_m_declara_per_controlantes = @w_d_campo25,
               @i_m_quien_llama              = 'B',
               @s_ssn                        = @s_ssn,
               @s_user                       = @s_user,
               @o_s_id_pj                    = @w_n_id_pj out

               if @w_n_error = 0
               begin
                  --> ACTUALIZAMOS LOS CAMPOS CON ID.PJ. Y MARCA DE QUE EL ID.CTA. FUE INSERTADO EN PJ.
                  update cob_bcradgi..cl_fatca_cta set
                  ct_n_id_pj   = @w_n_id_pj,
                  ct_c_persona = 'S'
                  where ct_n_id        = @w_n_id
                  and   ct_n_id_cta    = @w_n_id_cta
                  and   ct_n_nro_cuil  = @w_d_campo4
                  and   ct_c_persona   = 'N'

                  if @@error != 0
                  begin
                     select @w_d_msg   = 'ERROR AL ACTUALIZAR LA TABLA cob_bcradgi..cl_fatca_cta',
                            @w_n_error = 1

                     goto ERROR
                  end
               end
               else
               begin
                  --> ERROR AL EJECUTAR cob_bcradgi..sp_bc_ocde_afip_proc
                  select @w_d_msg = mensaje
                  from cobis..cl_errores
                  where numero = @w_n_error

                  select @w_d_msg = @w_d_msg+' - TABLA: cob_bcradgi..bc_d_ocde_afip_pj - ID.CAB: '+convert(varchar(10),@w_n_id)+' - ID.CTA: '+convert(varchar(10),@w_n_id_cta)+' - NRO.CUIL: '+@w_d_campo4

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               --> NO EXISTE EL ID.CTA. PARA PJ.
               select @w_d_msg = 'TABLA: cob_bcradgi..bc_d_ocde_afip_pj - NO EXISTE EL ID.CTA PARA EL ID.CAB: '+convert(varchar(10),@w_n_id)+' Y NRO.CUIL: '+@w_d_campo4

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
      end --> TABLA PERSONA JURIDICA

      if @w_d_campo3 = '05'
      begin --> TABLA PERSONA CONTROLADORA

         --> VALIDAMOS EL CAMPO pc_c_tipo_controlante
         if exists (select 1
                  from cobis..cl_tabla T, cobis..cl_catalogo C
                  where T.tabla  = 'bc_ocde_tipo_pers_contr'
                  and   C.tabla  = T.codigo
                  and   C.codigo = isnull(@w_d_campo5, ''))
         begin
            select @w_n_error = 0

            --> VALIDAMOS EL CAMPO pc_c_pais_residencia_fiscal_1
            if @w_d_campo5 = ''
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pc_c_pais_residencia_fiscal_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pc NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end

            --> VALIDAMOS EL CAMPO pc_c_jurisdiccion_1
            if @w_d_campo8 = ''
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pc_c_jurisdiccion_1 DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pc NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         else
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pc_c_tipo_controlante DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pc NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end

         if @w_n_error = 0
         begin
            --> BUSCAMOS PARA EL ID.CAB. Y NRO.CUIL DE PC EL ID.CTA. DE LA TABLA TEMPORAL QUE NO HA SIDO INSERTADO
            select @w_n_id_cta = isnull(ct_n_id_cta,0)
            from cob_bcradgi..cl_fatca_cta
            where ct_n_id        = @w_n_id
            and   ct_n_nro_cuil  = @w_d_campo4
            and   ct_c_persona   = 'S'
            order by ct_n_id_cta

            if @w_n_id_cta != 0
            begin
               --> BUSCAMOS EL ID.PJ. EN CASO DE ESTAR VACIO POR SER UN LOTE NUEVO
               select @w_n_id_pj = isnull(ct_n_id_pj,0)
               from cob_bcradgi..cl_fatca_cta
               where ct_n_id        = @w_n_id
               and   ct_n_id_cta    = @w_n_id_cta
               and   ct_n_nro_cuil  = @w_d_campo4
               and   ct_c_persona   = 'S'
               order by ct_n_id_pj

               if @w_n_id_pj != 0
               begin
                  --> INSERTAMOS EN TABLA cob_bcradgi..bc_d_ocde_afip_pc
                  exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
                  @t_trn                        = 29334,
                  @i_c_operacion                = 'I',
                  @i_n_opcion                   = 5,
                  @i_n_id                       = @w_n_id,
                  @i_n_id_cta                   = @w_n_id_cta,
                  @i_n_id_pj                    = @w_n_id_pj,
                  @i_c_tipo_registro_pc         = @w_d_campo3,
                  @i_n_secuencia                = @w_d_campo2,
                  @i_n_cuil                     = @w_d_campo4,
                  @i_c_pais_residencia_fiscal_1 = @w_d_campo5,
                  @i_c_nif_1                    = @w_d_campo6,
                  @i_c_motivo                   = @w_d_campo7,
                  @i_c_jurisdiccion_1           = @w_d_campo8,
                  @i_c_pais_residencia_fiscal_2 = @w_d_campo8,
                  @i_c_nif_2                    = @w_d_campo9,
                  @i_c_jurisdiccion_2           = @w_d_campo10,
                  @i_c_pais_residencia_fiscal_3 = @w_d_campo11,
                  @i_c_nif_3                    = @w_d_campo12,
                  @i_c_jurisdiccion_3           = @w_d_campo13,
                  @i_c_tipo_nombre              = @w_d_campo15,
                  @i_c_titulo                   = @w_d_campo16,
                  @i_d_primer_nombre            = @w_d_campo17,
                  @i_d_segundo_nombre           = @w_d_campo18,
                  @i_c_prefijo                  = @w_d_campo19,
                  @i_d_apellido                 = @w_d_campo20,
                  @i_c_sufijo                   = @w_d_campo21,
                  @i_c_tipo_domicilio           = @w_d_campo22,
                  @i_d_calle                    = @w_d_campo23,
                  @i_c_numero                   = @w_d_campo24,
                  @i_c_piso_dto_oficina         = @w_d_campo25,
                  @i_c_distrito                 = @w_d_campo26,
                  @i_c_casilla_postal           = @w_d_campo27,
                  @i_c_postal                   = @w_d_campo28,
                  @i_c_ciudad                   = @w_d_campo29,
                  @i_c_estado_provincia         = @w_d_campo30,
                  @i_c_pais_domicilio           = @w_d_campo31,
                  @i_c_nacionalidad             = @w_d_campo32,
                  @i_f_nacimiento               = @w_d_campo33,
                  @i_c_ciudad_nacimiento        = @w_d_campo34,
                  @i_c_provincia_nacimiento     = @w_d_campo35,
                  @i_c_pais_nacimiento          = @w_d_campo36,
                  @i_d_nombre_pais              = @w_d_campo37,
                  @i_c_tipo_controlante         = @w_d_campo38,
                  @i_m_fin_registro             = @w_d_campo39,
                  @i_m_quien_llama              = 'B',
                  @s_ssn                        = @s_ssn,
                  @s_user                       = @s_user

                  if @w_n_error != 0
                  begin
                     --> ERROR AL EJECUTAR cob_bcradgi..sp_bc_ocde_afip_proc
                     select @w_d_msg = mensaje
                     from cobis..cl_errores
                     where numero = @w_n_error

                     select @w_d_msg = @w_d_msg+' - TABLA: cob_bcradgi..bc_d_ocde_afip_pc - ID.CAB: '+convert(varchar(10),@w_n_id)+' - ID.CTA: '+convert(varchar(10),@w_n_id_cta)+' - ID.PJ: '+convert(varchar(10),@w_n_id_pj)+' - NRO.CUIL: '+@w_d_campo4

                     exec cob_bcradgi..sp_errores_batch
                     @i_sp          = @w_d_sp_name,
                     @i_campo       = @s_date,
                     @i_dato        = @w_d_dato,
                     @i_observacion = @w_d_msg,
                     @i_secuenciar  = 'S'
                  end
               end
               else
               begin
                  --> NO EXISTE EL ID.PJ. PARA PC.
                  select @w_d_msg = 'TABLA: cob_bcradgi..bc_d_ocde_afip_pc - NO EXISTE EL ID.PJ. PARA EL ID.CAB: '+convert(varchar(10),@w_n_id)+', ID.PJ: '+convert(varchar(10),@w_n_id_pj)+' Y NRO.CUIL: '+@w_d_campo4

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               --> NO EXISTE EL ID.CTA. PARA PC.
               select @w_d_msg = 'TABLA: cob_bcradgi..bc_d_ocde_afip_pc - NO EXISTE EL ID.CTA. PARA EL ID.CAB: '+convert(varchar(10),@w_n_id)+', ID.PJ: '+convert(varchar(10),@w_n_id_pj)+' Y NRO.CUIL: '+@w_d_campo4

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
      end --> TABLA PERSONA CONTROLADORA

      if @w_d_campo3 = '06'
      begin --> TABLA PAGOS

         select @w_n_monto_bruto = isnull(convert(money, @w_d_campo7),0)

         --> VALIDAMOS EL CAMPO pa_c_tipo_pago
         if exists (select 1
                  from cobis..cl_tabla T, cobis..cl_catalogo C
                  where T.tabla  = 'bc_ocde_tipo_pago'
                  and   C.tabla  = T.codigo
                  and   C.codigo = isnull(@w_d_campo6, ''))
         begin
            select @w_n_error = 0

            if @w_d_campo5 != ''
               select @w_d_campo5 = rtrim(ltrim(@w_d_campo5))
            else
            begin
               select @w_d_msg   = 'EL NRO. DE LA CTA. PARA LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end

            if @w_d_campo7 = ''
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pa_c_moneda DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end

            if @w_n_monto_bruto = 0
            begin
               select @w_d_msg   = 'EL VALOR DEL CAMPO pa_i_monto_bruto_total DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos NO PUEDE SER NULO',
                      @w_n_error = 1

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
         else
         begin
            select @w_d_msg   = 'EL VALOR DEL CAMPO pa_c_tipo_pago DE LA TABLA cob_bcradgi..bc_d_ocde_afip_pagos NO PUEDE SER NULO',
                   @w_n_error = 1

            exec cob_bcradgi..sp_errores_batch
            @i_sp          = @w_d_sp_name,
            @i_campo       = @s_date,
            @i_dato        = @w_d_dato,
            @i_observacion = @w_d_msg,
            @i_secuenciar  = 'S'
         end

         if @w_n_error = 0
         begin
            --> BUSCAMOS PARA EL ID.CAB. Y NRO.CTA DE PAGOS EL ID.CTA. DE LA TABLA TEMPORAL
            select @w_n_id_cta = ct_n_id_cta
            from cob_bcradgi..cl_fatca_cta
            where ct_n_id        = @w_n_id
            and   ct_n_nro_cuil  = @w_d_campo4
            and   ct_n_nro_cta   = @w_d_campo5
            order by ct_n_id_cta

            if @w_n_id_cta != 0
            begin
               --> INSERTAMOS EN TABLA cob_bcradgi..bc_d_ocde_afip_pagos
               exec @w_n_error = cob_bcradgi..sp_bc_ocde_afip_proc
               @t_trn                  = 29335,
               @i_c_operacion          = 'I',
               @i_n_opcion             = 6,
               @i_n_id                 = @w_n_id,
               @i_n_id_cta             = @w_n_id_cta,
               @i_c_tipo_registro_pa   = @w_d_campo3,
               @i_c_tipo_pago          = @w_d_campo6,
               @i_i_monto_bruto_total  = @w_n_monto_bruto,
               @i_c_moneda             = @w_d_campo8,
               @i_n_secuencia          = @w_d_campo2,
               @i_m_quien_llama        = 'B',
               @s_ssn                  = @s_ssn,
               @s_user                 = @s_user

               if @w_n_error != 0
               begin
                  select @w_d_msg = mensaje
                  from cobis..cl_errores
                  where numero = @w_n_error

                  select @w_d_msg = @w_d_msg+' - TABLA: cob_bcradgi..bc_d_ocde_afip_pagos - '+@w_d_error+' - ID.CAB: '+convert(varchar(10),@w_n_id)+' - ID.CTA: '+convert(varchar(10),@w_n_id_cta)

                  exec cob_bcradgi..sp_errores_batch
                  @i_sp          = @w_d_sp_name,
                  @i_campo       = @s_date,
                  @i_dato        = @w_d_dato,
                  @i_observacion = @w_d_msg,
                  @i_secuenciar  = 'S'
               end
            end
            else
            begin
               --> NO EXISTE EL ID.CTA. PARA PAGOS
               select @w_d_msg = 'TABLA: cob_bcradgi..bc_d_ocde_afip_pagos - NO EXISTE EL ID.CTA PARA EL ID.CAB: '+convert(varchar(10),@w_n_id)+' Y NRO.CTA: '+@w_d_campo5

               exec cob_bcradgi..sp_errores_batch
               @i_sp          = @w_d_sp_name,
               @i_campo       = @s_date,
               @i_dato        = @w_d_dato,
               @i_observacion = @w_d_msg,
               @i_secuenciar  = 'S'
            end
         end
      end --> TABLA PAGOS

      update cob_bcradgi..cl_fatca_carga_masiva set
      cm_c_proceso = 'S'
      where cm_n_secuen = @w_n_siguiente

      if @@error != 0
      begin
         select @w_d_msg = 'ERROR AL MARCAR COMO PROCESADOS LOS REGISTROS DE LA TABLA cob_bcradgi..cl_fatca_carga_masiva: EL PROCESO CONTINUA...'

         exec cob_bcradgi..sp_errores_batch
         @i_sp          = @w_d_sp_name,
         @i_campo       = @s_date,
         @i_dato        = @w_d_dato,
         @i_observacion = @w_d_msg,
         @i_secuenciar  = 'S'
      end

      select @w_n_siguiente = @w_n_siguiente + 1
   end

   select @w_d_msg = 'FIN OPERACION O'

   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'

end --> ALTA DE TABLAS OCDE-AFIP
else

if @i_c_operacion = 'S'
begin --> GENERACION DE DATOS PARA EL ARCHIVO DE SALIDA
   if @i_logueo_por_lote = 'N' --> PARA QUE ENTRE LA PRIMERA VEZ
   begin
      if exists (select 1
               from cob_bcradgi..bc_errores_batch
               where eb_sp = @w_d_sp_name
               and   eb_observacion like '%--> INICIO PROCESO CARGA MASIVA FATCA')
      begin
         if exists (select 1
                  from cob_bcradgi..bc_errores_batch
                  where eb_sp = @w_d_sp_name
                  and   eb_observacion like '%FIN OPERACION O')
         begin
            select @w_d_msg = '--> FIN PROCESO CARGA MASIVA FATCA'
         end
         else
         begin
            select @w_d_msg = 'NO SE PROCESO EL ARCHIVO POR PANTALLA. VERIFIQUE...'
         end
      end
      else
      begin
         select @w_d_msg = 'AUN NO INICIO EL PROCESO DE CARGA MASIVA: VERIFIQUE...'
      end

      exec cob_bcradgi..sp_errores_batch
      @i_sp          = @w_d_sp_name,
      @i_campo       = @s_date,
      @i_dato        = @w_d_dato,
      @i_observacion = @w_d_msg,
      @i_secuenciar  = 'S'
   end

   set rowcount @i_k_filas

   select
      eb_f_hora,
      eb_observacion
   from cob_bcradgi..bc_errores_batch
   where eb_sp = @w_d_sp_name
   and   eb_observacion > @i_d_observacion
   order by eb_f_hora

   set rowcount 0

end --> GENERACION DE DATOS PARA EL ARCHIVO DE SALIDA

return 0

ERROR:
if @w_n_error != 0
begin
   exec cob_bcradgi..sp_errores_batch
   @i_sp          = @w_d_sp_name,
   @i_campo       = @s_date,
   @i_dato        = @w_d_dato,
   @i_observacion = @w_d_msg,
   @i_secuenciar  = 'S'
end

return @w_n_error

/*
<returns>
   <return value="0" description="Resulado exitoso" />
</returns>
*/
--<keyword>sp_bc_ocde_afip_carga_masiva</keyword>
/*
<dependency ObjName="cob_bcradgi..sp_errores_batch" xtype="P" dependentObjectName="cob_bcradgi..sp_bc_ocde_afip_carga_masiva" dependentObjectType="P" />
*/

go
