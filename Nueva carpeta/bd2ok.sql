create table INFORMACION_DE_VENTA
(
    NRO_VENTA      INTEGER               not null,
    FECHA_HORA     DATE                  not null,
    TICKET         INTEGER               not null,
    primary key (NRO_VENTA)
);

create table DETALLE_VENTA
(
    NRO_VENTA      INTEGER               not null,
    CANT_PRODUCTO  INTEGER               not null,
    primary key (NRO_VENTA, CANT_PRODUCTO),
    foreign key  (NRO_VENTA)
       references INFORMACION_DE_VENTA (NRO_VENTA)
);

create table EMPLEADO
(
    NRO_VENTA      INTEGER               not null,
    INFO_EMPLEADO  VARCHAR(150)          not null,
    primary key (NRO_VENTA, INFO_EMPLEADO),
    foreign key  (NRO_VENTA)
       references INFORMACION_DE_VENTA (NRO_VENTA)
);

create table PRODUCTO
(
    NRO_VENTA      INTEGER               not null,
    CANT_PRODUCTO  INTEGER               not null,
    DESCRIPCION    VARCHAR(100)          not null,
    PRECIO_VENTA   INTEGER               not null,
    primary key (NRO_VENTA, CANT_PRODUCTO, DESCRIPCION),
    foreign key  (NRO_VENTA, CANT_PRODUCTO)
       references DETALLE_VENTA (NRO_VENTA, CANT_PRODUCTO)
);

create table MESA
(
    NRO_VENTA      INTEGER               not null,
    INFO_EMPLEADO  VARCHAR(150)          not null,
    NRO_MESA       INTEGER               not null,
    primary key (NRO_VENTA, INFO_EMPLEADO, NRO_MESA),
    foreign key  (NRO_VENTA, INFO_EMPLEADO)
       references EMPLEADO (NRO_VENTA, INFO_EMPLEADO)
);

create table TICKET_DETALLE
(
    NRO_VENTA      INTEGER               not null,
    NRO_TICKET     INTEGER               not null,
    DETA_TICK      VARCHAR(150)          not null,
    primary key (NRO_VENTA, NRO_TICKET),
    foreign key  (NRO_VENTA)
       references INFORMACION_DE_VENTA (NRO_VENTA)
);

