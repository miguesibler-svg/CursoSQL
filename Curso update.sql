insert into tb_articulos(codigo_ar, descripcion_ar, marca_ar, codigo_me, codigo_ca)
values(6,'escritorio','standar', 1,1);

update tb_articulos
set marca_ar='canon'
where codigo_ar=2 ;

update tb_articulos
set marca_ar='samsung'
where codigo_ar in (3,4);

update tb_articulos
set descripcion_ar=concat('* ',descripcion_ar)
where marca_ar='standar';