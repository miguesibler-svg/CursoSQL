/* Ejercicio 1
Crea la tabla paises con id_pais NUMBER como PK y nombre VARCHAR2(80).
Crea la tabla ciudades con id_ciudad NUMBER como PK, nombre VARCHAR2(80) e id_pais NUMBER como FK hacia paises.
Agrega la columna poblacion NUMBER a ciudades.
Modifica nombre de ciudades a VARCHAR2(120).
Elimina la columna poblacion.
Elimina la FK de ciudades.
Elimina ambas tablas.
*/

create table paises(
id_pais number(8) primary KEY,
nombre varchar2(80)
);

create table ciudades(
id_ciudad number(8) primary key,
nombre varchar2(80),
id_pais number(8),

constraint fk_id_pais
foreign key (id_pais)
references paises(id_pais)
);

alter table ciudades
add poblacion number(10);

alter table ciudades
modify nombre varchar2(120);

alter table ciudades
drop column poblacion;

alter table ciudades
drop constraint fk_id_pais;

drop table paises;
drop table ciudades;


/* Ejercicio 2
Crea la tabla marcas con id_marca NUMBER PK y nombre VARCHAR2(80).
Crea la tabla celulares con id_celular NUMBER PK, modelo VARCHAR2(80) e id_marca NUMBER FK.
Agrega la columna precio NUMBER(10,2).
Modifica modelo a VARCHAR2(120).
Elimina la columna precio.
Elimina la FK y luego elimina ambas tablas.
*/

create table marcas(
id_marca number(8) primary key,
nombre varchar2(80)
);

create table celulares (
id_celular number(8) primary key,
modelo varchar2(80),
id_marca number(8),

constraint fk_id_marca
foreign key (id_marca)
references marcas(id_marca)
);

alter table celulares
add precio number(10,2);

alter table celulares
modify modelo varchar2(120);

alter table celulares
drop column precio;

alter table celulares
drop constraint fk_id_marca;

drop table celulares;
drop table marcas;

/* Ejercicio 3
Crea la tabla hospitales con id_hospital NUMBER PK y nombre VARCHAR2(80).
Crea la tabla doctores con id_doctor NUMBER PK, nombre VARCHAR2(80) e id_hospital NUMBER FK.
Agrega la columna especialidad VARCHAR2(80).
Modifica especialidad a VARCHAR2(120).
Elimina la columna especialidad.
Elimina la FK y elimina las tablas.
*/

create table hospitales(
id_hospitales number(8) primary key,
nombre varchar2(80)
);

create table doctores(
id_doctor number(8) primary key,
nombre varchar2(80),
id_hospitales number(8),

constraint fk_id_hospitales
foreign key (id_hospitales)
references hospitales(id_hospitales)
);

alter table doctores
add especialidad varchar2(80);

alter table doctores
modify especialidad varchar2(120);

alter table doctores
drop column especialidad;

alter table doctores
drop constraint fk_id_hospitales;

drop table doctores;
drop table hospitales;

/* Ejercicio 4
Crea la tabla editoriales con id_editorial NUMBER PK y nombre VARCHAR2(80).
Crea la tabla revistas con id_revista NUMBER PK, titulo VARCHAR2(80) e id_editorial NUMBER FK.
Agrega la columna precio NUMBER(8,2).
Modifica titulo a VARCHAR2(120).
Elimina la columna precio.
Elimina la FK y elimina las tablas.
*/

create table editoriales(
id_editorial number(8) primary key,
nombre varchar2(80)
);

create table revistas(
id_revista number(8) primary key,
titulo varchar2(80),
id_editorial number(8),

constraint fk_id_editorial
foreign key (id_editorial)
references editoriales(id_editorial)
);

alter table revistas
add precio number(8,2);

alter table revistas
modify titulo varchar(120);

alter table revistas
drop column precio;

alter table revistas
drop constraint fk_id_editorial;

drop table editoriales;
drop table revistas;

/* Ejercicio 5
Crea la tabla sucursales con id_sucursal NUMBER PK y ciudad VARCHAR2(80).
Crea la tabla empleados_suc con id_empleado NUMBER PK, nombre VARCHAR2(80) e id_sucursal NUMBER FK.
Agrega la columna salario NUMBER(10,2).
Modifica nombre a VARCHAR2(120).
Elimina salario.
Elimina la FK y elimina tablas.
*/

create table sucursales(
id_sucursales number(8) primary key,
ciudades varchar(80)
);

create table empleados_suc(
id_empleado number(8) primary key,
nombre varchar2(80),
id_sucursales number(8),

constraint fk_id_sucursales
foreign key (id_sucursales)
references sucursales(id_sucursales)
);

alter table empleados_suc
add salario number(10,2);

alter table empleados_suc
modify nombre varchar2(120);

alter table empleados_suc
drop column salario;

alter table empleados_suc
drop constraint fk_id_sucursales;

drop table empleados_suc;
drop table sucursales;

/* Ejercicio 6
Crea la tabla universidades con id_universidad NUMBER y nombre VARCHAR2(80).
Crea la tabla carreras con id_carrera NUMBER, nombre VARCHAR2(80) e id_universidad NUMBER.
Agrega PK a universidades con ALTER TABLE.
Agrega PK a carreras con ALTER TABLE.
Agrega FK de carreras hacia universidades.
Agrega columna duracion NUMBER.
Modifica nombre de carreras a VARCHAR2(120).
Elimina columna duracion.
Elimina FK y elimina tablas.
*/

