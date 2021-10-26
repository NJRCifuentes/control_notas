--Creación de la tabla usuario
--drop table Usuario
create table Usuario(
	IDUsuario integer primary key,
	Usuario text,
             Contraseña text,
             Nombres text,
             Apellidos text,
             Tipo_Identificacion text,
             Numero_Identificacion Integer,
             Email text,
             IDPerfil Integer,
             Pregrado text,
             Fecha_Nacimiento text,
             Pais text,
             Estado text
);

--drop table Superadministrador
create table Superadministrador(
	IDAdm integer primary key,
	IDUsuario integer references Usuario(IDUsuario)
);

---CREACION TABLAS PARA COMPLETAR EL REGISTRO ÚNICO DE NOTAS
--drop table Estudiante
create table Estudiante(
	IDEstudiante integer primary key,
	Estado text,
             IDUsuario integer references Usuario(IDUsuario),
             CodCurso
 );
 
---drop table Curso
create table Curso(
	IDCurso integer primary key,
             CodCurso integer,
	NombreCurso text,
             Ciclo integer,
             Promedio Real,
             IDAsig integer references Asignatura(IDAsig),
             IDUsuario integer references Usuario(IDUsuario)
);

--drop table Asignatura
create table Asignatura(
	IDAsig integer primary key,
	NombreAsig text,
             Num_Actividades integer,
             Min_Actividades integer,
             Max_Actividades integer,
             Promedio real,
             IDActividad integer references Actividad(IDActividad),
             IDEstudiante,
             IDDocente
);

--drop table Actividad
create table Actividad(
	IDActividad integer primary key,
	Descripcion text,
             Numero_Horas integer,
             Fecha_límite text,
             IDComentario integer references Comentario(IDComentario),
             IDDOcente integer,
             IDEstudiante integer,
             IDAsig integer
);
--drop table Comentario
create table Comentario(
	IDComentario integer primary key,
	Descripcion text,
             IDActividad,
             IDUsuario integer references Usuario(IDUsuario)
);
-----TABLA DE DOCENTE-
--drop table Docente
create table Docente(
             IDDocente integer primary key,
	Contrato text,  --tipo de vinculación
             Salario real,
             IDUsuario integer references Usuario(IDUsuario),
             IDCurso, --integer references Curso(IDCurso),
             IDAsig  --integer references Asignatura(IDAsig)
);

