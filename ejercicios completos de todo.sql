/* =====================================================
EJERCICIO 1
En una biblioteca, crea las tablas autores y libros.

Tabla autores debe contener:
id_autor como identificador numérico de hasta 10 dígitos con AUTO_INCREMENT y llave primaria,
nombre como texto de longitud media.

Tabla libros debe contener:
id_libro como identificador numérico de hasta 10 dígitos con AUTO_INCREMENT y llave primaria,
titulo como texto de longitud media,
paginas como número entero pequeño,
id_autor como número que será llave foránea hacia autores.

Después:
Insertar al menos 3 autores y 5 libros
Actualizar el número de páginas de un libro
Eliminar los libros con menos de 120 páginas
Agregar una columna precio en libros
Modificar la longitud del título para que sea más grande
Renombrar la columna paginas a num_paginas
Eliminar la columna precio
Eliminar la llave foránea
Eliminar ambas tablas al final.
===================================================== */

create table autores(
id_autor number(10) generated always as identity primary key,
nombre varchar2(10) not null
);

create table libros (
id_libro number(10) generated always as identity primary key,
titulo varchar2(10) not null,
paginas number(10) not null,
id_autor number(10) not null,

constraint fk_id_autor
foreign key(id_autor)
references autores(id_autor)
);

-- Insertar al menos 3 autores y 5 libros
insert into autores (nombre) 
values('luis');
insert into autores (nombre)
values('miguel');
insert into autores (nombre)
values('minato');

insert into libros(titulo, paginas, id_autor)
values ('miguel', 1, 1);
insert into libros(titulo, paginas, id_autor)
values ('jose',2,2);
insert into libros(titulo, paginas, id_autor)
values ('luis', 3,3);
insert into libros(titulo, paginas, id_autor)
values('migueel', 4, 1);
insert into libros(titulo, paginas, id_autor)
values('karla', 35, 2);

--Actualizar el número de páginas de un libro
update libros
set paginas=38
where id_libro=1;

update libros
set paginas=199
where id_libro=2;

update libros
set paginas=1999
where id_libro=3;

--Eliminar los libros con menos de 120 páginas
delete from libros
where paginas<120;

--Agregar una columna precio en libros
alter table libros
add precio number(10);

--Modificar la longitud del título para que sea más grande
alter table libros
modify titulo varchar2(120);
--Renombrar la columna paginas a num_paginas
alter table libros
rename column paginas to num_paginas;

--Eliminar la columna precio
alter table libros
drop column precio;
--Eliminar la llave foránea
alter table libros
drop constraint fk_id_autor;

--Eliminar ambas tablas al final.

drop table libros;
drop table autores;

/* =====================================================
EJERCICIO 2
En una tienda, crea las tablas clientes y pedidos.

Tabla clientes debe contener:
id_cliente AUTO_INCREMENT y llave primaria,
nombre texto mediano,
ciudad texto corto.

Tabla pedidos debe contener:
id_pedido AUTO_INCREMENT y llave primaria,
fecha fecha,
id_cliente llave foránea hacia clientes.

Después:
Insertar registros
Actualizar la ciudad de un cliente
Eliminar pedidos antiguos
Agregar columna telefono a clientes
Modificar tamaño del nombre
Renombrar columna fecha a fecha_pedido
Eliminar columna telefono
Eliminar llave foránea
Eliminar tablas.
===================================================== */
create table clientes(
id_cliente number(10) generated always as identity primary key,
nombre varchar2(10) not null,
ciudad varchar2(10) not null
);
create table pedidos(
id_pedido number(10) generated always as identity primary key,
fecha varchar2(10) not null,
id_cliente number(10) not null,

constraint fk_id_cliente
foreign key (id_cliente)
REFERENCES clientes(id_cliente)
);

--Insertar registros
insert into clientes(nombre, ciudad)
values ('miguel','mexico');

insert into clientes(nombre, ciudad)
values ('jose', 'españa');

insert into clientes(nombre, ciudad)
values ('luis','jamaica');

insert into pedidos(fecha, id_cliente)
values('22/22/22',1);

insert into pedidos(fecha, id_cliente)
values('2/2/2',2);
insert into pedidos(fecha, id_cliente)
values('2/3/3',3);
insert into pedidos(fecha, id_cliente)
values('5/7/3', 1);

--Actualizar la ciudad de un cliente
update clientes
set ciudad='argentina'
where id_cliente=1;

update clientes
set ciudad='mexico'
where id_cliente=2;
update clientes
set nombre='pepe'
where id_cliente=3;

--Eliminar pedidos antiguos
delete from pedidos;

--Agregar columna telefono a clientes
alter table clientes
add telefono number(10) ;

