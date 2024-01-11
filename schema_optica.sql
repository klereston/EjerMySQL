
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

create table Empleado(
empleado_id integer auto_increment primary key,
nombre varchar(100)
);

insert into Empleado values(0,'Carlos');
insert into Empleado values(0,'Pepito');
select * from Empleado;


create table Cliente(
cliente_id integer auto_increment primary key,
nombre varchar(100),
direccion varchar(100), 
telefono integer,
email varchar(100),
data_registro date,
recomendado_cliente_id integer DEFAULT null,
vendendor varchar(100),
FOREIGN KEY (recomendado_cliente_id) REFERENCES Cliente(cliente_id)
);

insert into Cliente values(0,'Pepe', 'Calle Madrid n123 p12 022002', 666555444, 'pepe@gmail.com','2008-11-11',0,1);
insert into Cliente values(0,'Kaka', 'Calle Madrid n123 p12 022002', 666111222, 'kaka@gmail.com','2008-11-11',0,1);
insert into Cliente values(0,'Ronaldo', 'Calle Madrid n123 p12 022002', 633444888, 'ronal@gmail.com','2008-11-11',0,2);
insert into Cliente values(0,'Beti', 'Calle Madrid n123 p12 022002', 656332999, 'beti@gmail.com','2008-11-11',0,2);
insert into Cliente values(0,'Pedro', 'Calle Madrid n123 p12 022002', 612233665, 'pedro@gmail.com','2008-11-11',0,1);
select * from Cliente;

create table Proveedor(
proveedor_id integer auto_increment primary key,
nombre varchar(100),
calle varchar(100),
numero integer,
piso integer, 
puerta varchar(5), 
ciudad varchar(100), 
codigo_postal integer, 
pais varchar(100), 
telefono integer, 
fax integer, 
NIF varchar(100)
);

insert into Proveedor values(0,'Peps', 'Londre', 123, 12, 'b', 'Madrid', 12300, 'España', 933933933, 933933933, 'A1234567');
insert into Proveedor values(0,'Moura', 'PereSant', 444, 31, 'c', 'Barcelona', 08008, 'España', 933933933, 933933933, 'B0277767');


/*ESTA TABLA PUEDE SER VENTAS!!!! CAMBIARLA !!!*/
create table Gafa(
gafa_id integer auto_increment primary key,
marca varchar(100),
graduacion_lentes float,
montura varchar(100), 
color_montura varchar(100), 
color_lentes varchar(100),
precio float,
data_venta date,
proveedor_id integer,
FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id),
cliente_id integer,
FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
empleado_id integer,
FOREIGN KEY (empleado_id) REFERENCES Empleado(empleado_id)
);

/*Las diferentes marcas de gafas pertenece a un unico proveedor 
    relacion muchas marcas un proveedor */
insert into Gafa values(0,'Hall', 0.7, 'pasta', 'verde', 'amarillo', 123.30, '2021-01-02', 1, 1, 2);
insert into Gafa values(0,'Niks', 1.5, 'flotante', 'negro', 'negro', 222.50, '2021-08-11', 1, 3, 2);
insert into Gafa values(0,'Petrols', 3.0, 'pasta', 'rojo', 'transparente', 105.00, '2021-10-11', 1, 2, 1);
insert into Gafa values(0,'Hall', 0.7, 'pasta', 'verde', 'amarillo', 123.30, '2021-11-11', 1, 4, 1);
insert into Gafa values(0,'Niks', 1.5, 'flotante', 'negro', 'negro', 222.50, '2022-01-11', 1, 1, 1);
insert into Gafa values(0,'Petrols', 3.0, 'pasta', 'rojo', 'transparente', 105.00, '2022-05-11', 1, 1, 2);
insert into Gafa values(0,'Hall', 0.7, 'pasta', 'verde', 'amarillo', 123.30, '2022-09-11', 1, 2, 1);
insert into Gafa values(0,'Niks', 1.5, 'flotante', 'negro', 'negro', 222.50, '2023-01-11', 1, 2, 2);
insert into Gafa values(0,'Petrols', 3.0, 'pasta', 'rojo', 'transparente', 105.00, '2023-10-11', 1, 3, 1);


/*Llista el total de compres d’un client/a.*/
SELECT Cliente.nombre as Cliente, Gafa.marca as Marca, Gafa.precio as Precio
FROM Gafa
INNER JOIN Cliente
ON Gafa.cliente_id=Cliente.cliente_id
where Gafa.cliente_id = 3;
select sum(precio) as Total from Gafa where cliente_id = 3;

/*Llista les diferents ulleres que ha venut un empleat durant un any.*/
SELECT Gafa.marca as Marca, Empleado.nombre as Empleado, Gafa.data_venta
FROM Gafa
INNER JOIN Empleado
ON Gafa.empleado_id=Empleado.empleado_id
where Gafa.empleado_id = 2 AND Gafa.data_venta < '2022-01-01' AND Gafa.data_venta >= '2021-01-01';

/*Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.*/
SELECT Proveedor.nombre as Proveedor, COUNT(*) AS Total_Gafas
FROM Gafa
INNER JOIN Proveedor
ON Gafa.proveedor_id=Proveedor.proveedor_id
GROUP BY Proveedor.nombre 
ORDER BY proveedor DESC;
