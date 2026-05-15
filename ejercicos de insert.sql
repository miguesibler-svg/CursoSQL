/* =========================================================
EJERCICIOS 1–5  
LLAVES PRIMARIAS Y FORÁNEAS DESDE CREATE TABLE
========================================================= */

/* Ejercicio 1
En una biblioteca, crea las tablas autores y libros.

Tabla autores debe contener:
- id_autor numérico de hasta 10 dígitos, AUTO_INCREMENT y llave primaria
- nombre texto de longitud media
- pais texto corto

Tabla libros debe contener:
- id_libro numérico AUTO_INCREMENT y llave primaria
- titulo texto largo
- anio número entero pequeño
- id_autor como llave foránea hacia autores

Después debes:
1. Agregar una columna precio en libros
2. Modificar la longitud del titulo para que sea más grande
3. Eliminar la columna anio de libros
4. Insertar un registro en autores y uno en libros
5. Eliminar la llave foránea
6. Eliminar ambas tablas
*/

create table autores(
id_autor number(10) generated always as identity primary key,
nombre varchar2(10) not null,
pais varchar2(10)
);

create table libros (
id_libro number(10) generated always as identity primary key,
titulo varchar2(10) not null,
anio number(10) not null,
id_autor number(10) not null,

constraint fk_id_autor
foreign key (id_autor)
references autores (id_autor)
);

alter table libros
add precio number(10);

alter table libros
modify titulo varchar2(120);

alter table libros
drop column anio;

insert into autores (nombre, pais) 
values ('miguel', 'mexico');

insert into libros (titulo,id_autor, precio)
values ('mi caca', 1, 13);

alter table libros
drop constraint fk_id_autor;

drop table libros;

drop table autores;

/* Ejercicio 2
En una tienda crea las tablas categorias y productos.

Categorias:
- id_categoria AUTO_INCREMENT PK
- nombre texto medio

Productos:
- id_producto AUTO_INCREMENT PK
- nombre texto medio
- precio decimal
- id_categoria llave foránea

Después:
1. Agregar columna stock en productos
2. Aumentar longitud del nombre
3. Eliminar columna precio
4. Insertar registros en ambas tablas
5. Eliminar llave foránea
6. Eliminar tablas
*/

create table categorias(
id_categoria number(10) generated always as identity,
nombre varchar2(10)
);

create table productos(
id_producto number(10) generated always as identity,
nombre varchar2(10) not null,
precio number(10,2) not null,
id_categoria number(10) not null,

constraint fk_id_categoria
foreign key (id_categoria)
references categorias(id_categoria)
);

alter table productos
add stock varchar2(120);

alter table productos 
modify nombre varchar2(120);

alter table productos
drop column precio;

insert into categorias (nombre)
values('tenis');

insert into productos (nombre, id_categoria, stock)
values ('miguel', 1, '12');

alter table productos
drop constraint fk_id_categoria;

drop table categorias;
drop table productos;


/* Ejercicio 3
En un hospital crea doctores y pacientes.

Doctores:
- id_doctor AUTO_INCREMENT PK
- nombre texto medio
- especialidad texto medio

Pacientes:
- id_paciente AUTO_INCREMENT PK
- nombre texto medio
- edad entero pequeño
- id_doctor FK

Después:
1. Agregar telefono en pacientes
2. Modificar longitud nombre
3. Eliminar edad
4. Insertar datos
5. Eliminar FK
6. Eliminar tablas
*/

create table doctores(
id_doctor number(10) generated always as identity primary key,
nombre varchar2(10) not null,
especialidad varchar2(10) not null
);

create table pacientes(
id_paciente number(10) generated always as identity primary key,
nombre varchar2(10) not null,
edad number(2) not null,
id_doctor number(10) not null,

constraint fk_id_doctor
foreign key (id_doctor)
references doctores(id_doctor)
);

alter table pacientes
add telefono number(10) not null;

alter table pacientes
modify nombre varchar2(120);

alter table pacientes
drop column edad;

insert into doctores(nombre, especialidad)
values ('miguel', 'sistemas');

insert into pacientes(nombre, id_doctor, telefono)
values ('luis', 1, 1234567890);

alter table pacientes
drop constraint fk_id_doctor;

drop table doctores;
drop table pacientes;