--Modificar tamaño del nombre
alter table clientes
modify nombre varchar(120);

--Renombrar columna fecha a fecha_pedido
alter table pedidos
rename column fecha to fecha_pedido;

--Eliminar columna telefono
alter table clientes
drop column telefono;

--Eliminar llave foránea 
alter table pedidos
drop constraint fk_id_cliente;

--Eliminar tablas.
drop table clientes;
drop table pedidos;
/* =====================================================
EJERCICIO 3
En un hospital, crea las tablas medicos y pacientes.
Pacientes debe tener FK hacia medicos desde la creación.

Después:
Insertar datos
Actualizar especialidad de médico
Eliminar pacientes sin nombre
Agregar columna telefono
Modificar longitud del nombre
Renombrar nombre a nombre_paciente
Eliminar columna telefono
Eliminar llave foránea
Eliminar tablas.
===================================================== */
create table medicos(
id_medico number(10) generated always as identity primary key,
nombre varchar2(10) not null,
especialidad varchar2(10) not null
);

create table pacientes(
id_paciente number(10) generated always as identity primary key,
nombre varchar2(10) not null,
consultorio varchar2(10) not null,
id_medico number(10) not null,

constraint fk_id_medico
foreign key (id_medico)
references medicos(id_medico)
);

--Insertar datos
insert into medicos(nombre, especialidad)
values('miguel','cirujano');
insert into medicos(nombre, especialidad)
values('luis','ginecologo');
insert into medicos(nombre, especialidad)
values('carmen', 'odontologo');

insert into pacientes(nombre, consultorio, id_medico)
values('jose','1',1);
insert into pacientes(nombre, consultorio, id_medico)
values('pepe','2',2);
insert into pacientes(nombre, consultorio, id_medico)
values('vito','4',2);

--Actualizar especialidad de médico
update medicos
set especialidad='familiar'
where id_medico=1;

update medicos
set especialidad='cirujano'
where id_medico=2;

--Eliminar pacientes sin nombre
delete from medicos where id_medico=3; 

--Agregar columna telefono
alter table pacientes 
add telefono number(10);

--Modificar longitud del nombre
alter table pacientes
modify nombre varchar2(129);
--Renombrar nombre a nombre_paciente
alter table pacientes
rename column nombre to nombre_paciente;

--Eliminar columna telefono
alter table pacientes
drop column telefono;

--Eliminar llave foránea
alter table pacientes
drop constraint fk_id_medico;

--Eliminar tablas.
drop table medicos;
drop table pacientes;

/* =====================================================
EJERCICIO 4
En una escuela deportiva, crea equipos y jugadores con FK desde creación.

Después:
Insertar datos
Actualizar nombre equipo
Eliminar jugadores sin equipo
Agregar columna posicion
Modificar longitud nombre
Renombrar posicion a posicion_juego
Eliminar columna posicion_juego
Eliminar llave foránea
Eliminar tablas.
===================================================== */
create table equipos(
id_equipo number(10) generated always as identity primary key,
nombre varchar2(10) not null,
numero_inte number(2)
); 

create table jugadores(
id_jugador number(10) generated always as identity primary key,
nombre varchar2(10) not null,
numero number(3) not null,
posision varchar2(10) not null,
id_equipo number(10) not null,

constraint fk_id_equipo
foreign key (id_equipo)
references equipos(id_equipo)
);

--Insertar datos
insert into equipos(nombre, numero_inte)
values('america', 12);
insert into equipos(nombre, numero_inte)
values('cruz', 12);
insert into equipos(nombre, numero_inte)
values('toluca', 20);

insert into jugadores(nombre, numero, posicion, id_equipo)
values('miguel', 10, 'delantero', 1);
insert into jugadores(nombre, numero, posicion, id_equipo)
values('luis',9,'medio',2);
insert into jugadores(nombre, numero, posicion, id_equipo)
values('jose',3,'defensa',3);

--Actualizar nombre equipo
update equipos
set nombre='chivas'
where id_equipo=2;
update equipos
set nombre='puebla'
where id_equipo=3;

--Eliminar jugadores sin equipo
delete from jugadores where id_jugador=3;

--Modificar longitud nombre
alter table jugadores 
modify nombre varchar2(120);

--Renombrar posicion a posicion_juego
alter table jugadores
rename column posicion to posicion_juego;
--Eliminar columna posicion_juego
alter table jugadores
drop column posicion_juego;
--Eliminar llave foránea
alter table jugadores
drop constraint fk_id_equipo;
--Eliminar tablas.
drop table jugadores;
drop table equipos;
/* =====================================================
EJERCICIO 5
En una empresa, crea departamentos y empleados con FK desde creación.

Después:
Insertar datos
Actualizar salario
Eliminar empleados con salario bajo
Agregar columna fecha_ingreso
Modificar longitud nombre
Renombrar fecha_ingreso a ingreso
Eliminar columna ingreso
Eliminar llave foránea
Eliminar tablas.
===================================================== */

