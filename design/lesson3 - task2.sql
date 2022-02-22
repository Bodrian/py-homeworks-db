create table if not exists Department (
	Department_name varchar(40) primary key
);

create table if not exists Worker_name (
	Id serial primary key,
	Name varchar(40) not null
);

create table if not exists Head_department (
	Id serial primary key,
	Head_name_Id integer references Worker_name (Id),
	Department_name varchar(40) references Department (Department_name)
);

create table if not exists Worker (
	Id serial primary key,
	Whorker_name_Id integer references Worker_name (Id),
	Head_department_id integer references Head_department (Id)
);