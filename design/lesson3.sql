create table if not exists Жанры (
	Название varchar(40) primary key
);

create table if not exists Исполнитель (
	Идентификатор serial primary key,
	Имя varchar(40) not null,
	Жанр varchar(40) references Жанры (Название)
);

create table if not exists Альбом (
	Идентификатор serial primary key,
	Название_альбома varchar(40) not null,
	Год_выпуска integer not null check (Год_выпуска > 1900 and Год_выпуска < 2023),
	Идентификатор_исполнителя integer references Исполнитель (Идентификатор)
);

create table if not exists Треки (
	Идентификатор serial primary key,
	Название_трека varchar(40) not null,
	Длительность integer not null,
	Идентификатор_альбома integer unique references Альбом (Идентификатор)
);

create table if not exists Сборник (
	Идентификатор serial primary key,
	Название_сборника varchar(40) not null,
	Год_выпуска integer not null check (Год_выпуска > 1900 and Год_выпуска < 2023),
	Идентификатор_трека integer references Треки (Идентификатор)
	Идентификатор_альбома integer references Альбом (Идентификатор)
);