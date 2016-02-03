DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Theatres;
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Performances;
DROP TABLE IF EXISTS Reservations;

CREATE TABLE Users
(
username char(15),
name char(20) NOT NULL,
adress char(30),
phoneNbr char(11) NOT NULL,
PRIMARY KEY(username)
);

CREATE TABLE Theatres
(
name char(15),
seats int NOT NULL,
PRIMARY KEY(name)
);

CREATE TABLE Movies
(
title char(20),
PRIMARY KEY(title)
);

CREATE TABLE Performances
(
title char(20),
day date,
freeSeats int NOT NULL,
theatreName char(20)
PRIMARY KEY(title, day),
FOREIGN KEY(theatreName) REFERENCES Theatres(name)
);

CREATE TABLE Reservations
(
refNbr int AUTO_INCREMENT,
username char(15),
title char(20),
day Date,
PRIMARY KEY(refNbr),
FOREIGN KEY(username) REFERENCES Users(username),
foreign key(title, day) REFERENCES Performances(title, day)
);
