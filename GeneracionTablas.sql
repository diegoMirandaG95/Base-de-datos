/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     20/12/2015 13:58:27                          */
/*==============================================================*/


drop index RELATIONSHIP_16_FK;

drop index CORREO_PK;

drop table CORREO;

drop index DOMICILIO_PK;

drop table DOMICILIO;

drop index NECESITA_FK;

drop index EXAMEN_PK;

drop table EXAMEN;

drop index POSEE_1_FK;

drop index LABORATORIO_PK;

drop table LABORATORIO;

drop index SE_TRABAJA_FK;

drop index TRABAJA_FK;

drop index LABORATORIO_LABORATORISTA_PK;

drop table LABORATORIO_LABORATORISTA;

drop index LABORATORIO_REALIZA_EXAMEN2_FK;

drop index LABORATORIO_REALIZA_EXAMEN_FK;

drop index LABORATORIO_REALIZA_EXAMEN_PK;

drop table LABORATORIO_REALIZA_EXAMEN;

drop index LABORATORISTA_PK;

drop table LABORATORISTA;

drop index MEDICO_PK;

drop table MEDICO;

drop index ES_AGREGADO_FK;

drop index AGREGA_FK;

drop index MEDICO_PACIENTE_PK;

drop table MEDICO_PACIENTE;

drop index MUESTRA_PK;

drop table MUESTRA;

drop index PACIENTE_PK;

drop table PACIENTE;

drop index ES_TOMADO_FK;

drop index RECOMIENDA_FK;

drop index TOMA_FK;

drop index PACIENTE_EXAMEN_PK;

drop table PACIENTE_EXAMEN;

drop index POSEE_RESULTADOS_FK;

drop index SUBE_RESULTADOS_FK;

drop table RESULTADOS_EXAMENES;

drop index SEDE_PK;

drop table SEDE;

drop index RELATIONSHIP_14_FK;

drop index TELEFONO_PK;

drop table TELEFONO;

drop index RELATIONSHIP_15_FK;

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: CORREO                                                */
/*==============================================================*/
create table CORREO (
   NOMBRE_CORREO        VARCHAR(20)          not null,
   DOMINIO_CORREO       VARCHAR(20)          not null,
   RUT_USUARIO          DECIMAL              not null,
   constraint PK_CORREO primary key (NOMBRE_CORREO, DOMINIO_CORREO)
);

