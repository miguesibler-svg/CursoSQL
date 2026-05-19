-- =====================================================
-- EJERCICIO 1 – BIBLIOTECA (PK y FK desde CREATE)
-- =====================================================
-- 1. Crear tabla AUTOR:
--    id_autor INT PK
--    nombre VARCHAR(100)
--    pais VARCHAR(50)
create table autor(
id_autor number(10) generated always as identity primary key,
nombre varchar2(100) not null,
pais varchar(50) not null
);

-- 2. Crear tabla LIBRO:
--    id_libro INT PK
--    titulo VARCHAR(150)
--    precio DECIMAL(6,2)
--    id_autor INT FK → AUTOR(id_autor)
create table libros(
id_libro number(10) generated always as identity primary key,
titulo varchar2(150) not null,
precio number(6,2)not null,
id_autor number(10) not null,

constraint fk_id_autor
foreign key(id_autor)
references autor(id_autor)
);

-- 3. Insertar 5 autores y 10 libros.
insert into autor(nombre, pais)
values('miguel', 'mexico');
insert into autor(nombre, pais)
values('luis', 'argentina');
insert into autor(nombre, pais)
values('jose','colombia');

insert into libros(titulo, precio, id_autor)
values('jose', 120, 1);
insert into libros(titulo, precio, id_autor)
values('migue',233,2);
insert into libros(titulo, precio, id_autor)
values('kiss',2332,3);
insert into libros(titulo, precio, id_autor)
values('gku',233,1);
insert into libros(titulo, precio, id_autor)
values('josi',2333,2);

-- 4. Actualizar el título de un libro específico.
update libros
set titulo='dragon ball'
where id_libro=1;
update libros
set titulo='naruto'
where id_libro=2;
update libros
set titulo='one pice'
where id_libro=3;

-- 5. Eliminar un libro por id.
delete from libros where id_libro=3;

-- 6. ALTER TABLE LIBRO:
--    ADD anio_publicacion INT
alter table libros
add anio_publicacion number(12) ;

--    MODIFY precio DECIMAL(8,2)
alter table libros
modify precio number(8,2);

--    RENAME COLUMN titulo TO nombre_libro
alter table libros
rename column titulo to nombre_libro;

--    ADD CONSTRAINT UNIQUE(nombre_libro)
alter table libros
modify nombre_libro unique;

--    DROP COLUMN anio_publicacion
alter table libros
drop column anio_publicacion;

--    RENAME TABLE LIBRO TO LIBROS
alter table libros
rename to libro;

-- 7. Eliminar tablas LIBROS y AUTOR.
drop table libro;
drop table autor;

-- =====================================================
-- EJERCICIO 2 – VENTAS (PK y FK desde CREATE)
-- =====================================================
-- 1. Crear CLIENTE:
--    id_cliente INT PK
--    nombre VARCHAR(100)
--    email VARCHAR(100)
create table cliente(
id_cliente number(10) generated always as identity primary key,
nombre varchar2(100) not null,
email varchar2(100)
);

-- 2. Crear PEDIDO:
--    id_pedido INT PK
--    fecha DATE
--    total DECIMAL(8,2)
--    id_cliente INT FK → CLIENTE
create table pedido(
id_pedido number(10) generated always as identity primary key,
fecha date,
total number(8,2) not null,
id_cliente number(10) not null,

constraint fk_id_cliente
foreign key(id_cliente)
references cliente(id_cliente)
);

-- 3. Insertar 5 clientes y 8 pedidos.
insert into cliente(nombre, email)
values('miguel', 'traceurs.com');
insert into cliente(nombre, email)
values('luis', 'lsksks.com');
insert into cliente(nombre, email)
values('luisa', 'jskd.com');
insert into cliente(nombre, email)
values('lose', 'sdsd.com');
insert into cliente(nombre, email)
values ('mari', 'naruto');


