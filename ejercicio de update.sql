/* =========================================================
EJERCICIOS SQL
5 de creación con PK y FK
5 usando ALTER para agregar PK y FK
========================================================= */


/* Ejercicio 1
En una tienda de música, crea las tablas artistas y canciones.

Tabla artistas:
- id_artista INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- pais VARCHAR(50)

Tabla canciones:
- id_cancion INT AUTO_INCREMENT PK
- titulo VARCHAR(150)
- duracion INT
- id_artista FK hacia artistas

Después debes:
1. Agregar columna genero a canciones
2. Modificar titulo a VARCHAR(200)
3. Eliminar columna duracion
4. Insertar un artista y una canción
5. Actualizar el genero de la canción
6. Eliminar la llave foránea
7. Eliminar ambas tablas
*/

create table artistas(
id_artista number(10) generated always as identity primary key,
nombre VARCHAR(10) not null,
pais VARCHAR(10)
);


create table canciones(
id_cancion number(10) generated always as identity primary key,
titulo VARCHAR(50) not null,
duracion varchar(10)not null,
id_artista number(10) not null,

constraint fk_id_artista
foreign key(id_artista)
references artistas(id_artista)
);

1. Agregar columna genero a canciones
alter table canciones
add genero varchar2(10) not null;

2. Modificar titulo a VARCHAR(200)
alter table canciones
modify titulo varchar2(120);

3. Eliminar columna genero
alter table canciones
drop column genero;
4. Insertar un artista y una canción
insert into artistas(nombre, pais)
values('miguel', 'mexico');

insert into canciones (titulo, duracion, id_artista)
values('adios', '1.2', '1');

5. Actualizar el titulo de la canción
update canciones
set titulo='miguel'
where id_cancion=1;

6. Eliminar la llave foránea
alter table canciones
drop constraint fk_id_artista;
7. Eliminar ambas tablas
drop table canciones;
drop table artistas;

/* Ejercicio 2
Sistema escolar con tablas estudiantes y cursos.

Tabla estudiantes:
- id_estudiante INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- edad INT

Tabla cursos:
- id_curso INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- id_estudiante FK hacia estudiantes

Después:
1. Agregar columna calificacion en cursos
2. Modificar nombre a VARCHAR(150)
3. Eliminar columna edad de estudiantes
4. Insertar registros
5. Eliminar datos del curso
6. Eliminar FK
7. Eliminar tablas
*/

create table estudiantes(
id_estudiante number(10) generated always as identity primary key,
nombre VARCHAR(10) not null,
edad number(2) not null
);

create table cursos(
id_curso number(10) generated always as identity primary key,
nombre VARCHAR(10),
id_estudiante number(10) not null,

constraint fk_id_estudiante
foreign key (id_estudiante)
references estudiantes(id_estudiante)
);

1. Agregar columna calificacion en cursos
alter table cursos
add calificacion varchar2(10) not null;
2. Modificar nombre a VARCHAR(150)
alter table cursos
modify nombre varchar2(150);
3. Eliminar columna edad de estudiantes
alter table estudiantes
drop column edad;
4. Insertar registros
insert into estudiantes(nombre)
values('miguel');

insert into cursos(nombre, id_estudiante, calificacion)
values('miguel', 1, '10');

5. Eliminar datos del curso
delete from cursos;

6. Eliminar FK
alter table cursos
drop constraint fk_id_estudiante;
7. Eliminar tablas
drop table estudiantes;
drop table cursos;


/* Ejercicio 3
Hospital con doctores y pacientes.

Tabla doctores:
- id_doctor INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- especialidad VARCHAR(100)

Tabla pacientes:
- id_paciente INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- id_doctor FK

Después:
1. Agregar columna telefono pacientes
2. Modificar nombre pacientes VARCHAR(150)
3. Eliminar especialidad
4. Insertar datos
5. Actualizar telefono
6. Eliminar FK
7. Borrar tablas
*/

