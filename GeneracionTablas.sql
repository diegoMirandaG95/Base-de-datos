/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     19/12/2015 2:07:10                           */
/*==============================================================*/


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

drop index ES3_FK;

drop index LABORATORISTA_PK;

drop table LABORATORISTA;

drop index ES2_FK;

drop index MEDICO_PK;

drop table MEDICO;

drop index ES_AGREGADO_FK;

drop index AGREGA_FK;

drop index MEDICO_PACIENTE_PK;

drop table MEDICO_PACIENTE;

drop index MUESTRA_PK;

drop table MUESTRA;

drop index ES_FK;

drop index PACIENTE_PK;

drop table PACIENTE;

drop index ES_TOMADO_FK;

drop index TOMA_FK;

drop index PACIENTE_EXAMEN_PK;

drop table PACIENTE_EXAMEN;

drop index REALIZA2_FK;

drop index REALIZA_FK;

drop index REALIZA_PK;

drop table REALIZA;

drop index RECOMIENDA2_FK;

drop index RECOMIENDA_FK;

drop index RECOMIENDA_PK;

drop table RECOMIENDA;

drop index SEDE_PK;

drop table SEDE;

drop index RELATIONSHIP_14_FK;

drop index TELEFONO_PK;

drop table TELEFONO;

drop index USUARIO_PK;

drop table USUARIO;

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN (
   ID_EXAMEN            INT4                 not null,
   ID_MUESTRA           INT4                 not null,
   PRECIO_EXAMEN        MONEY                null,
   ESTADO_EXAMEN        VARCHAR(12)          null,
   DESCRIPCION_EXAMEN   VARCHAR(400)         null,
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
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_LABORATORISTA VARCHAR(4)           not null,
   ID_LABORATORIO       INT4                 null,
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
RUT_USUARIO,
IDENTIFICADOR_LABORATORISTA
);

/*==============================================================*/
/* Index: SE_TRABAJA_FK                                         */
/*==============================================================*/
create  index SE_TRABAJA_FK on LABORATORIO_LABORATORISTA (
ID_LABORATORIO
);

/*==============================================================*/
/* Table: LABORATORISTA                                         */
/*==============================================================*/
create table LABORATORISTA (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_LABORATORISTA VARCHAR(4)           not null,
   constraint PK_LABORATORISTA primary key (RUT_USUARIO, IDENTIFICADOR_LABORATORISTA)
);

/*==============================================================*/
/* Index: LABORATORISTA_PK                                      */
/*==============================================================*/
create unique index LABORATORISTA_PK on LABORATORISTA (
RUT_USUARIO,
IDENTIFICADOR_LABORATORISTA
);

/*==============================================================*/
/* Index: ES3_FK                                                */
/*==============================================================*/
create  index ES3_FK on LABORATORISTA (
RUT_USUARIO
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_MEDICO VARCHAR(4)           not null,
   constraint PK_MEDICO primary key (RUT_USUARIO, IDENTIFICADOR_MEDICO)
);

/*==============================================================*/
/* Index: MEDICO_PK                                             */
/*==============================================================*/
create unique index MEDICO_PK on MEDICO (
RUT_USUARIO,
IDENTIFICADOR_MEDICO
);

/*==============================================================*/
/* Index: ES2_FK                                                */
/*==============================================================*/
create  index ES2_FK on MEDICO (
RUT_USUARIO
);

/*==============================================================*/
/* Table: MEDICO_PACIENTE                                       */
/*==============================================================*/
create table MEDICO_PACIENTE (
   FECHA_CONSULTA       DATE                 not null,
   PAC_RUT_USUARIO      DECIMAL              null,
   IDENTIFICADOR_PACIENTE VARCHAR(4)           null,
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_MEDICO VARCHAR(4)           not null,
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
RUT_USUARIO,
IDENTIFICADOR_MEDICO
);