create table departamentos(
id_departamento number(10) generated always as identity primary key,
nombre varchar2(120) not null,
num_personal number(10) not null
); 
create table empleados(
id_empleado number(10) generated always as identity primary key,
nombre varchar2(10) not null,
apellido varchar2(10) not null,
id_departamento number(10) not null,

constraint fk_id_departamento
foreign key(id_departamento)
references departamentos(id_departamento)
);

--Insertar datos
insert into departamentos(nombre, num_personal)
values('rh',2);
insert into departamentos(nombre, num_personal)
values('ti',4);
insert into departamentos(nombre, num_personal)
values('almacen',5);

insert into empleados(nombre, apellido, id_departamento)
values('miguel','barragan',2);
insert into empleados(nombre, apellido, id_departamento)
values('jose','neri',3);
insert into empleados(nombre, apellido, id_departamento)
values('pepe','galvan',1);

--Actualizar salario
alter table empleados
add salario number(10);



--Eliminar empleados con salario bajo
--Agregar columna fecha_ingreso
--Modificar longitud nombre
--Renombrar fecha_ingreso a ingreso
--Eliminar columna ingreso
--Eliminar llave foránea
--Eliminar tablas.

/* =====================================================
EJERCICIO 6
En una tienda en línea, crea las tablas categorias y productos SIN llaves primarias ni foráneas.

Tabla categorias:
id_categoria número,
nombre texto medio.

Tabla productos:
id_producto número,
nombre texto medio,
precio decimal.

Después:
Agregar la llave primaria a categorias
Agregar la llave primaria a productos
Agregar columna id_categoria en productos
Crear la llave foránea productos → categorias
Insertar registros
Actualizar precios
Eliminar productos con precio menor a 50
Agregar columna stock
Modificar longitud del nombre
Renombrar nombre a nombre_producto
Eliminar columna stock
Eliminar llave foránea
Eliminar tablas.
===================================================== */


/* =====================================================
EJERCICIO 7
En una universidad, crea las tablas profesores y materias SIN llaves.

Tabla profesores:
id_profesor número,
nombre texto medio.

Tabla materias:
id_materia número,
nombre texto medio.

Después:
Agregar PK a ambas tablas
Agregar columna id_profesor en materias
Crear FK hacia profesores
Insertar registros
Actualizar nombre profesor
Eliminar materias sin asignación
Agregar columna creditos
Modificar tipo de creditos
Renombrar creditos a creditos_materia
Eliminar columna creditos_materia
Eliminar llave foránea
Eliminar tablas.
===================================================== */


/* =====================================================
EJERCICIO 8
En un gimnasio, crea las tablas miembros y pagos SIN llaves.

Tabla miembros:
id_miembro número,
nombre texto medio.

Tabla pagos:
id_pago número,
monto decimal.

Después:
Agregar PK a ambas tablas
Agregar columna id_miembro en pagos
Crear FK pagos → miembros
Insertar registros
Actualizar montos
Eliminar pagos menores a 100
Agregar columna metodo_pago
Modificar monto DECIMAL(10,2)
Renombrar metodo_pago a metodo
Eliminar columna metodo
Eliminar llave foránea
Eliminar tablas.
===================================================== */


/* =====================================================
EJERCICIO 9
En una aerolínea, crea las tablas aviones y vuelos SIN llaves.

Tabla aviones:
id_avion número,
modelo texto medio.

Tabla vuelos:
id_vuelo número,
destino texto medio.

Después:
Agregar PK a ambas tablas
Agregar columna id_avion en vuelos
Crear FK vuelos → aviones
Insertar registros
Actualizar destinos
Eliminar vuelos cancelados
Agregar columna estado
Modificar longitud destino
Renombrar estado a estado_vuelo
Eliminar columna estado_vuelo
Eliminar llave foránea
Eliminar tablas.
===================================================== */


/* =====================================================
EJERCICIO 10
En un restaurante, crea las tablas mesas y reservas SIN llaves.

Tabla mesas:
id_mesa número,
capacidad entero.

Tabla reservas:
id_reserva número,
fecha fecha.

Después:
Agregar PK a ambas tablas
Agregar columna id_mesa en reservas
Crear FK reservas → mesas
Insertar registros
Actualizar fechas
Eliminar reservas antiguas
Agregar columna telefono_cliente
Modificar longitud telefono_cliente
Renombrar telefono_cliente a telefono
Eliminar columna telefono
Eliminar llave foránea
Eliminar tablas.
===================================================== */