create table doctores(
id_doctor number(10) generated always as identity primary key,
nombre VARCHAR(10),
especialidad VARCHAR(10)
);


create table pacientes(
id_paciente number(10) generated always as identity primary key,
nombre VARCHAR(10),
id_doctor number(10) not null,

constraint fk_id_doctor
foreign key(id_doctor)
references doctores(id_doctor)
);

1. Agregar columna telefono pacientes
alter table pacientes
add telefono varchar2(10) not null;

2. Modificar nombre pacientes VARCHAR(150)
alter table pacientes
modify nombre varchar2(150);

3. Eliminar especialidad
alter table doctores
drop column especialidad;

4. Insertar datos
insert into doctores(nombre)
values ('miguel');

insert into pacientes(nombre, id_doctor, telefono)
values('miguel', 1, '22222');

5. Actualizar telefono
update pacientes
set telefono='1111'
where id_paciente=1;

6. Eliminar FK
alter table pacientes
drop constraint fk_id_doctor;

7. Borrar tablas
drop table pacientes;
drop table doctores;

/* Ejercicio 4
Sistema de ventas con clientes y pedidos.

Clientes:
- id_cliente INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- ciudad VARCHAR(100)

Pedidos:
- id_pedido INT AUTO_INCREMENT PK
- fecha DATE
- id_cliente FK

Después:
1. Agregar total DECIMAL
2. Cambiar fecha a DATETIME
3. Eliminar ciudad
4. Insertar datos
5. Eliminar pedidos
6. Eliminar FK
7. Eliminar tablas
*/

create table clientes(
id_cliente number(10) generated always as identity primary key,
nombre VARCHAR(10) not null,
ciudad VARCHAR(10) not null
);

create table pedidos(
id_pedido number(10) generated always as identity primary key,
fecha varchar2(10) not null,
id_cliente number(10) not null,

constraint fk_id_cliente
foreign key(id_cliente)
references clientes(id_cliente)
);

1. Agregar total DECIMAL
alter table pedidos
add total varchar2(10) not null;

2. Cambiar fecha a DATETIME
alter table pedidos
modify fecha varchar2(120);

3. Eliminar ciudad
alter table clientes
drop column ciudad;

4. Insertar datos
insert into clientes(nombre)
values('miguel');

insert into pedidos(fecha, id_cliente, total)
values ('20/29/29', 1, '1223');

5. Eliminar pedidos
delete  from pedidos;

6. Eliminar FK
alter table pedidos
drop constraint fk_id_cliente;

7. Eliminar tablas
drop table pedidos;
drop table clientes;

/* Ejercicio 5
Empresa con departamentos y empleados.

Departamentos:
- id_departamento INT AUTO_INCREMENT PK
- nombre VARCHAR(100)

Empleados:
- id_empleado INT AUTO_INCREMENT PK
- nombre VARCHAR(100)
- id_departamento FK

Después:
1. Agregar salario
2. Modificar nombre VARCHAR(150)
3. Eliminar salario
4. Insertar datos
5. Actualizar empleado
6. Eliminar FK
7. Eliminar tablas
*/

create table departamentos(
id_departamento number(10) generated always as identity primary key,
nombre VARCHAR(10)
);

create table empleados(
id_empleado number(10) generated always as identity primary key,
nombre VARCHAR(10) not null,
id_departamento number(10) not null,

constraint fk_id_departamento
foreign key(id_departamento)
references departamentos(id_departamento)
);

1. Agregar salario
alter table empleados
add salario number(10,2) not null;

2. Modificar nombre VARCHAR(150)
alter table empleados
modify nombre varchar2(150);

3. Eliminar salario
alter table empleados
drop column salario;

4. Insertar datos
insert into departamentos(nombre)
values('miguel');

insert into empleados(nombre, id_departamento)
values ('miguel', 1);

5. Actualizar empleado
update empleados
set nombre='luis'
where id_empleado=1;