insert into pedido(fecha, total, id_cliente)
values('23/12/1999', 122, 1);
insert into pedido(fecha, total, id_cliente)
values(to_date('1999-05-12','YYYY-MM-DD'), 1222,2);
insert into pedido(fecha, total, id_cliente)
values(to_date('2020/05/09', 'YYYY/MM/DD'),2222,1);
insert into pedido(fecha, total, id_cliente)
values(to_date('2015/05/09', 'YYYY/MM/DD'),2222,3);
insert into pedido(fecha, total, id_cliente)
values(to_date('2011/05/09', 'YYYY/MM/DD'),2222,1);

-- 4. Actualizar total de un pedido.
update pedido
set fecha=to_date('2026/05/09','YYYY/MM/DD')
where id_pedido=1;
update pedido
set fecha=to_date('2005/05/09','YYYY/MM/DD')
where id_pedido=4;
update pedido
set fecha=to_date('2025/05/09','YYYY/MM/DD')
where id_pedido=5;
-- 5. Eliminar pedidos con total < 100.
delete from pedido where total<1000;
delete from pedido where total<2000;

-- 6. ALTER TABLE CLIENTE:
--    ADD telefono VARCHAR(15)
alter table cliente
add telefono varchar2(10);
--    MODIFY telefono VARCHAR(20)
alter table cliente
modify telefono varchar(20);
--    RENAME COLUMN telefono TO celular
alter table cliente
rename column telefono to celular;
--    ADD CONSTRAINT UNIQUE(email)
alter table cliente
modify email unique;
--    DROP COLUMN celular
alter table cliente 
drop column celular;
--    RENAME TABLE PEDIDO TO ORDEN
alter table pedido
rename to orden;

-- 7. Eliminar tablas ORDEN y CLIENTE.
drop table orden;
drop table cliente;

-- =====================================================
-- EJERCICIO 3 – EMPRESA (PK y FK desde CREATE)
-- =====================================================
-- 1. Crear DEPARTAMENTO:
--    id_departamento INT PK
--    nombre VARCHAR(80)
create table departamento(
id_departamento number(10) generated always as identity primary key,
nombre varchar2(80) not null
);

-- 2. Crear EMPLEADO:
--    id_empleado INT PK
--    nombre VARCHAR(100)
--    salario DECIMAL(9,2)
--    id_departamento INT FK
create table empleado(
id_empleado number(10) generated always as identity primary key,
nombre varchar2(100) not null,
salario number(9,2) not null,
id_departamento number(10) not null,
constraint fk_id_departamento
foreign key(id_departamento)
references departamento(id_departamento)
);

-- 3. Insertar registros.
insert into departamento(nombre)
values('rh');
insert into departamento(nombre)
values('ti');
insert into departamento(nombre)
values('almacen');

insert into empleado(nombre, salario, id_departamento)
values('miguel',10000,2);
insert into empleado(nombre, salario, id_departamento)
values('luis',20000,1);
insert into empleado(nombre, salario, id_departamento)
values('jose',30000,3);
delete from empleado;
-- 4. Aumentar salario 10%.
update empleado
set salario=salario+(salario*.10)
where salario>0;

-- 5. Eliminar un empleado.
delete from empleado where id_empleado=5;

-- 6. ALTER TABLE EMPLEADO:
--    ADD edad INT
alter table empleado
add edad number(2);
--    MODIFY salario DECIMAL(10,2)
alter table empleado
modify salario number(10,2);
--    RENAME COLUMN nombre TO nombre_empleado
alter table empleado
rename column nombre to nombre_empleado;
--    ADD CONSTRAINT CHECK(salario > 0)
--    DROP COLUMN edad
alter table empleado
drop column edad;
--    RENAME TABLE EMPLEADO TO TRABAJADOR
alter table empleado
rename to trabajo;
-- 7. Eliminar tablas TRABAJADOR y DEPARTAMENTO.
drop table trabajo;
drop table departamento;

