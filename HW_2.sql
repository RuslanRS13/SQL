
--1)	Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null


create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees;

--2)	Наполнить таблицу employee 70 строками.

insert into employees(employee_name)
values  	('Manuel_Neuer'),
		('Dayot_Upamecano'),
		('Omar_Richards'),
		('Niklas_Sule'),
		('Benjamin_Pavard'),
		('Joshua_Kimmich'),
		('Serge_Gnabry'),
		('Leon_Goretzka'),
		('Robert_Lewandowski'),
		('Leroy_Sane'),
		('Kingsley_Coman'),
		('Eric_Maxim'),
		('Michael_Cuisance '),
		('Marcel_Sabitzer'),
		('Alphonso_Davies'),
		('Bouna_Sarr'),
		('Tanguy_Nianzou'),
		('Corentin_Tolisso'),
		('Thomas_Muller'),
		('Sven_Ulreich'),
		('Christian_Fruchtl'),
		('Josip_Stanisic'),
		('Marc_Andre'),
		('Sergino_Dest'),
		('Gerard_Pique'),
		('Ronald_Araujo'),
		('Sergio_Busquets'),
		('Riqui_Puig'),
		('Ousmane_Dembele'),
		('Dani_Alves'),
		('Memphis_Depay'),
		('Ansu_Fati'),
		('Yusuf_Demir'),
		('Martin_Braithwaite'),
		('Neto'),
		('Philippe_Coutinho'),
		('Clement_Lenglet'),
		('Pedri'),
		('Luuk_de_Jong'),
		('Jordi_Alba '),
		('Sergi_Roberto'),
		('Frenkie_de_Jong'),
		('Oscar_Mingueza'),
		('Samuel_Umtiti'),
		('Eric_Garcia'),
		('Inaki_Pena'),
		('Keylor_Navas'),
		('Achraf_Hakimi'),
		('Presnel_Kimpembe'),
		('Sergio_Ramos'),
		('Marquinhos'),
		('Marco_Verratti'),
		('Kylian_Mbappe'),
		('Leandro_Paredes'),
		('Mauro_Icardi'),
		('Neymar'),
		('Angel_Di_Maria'),
		('Juan_Bernat'),
		('Danilo_Pereira'),
		('Sergio_Rico'),
		('Colin_Dagba'),
		('Georginio_Wijnaldum'),
		('Layvin_Kurzawa'),
		('Xavi'),
		('Iniesta'),
		('Guardiola'),
		('Ronaldinho'),
		('Rivaldo'),
		('Ronaldo'),
		('Pedro');
	
--3)	Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

	
create table salary (
	id serial primary key,
	monthly_salary int not null
	);
		
select * from salary;	
		
--4)	Наполнить таблицу salary 15 строками:

insert into salary (monthly_salary)
values 		(1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400);
		
--5)	Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

select * from employee_salary;

--6)	Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary (employee_id, salary_id)
values  	(1, 1),
		(3, 5),
		(5, 10),
		(7, 15),
		(9, 2),
		(11, 4),
		(13, 6),
		(15, 8),
		(17, 10),
		(19, 12),
		(21, 14),
		(23, 3),
		(25, 6),
		(27, 9),
		(29, 11),
		(31, 13),
		(33, 15),
		(35, 1),
		(37, 1),
		(39, 7),
		(41, 1),
		(43, 5),
		(45, 10),
		(47, 15),
		(49, 2),
		(51, 4),
		(53, 6),
		(55, 8),
		(57, 10),
		(59, 12),
		(81, 14),
		(83, 3),
		(85, 6),
		(87, 9),
		(89, 11),
		(91, 13),
		(93, 15),
		(95, 13),
		(97, 9),
		(99, 8);

--7)	Создать таблицу roles
-- id. Serial  primary key,
-- role_name. int, not null, unique
	
create table roles (
	id serial primary key,
	role_name int not null unique
	);
	
select * from roles;

--8)	Поменять тип столба role_name с int на varchar(30)

alter table roles 
alter column role_name type varchar(40) using role_name::varchar(30);

--9)	Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values  	('Junior_Python_developer'),
		('Middle_Python_developer'),
		('Senior_Python_developer'),
		('Junior_Java_developer'),	
		('Middle_Java_developer'),
		('Senior_Java_developer'),
		('Junior_JavaScript_developer'),
		('Middle_JavaScript_developer'),	
		('Senior_JavaScript_developer'),
		('Junior_Manual_QA_engineer'),	
		('Middle_Manual_QA_engineer'),
		('Senior_Manual_QA_engineer'),
		('Project_Manager'),
		('Designer'),	
		('HR'),
		('CEO'),
		('Sales_manager'),
		('Junior_Automation_QA_engineer'),	
		('Middle_Automation_QA_engineer'),
		('Senior_Automation_QA_engineer');
		
--10)	Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
		
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees (id),
foreign key (role_id)	
	references roles (id)
);	

select * from roles_employee;
	
--11)	Наполнить таблицу roles_employee 40 строками:

insert into roles_employee (employee_id, role_id)
values  	(5,1),
		(10,4),
		(15,8),
		(20,12),
		(21,16),
		(25,20),
		(30,2),
		(35,5),
		(40,7),
		(45,9),
		(50,11),
		(55,13),
		(60,15),
		(65,17),
		(70,19),
		(1,3),
		(7,6),
		(9,14),
		(13,18),
		(17,10),
		(23,7),
		(33,9),
		(44,13),
		(59,1),
		(58,3),
		(61,5),
		(66,7),
		(69,9),
		(22,11),
		(27,13),
		(37,15),
		(47,17),
		(57,19),
		(63,2),
		(14,4),
		(8,8),
		(6,10),
		(3,12),
		(24,14),
		(53,16);
