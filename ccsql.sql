drop database if exists ccport;
go
create database ccport;
go

use ccport;
go

CREATE TABLE employee (
  Title varchar(64) NOT NULL,
  Email varchar(64) NOT NULL,
  EmployeeID int NOT NULL identity
)
go

CREATE TABLE history (
  VisitorID int NOT NULL identity,
  EmployeeIDHistory int NOT NULL,
  Changes text NOT NULL
)
go

CREATE TABLE visitor (
  Name text NOT NULL,
  Email varchar(64) NOT NULL primary key,
  Message text NOT NULL
)
go