-- =====================================================
-- EJERCICIO 4 – TIENDA (PK y FK desde CREATE)
-- =====================================================
-- 1. Crear CATEGORIA (id_categoria PK, nombre VARCHAR(80))
create table categoria(
id_categoria number(10) generated always as identity primary key, 
nombre VARCHAR(80) not null
);
-- 2. Crear PRODUCTO (id_producto PK, nombre VARCHAR(100), precio DECIMAL(8,2), id_categoria FK)
create table producto(
id_producto number(10) generated always as identity primary key, 
nombre VARCHAR(100) not null, 
precio DECIMAL(8,2) not null, 
id_categoria number(10) not null,

constraint fk_id_categoria
foreign key (id_categoria)
references categoria(id_categoria)
);
-- 3. Insertar productos.

insert into categoria(nombre)
values('miguel');
insert into categoria(nombre)
values('jose');
insert into categoria(nombre)
values('perez');

insert into producto(nombre, precio, id_categoria)
values('putas',1000,1);
insert into producto(nombre, precio, id_categoria)
values('jotos',1200,2);
insert into producto(nombre, precio, id_categoria)
values ('peña',2333, 3);
-- 4. Actualizar precios +10%.
update producto
set precio=precio+(precio*.10) 
where id_producto>0;

-- 5. Eliminar productos sin stock.
delete from producto where id_producto=2;

-- 6. ALTER TABLE PRODUCTO:
--    ADD stock INT
alter table producto
add stock number(10);

--    MODIFY precio DECIMAL(10,2)
alter table producto
modify precio number(10,2);

--    RENAME COLUMN precio TO precio_unitario
alter table producto
rename column precio to precio_unitario;

--    DROP COLUMN stock
alter table producto
drop column stock;

--    RENAME TABLE PRODUCTO TO ARTICULO
alter table producto
rename to articulo;

-- 7. Eliminar tablas ARTICULO y CATEGORIA.
drop table articulo;
drop table categoria;

-- =====================================================
-- EJERCICIO 5 – ESCUELA (PK y FK desde CREATE)
-- =====================================================
-- 1. Crear ESCUELA (id_escuela PK, nombre, ciudad)
create table escuela(
id_escuela number(10) generated always as identity primary key,
nombre varchar(10) not null,
ciudad varchar2(10) not null
);
-- 2. Crear ESTUDIANTE (id_estudiante PK, nombre, edad, id_escuela FK)
create table estudiante(
id_estudiante number(10) generated always as identity primary key,
nombre varchar2(10) not null,
edad number(2) not null,
id_escuela number(10) not null,
constraint fk_id_escuela
foreign key(id_escuela)
references escuela(id_escuela)
);
-- 3. Insertar estudiantes.
insert into escuela(nombre, ciudad)
values('miguel','mexico');
insert into escuela(nombre, ciudad)
values('jose','argentina');
insert into escuela(nombre, ciudad)
values('pepe', 'el sol');

insert into estudiante(nombre, edad, id_escuela)
values('miguel',12,1);
insert into estudiante(nombre, edad, id_escuela)
values('luis',22,3);
insert into estudiante(nombre, edad, id_escuela)
values('jose',23,2);

