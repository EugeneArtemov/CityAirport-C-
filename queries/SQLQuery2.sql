use CityAirport;

create table register(
id_user int identity primary key,
login_user varchar(50) not null,
password_user varchar(50) not null,
);

insert into register (login_user,password_user) values ('admin', '123')
