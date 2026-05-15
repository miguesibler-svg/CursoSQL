/* =========================================================
EJERCICIOS CREANDO PK Y FK DESDE LA CREACIÓN
========================================================= */

/* Ejercicio 1
En una biblioteca, crea las tablas autores y libros.

Tabla autores:
id_autor numérico hasta 10 dígitos y llave primaria auto incremento,
nombre texto longitud media,
pais texto corto.

Tabla libros:
id_libro numérico hasta 10 dígitos y llave primaria auto incremento,
titulo texto largo,
anio número entero pequeño,
id_autor llave foránea hacia autores.

Después:
Agregar columna precio en libros
Modificar titulo para mayor longitud
Eliminar columna anio
Eliminar llave foránea
Eliminar ambas tablas.
*/

create table autores(
    id_autor number(10) generated always as identity primary key,
    nombre varchar2(10) not null,
    pais varchar2(10) not null
);


 create table libros(
id_libro number(10) generated always as identity primary key,
titulo varchar2(10) not null,
anio number(4) not null,
id_autor number(10) not null,

constraint fk_id_autor
foreign key (id_autor)
references autores(id_autor)
 );
 
alter table libros
add libros varchar2(120);

alter table libros
modify titulo varchar2(120);

alter table libros
drop column anio;

alter table libros
drop constraint fk_id_autor;

drop table libros;
drop table autores;

/* Ejercicio 2
En una tienda, crea las tablas categorias y productos.

Tabla categorias:
id_categoria PK auto incremento,
nombre texto medio.

Tabla productos:
id_producto PK auto incremento,
nombre texto medio,
precio decimal,
id_categoria FK hacia categorias.

Después:
Agregar columna stock
Modificar nombre a mayor longitud
Eliminar columna precio
Eliminar llave foránea
Eliminar tablas.
*/

create table categorias(
id_categoria number(10) generated always as identity primary key,
nombre varchar2(120)
);

create table productos(
id_producto number(10) generated always as identity,
nombre varchar2(10)not null,
precio number(10) not null,
id_categoria number(10) not null,

constraint fk_id_categoria
foreign key (id_categoria)
references categorias(id_categoria)
);

alter table productos 
add stock varchar2(120) not null;

alter table productos
modify nombre varchar2(120);

alter table productos
drop column precio;

alter table productos
drop constraint fk_id_categoria;

drop table productos;
drop table categorias;

/* Ejercicio 3
En un hospital, crea las tablas doctores y pacientes.

Tabla doctores:
id_doctor PK auto incremento,
nombre texto medio,
especialidad texto medio.

Tabla pacientes:
id_paciente PK auto incremento,
nombre texto medio,
edad entero pequeño,
id_doctor FK hacia doctores.

Después:
Agregar columna telefono
Modificar nombre
Eliminar edad
Eliminar FK
Eliminar tablas.
*/

create table doctores(
id_doctor number(10)generated always as identity,
nombre varchar2(20),
especialidad varchar2(10)
);

create table pacientes(
id_paciente number(10)generated always as identity primary key,
nombre varchar2(10),
edad number(10),
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

alter table pacientes
drop constraint fk_id_doctor;

drop table doctores;
drop table pacientes;


/* Ejercicio 4
En una empresa, crea departamentos y empleados.

Departamentos:
id_departamento PK auto incremento,
nombre texto medio.

Empleados:
id_empleado PK auto incremento,
nombre texto medio,
salario decimal,
id_departamento FK.

Después:
Agregar columna fecha_ingreso
Modificar nombre
Eliminar salario
Eliminar FK
Eliminar tablas.
*/

create table departamentos(
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

alter table empleados
drop constraint fk_id_departamento;

drop table empleados;
drop table departamentos;

/* Ejercicio 5
En un cine, crea salas y funciones.

Salas:
id_sala PK auto incremento,
nombre texto medio,
capacidad entero.

Funciones:
id_funcion PK auto incremento,
hora texto corto,
id_sala FK.

Después:
Agregar columna precio
Modificar hora
Eliminar capacidad
Eliminar FK
Eliminar tablas.
*/

create table salas(
id_sala number(10) generated always as identity primary key,
nombre varchar2(10) not null,
capacidad number(10)not null
);

create table funciones(
id_funcion number(10) generated always as identity primary key,
hora varchar2(10),
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

alter table funciones
drop constraint fk_id_sala;

drop table funciones;
drop table salas;


/* =========================================================
EJERCICIOS CREANDO PK Y FK CON ALTER
========================================================= */

/* Ejercicio 6
En una universidad crea carreras y estudiantes SIN LLAVES.

Carreras:
id_carrera número,
nombre texto medio.

Estudiantes:
id_estudiante número,
nombre texto medio,
id_carrera número.

Después:
Agregar PK a ambas tablas
Convertir id_estudiante en auto incremento
Crear FK hacia carreras
Agregar columna correo
Eliminar columna nombre de carreras
Eliminar FK
Eliminar tablas.
*/

/* Ejercicio 7
En un gimnasio crea entrenadores y clientes sin llaves.

Entrenadores:
id_entrenador número,
nombre texto medio.

Clientes:
id_cliente número,
nombre texto medio,
id_entrenador número.

Después:
Agregar PK
Agregar auto incremento
Crear FK
Agregar columna peso
Modificar longitud nombre
Eliminar FK
Eliminar tablas.
*/

/* Ejercicio 8
En un hotel crea habitaciones y reservas sin llaves.

Habitaciones:
id_habitacion número,
tipo texto medio.

Reservas:
id_reserva número,
fecha texto corto,
id_habitacion número.

Después:
Agregar PK
Auto incremento a reservas
Crear FK
Agregar columna precio
Eliminar columna tipo
Eliminar FK
Eliminar tablas.
*/

/* Ejercicio 9
En una escuela crea maestros y materias sin llaves.

Maestros:
id_maestro número,
nombre texto medio.

Materias:
id_materia número,
nombre texto medio,
id_maestro número.

Después:
Agregar PK
Auto incremento
Crear FK
Agregar columna horas
Modificar nombre
Eliminar FK
Eliminar tablas.
*/

/* Ejercicio 10
En una veterinaria crea mascotas y citas sin llaves.

Mascotas:
id_mascota número,
nombre texto medio.

Citas:
id_cita número,
fecha texto corto,
id_mascota número.

Después:
Agregar PK
Auto incremento
Crear FK
Agregar columna motivo
Eliminar columna fecha
Eliminar FK
Eliminar tablas.
*/