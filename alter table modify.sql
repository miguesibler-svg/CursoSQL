/* Ejercicio 1 
Modifica la tabla alumnos para que la columna nombre permita 80 caracteres.*/

alter table alumnos
modify nombre varchar2(80);

/* Ejercicio 2 
Modifica la tabla alumnos para que la columna edad sea obligatoria (NOT NULL).*/

alter table alumnos
modify edad not null;

/* Ejercicio 3
Modifica la tabla mascotas para que la columna peso sea NUMBER(6,2). */
alter table mascotas
modify peso number(6,2);

/* Ejercicio 4 
Modifica la tabla libros para que la columna titulo permita 150 caracteres.*/
alter table libros
modify titulo varchar2(150);

/* Ejercicio 5 
Modifica la tabla empleados para que la columna salario sea NUMBER(12,2).*/

alter table empleados
modify salario number(12,2);

/* Ejercicio 6 
Modifica la tabla productos para que la columna descripcion sea VARCHAR2(500).*/

alter table productos
modify descripcion varchar2(500);

/* Ejercicio 7
Modifica la tabla peliculas para que la columna genero permita 60 caracteres. */

alter table peliculas 
modify genero varchar2(60);

/* Ejercicio 8 
Modifica la tabla ventas para que la columna metodo_pago permita 50 caracteres.*/

alter table ventas
modify metodo_pago varchar2(50);

/* Ejercicio 9
Modifica la tabla proveedores para que la columna telefono permita 30 caracteres. */

alter table proveedores 
modify telefono varchar2(30);

/* Ejercicio 10
Modifica la tabla facturas para que la columna numero_factura permita 40 caracteres. */

alter table facturas
modify numero_factura varchar2(40);