-- 4. Actualizar nombre de estudiante.
update estudiante
set nombre='luis'
where id_estudiante=1;
update estudiante
set nombre='pepe'
where id_estudiante=2;
update estudiante
set nombre='miguel'
where id_estudiante=3;
-- 5. Eliminar estudiante.
delete from estudiante where id_estudiante=1;
-- 6. ALTER TABLE ESTUDIANTE:
--    ADD promedio DECIMAL(4,2)
alter table estudiante
add promedio number(4,2);
--    MODIFY promedio DECIMAL(5,2)
alter table estudiante
modify promedio number(5,2);
--    RENAME COLUMN nombre TO nombre_estudiante
alter table estudiante
rename column nombre to nombre_estudiante;
--    ADD CONSTRAINT CHECK(edad >= 5)
alter table estudiante
add  check (edad>=5);
--    DROP COLUMN promedio
alter table estudiante
drop column promedio;
--    RENAME TABLE ESTUDIANTE TO ALUMNO
alter table estudiante
rename to alumno;
-- 7. Eliminar tablas ALUMNO y ESCUELA.
drop table alumno;
drop table escuela;
-- =====================================================
-- EJERCICIO 6 – PROVEEDORES (PK y FK con ALTER)
-- =====================================================
-- 1. Crear PROVEEDOR(id_proveedor INT, nombre VARCHAR(100))
create table proveedor(
id_proveedor number(10) generated always as identity,
nombre varchar2(100) not null
);
-- 2. Crear COMPRA(id_compra INT, monto DECIMAL(8,2), id_proveedor INT)
create table compra(
id_compra number(10) generated always as identity,
monto number(8,2) not null,
id_proveedor number(10) not null
);
-- 3. ALTER TABLE:
--    ADD PK a PROVEEDOR y COMPRA
alter table proveedor
add primary key(id_proveedor);
alter table compra
add primary key(id_compra);
--    ADD FK COMPRA → PROVEEDOR
alter table compra
add constraint fk_id_proveedor
foreign key(id_proveedor)
references proveedor(id_proveedor);
-- 4. Insertar registros.
insert into proveedor(nombre)
values('jose');
insert into proveedor(nombre)
values('miguel');
insert into proveedor(nombre)
values('carmaen');

insert into compra(monto, id_proveedor)
values(233,2);
insert into compra(monto, id_proveedor)
values(2333.2,3);
insert into compra(monto, id_proveedor)
values(2333.3,1);
-- 5. Actualizar monto de compra.
update compra
set monto=1000.00
where id_compra=1;
update compra 
set monto=2000.00
where id_compra=2;
update compra
set monto=3000.00
where id_compra=3;
-- 6. Eliminar compras menores a 50.
delete from compra where monto<3000.00;
-- 7. ALTER TABLE COMPRA:
--    ADD fecha DATE
alter table compra
add fecha date;
--    MODIFY monto DECIMAL(10,2)
alter table compra
modify monto number(10,2);
--    RENAME COLUMN monto TO total_compra
alter table compra
rename column monto to total_compra;
--    ADD CONSTRAINT CHECK(total_compra > 0)
alter table compra
add constraint chk_total_compra
check (total_compra>0);
--    DROP COLUMN fecha
alter table compra
drop column fecha; 
--    RENAME TABLE COMPRA TO COMPRAS
alter table compra
rename to compras;
-- 8. Eliminar tablas COMPRAS y PROVEEDOR.
drop table compras;
drop table proveedor;

-- =====================================================
-- EJERCICIO 7 – PAÍSES (PK y FK con ALTER)
-- =====================================================
-- 1. Crear PAIS(id_pais INT, nombre VARCHAR(80))
create table pais(
id_pais number(10) generated always as identity,
nombre varchar2(120) not null
);

-- 2. Crear CIUDAD(id_ciudad INT, nombre_ciudad VARCHAR(80), id_pais INT)
create table ciudad(
id_ciudad number(10) generated always as identity,
nombre_ciudad varchar2(80)not null,
id_pais number(10) not null
);
-- 3. ALTER TABLE agregar PK y FK.
alter table ciudad
add primary key(id_ciudad);
alter table pais
add primary key(id_pais);

alter table ciudad
add constraint fk_id_pais
foreign key(id_pais)
references pais(id_pais);
-- 4. Insertar registros.
insert into pais(nombre)
values('miguel');
insert into pais(nombre)
values('mexico');
insert into pais(nombre)
values('argentina');

insert into ciudad(nombre_ciudad, id_pais)
values('df',1);
insert into ciudad(nombre_ciudad, id_pais)
values('paris',2);
insert into ciudad(nombre_ciudad, id_pais)
values('roma',3);

