create table if not exists Genre (
	Name_genre varchar(40) primary key
);

create table if not exists Name_artist (
	Id serial primary key,
	Name_artist varchar(40) not null
);

create table if not exists Album_info (
	Id serial primary key,
	Album_name varchar(40) not null,
	Year integer not null check (Year > 1900 and Year < 2023)
);

create table if not exists Collection_info (
	Id serial primary key,
	Collection_name varchar(40) not null,
	Year integer not null check (Year > 1900 and Year < 2023)
);

create table if not exists Artist (
	Id serial primary key,
	Artist_name_Id integer references Name_artist (Id),
	Genre varchar(40) references Genre (Name_genre)
);

create table if not exists Album (
	Id serial primary key,
	Album_info_Id integer references Album_info (Id),
	Artist_Id integer references Artist (Id)
);

create table if not exists Track (
	Id serial primary key,
	Track_name varchar(40) not null,
	Duration integer not null,
	Album_Id integer references Album (Id)
);

create table if not exists Collection (
	Collection_info_Id integer references Collection_info (Id),
	Track_Id integer references Track (Id),
	constraint pk primary key (Collection_info_Id, Track_Id)
);