/*==============================================================*/
/* Index: ES_AGREGADO_FK                                        */
/*==============================================================*/
create  index ES_AGREGADO_FK on MEDICO_PACIENTE (
PAC_RUT_USUARIO,
IDENTIFICADOR_PACIENTE
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
   constraint PK_PACIENTE primary key (RUT_USUARIO, IDENTIFICADOR_PACIENTE)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
RUT_USUARIO,
IDENTIFICADOR_PACIENTE
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on PACIENTE (
RUT_USUARIO
);

/*==============================================================*/
/* Table: PACIENTE_EXAMEN                                       */
/*==============================================================*/
create table PACIENTE_EXAMEN (
   ID_PACIENTE_EXAMEN   INT4                 not null,
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_PACIENTE VARCHAR(4)           not null,
   ID_EXAMEN            INT4                 null,
   FECHA_CADUCACION_EXAMEN DATE                 null,
   FECHA_REALIZACION    DATE                 null,
   HORA_CADUCACION      TIME                 null,
   REALIZADO            BOOL                 null,
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
RUT_USUARIO,
IDENTIFICADOR_PACIENTE
);

/*==============================================================*/
/* Index: ES_TOMADO_FK                                          */
/*==============================================================*/
create  index ES_TOMADO_FK on PACIENTE_EXAMEN (
ID_EXAMEN
);

/*==============================================================*/
/* Table: REALIZA                                               */
/*==============================================================*/
create table REALIZA (
   ID_LABORATORIO       INT4                 not null,
   ID_EXAMEN            INT4                 not null,
   constraint PK_REALIZA primary key (ID_LABORATORIO, ID_EXAMEN)
);

/*==============================================================*/
/* Index: REALIZA_PK                                            */
/*==============================================================*/
create unique index REALIZA_PK on REALIZA (
ID_LABORATORIO,
ID_EXAMEN
);

/*==============================================================*/
/* Index: REALIZA_FK                                            */
/*==============================================================*/
create  index REALIZA_FK on REALIZA (
ID_LABORATORIO
);

/*==============================================================*/
/* Index: REALIZA2_FK                                           */
/*==============================================================*/
create  index REALIZA2_FK on REALIZA (
ID_EXAMEN
);

/*==============================================================*/
/* Table: RECOMIENDA                                            */
/*==============================================================*/
create table RECOMIENDA (
   RUT_USUARIO          DECIMAL              not null,
   IDENTIFICADOR_MEDICO VARCHAR(4)           not null,
   ID_PACIENTE_EXAMEN   INT4                 not null,
   constraint PK_RECOMIENDA primary key (RUT_USUARIO, IDENTIFICADOR_MEDICO, ID_PACIENTE_EXAMEN)
);

/*==============================================================*/
/* Index: RECOMIENDA_PK                                         */
/*==============================================================*/
create unique index RECOMIENDA_PK on RECOMIENDA (
RUT_USUARIO,
IDENTIFICADOR_MEDICO,
ID_PACIENTE_EXAMEN
);

/*==============================================================*/
/* Index: RECOMIENDA_FK                                         */
/*==============================================================*/
create  index RECOMIENDA_FK on RECOMIENDA (
RUT_USUARIO,
IDENTIFICADOR_MEDICO
);

/*==============================================================*/
/* Index: RECOMIENDA2_FK                                        */
/*==============================================================*/
create  index RECOMIENDA2_FK on RECOMIENDA (
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
   PRIMER_NOMBRE_PERSONA VARCHAR(20)          null,
   SEGUNDO_NOMBRE_PERSONA VARCHAR(20)          null,
   APELLIDO_PATERNO_PERSONA VARCHAR(20)          null,
   APELLIDO_MATERNO_PERSONA VARCHAR(40)          null,
   constraint PK_USUARIO primary key (RUT_USUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
RUT_USUARIO
);

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
   add constraint FK_LABORATO_TRABAJA_LABORATO foreign key (RUT_USUARIO, IDENTIFICADOR_LABORATORISTA)
      references LABORATORISTA (RUT_USUARIO, IDENTIFICADOR_LABORATORISTA)
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
   add constraint FK_MEDICO_P_AGREGA_MEDICO foreign key (RUT_USUARIO, IDENTIFICADOR_MEDICO)
      references MEDICO (RUT_USUARIO, IDENTIFICADOR_MEDICO)
      on delete restrict on update restrict;

alter table MEDICO_PACIENTE
   add constraint FK_MEDICO_P_ES_AGREGA_PACIENTE foreign key (PAC_RUT_USUARIO, IDENTIFICADOR_PACIENTE)
      references PACIENTE (RUT_USUARIO, IDENTIFICADOR_PACIENTE)
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
   add constraint FK_PACIENTE_TOMA_PACIENTE foreign key (RUT_USUARIO, IDENTIFICADOR_PACIENTE)
      references PACIENTE (RUT_USUARIO, IDENTIFICADOR_PACIENTE)
      on delete restrict on update restrict;

alter table REALIZA
   add constraint FK_REALIZA_REALIZA_LABORATO foreign key (ID_LABORATORIO)
      references LABORATORIO (ID_LABORATORIO)
      on delete restrict on update restrict;

alter table REALIZA
   add constraint FK_REALIZA_REALIZA2_EXAMEN foreign key (ID_EXAMEN)
      references EXAMEN (ID_EXAMEN)
      on delete restrict on update restrict;

alter table RECOMIENDA
   add constraint FK_RECOMIEN_RECOMIEND_MEDICO foreign key (RUT_USUARIO, IDENTIFICADOR_MEDICO)
      references MEDICO (RUT_USUARIO, IDENTIFICADOR_MEDICO)
      on delete restrict on update restrict;

alter table RECOMIENDA
   add constraint FK_RECOMIEN_RECOMIEND_PACIENTE foreign key (ID_PACIENTE_EXAMEN)
      references PACIENTE_EXAMEN (ID_PACIENTE_EXAMEN)
      on delete restrict on update restrict;

alter table TELEFONO
   add constraint FK_TELEFONO_RELATIONS_USUARIO foreign key (RUT_USUARIO)
      references USUARIO (RUT_USUARIO)
      on delete restrict on update restrict;

