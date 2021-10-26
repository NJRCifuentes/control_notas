import sqlite3  
  
con = sqlite3.connect("Sistema_Notas_EIA.db")  
print("BASE DE DATOS CREADA CON EXITO")  

#con.execute("create table Usuarios (IDUsuario INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,Usuario text, Contraseña text,Nombres text, Apellidos text,Tipo_Identificacion text,Numero_Identificacion Integer,Email text,IDPerfil Integer,Pregrado text,Fecha_Nacimiento text,Pais text,Estado text)")  
con.execute("create table Actividad (IDActividad integer primary key AUTOINCREMENT NOT NULL, Descripcion text,Nota_Act real,Numero_Horas integer,Fecha_límite text)")
con.execute("create table Asignatura(IDAsig integer primary key,NombreAsig text,Num_Actividades integer,Min_Actividades integer,Max_Actividades integer,Promedio real,IDActividad integer references Actividad(IDActividad))")
con.execute("create table Curso(IDCurso integer primary key,NombreCurso text,Ciclo integer,Promedio Real,IDAsig integer references Asignatura(IDAsig),IDUsuario integer references Usuario(IDUsuario))")

print("TABLA CREADAS SATISFACTORIAMENTE!!")  
  
con.close() 