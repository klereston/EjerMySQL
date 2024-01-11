DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

create table Tiendas(
tienda_id integer auto_increment primary key,
direccion varchar(100),
codigo_postal integer, 
localidad varchar(100), 
provincia varchar(100)
); 

insert into Tiendas values(0,'calle piri n129', 08080, 'Barcelona', 'Barcelona');
insert into Tiendas values(0,'calle gaga n1', 00180, 'Madrid', 'Madrid');
insert into Tiendas values(0,'calle perito n9', 04050, 'Valencia', 'Valencia');
insert into Tiendas values(0,'calle poras n29', 02020, 'La Coruña', 'La Coruña');

create table Empleados(
empleado_id integer auto_increment primary key,
nombre varchar(100),
apellido varchar(100),
NIF varchar(100),
telefono integer,
tienda_id integer,
FOREIGN KEY (tienda_id) REFERENCES Tiendas(tienda_id)
);


insert into Empleados values(0,'Carlos', 'lulu','B123112', 654238238, 1);
insert into Empleados values(0,'Pepito', 'gomez','C345553', 694821859, 1);
insert into Empleados values(0,'Lola', 'tavares','B123112', 654238238, 2);
insert into Empleados values(0,'Ramos', 'xaves','C345553', 694821859, 3);

create table Clientes(
cliente_id integer auto_increment primary key,
nombre varchar(100),
apellidos varchar(100), 
direccion varchar(100),
codigo_postal integer, 
localidad varchar(100), 
provincia varchar(100), 
telefono integer
);

insert into Clientes values(0, 'Pepito', 'Perez','calle piri n129', 08080, 'Barcelona', 'Barcelona', 633444888);
insert into Clientes values(0, 'Kaka', 'Nunes','calle piri n129', 08080, 'Barcelona', 'Barcelona', 633444888);
insert into Clientes values(0, 'Ronaldo', 'Ruis','calle piri n129', 08080, 'Barcelona', 'Barcelona', 633444888);
insert into Clientes values(0, 'Kado', 'Kan','calle piri n129', 08080, 'Valencia', 'Valencia', 633444888);
insert into Clientes values(0, 'Rivaldo', 'Pelotas','calle piri n129', 08080, 'Madrid', 'Madrid', 633444888);


create table Comandas(
comanda_id integer auto_increment primary key,
data_registro date,
repartimento_domicilio_tienda varchar(100),
cliente_id integer,
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
tienda_id integer,
FOREIGN KEY (tienda_id) REFERENCES Tiendas(tienda_id),
empleado_id integer,
FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
);

/*comanda s'emmagatzema un identificador únic: Data/hora, si la comanda és per a repartiment a domicili o per a recollir en botiga.
Query: -> la quantitat de productes que s'han seleccionat de cada tipus, el preu total.*/
/*el que hizo la comanda 1º fue el cliente Pepito 1ª*/
/*el que hizo la comanda 2º fue el cliente Kaka 2ª*/
/*el que hizo la comanda 3º fue el cliente Ronaldo 3ª*/
/*Tiendas 1º , Empleados 1, 2*/
insert into Comandas values(0, '2021-01-02 23:09:59', 'domicilio', 1, 1, 1);
insert into Comandas values(0, '2022-01-02 12:30:54', 'tienda', 2, 1, 2);
insert into Comandas values(0, '2023-01-02 13:12:50', 'domicilio', 3, 2, 3);
insert into Comandas values(0, '2022-10-22 03:00:09', 'domicilio', 2, 1, 1);

/*Tipo producto*/
create table Bebidas(
bebida_id integer auto_increment primary key,
nombre varchar(100)
);

insert into Bebidas values(0, 'coca-cola');
insert into Bebidas values(0, 'fanta-naranja');
insert into Bebidas values(0, 'zumo-manzana');


create table Hamburguesas(
hamburguesa_id integer auto_increment primary key,
nombre varchar(100)
);

insert into Hamburguesas values(0, 'xxx');

/*Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.*/
create table Categoria(
categoria_id integer auto_increment primary key,
nombre varchar(100)
);

insert into Categoria values(0, 'queso');
insert into Categoria values(0, 'vegetal');
insert into Categoria values(0, 'carne');
insert into Categoria values(0, 'dulce');

