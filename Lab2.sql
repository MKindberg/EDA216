SET foreign_key_checks=0;

DROP TABLE IF EXISTS  users;
DROP TABLE IF EXISTS  theatres;
DROP TABLE IF EXISTS  movies;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS  performances;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users
(
username char(15),
name char(20) NOT NULL,
adress char(30),
phoneNbr char(11) NOT NULL,
PRIMARY KEY(username)
);

CREATE TABLE theatres
(
name char(15),
seats int NOT NULL CHECK (seats>0),
PRIMARY KEY(name)
);

CREATE TABLE movies
(
title char(20),
PRIMARY KEY(title)
);

CREATE TABLE performances
(
title char(20),
day date,
freeSeats int NOT NULL CHECK (freeSeats>=0),
theatreName char(15),
PRIMARY KEY(title, day),
FOREIGN KEY(title) REFERENCES movies(title) ON UPDATE CASCADE,
FOREIGN KEY(theatreName) REFERENCES theatres(name) ON UPDATE CASCADE
);

CREATE TABLE reservations
(
refNbr int AUTO_INCREMENT,
username char(15),
title char(20),
day Date,
PRIMARY KEY(refNbr),
FOREIGN KEY(username) REFERENCES users(username) ON UPDATE CASCADE,
FOREIGN KEY(title, day) REFERENCES performances(title, day) ON UPDATE CASCADE
);


INSERT INTO Users VALUES ("AAAA", "aaa", "AAAAAb", "0767-467756");
INSERT INTO Users (username, name, phoneNbr) VALUES ("BBBB", "bbb", "0798-486349");

INSERT INTO theatres VALUES("Filmstaden", 150);
INSERT INTO theatres VALUES("Royal", 120);

INSERT INTO movies VALUES("Creed");
INSERT INTO movies VALUES("Point break");
INSERT INTO movies VALUES("Deadpool");
INSERT INTO movies VALUES("4");
INSERT INTO movies VALUES("Youth");

INSERT INTO performances VALUES("Creed", '2016-02-06', 100, "Royal");
INSERT INTO performances VALUES("Deadpool", '2016-02-08', 90, "Royal");
INSERT INTO performances VALUES("Creed", '2016-02-05', 67, "Filmstaden");
INSERT INTO performances VALUES("Point break", '2016-02-06', 78, "Royal");
INSERT INTO performances VALUES("Point break", '2016-02-07', 12, "Filmstaden");


SELECT * FROM movies;
SELECT DISTINCT day FROM performances ORDER BY day;
SELECT * FROM performances;


INSERT INTO reservations (username, title, day) VALUES("AAAA", "Creed", '2016-02-06');
UPDATE performances SET freeSeats=freeSeats-1 WHERE title="Creed" AND day='2016-02-06';
INSERT INTO reservations (username, title, day) VALUES("AAAA", "Deadpool", '2016-02-08');
UPDATE performances SET freeSeats=freeSeats-1 WHERE title="Deadpool" AND day='2016-02-08';


INSERT INTO movies VALUES("Creed");
INSERT INTO performances VALUES("Deadpool", '2016-02-08', 90, "Filmstaden");
INSERT INTO reservations (username, title, day) VALUES("ger", "Creed", '2016-02-06');
INSERT INTO performances VALUES("4", '2016-02-10', 90, "avbs");
INSERT INTO theatres VALUES("b", -10);