-- 5. Actualizar nombres.
update pais
set nombre='paris'
where id_pais=1;
update pais
set nombre='mexico'
where id_pais=2;
update pais
set nombre='new york'
where id_pais=3;
-- 6. Eliminar ciudades pequeñas.
delete from ciudad where id_ciudad=1;
-- 7. ALTER TABLE CIUDAD:
--    ADD poblacion INT
alter table ciudad
add poblacion number(10);

--    MODIFY nombre_ciudad VARCHAR(120)
alter table ciudad
modify nombre_ciudad varchar2(120);
--    RENAME COLUMN nombre_ciudad TO ciudad
alter table ciudad
rename column nombre_ciudad to ciudad;
--    ADD CONSTRAINT UNIQUE(ciudad)
alter table ciudad
add constraint uq_ciudad
unique (ciudad);
--    DROP COLUMN poblacion
alter table ciudad
drop column poblacion;
--    RENAME TABLE CIUDAD TO MUNICIPIO
alter table ciudad
rename to municipio;
-- 8. Eliminar tablas MUNICIPIO y PAIS.
drop table municipio;
drop table pais;
-- =====================================================
-- EJERCICIO 8 – RED SOCIAL (PK y FK con ALTER)
-- =====================================================
-- 1. Crear USUARIO(id_usuario INT, nombre VARCHAR(100))
create table usuario(
id_usuario number(10) generated always as identity,
nombre varchar2(100)
);
-- 2. Crear PUBLICACION(id_publicacion INT, contenido VARCHAR(200), id_usuario INT)
create table publicacion(
id_publicacion number(10) generated always as identity,
contenido varchar2(200) not null,
id_usuario number(10) not null
);
-- 3. ALTER TABLE agregar PK y FK.
alter table usuario
add primary key(id_usuario);
alter table publicacion
add primary key(id_publicacion);
-- 4. Insertar publicaciones.
insert into usuario(nombre)
values('miguel');
insert into usuario(nombre)
values('jose');
insert into usuario(nombre)
values('luis');

insert into publicacion(contenido, id_usuario)
values('minato',1);
insert into publicacion(contenido, id_usuario)
values('jose',2);
insert into publicacion(contenido, id_usuario)
values('minaro',3);
-- 5. Actualizar contenido.

update publicacion
set contenido='hola hola'
where id_publicacion=1;
update publicacion
set contenido='nuun'
where id_publicacion=2;
update publicacion
set contenido='gugu'
where id_publicacion=3;
-- 6. Eliminar publicaciones antiguas.
delete from publicacion where id_publicacion=3;
-- 7. ALTER TABLE PUBLICACION:
--    ADD likes INT
alter table publicacion
add likes number(10);
--    MODIFY contenido VARCHAR(300)
alter table publicacion
modify contenido varchar2(300);
--    RENAME COLUMN contenido TO texto
alter table publicacion
rename column contenido to texto;
--    ADD CONSTRAINT CHECK(LENGTH(texto) > 0)
alter table publicacion
add constraint chek_texto
check (texto>'');
--    DROP COLUMN likes
alter table publicacion
drop column likes;
--    RENAME TABLE PUBLICACION TO POST
alter table publicacion
rename to post;
-- 8. Eliminar tablas POST y USUARIO.
drop table post;
drop table usuario;

-- =====================================================
-- EJERCICIO 9 – UNIVERSIDAD (PK y FK con ALTER)
-- =====================================================
-- 1. Crear CURSO(id_curso INT, nombre_curso VARCHAR(100))
create table curso(
id_curso number(10) generated always as identity,
nombre_curso varchar(100) not null
);
-- 2. Crear INSCRIPCION(id_inscripcion INT, id_curso INT, estudiante VARCHAR(100))
create table inscripcion(
id_inscripcion number(10) generated always as identity,
estudiante varchar(100) not null,
id_curso number(10) not null
);
-- 3. ALTER TABLE agregar PK y FK.
alter table curso
add primary key (id_curso);
alter table inscripcion
add primary key(id_inscripcion);

