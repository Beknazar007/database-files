create table car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL,
	model VARCHAR(50) NOT NULL,
	price VARCHAR(50) NOT NULL
);
create table person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,salary VARCHAR(25) NOT NULL,
	city VARCHAR(50) NOT NULL,
	
	car_id BIGINT REFERENCES car (id),
	UNIQUE(car_id) 
);
insert into person (first_name, last_name, salary, city) values ('Ronni', 'Longmire', '$76928.35', 'Manturovo' );
insert into person (first_name, last_name, salary, city) values ('Minor', 'Jarman', '$28094.09', 'Ribeirão Pires' );
insert into person (first_name, last_name, salary, city) values ('Isadora', 'Yandell', '$85448.16', 'Colegiales');
insert into person (first_name, last_name, salary, city) values ('Lewiss', 'Braven', '$191.03', 'Massy');
insert into person (first_name, last_name, salary, city) values ('Homerus', 'Dehm', '$7659.65', 'Lenningen');
insert into person (first_name, last_name, salary, city) values ('Reade', 'Rentz', '$42879.14', 'Tucuruí');
insert into person (first_name, last_name, salary, city) values ('Beki', 'Saitov', '$89220.65', 'Bishkek');
insert into person (first_name, last_name, salary, city ) values ('Stinky', 'Chalker', '$25826.62', 'Concepción de La Vega' );
insert into person (first_name, last_name, salary, city ) values ('Teresina', 'Smallpiece', '$34354.06', 'Tandzut' );
insert into person (first_name, last_name, salary, city ) values ( 'Leonore', 'Seres', '$86886.79', 'Kangxung');

insert into car ( make, model, price) values ('Chevrolet', 'Traverse', '$86457.39');
insert into car ( make, model, price) values ('Ford', 'F250', '$95411.97');
insert into car ( make, model, price) values ('Mercedes-Benz', 'W123', '$20361.69');
insert into car ( make, model, price) values ('Mercedes-Benz', 'E-Class', '$68917.90');
insert into car ( make, model, price) values ('Dodge', 'Ram Van B150', '$78032.38');
insert into car ( make, model, price) values ('Toyota', 'Sienna', '$62300.11');
insert into car ( make, model, price) values ('Jeep', 'Liberty', '$9788.75');
insert into car ( make, model, price) values ('Chevrolet', 'Express 2500', '$57745.24');
insert into car ( make, model, price) values ('Chevrolet', 'Venture', '$79674.20');
insert into car ( make, model, price) values ( 'Cadillac', 'STS', '$63367.18');