/* Ejercicio 4
En una empresa crea departamentos y empleados.

Departamentos:
- id_departamento AUTO_INCREMENT PK
- nombre texto medio

Empleados:
- id_empleado AUTO_INCREMENT PK
- nombre texto medio
- salario decimal
- id_departamento FK

Después:
Agregar fecha_ingreso
Modificar nombre
Eliminar salario
Insertar datos
Eliminar FK
Eliminar tablas
*/

create table departamentos (
id_departamento number(10) generated always as identity primary key,
nombre varchar2(10)
);


create table empleados(
id_empleado number(10) generated always as identity primary key,
nombre varchar2(10) not null,
salario number(10,2) not null,
id_departamento number(10) not null,

constraint fk_id_departamento
foreign key (id_departamento)
references departamentos (id_departamento)
);

alter table empleados
add fecha_ingreso varchar2(10) not null;

alter table empleados
modify nombre varchar2(120);

alter table empleados
drop column salario;

insert into departamentos (nombre)
values ('sistemas');

insert into empleados (nombre, id_departamento, fecha_ingreso)
values('miguel',1, '9199/999');

alter table empleados
drop constraint fk_id_departamento;

drop table empleados;
drop table departamentos;

/* Ejercicio 5
En un cine crea salas y funciones.

Salas:
- id_sala AUTO_INCREMENT PK
- nombre texto medio
- capacidad entero

Funciones:
- id_funcion AUTO_INCREMENT PK
- hora texto corto
- id_sala FK

Después:
Agregar precio
Modificar hora
Eliminar capacidad
Insertar datos
Eliminar FK
Eliminar tablas
*/

create table salas (
id_sala number(10) generated always as identity primary key,
nombre varchar2(10) not null,
capacidad number(10) not null
);


create table funciones(
id_funcion number(10) generated always as identity primary key,
hora varchar2(20) not null,
id_sala number(10) not null,

constraint fk_id_sala
foreign key (id_sala)
references salas (id_sala)
);

alter table funciones
add precio varchar2(10) not null;

alter table funciones
modify hora varchar2(120);

alter table salas
drop column capacidad;

insert into salas(nombre)
values('miguiel1');

insert into funciones(hora, id_sala, precio)
values('10:20', 1, 12);

alter table salas
rename to sal;

alter table funciones 
drop constraint fk_id_sala;

drop table funciones;
drop table sal;


/* =========================================================
EJERCICIOS 6–10  
LLAVES CREADAS CON ALTER TABLE
========================================================= */

/* Ejercicio 6
En una universidad crea carreras y estudiantes SIN LLAVES.

Carreras:
- id_carrera número
- nombre texto medio

Estudiantes:
- id_estudiante número
- nombre texto medio
- id_carrera número

Después debes:
1. Agregar PK a ambas tablas
2. Convertir id_estudiante en AUTO_INCREMENT
3. Crear llave foránea hacia carreras
4. Agregar columna correo en estudiantes
5. Eliminar columna nombre de carreras
6. Insertar datos
7. Eliminar llave foránea
8. Eliminar tablas
*/


/* Ejercicio 7
En un gimnasio crea entrenadores y clientes sin llaves.

Entrenadores:
- id_entrenador número
- nombre texto medio

Clientes:
- id_cliente número
- nombre texto medio
- id_entrenador número

Después:
Agregar PK
Auto incremento
Crear FK
Agregar peso
Modificar nombre
Insertar datos
Eliminar FK
Eliminar tablas
*/


/* Ejercicio 8
En un hotel crea habitaciones y reservas sin llaves.

Habitaciones:
- id_habitacion número
- tipo texto medio

Reservas:
- id_reserva número
- fecha texto corto
- id_habitacion número

Después:
Agregar PK
Auto incremento a reservas
Crear FK
Agregar precio
Eliminar tipo
Insertar datos
Eliminar FK
Eliminar tablas
*/


/* Ejercicio 9
En una escuela crea maestros y materias sin llaves.

Maestros:
- id_maestro número
- nombre texto medio

Materias:
- id_materia número
- nombre texto medio
- id_maestro número

Después:
Agregar PK
Auto incremento
Crear FK
Agregar horas
Modificar nombre
Insertar datos
Eliminar FK
Eliminar tablas
*/


/* Ejercicio 10
En una veterinaria crea mascotas y citas sin llaves.

Mascotas:
- id_mascota número
- nombre texto medio

Citas:
- id_cita número
- fecha texto corto
- id_mascota número

Después:
Agregar PK
Auto incremento
Crear FK
Agregar motivo
Eliminar fecha
Insertar datos
Eliminar FK
Eliminar tablas
*/