--select * from users;
--CREATE TABLE users (
--    id INT IDENTITY(1,1) PRIMARY KEY,
--    username VARCHAR(50) NOT NULL,
--    nombre VARCHAR(50),
--    password1 VARCHAR(100) NOT NULL
--);
--drop table users;
insert into users values('admin','administrador','123');
--select * from users;
--para verificar el usuario
go
create or alter proc sp_login
@user varchar(50),
@pass varchar(50)
as
select * from users where username=@user and password1=@pass;
go
--para buscar usuario
go
create or alter proc sp_searchUser
@user varchar(50)
as
select id from users where username=@user;
go

--para cambiar la contraseña
go
create or alter proc sp_changePassword
@user varchar(50),
@lastPassword varchar(50),
@newPassword varchar(50)
as
if(@user is null) or ( @lastPassword is null ) or ( @newPassword is null)
	return 0
else
begin
	update users set password1=@newPassword where username=@user and password1=@lastPassword;
	return 1;

-- entonces aqui actualizamos el password del usuario
end;
go

select * from users;

exec sp_changePassword 'admin','123','admin';

exec sp_login 'admin','123';


select * from users;
go
create or alter procedure sp_cambiar
  @user varchar(40)=null,
  @lastPassword varchar(50)=null,
  @newPassword varchar(50)=null
 as 
 if (@user is null) or (@lastPassword is null) or (@newPassword is null)
  select 'null value' as 'error';
 else if (@user = '') or (@lastPassword = '') or (@newPassword = '')
  select 'empty value' as 'error';
 else if (@lastPassword != (select password1 from users where username=@user))
  select 'wrong value' as 'error';
 else
 begin
  update users set password1=@newPassword where username=@user and password1=@lastPassword;
    select 'Cambio realizado'as 'pass';
 end;
 go

 exec sp_cambiar 'chris','','p23123';
