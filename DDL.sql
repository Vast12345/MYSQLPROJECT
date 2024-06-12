create table cliente(
    clienteid int primary key AUTO_INCREMENT,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(100) not null,
    telefono varchar(15) not null,
    email varchar(100) not null
);

create table vehiculo(
    vehiculoid int primary key auto_increment,
    placa varchar(15) not null,
    marca varchar(100) not null,
    modelo varchar(100) not null,
    clienteid int not null,
    Foreign Key (clienteid) REFERENCES cliente(clienteid)
);

create table servicio(
    servicioid int primary key AUTO_INCREMENT,
    nombre varchar(100) not null,
    descripcion text not null,
    costo decimal(15, 2) not null
);

create table empleado(
    empleadoid int primary key AUTO_INCREMENT,
    nombre VARCHAR(50) not null,
    apellido varchar(50) not null,
    cargo varchar(15) not null,
    telefono varchar(15) not null
);

create table reperacion(
    reperacionid int primary key AUTO_INCREMENT,
    fecha date not null,
    costototal decimal(15, 2) not null,
    descripcion text not NULl,
    servicioid int not null,
    vehiculoid int not null,
    empleadoid int not null,
    Foreign Key (servicioid) REFERENCES servicio(servicioid),
    Foreign Key (vehiculoid) REFERENCES vehiculo(vehiculoid),
    Foreign Key (empleadoid) REFERENCES empleado(empleadoid)
);

create table proveedor(
    proveedorid int PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) not null,
    apellido varchar(50) not null,
    contacto varchar(100) not null,
    telefono varchar(15) not null
);

create table ordenes_compra(
    ordenid int not null auto_increment,
    fecha date not null,
    total decimal(15, 2) not null,
    empleadoid int not null,
    proveedorid int not null,
    PRIMARY KEY(ordenid, empleadoid, proveedorid),
    Foreign Key (empleadoid) REFERENCES empleado(empleadoid),
    Foreign Key (proveedorid) REFERENCES proveedor(proveedorid)
);

create table facturacion(
    facturaid int primary key AUTO_INCREMENT,
    fecha date not null,
    total decimal(15, 2) not null,
    clienteid int not null,
    Foreign Key (clienteid) REFERENCES cliente(clienteid)
);

create table factura_detalles(
    facturaid int not null,
    reperacionid int not null,
    cantidad int not null,
    precio decimal(15, 2) not null,
    primary key(facturaid, reperacionid),
    Foreign Key (facturaid) REFERENCES facturacion(facturaid),
    Foreign Key (reperacionid) REFERENCES reperacion(reperacionid)
);

create table cita(
    citaid int primary key AUTO_INCREMENT,
    fechahora datetime not null,
    clienteid int not null,
    vehiculoid int not null,
    servicioid int not null,
    Foreign Key (clienteid) REFERENCES cliente(clienteid),
    Foreign Key (vehiculoid) REFERENCES vehiculo(vehiculoid),
    Foreign Key (servicioid) REFERENCES servicio(servicioid)
);

create table pieza(
    piezaid int primary key AUTO_INCREMENT,
    nombre varchar(50) not null,
    descrpicion text not null,
    precio decimal(15, 2) not null,
    proveedorid int not null,
    Foreign Key (proveedorid) REFERENCES proveedor(proveedorid)
);

create table reperacion_pieza(
    reperacionid int not null,
    cantidad int not null,
    piezaid int not null,
    primary key(reperacionid, piezaid),
    Foreign Key (reperacionid) REFERENCES reperacion(reperacionid),
    Foreign Key (piezaid) REFERENCES pieza(piezaid)
);

create table inventario(
    inventarioid int primary key AUTO_INCREMENT,
    cantidad int not null,
    ubicacion varchar(50) not null,
    piezaid int not null,
    Foreign Key (piezaid) REFERENCES pieza(piezaid)
);