alter table inscripcion
add constraint fk_id_curso
foreign key(id_curso)
references curso(id_curso);
-- 4. Insertar datos.
insert into curso(nombre_curso)
values('miguel');
insert into curso(nombre_curso)
values('jose');
insert into curso(nombre_curso)
values('mina');

insert into inscripcion(estudiante, id_curso)
values('miguel',1);
insert into inscripcion(estudiante, id_curso)
values('kuis',2);
insert into inscripcion(estudiante, id_curso)
values('hhh',3);
-- 5. Actualizar nombres.
update curso
set nombre_curso='null'
where id_curso=1;
update curso
set nombre_curso='luis'
where id_curso=2;
-- 6. Eliminar inscripciones.
delete from inscripcion ;
-- 7. ALTER TABLE INSCRIPCION:
--    ADD semestre VARCHAR(10)
alter table inscripcion
add semestre varchar2(100);
--    MODIFY nombre_curso VARCHAR(150)
alter table curso
modify nombre_curso varchar2(150);
--    RENAME COLUMN nombre_curso TO curso
alter table curso
rename column nombre_curso to curso;
--    ADD CONSTRAINT UNIQUE(curso)
alter table curso
add constraint fk_curso
unique (curso);
--    DROP COLUMN semestre
alter table inscripcion
drop column semestre;
--    RENAME TABLE INSCRIPCION TO MATRICULA
alter table inscripcion
rename to maricula;
-- 8. Eliminar tablas MATRICULA y CURSO.
drop table maricula;
drop table curso;

-- =====================================================
-- EJERCICIO 10 – AUTOS (PK y FK con ALTER)
-- =====================================================
-- 1. Crear MARCA(id_marca INT, nombre VARCHAR(100))
create table marca(
id_marca number(10) generated always as identity, 
nombre varchar2(10) not null
);
-- 2. Crear VEHICULO(id_vehiculo INT, modelo VARCHAR(100), id_marca INT)
create table vihiculo(
id_vehiculo number(10) generated always as identity,
modelo varchar2(100) not null,
id_marca number(10) not null
);
-- 3. ALTER TABLE agregar PK y FK.
alter table marca 
add primary key (id_marca);
alter table vehiculo
add primary key(id_vehiculo);

alter table vehiculo
add constraint fk_id_marca
foreign key(id_marca)
references marca (id_marca);
-- 4. Insertar autos.
insert into marca(nombre)
values('audi');
insert into marca(nombre)
values('honda');
insert into marca(nombre)
values('toyota');

insert into vehiculo(modelo, id_marca)
values('runrun',1);
insert into vehiculo(modelo, id_marca)
values('ranran',2);
insert into vehiculo(modelo, id_marca)
values('gungun',3);
-- 5. Actualizar modelo.
update vehiculo
set modelo='huhun'
where id_vehiculo=1;
update vehiculo
set modelo='tytyt'
where id_vehiculo=2;
update vehiculo
set modelo='tueyy'
where id_vehiculo=3;
-- 6. Eliminar autos antiguos.
delete from vehiculo where id_vehiculo=1;
-- 7. ALTER TABLE VEHICULO:
--    ADD color VARCHAR(50)
alter table vehiculo
add color varchar2(40);

--    MODIFY modelo VARCHAR(150)
alter table vehiculo
modify modelo varchar2(140);
--    RENAME COLUMN modelo TO modelo_auto
alter table vehiculo
rename column modelo to modelo_auto;
--    ADD CONSTRAINT UNIQUE(modelo_auto)
alter table vehiculo
add constraint unq_modelo_auto
unique (modelo_auto);
--    DROP COLUMN color
alter table vehiculo
drop column color;
--    RENAME TABLE VEHICULO TO AUTO
alter table vehiculo
rename to auto;
-- 8. Eliminar tablas AUTO y MARCA.
drop table auto;
drop table marca;