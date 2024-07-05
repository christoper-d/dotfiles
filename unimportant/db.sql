
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    nombre VARCHAR(50),
    ap_paterno VARCHAR(50),
    ap_materno VARCHAR(50),
    password VARCHAR(100) NOT NULL
);

CREATE TABLE archivos (
    archivo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    archivo BLOB NOT NULL
);

CREATE TABLE permisos (
    permiso_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    archivo_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (archivo_id) REFERENCES archivos (archivo_id)
);

select * from users;
insert into users values('admin','administrador','123');

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
begin
	declare lastPassword varchar(50);
	-- 
	SELECT lastname INTO v_lastname
	FROM employee
	WHERE empno = p_empno;
-- entonces aqui actualizamos el password del usuario
update users set password1=@newPassword where username=@user and password1=@lastPassword;
end
go

select * from users;

exec sp_changePassword 'admin','admin','123';

exec sp_login 'admin','123';


-------------------------------------------------------------------------------------------------------------------------------
select * from users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    nombre VARCHAR(50),
    ap_paterno VARCHAR(50),
    ap_materno VARCHAR(50),
    password VARCHAR(100) NOT NULL
);

insert into users values('admin','administrador','123');

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
  select 'error';
 else 
 begin
  update users set password1=@newPassword where username=@user and password1=@lastPassword;
    select 'Cambio realizado';
 end;
 go

 exec sp_cambiar 'chris','123','p123';