/*==============================================================*/
/* Index: CORREO_PK                                             */
/*==============================================================*/
create unique index CORREO_PK on CORREO (
NOMBRE_CORREO,
DOMINIO_CORREO
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_16_FK on CORREO (
RUT_USUARIO
);

/*==============================================================*/
/* Table: DOMICILIO                                             */
/*==============================================================*/
create table DOMICILIO (
   ID_DOMICILIO         INT4                 not null,
   AVENIDA_CALLE_DOMICILIO VARCHAR(40)          null,
   NUMERO_DOMICILIO     INT4                 null,
   COMUNA_DOMICILIO     VARCHAR(20)          null,
   CIUDAD_DOMICILIO     VARCHAR(20)          null,
   constraint PK_DOMICILIO primary key (ID_DOMICILIO)
);

/*==============================================================*/
/* Index: DOMICILIO_PK                                          */
/*==============================================================*/
create unique index DOMICILIO_PK on DOMICILIO (
ID_DOMICILIO
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN (
   ID_EXAMEN            INT4                 not null,
   ID_MUESTRA           INT4                 not null,
   NOMBRE_EXAMEN        VARCHAR(20)          null,
   DESCRIPCION_EXAMEN   VARCHAR(400)         null,
   PRECIO_EXAMEN        MONEY                null,
   constraint PK_EXAMEN primary key (ID_EXAMEN)
);

comment on table EXAMEN is
'Esta entidad contiene los tipos de examenes que existe, es decir si es un cardiograma o otro, unico en sí.';

/*==============================================================*/
/* Index: EXAMEN_PK                                             */
/*==============================================================*/
create unique index EXAMEN_PK on EXAMEN (
ID_EXAMEN
);

/*==============================================================*/
/* Index: NECESITA_FK                                           */
/*==============================================================*/
create  index NECESITA_FK on EXAMEN (
ID_MUESTRA
);

/*==============================================================*/
/* Table: LABORATORIO                                           */
/*==============================================================*/
create table LABORATORIO (
   ID_LABORATORIO       INT4                 not null,
   ID_SEDE              INT4                 not null,
   DESCRIPCION_LABORATORIO VARCHAR(400)         null,
   PISO_LABORATORIO     INT4                 null,
   constraint PK_LABORATORIO primary key (ID_LABORATORIO)
);

/*==============================================================*/
/* Index: LABORATORIO_PK                                        */
/*==============================================================*/
create unique index LABORATORIO_PK on LABORATORIO (
ID_LABORATORIO
);

/*==============================================================*/
/* Index: POSEE_1_FK                                            */
/*==============================================================*/
create  index POSEE_1_FK on LABORATORIO (
ID_SEDE
);

/*==============================================================*/
/* Table: LABORATORIO_LABORATORISTA                             */
/*==============================================================*/
create table LABORATORIO_LABORATORISTA (
   ID_OPERACION         INT4                 not null,
   ID_LABORATORIO       INT4                 null,
   RUT_USUARIO          DECIMAL              not null,
   HORA_APERTURA        TIME                 null,
   HORA_CIERRE          TIME                 null,
   constraint PK_LABORATORIO_LABORATORISTA primary key (ID_OPERACION)
);

/*==============================================================*/
/* Index: LABORATORIO_LABORATORISTA_PK                          */
/*==============================================================*/
create unique index LABORATORIO_LABORATORISTA_PK on LABORATORIO_LABORATORISTA (
ID_OPERACION
);

/*==============================================================*/
/* Index: TRABAJA_FK                                            */
/*==============================================================*/
create  index TRABAJA_FK on LABORATORIO_LABORATORISTA (
RUT_USUARIO
);

/*==============================================================*/
/* Index: SE_TRABAJA_FK                                         */
/*==============================================================*/
create  index SE_TRABAJA_FK on LABORATORIO_LABORATORISTA (
ID_LABORATORIO
);

/*==============================================================*/
/* Table: LABORATORIO_REALIZA_EXAMEN                            */
/*==============================================================*/
create table LABORATORIO_REALIZA_EXAMEN (
   ID_LABORATORIO       INT4                 not null,
   ID_EXAMEN            INT4                 not null,
   constraint PK_LABORATORIO_REALIZA_EXAMEN primary key (ID_LABORATORIO, ID_EXAMEN)
);

/*==============================================================*/
/* Index: LABORATORIO_REALIZA_EXAMEN_PK                         */
/*==============================================================*/
create unique index LABORATORIO_REALIZA_EXAMEN_PK on LABORATORIO_REALIZA_EXAMEN (
ID_LABORATORIO,
ID_EXAMEN
);

/*==============================================================*/
/* Index: LABORATORIO_REALIZA_EXAMEN_FK                         */
/*==============================================================*/
create  index LABORATORIO_REALIZA_EXAMEN_FK on LABORATORIO_REALIZA_EXAMEN (
ID_LABORATORIO
);

/*==============================================================*/
/* Index: LABORATORIO_REALIZA_EXAMEN2_FK                        */
/*==============================================================*/
create  index LABORATORIO_REALIZA_EXAMEN2_FK on LABORATORIO_REALIZA_EXAMEN (
ID_EXAMEN
);

/*==============================================================*/
/* Table: LABORATORISTA                                         */
/*==============================================================*/
create table LABORATORISTA (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_LABORATORISTA VARCHAR(4)           not null,
   INSTITUCION_EGRESO_LABO_ VARCHAR(20)          null,
   ANTECEDENTES_LABORATORISTA VARCHAR(300)         null,
   constraint PK_LABORATORISTA primary key (RUT_USUARIO)
);

/*==============================================================*/
/* Index: LABORATORISTA_PK                                      */
/*==============================================================*/
create unique index LABORATORISTA_PK on LABORATORISTA (
RUT_USUARIO
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_MEDICO VARCHAR(4)           not null,
   INSTITUCION_EGRESO_MEDICO VARCHAR(20)          null,
   ANTECEDENTES_MEDICO  VARCHAR(300)         null,
   constraint PK_MEDICO primary key (RUT_USUARIO)
);

/*==============================================================*/
/* Index: MEDICO_PK                                             */
/*==============================================================*/
create unique index MEDICO_PK on MEDICO (
RUT_USUARIO
);

/*==============================================================*/
/* Table: MEDICO_PACIENTE                                       */
/*==============================================================*/
create table MEDICO_PACIENTE (
   FECHA_CONSULTA       DATE                 not null,
   RUT_USUARIO          DECIMAL              not null,
   PAC_RUT_USUARIO      DECIMAL              null,
   HORA_CONSULTA        TIME                 null,
   constraint PK_MEDICO_PACIENTE primary key (FECHA_CONSULTA)
);

/*==============================================================*/
/* Index: MEDICO_PACIENTE_PK                                    */
/*==============================================================*/
create unique index MEDICO_PACIENTE_PK on MEDICO_PACIENTE (
FECHA_CONSULTA
);

/*==============================================================*/
/* Index: AGREGA_FK                                             */
/*==============================================================*/
create  index AGREGA_FK on MEDICO_PACIENTE (
RUT_USUARIO
);

/*==============================================================*/
/* Index: ES_AGREGADO_FK                                        */
/*==============================================================*/
create  index ES_AGREGADO_FK on MEDICO_PACIENTE (
PAC_RUT_USUARIO
);

/*==============================================================*/
/* Table: MUESTRA                                               */
/*==============================================================*/
create table MUESTRA (
   ID_MUESTRA           INT4                 not null,
   DESCRIPCION_MUESTRA  VARCHAR(400)         null,
   TIPO_MUESTRA         VARCHAR(15)          null,
   TIEMPO_MUESTRA       INT4                 null,
   constraint PK_MUESTRA primary key (ID_MUESTRA)
);

/*==============================================================*/
/* Index: MUESTRA_PK                                            */
/*==============================================================*/
create unique index MUESTRA_PK on MUESTRA (
ID_MUESTRA
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_PACIENTE VARCHAR(4)           not null,
   ESTADO_GRAVEDAD_PACIENTE VARCHAR(1)           null,
   constraint PK_PACIENTE primary key (RUT_USUARIO)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
RUT_USUARIO
);

/*==============================================================*/
/* Table: PACIENTE_EXAMEN                                       */
/*==============================================================*/
create table PACIENTE_EXAMEN (
   ID_PACIENTE_EXAMEN   INT4                 not null,
   ID_EXAMEN            INT4                 null,
   RUT_USUARIO          DECIMAL              not null,
   PAC_RUT_USUARIO      DECIMAL              not null,
   ESTADO_EXAMEN        VARCHAR(12)          null,
   REALIZADO            BOOL                 null,
   FECHA_CADUCACION_EXAMEN DATE                 null,
   HORA_CADUCACION      TIME                 null,
   FECHA_REALIZACION    DATE                 null,
   CADUCO               BOOL                 null,
   constraint PK_PACIENTE_EXAMEN primary key (ID_PACIENTE_EXAMEN)
);

/*==============================================================*/
/* Index: PACIENTE_EXAMEN_PK                                    */
/*==============================================================*/
create unique index PACIENTE_EXAMEN_PK on PACIENTE_EXAMEN (
ID_PACIENTE_EXAMEN
);

/*==============================================================*/
/* Index: TOMA_FK                                               */
/*==============================================================*/
create  index TOMA_FK on PACIENTE_EXAMEN (
PAC_RUT_USUARIO
);

/*==============================================================*/
/* Index: RECOMIENDA_FK                                         */
/*==============================================================*/
create  index RECOMIENDA_FK on PACIENTE_EXAMEN (
RUT_USUARIO
);

/*==============================================================*/
/* Index: ES_TOMADO_FK                                          */
/*==============================================================*/
create  index ES_TOMADO_FK on PACIENTE_EXAMEN (
ID_EXAMEN
);

/*==============================================================*/
/* Table: RESULTADOS_EXAMENES                                   */
/*==============================================================*/
create table RESULTADOS_EXAMENES (
   ID_PACIENTE_EXAMEN   INT4                 null,
   RUT_USUARIO          DECIMAL              not null,
   DESCRIPCION_RESULTADO VARCHAR(200)         not null
);

/*==============================================================*/
/* Index: SUBE_RESULTADOS_FK                                    */
/*==============================================================*/
create  index SUBE_RESULTADOS_FK on RESULTADOS_EXAMENES (
RUT_USUARIO
);

/*==============================================================*/
/* Index: POSEE_RESULTADOS_FK                                   */
/*==============================================================*/
create  index POSEE_RESULTADOS_FK on RESULTADOS_EXAMENES (
ID_PACIENTE_EXAMEN
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE (
   ID_SEDE              INT4                 not null,
   NOMBRE_SEDE          VARCHAR(50)          null,
   constraint PK_SEDE primary key (ID_SEDE)
);

/*==============================================================*/
/* Index: SEDE_PK                                               */
/*==============================================================*/
create unique index SEDE_PK on SEDE (
ID_SEDE
);

/*==============================================================*/
/* Table: TELEFONO                                              */
/*==============================================================*/
create table TELEFONO (
   ID_TELEFONO          INT4                 not null,
   RUT_USUARIO          DECIMAL              not null,
   NUMERO_TELEFONO      INT4                 null,
   CODIGO_PAIS_TELEFONO INT4                 null,
   CODIGO_ACCESO_MOVIL  INT4                 null,
   CODIGO_DE_AREA       INT4                 null,
   TELEFONO_FIJO        BOOL                 null,
   constraint PK_TELEFONO primary key (ID_TELEFONO)
);

/*==============================================================*/
/* Index: TELEFONO_PK                                           */
/*==============================================================*/
create unique index TELEFONO_PK on TELEFONO (
ID_TELEFONO
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on TELEFONO (
RUT_USUARIO
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   RUT_USUARIO          DECIMAL              not null,
   ID_DOMICILIO         INT4                 null,
   PRIMER_NOMBRE_PERSONA VARCHAR(20)          null,
   SEGUNDO_NOMBRE_PERSONA VARCHAR(20)          null,
   APELLIDO_PATERNO_PERSONA VARCHAR(20)          null,
   APELLIDO_MATERNO_PERSONA VARCHAR(20)          null,
   FECHA_DE_NACIMIENTO  DATE                 null,
   FECHA_INGRESO        DATE                 null,
   PREVISION            VARCHAR(20)          null,
   HORA_INGRESO         TIME                 null,
   ESTADO_CIVIL         VARCHAR(20)          null,
   GRUPO_SANGUINEO      VARCHAR(4)           null,
   constraint PK_USUARIO primary key (RUT_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
RUT_USUARIO
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on USUARIO (
ID_DOMICILIO
);

alter table CORREO
   add constraint FK_CORREO_RELATIONS_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table EXAMEN
   add constraint FK_EXAMEN_NECESITA_MUESTRA foreign key (ID_MUESTRA)
      references MUESTRA (ID_MUESTRA)
      on delete restrict on update restrict;

alter table LABORATORIO
   add constraint FK_LABORATO_POSEE_1_SEDE foreign key (ID_SEDE)
      references SEDE (ID_SEDE)
      on delete restrict on update restrict;

alter table LABORATORIO_LABORATORISTA
   add constraint FK_LABORATO_SE_TRABAJ_LABORATO foreign key (ID_LABORATORIO)
      references LABORATORIO (ID_LABORATORIO)
      on delete restrict on update restrict;

alter table LABORATORIO_LABORATORISTA
   add constraint FK_LABORATO_TRABAJA_LABORATO foreign key (RUT_USUARIO)
      references LABORATORISTA (RUT_USUARIO)
      on delete restrict on update restrict;

alter table LABORATORIO_REALIZA_EXAMEN
   add constraint FK_LABORATO_LABORATOR_LABORATO foreign key (ID_LABORATORIO)
      references LABORATORIO (ID_LABORATORIO)
      on delete restrict on update restrict;

alter table LABORATORIO_REALIZA_EXAMEN
   add constraint FK_LABORATO_LABORATOR_EXAMEN foreign key (ID_EXAMEN)
      references EXAMEN (ID_EXAMEN)
      on delete restrict on update restrict;

alter table LABORATORISTA
   add constraint FK_LABORATO_ES3_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table MEDICO
   add constraint FK_MEDICO_ES2_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table MEDICO_PACIENTE
   add constraint FK_MEDICO_P_AGREGA_MEDICO foreign key (RUT_USUARIO)
      references MEDICO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table MEDICO_PACIENTE
   add constraint FK_MEDICO_P_ES_AGREGA_PACIENTE foreign key (PAC_RUT_USUARIO)
      references PACIENTE (RUT_USUARIO)
      on delete restrict on update restrict;

alter table PACIENTE
   add constraint FK_PACIENTE_ES_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table PACIENTE_EXAMEN
   add constraint FK_PACIENTE_ES_TOMADO_EXAMEN foreign key (ID_EXAMEN)
      references EXAMEN (ID_EXAMEN)
      on delete restrict on update restrict;

alter table PACIENTE_EXAMEN
   add constraint FK_PACIENTE_RECOMIEND_MEDICO foreign key (RUT_USUARIO)
      references MEDICO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table PACIENTE_EXAMEN
   add constraint FK_PACIENTE_TOMA_PACIENTE foreign key (PAC_RUT_USUARIO)
      references PACIENTE (RUT_USUARIO)
      on delete restrict on update restrict;

alter table RESULTADOS_EXAMENES
   add constraint FK_RESULTAD_POSEE_RES_PACIENTE foreign key (ID_PACIENTE_EXAMEN)
      references PACIENTE_EXAMEN (ID_PACIENTE_EXAMEN)
      on delete restrict on update restrict;

alter table RESULTADOS_EXAMENES
   add constraint FK_RESULTAD_SUBE_RESU_LABORATO foreign key (RUT_USUARIO)
      references LABORATORISTA (RUT_USUARIO)
      on delete restrict on update restrict;

alter table TELEFONO
   add constraint FK_TELEFONO_RELATIONS_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_RELATIONS_DOMICILI foreign key (ID_DOMICILIO)
      references DOMICILIO (ID_DOMICILIO)
      on delete restrict on update restrict;

