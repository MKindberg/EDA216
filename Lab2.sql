CREATE TABLE user
(
Username char(15),
Name char(20) not null,
Adress char(30),
PhoneNbr char(11) not null,
primary key(username)
);

CREATE TABLE Theatre
(
Name char(15),
Seats int not null,
primary key(name)
);

CREATE TABLE Reservation
(
RefNbr int,
Username char(15),

)
