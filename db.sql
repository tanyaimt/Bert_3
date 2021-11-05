use jatisdb;
/*foreign key to table  */
CREATE TABLE concepto_base ( /*schema conceptos base*/
    id int unique auto_increment,
	nombre varchar(45)
);
CREATE TABLE BD_transaccion_concepto ( /*schema conceptos base*/
    id int unique auto_increment,
	concepto_base_id int /*foreign key to table concepto_base*/
);
CREATE TABLE parametros ( /*schema conceptos base*/
    id int unique auto_increment,
	descripcion varchar(45),
    valor varchar(45),
    tipo varchar(45),
    tamaño varchar(45),
    proposito varchar(45),
    concepto_base_id int /*foreign key to table concepto_base*/
);
CREATE TABLE bd_tabla ( /*schema bases de datos*/
    id int unique auto_increment,
    tb_name varchar(45)
);
CREATE TABLE bd_transaccion ( /*schema bases de datos*/
    id int unique auto_increment,
    descripcion_transaccion varchar(45),
    fecha varchar(45),
	tabla_id int, /*foreign key to table bd_tabla*/
    usuario_id int /*foreign key to table usuario (pending)*/
);
CREATE TABLE bd_valor ( /*schema bases de datos*/
    id int unique auto_increment,
    valor varchar(45),
    tipo enum("VARCHAR","TEXT", "BOOLEAN", "INT", "DOUBLE", "DATETIME"),
    tamaño int,
	tabla_id int, /*foreign key to table bd_tabla*/
	UNIQUE KEY u_id(valor,tabla_id)
);
CREATE TABLE bd_relacion ( /*schema bases de datos*/
    id int unique auto_increment,
    valor_main_id int, /*foreign key to table bd_tabla*/
    valor_foreign_id int /*foreign key to table bd_tabla*/
);
CREATE TABLE bd_data ( /*schema bases de datos*/
    id int unique auto_increment,
    db_value_id int, /*foreign key to table bd_tabla*/
    info varchar(255),
    id_reg int
);

/*registro de tablas base*/
insert into bd_tabla(id, tb_name) values(1, "materia_prima");
insert into bd_tabla(id, tb_name) values(2, "materia_prima_producto");
insert into bd_tabla(id, tb_name) values(3, "producto");
insert into bd_tabla(id, tb_name) values(4, "proceso");
insert into bd_tabla(id, tb_name) values(5, "rol");
insert into bd_tabla(id, tb_name) values(6,"puesto");
insert into bd_tabla(id, tb_name) values(7, "empleado");
insert into bd_tabla(id, tb_name) values(8, "departamento");


insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(1, "id","VARCHAR", 45,1);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(2, "id","VARCHAR", 45,2);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(3, "id","VARCHAR", 45,3);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(4, "id","VARCHAR", 45,4);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(5, "id","VARCHAR", 45,5);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(6, "id","VARCHAR", 45,6);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(7, "id","VARCHAR", 45,7);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(8, "descripcion","VARCHAR", 45,1);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(9, "costo","VARCHAR", 45,1);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(10, "unidad_medida","VARCHAR", 45,1);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(11, "directo","BOOLEAN", NULL,1);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(12, "activo_fijo","VARCHAR", 45,1);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(13, "descripcion","VARCHAR", 45,3);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(14, "costo","VARCHAR", 45,3);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(15, "materia_prima_id","INT", NULL,2);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(16, "producto_id","INT", NULL,2);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(1, 1, 15);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(2, 3, 16);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(17, "descripcion","VARCHAR", 45,4);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(18, "tiempo","VARCHAR", 45,4);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(19, "rol_id","INT", NULL,4);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(20, "product_id","INT", 45,4);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(21, "directo","BOOLEAN", 45,4);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(3, 5, 19);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(4, 3, 20);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(22, "descripcion","VARCHAR", 45,5);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(23, "puesto_id","INT", 45,5);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(5, 6, 23);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(24, "nombre","VARCHAR", 45,6);

insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(25, "costo_hora","VARCHAR", 45,7);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(26, "departamento_id","INT", 45,7);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(27, "nombre","INT", 45,7);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(28, "apellido","INT", 45,7);


insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(29, "nombre","VARCHAR", 45,8);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(30, "directo","BOOLEAN", 45,8);
insert into bd_valor(id, valor, tipo, tamaño, tabla_id) values(31, "supervisor_id","INT", 45,8);
insert into bd_relacion(id, valor_main_id, valor_foreign_id) values(6, 7, 29);

insert into bd_data(db_value_id, info, id_reg) values(25,"400", 1);
insert into bd_data(db_value_id, info, id_reg) values(26,"IT", 1);
insert into bd_data(db_value_id, info, id_reg) values(27,"Tanya Montserrat", 1);
insert into bd_data(db_value_id, info, id_reg) values(28,"Rojas Gonzalez", 1);

insert into bd_data(db_value_id, info, id_reg) values(25,"400", 2);
insert into bd_data(db_value_id, info, id_reg) values(26,"IT", 2);
insert into bd_data(db_value_id, info, id_reg) values(27,"Jose Luis", 2);
insert into bd_data(db_value_id, info, id_reg) values(28,"Esparza Guevara" , 2);

insert into bd_data(db_value_id, info, id_reg) values(25,"400", 3);
insert into bd_data(db_value_id, info, id_reg) values(26,"Finanzas", 3);
insert into bd_data(db_value_id, info, id_reg) values(27,"Cruz Mireya", 3);
insert into bd_data(db_value_id, info, id_reg) values(28,"Gonzalez Cervantes", 3);

insert into bd_data(db_value_id, info, id_reg) values(25,"400", 4);
insert into bd_data(db_value_id, info, id_reg) values(26,"RH", 4);
insert into bd_data(db_value_id, info, id_reg) values(27,"Marco Antonio", 4);
insert into bd_data(db_value_id, info, id_reg) values(28,"Rojas Martinez", 4);

select * from bd_tabla where tb_name="empleado";
select * from bd_valor where tabla_id in (select id from bd_tabla where tb_name="empleado");
select * from bd_data where db_value_id in (select id from bd_valor where tabla_id in (select id from bd_tabla where tb_name="empleado"));


select d.id_reg from bd_tabla as t, bd_valor as v, bd_data as d
where t.id=v.tabla_id
and v.id=d.db_value_id
and t.tb_name="empleado"
and d.db_value_id=26
and d.info="IT";

select v.valor, d.info from bd_tabla as t, bd_valor as v, bd_data as d
where t.id=v.tabla_id
and v.id=d.db_value_id
and t.tb_name="empleado"
and d.id_reg in (
	select d.id_reg from bd_tabla as t, bd_valor as v, bd_data as d
	where t.id=v.tabla_id
	and v.id=d.db_value_id
	and t.tb_name="empleado"
	and d.db_value_id=26
	and d.info="IT")
and v.valor in ("nombre", "apellido")