create table Pizzas(
pizza_id integer auto_increment primary key,
nombre varchar(100),
categoria_id integer,
FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
);

insert into Pizzas values(0, '4 quesos', 1);
insert into Pizzas values(0, 'margarita', 1);
insert into Pizzas values(0, 'vegetal', 2);
insert into Pizzas values(0, 'calabresa', 3);
insert into Pizzas values(0, 'chocolate', 4);


/*Tipo*/
create table CodTipo(
codtipo_id integer auto_increment primary key,
bebida_id integer,
FOREIGN KEY (bebida_id) REFERENCES Bebidas(bebida_id),
hamburguesa_id integer,
FOREIGN KEY (hamburguesa_id) REFERENCES Hamburguesas(hamburguesa_id),
pizza_id integer,
FOREIGN KEY (pizza_id) REFERENCES Pizzas(pizza_id)
);

/*tipo (1 - 1) = coca-cola*/
/*tipo (1 - 2) = fanta-naranja*/
/*tipo (1 - 3) = zumo-manzana*/
/*tipo (2 - 1) = hamburguesa xxx*/
/*tipo (3 - 1) = pizza 4 quesos*/
/*tipo (3 - 2) = pizza margarita*/
/*tipo (3 - 3) = pizza vegetal*/
insert into CodTipo values(0, 1, 0, 0);
insert into CodTipo values(0, 2, 0, 0);
insert into CodTipo values(0, 3, 0, 0);

insert into CodTipo values(0, 0, 1, 0);

insert into CodTipo values(0, 0, 0, 1);
insert into CodTipo values(0, 0, 0, 2);
insert into CodTipo values(0, 0, 0, 3);
insert into CodTipo values(0, 0, 0, 4);
insert into CodTipo values(0, 0, 0, 5);


create table Productos(
producto_id integer auto_increment primary key,
codtipo_id integer,
FOREIGN KEY (codtipo_id) REFERENCES CodTipo(codtipo_id),
descripcion varchar(100),
imagen varchar(100),
precio varchar(100),
comanda_id integer,
FOREIGN KEY (comanda_id) REFERENCES Comandas(comanda_id)
);

/*Una comanda pot constar d'un o diversos productes*/ 
/*cocacola comnda 1, fanta comanda 1, pizza comanda 1*/
/*comanda 1º de Pepito 1º pizza 1º*/
insert into Productos values(0, 1, 'bebida carbonatada de cafe', 'coca-cola.png', 2.50, 1); 
insert into Productos values(0, 4, 'hamburguesa triplo x', 'hamburguesa.png', 12.50, 1); 
insert into Productos values(0, 6, 'pizza de mozarela y tomate', 'pizza.png', 10.50, 1); 

/*comanda 2º de Kaka 2º pizza 2º*/
insert into Productos values(0, 2, 'bebida carbonatada de naranja', 'fanta-naranja.png', 2.50, 2); 
insert into Productos values(0, 6, 'pizza de mozarela y tomate', 'pizza.png', 10.50, 2); 

/*comanda 3º de Pepito 3º*/
insert into Productos values(0, 4, 'hamburguesa triplo x', 'hamburguesa.png', 12.50, 3); 

/*comnda numero 4º Kaka*/
insert into Productos values(0, 3, 'bebida zumo-manzana', 'zumo-manzana.png', 2.50, 4); 
insert into Productos values(0, 7, 'pizza de vegetal', 'pizza.png', 10.50, 4); 



/*Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.*/
/*comanda = cliente_id, tienda_id.
productos = tipo_id, comanda_id. */
/*tienda_id 1 = barcelona, cod de bebidas van del 1 al 3*/
SELECT COUNT(Productos.codtipo_id) as Total_Bebidas_Vendidas_Barcelona
FROM Productos
INNER JOIN Comandas
ON Productos.comanda_id=Comandas.comanda_id
where Productos.codtipo_id <= 3 AND Comandas.tienda_id = 1;


/*Llista quantes comandes ha efectuat un determinat empleat/da.*/
/*id de Carlos es 1*/
SELECT COUNT(Comandas.comanda_id) as Total_Comandas_Efectuadas_Carlos
FROM Comandas
INNER JOIN Empleados
ON Comandas.empleado_id=Empleados.empleado_id
where Comandas.empleado_id = 1;