delete from empleados;

6. Eliminar FK
alter table empleados
drop constraint fk_id_departamento;

7. Eliminar tablas
drop table empleados;
drop table departamentos;

/* =========================================================
EJERCICIOS USANDO ALTER TABLE PARA CREAR PK Y FK
========================================================= */


/* Ejercicio 6
Crear tablas sin llaves: usuarios y publicaciones.

Usuarios:
- id_usuario INT AUTO_INCREMENT
- nombre VARCHAR(100)

Publicaciones:
- id_publicacion INT AUTO_INCREMENT
- titulo VARCHAR(150)
- id_usuario INT

Después:
1. Agregar PK a ambas tablas
2. Agregar FK id_usuario en publicaciones
3. Agregar columna fecha
4. Renombrar titulo a titulo_post
5. Insertar datos
6. Eliminar columna fecha
7. Eliminar tablas
*/

create table usuarios(
id_usuario number(10) generated always as identity primary key,
nombre VARCHAR(10)
);


create table publicaciones(
id_publicacion number(10) generated always as identity primary key,
titulo VARCHAR(50) not null,
id_usuario number(10) not null
);

2. Agregar FK id_usuario en publicaciones
alter table publicaciones
add constraint fk_id_usuario
foreign key (id_usuario)
references usuarios(id_usuario);

3. Agregar columna fecha
alter table publicaciones
add fechas varchar2(10) not null;

4. Renombrar titulo a titulo_post
alter table publicaciones
rename column titulo to titulo_post;

5. Insertar datos
insert into usuarios(nombre)
values ('miguel');

insert into publicaciones (titulo_post, id_usuario, fechas)
values ('miguel', 1, '29/29/29');

delete from publicaciones;

6. Eliminar columna fecha
alter table publicaciones
drop column fechas;
7. Eliminar tablas
drop table publicaciones;
drop table usuarios;

/* Ejercicio 7
Crear tablas sin llaves: marcas y productos.

Marcas:
- id_marca INT AUTO_INCREMENT
- nombre VARCHAR(100)

Productos:
- id_producto INT AUTO_INCREMENT
- nombre VARCHAR(100)
- id_marca INT

Después:
1. Agregar PK
2. Crear FK
3. Agregar precio
4. Modificar nombre VARCHAR(200)
5. Insertar datos
6. Eliminar datos productos
7. Eliminar tablas
*/

create table marcas(
id_marca number(10) generated always as identity,
nombre VARCHAR(10)
);

create table productos(
id_producto number(10) generated always as identity,
nombre VARCHAR(10),
id_marca number(10) not null
);

1. Agregar PK
alter table marcas
add primary key(id_marca);

alter table productos
add primary key(id_producto);

2. Crear FK
alter table productos
add constraint fk_id_marca
foreign key(id_marca)
references marcas(id_marca);

3. Agregar precio
alter table productos
add precio number(10) not null;

4. Modificar nombre VARCHAR(200)
alter table productos
modify nombre varchar(200);

5. Insertar datos
insert into marcas (nombre)
values ('miguel');

insert into productos (nombre, id_marca, precio)
values('miguel', 1, 11);

update productos
set nombre='jose'
where id_producto=1;

6. Eliminar datos productos
delete from productos;

7. Eliminar tablas
drop table marcas;
drop table productos;


/* Ejercicio 8
Tablas sin llaves: profesores y materias.

Profesores:
- id_profesor INT AUTO_INCREMENT
- nombre VARCHAR(100)

Materias:
- id_materia INT AUTO_INCREMENT
- nombre VARCHAR(100)
- id_profesor INT

Después:
1. Agregar PK
2. Crear FK
3. Agregar aula
4. Renombrar tabla materias a asignaturas
5. Insertar datos
6. Eliminar columna aula
7. Eliminar tablas
*/
create table profesores(
id_profesor number(10) generated always as identity,
nombre VARCHAR(10)
);