create table universidades(
id_universidad number(8),
nombre varchar2(80)
);

create table carreras (
id_carrera number(8),
nombre varchar2(80),
id_universidad number(8)
);

alter table universidades
add primary key (id_universidad);

alter table carreras
add primary key (id_carrera);

alter table carreras
add constraint fk_id_universidad
foreign key (id_universidad)
references universidades (id_universidad);

alter table carreras
add duracion number(10);

alter table carreras
modify nombre varchar2(120);

alter table carreras
drop column duracion;

alter table carreras
drop constraint fk_id_universidad;

drop table carreras;
drop table universidades;

/* Ejercicio 7
Crea la tabla clientesA con id_cliente NUMBER y nombre VARCHAR2(80).
Crea la tabla comprasA con id_compra NUMBER y id_cliente NUMBER.
Agrega PK a ambas tablas con ALTER TABLE.
Agrega FK comprasA -> clientesA.
Agrega columna total NUMBER(10,2).
Modifica nombre de clientesA a VARCHAR2(120).
Elimina columna total.
Elimina FK y elimina tablas.
*/

create table clientesA (
id_cliente number(8),
nombre varchar2(80)
);

create table comprasA(
id_compra number(8),
id_cliente number(8)
);

alter table clientesA
add primary key(id_cliente);

alter table comprasA
add primary key(id_compra);

alter table comprasA
add constraint fk_id_cliente
foreign key (id_cliente)
references clientesA(id_cliente);

alter table comprasA
add total number(10,2);

alter table clientesA
modify nombre varchar2(120);

alter table comprasA
drop column total;

alter table comprasA
drop constraint fk_id_cliente;

drop table comprasA;
drop table clientesA;


/* Ejercicio 8
Crea la tabla escuelas con id_escuela NUMBER y nombre VARCHAR2(80).
Crea la tabla alumnosEsc con id_alumno NUMBER y id_escuela NUMBER.
Agrega PK con ALTER TABLE.
Agrega FK alumnosEsc -> escuelas.
Agrega columna grado NUMBER.
Modifica nombre alumnosEsc a VARCHAR2(120).
Elimina grado.
Elimina FK y elimina tablas.
*/

create table escuelas(
id_escuelas number(8),
nombre varchar2(80)
);

create table alumnosEsc(
id_alumno number(8),
id_escuelas number(8)
);

alter table escuelas
add primary key(id_escuelas);

alter table alumnosEsc
add primary key(id_alumno);

alter table alumnosEsc
add constraint fk_id_escuelas
foreign key (id_escuelas)
references escuelas(id_escuelas);

alter table alumnosEsc
add grado number(8);

alter table escuelas
modify nombre varchar2(120);

alter table alumnosEsc
drop column grado;

alter table alumnosEsc
drop constraint fk_id_escuelas;

drop table escuelas;
drop table alumnosEsc;



/* Ejercicio 9
Crea la tabla aerolineas con id_aerolinea NUMBER y nombre VARCHAR2(80).
Crea la tabla vuelosA con id_vuelo NUMBER y id_aerolinea NUMBER.
Agrega PK con ALTER TABLE.
Agrega FK vuelosA -> aerolineas.
Agrega columna duracion NUMBER.
Modifica nombre a VARCHAR2(120).
Elimina duracion.
Elimina FK y elimina tablas.
*/

create table aerolineas(
id_aerolinea number(8),
nombre varchar(80)
);

create table vuelosA (
id_vuelo number(8),
id_aerolinea number(8)
);

alter table aerolineas
add primary key (id_aerolinea );

alter table vuelosA
add primary key(id_vuelo);

alter table vuelosA
add constraint fk_id_aerolinea
foreign key (id_aerolinea)
references aerolineas(id_aerolinea);

alter table vuelosA
add duracion number(10);

alter table aerolineas
modify nombre varchar2(120);

alter table vuelosA
drop column duracion;

alter table vuelosA
drop constraint fk_id_aerolinea;

drop table vuelosA;
drop table aerolineas;

/* Ejercicio 10
Crea la tabla bancos con id_banco NUMBER y nombre VARCHAR2(80).
Crea la tabla cuentas con id_cuenta NUMBER y id_banco NUMBER.
Agrega PK con ALTER TABLE.
Agrega FK cuentas -> bancos.
Agrega columna saldo NUMBER(12,2).
Modifica nombre a VARCHAR2(120).
Elimina saldo.
Elimina FK y elimina tablas.
*/

create table bancos(
id_banco number(8),
nombre varchar2(8)
);

create table cuentas(
id_cuenta number(8),
id_banco number(8)
);

alter table bancos
add primary key(id_banco);

alter table cuentas
add primary key(id_cuenta);

alter table cuentas
add constraint fk_id_banco
foreign key (id_banco)
references bancos(id_banco);

alter table cuentas
add saldo number (12,2);

alter table bancos
modify nombre varchar2(120);

alter table cuentas
drop column saldo;

alter table cuentas
drop constraint fk_id_banco;

drop table cuentas;
drop table bancos;

