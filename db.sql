CREATE TABLE CONTACTO(
IdContacto int primary key identity,
Nombre varchar(40),
Telefono varchar(40),
FechaNacimiento date,
FechaRegistro datetime default getdate()
)

go

set dateformat dmy

insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Carlos','Masculino',CONVERT(date,'22/03/2005'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Pepe','Masculino',CONVERT(date,'08/09/2009'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Diego','Masculino',CONVERT(date,'14/10/2002'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Camilo','Masculino',CONVERT(date,'11/10/2000'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Jairo','Masculino',CONVERT(date,'08/06/2006'))

insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Alexa','Femenino',CONVERT(date,'17/04/2010'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Fernanda','Femenino',CONVERT(date,'05/03/2001'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Sharon','Femenino',CONVERT(date,'22/07/2003'))
insert into CONTACTO(Nombre,Telefono,FechaNacimiento) values
('Claudia','Femenino',CONVERT(date,'05/09/2004'))
go

select * from CONTACTO