create table materias(
id_materia number(10) generated always as identity,
nombre VARCHAR(10)not null,
id_profesor number(10) not null
);

1. Agregar PK
alter table materias
add primary key(id_materia);

alter table profesores
add primary key(id_profesor);
2. Crear FK
alter table materias
add constraint fk_id_profesor
foreign key (id_profesor)
references profesores(id_profesor);

3. Agregar aula
alter table materias
add aula varchar2(10) not null;

4. Renombrar tabla materias a asignaturas
alter table materias
rename to asignaturas;

5. Insertar datos
insert into profesores(nombre)
values('miguel');

insert into asignaturas(nombre, id_profesor, aula)
values ('miguel',1,'22');

6. Eliminar columna aula
alter table asignaturas
drop column aula;

7. Eliminar tablas
drop table asignaturas;
drop table profesores;

/* Ejercicio 9
Tablas sin llaves: autores y artículos.

Autores:
- id_autor INT AUTO_INCREMENT
- nombre VARCHAR(100)

Articulos:
- id_articulo INT AUTO_INCREMENT
- titulo VARCHAR(100)
- id_autor INT

Después:
1. Agregar PK
2. Crear FK
3. Agregar fecha_publicacion
4. Modificar titulo VARCHAR(200)
5. Insertar datos
6. Eliminar registros
7. Eliminar tablas
*/

create table autores(
id_autor number(10) generated always as identity,
nombre VARCHAR(10)
);

create table articulos(
id_articulo number(10) generated always as identity,
titulo VARCHAR(10)not null,
id_autor number(10) not null
);

1. Agregar PK
alter table articulos
add primary key (id_articulo);

alter table autores
add primary key (id_autor);

2. Crear FK
alter table articulos
add constraint fk_id_autor
foreign key (id_autor)
references autores(id_autor);

3. Agregar fecha_publicacion
alter table articulos
add fecha_publicacion varchar2(10) not null;

4. Modificar titulo VARCHAR(200)
alter table articulos
modify titulo varchar2(200);

5. Insertar datos

insert into autores(nombre)
values('miguel');

insert into articulos(titulo, id_autor, fecha_publicacion)
values('miugl', 1, '12/33/33');

6. Eliminar registros
delete from autores;
delete from articulos;

7. Eliminar tablas
drop table autores;
drop table articulos;

/* Ejercicio 10
Tablas sin llaves: sucursales y ventas.

Sucursales:
- id_sucursal INT AUTO_INCREMENT
- ciudad VARCHAR(100)

Ventas:
- id_venta INT AUTO_INCREMENT
- total DECIMAL
- id_sucursal INT

Después:
1. Agregar PK
2. Crear FK
3. Agregar metodo_pago
4. Renombrar columna ciudad a ubicacion
5. Insertar datos
6. Eliminar columna metodo_pago
7. Eliminar tablas
*/

create table sucursales(
id_sucursal number(10) generated always as identity,
ciudad VARCHAR(10)
);

create table ventas(
id_venta number(10) generated always as identity,
total number(10,2) not null,
id_sucursal number(10) not null
);

1. Agregar PK
alter table sucursales
add primary key (id_sucursal);

alter table ventas
add primary key (id_venta);

2. Crear FK
alter table ventas
add foreign key (id_sucursal)
references sucursales(id_sucursal);

3. Agregar metodo_pago
alter table ventas
add metodo_pago number(10,2) not null;

4. Renombrar columna ciudad a ubicacion
alter table sucursales
rename column ciudad to ubicacion;

5. Insertar datos
insert into sucursales(ubicacion)
values('pais');

insert into ventas(total, ID_SUCURSAL, METODO_PAGO)
values(11.2, 1, 11.2);

6. Eliminar columna metodo_pago
delete from ventas;

alter table ventas
drop column metodo_pago;

7. Eliminar tablas
drop table ventas;
drop table sucursales;


