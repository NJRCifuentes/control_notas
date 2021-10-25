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
             IDCurso integer references Curso(IDCurso)
);
---drop table Curso
create table Curso(
	IDCurso integer primary key,
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
             IDUsuario integer references Usuario(IDUsuario)--,
             --IDCurso integer references Curso(IDCurso),
             --IDAsig  integer references Asignatura(IDAsig)
);

---POBLANDO LAS TABLAS CREADAS CON INFORMACIÓN 
------poblamiento tabla usuarios
insert into Usuario (IDUsuario, Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado)
  values(101001, 'jmperez','pbkdf2:sha256:150000$OGKmXT7i$8eccbc741fc6931c1b890f4d7a07d46e83a67206b0441f80fec6b38a9fa36bf6' ,'Juan Manuel', 'Pérez Gómez', 'CC', 1014999456, 'jmperez@eia.edu.co', 2, 'Ing. Sistemas', '01/08/2000', 'Colombia', 'Activo');
insert into Usuario (IDUsuario, Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado)
  values(101002, 'mjdiaz','pbkdf2:sha256:150000$EGJ878Vy$cbb5d231ecc774245cf09b381a021be03aed4de134c67370150e1b24a5466f94' ,'Maria José', 'Diaz Unza', 'CC', 1015166789, 'mjdiaz@eia.edu.co', 1, 'Ing. Sistemas', '10/09/1990', 'Colombia', 'Activo');
insert into Usuario (IDUsuario, Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado)
  values(101003, 'jpmontoya','pbkdf2:sha256:150000$tscaGIFX$ee6130cef79ec191a7259d542f3bc99c200520ec336496897a2e4b560d77026f' ,'Juan Pablo', 'Montoya Domínguez', 'CC', 75465359, 'jpmontoya@eia.edu.co', 3, 'Ing. Sistemas', '01/07/1980', 'Colombia', 'Activo');
insert into Usuario (IDUsuario, Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado)
  values(101004, 'mmoreno','pbkdf2:sha256:150000$tscaGIFX$ee6130cef79ec191a7259d542f3bc99c200520ec336496897a2e4b560d77026f' ,'Mario', 'Moreno Duarte', 'CE', 205620, 'mmoreno@eia.edu.co', 2, 'Ing. Sistemas', '01/01/2001', 'México', 'Activo');
insert into Usuario (IDUsuario, Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado)
  values(101005, 'fftorres','pbkdf2:sha256:150000$htxDoeqY$f3f839d6a4314b0632025ce77f77b9613cde1af29daaa37c0b3bce54205e25b1' ,'Fabian Federico', 'Torres Tello', 'CC', 1015906343, 'fftorres@eia.edu.co', 2, 'Ing. Sistemas', '10/02/1999', 'Colombia', 'Activo');

--poblamiento tabla estudiante
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120508, 'Retirado', 100999, 1001);
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120510, 'Retirado', 100998, 1001);
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120511, 'Retirado', 100997, 1002);
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120512, 'Retirado', 100996, 1002);  
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120513, 'Retirado', 100995, 1002);  
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120514, 'Retirado', 100994, 1003);  
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120515, 'Retirado', 100993, 1003); 
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120516, 'Aplazado', 100992, 1003);  
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120517, 'Aplazado', 100991, 1003);  
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120509, 'Matriculado', 101001, 1001);
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120777, 'Matriculado', 101004, 1001);
insert into Estudiante (IDEstudiante, Estado, IDUsuario, IDCurso)
  values(202120888, 'Matriculado', 101005, 1001);

--poblamiento tabla docente
insert into Docente (IDDocente, Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400001,'Hora Catedra', 5000000, 101003, 1, 1);
insert into Docente (Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400002,'Planta', 4000000, 108881, 1, 1);
insert into Docente (Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400003,'Finalizado', 1000000, 108880, 1, 1);
insert into Docente (Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400004,'Planta', 2000000, 108882, 1, 2);
insert into Docente (Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400005,'Hora Catedra', 1000000, 108883, 1, 3);
insert into Docente (Contrato, Salario, IDUsuario, IDCurso, IDAsig)
  values(123400006,'Hora Catedra', 1500000, 108884, 2, 1);
  
---poblamiento tabla superadministrador
insert into Superadministrador (IDAdm, IDUsuario)
  values(11001, 101002);

---poblamiento base de cursos
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 5.0, 1, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 5.0, 2, 101001); 
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 5.0, 3, 101001);  
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.5, 1, 101004);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.5, 2, 101004); 
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.5, 3, 101004);     
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.8, 1, 101005);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.8, 2, 101005); 
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1001, 'Programación Báscica', 1, 4.8, 3, 101005);              
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1002, 'Programación orientada a objetos', 2, 4.0, 4, 101001); 
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1002, 'Programación orientada a objetos', 2, 4.0, 5, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1002, 'Programación orientada a objetos', 2, 4.0, 6, 101001); 
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1003, 'Desarrollo WEB con HTML, CSS y JavaScript', 3, 4.5, 7, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1003, 'Desarrollo WEB con HTML, CSS y JavaScript', 3, 4.5, 8, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1003, 'Desarrollo WEB con HTML, CSS y JavaScript', 3, 4.5, 9, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1004, 'Desarrollo de aplicaciones con Flask', 4, 4.5, 10, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1004, 'Desarrollo de aplicaciones con Flask', 4, 4.5, 11, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1004, 'Desarrollo de aplicaciones con Flask', 4, 4.5, 12, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1005, 'Metodologías ágiles', 4, 5.0, 13, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1005, 'Metodologías ágiles', 4, 5.0, 14, 101001);
insert into Curso(IDCurso, NombreCurso, Ciclo, Promedio, IDAsig, IDUsuario)
 values(1005, 'Metodologías ágiles', 4, 5.0, 15, 101001); 

--poblamiento de la tabla asignaturas
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 1, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 2, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 3, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 4, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 5, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 6, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 7, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 8, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 1, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.7, 2, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.6, 3, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.8, 4, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.7, 5, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.4, 6, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.5, 7, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.8, 8, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 5.0, 1, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.7, 2, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.7, 3, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.4, 4, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.5, 5, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.8, 6, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.7, 7, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(1, 'Fundamentos de Programación', 8, 4, 8, 4.9, 8, 202120888, 123400001);
--
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 1, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 2, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 3, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 4, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 5, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 6, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 7, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 8, 202120509, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 1, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.7, 2, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.6, 3, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.8, 4, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.7, 5, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.4, 6, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.5, 7, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.8, 8, 202120777, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 5.0, 1, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.7, 2, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.7, 3, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.4, 4, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.5, 5, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.8, 6, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.7, 7, 202120888, 123400001);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(2, 'Basic English Reading Skills for Programing', 8, 4, 8, 4.9, 8, 202120888, 123400001);
--
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 1, 202120509, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 2, 202120509, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 3, 202120509, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 4, 202120509, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 4.5, 1, 202120777, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 2, 202120777, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 4.5, 3, 202120777, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 4, 202120777, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 4.8, 1, 202120888, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 4.7, 2, 202120888, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 4.7, 3, 202120888, 123400002);
insert into Asignatura(IDAsig, NombreAsig, Num_Actividades, Min_Actividades, Max_Actividades, Promedio, IDActividad, IDEstudiante, IDDocente)
values(3, 'Basic English Reading Skills for Programing', 4, 4, 8, 5.0, 4, 202120888, 123400002);


--poblamiento de la tabla actividades
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(1, 'Reto 1', 8, '10/10/2021', 8001, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(2, 'Reto 2', 8, '20/10/2021', 8002, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(3, 'Reto 3', 8, '30/10/2021', 8003, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(4, 'Reto 4', 8, '10/11/2021', 8004, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(5, 'Reto 5', 8, '20/11/2021', 8005, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(6, 'Reto 6', 8, '30/11/2021', 8006, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(7, 'Reto 7', 8, '10/12/2021', 8007, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(8, 'Reto 8', 8, '20/12/2021', 8008, 123400001, 202120509, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(9, 'Reto 1', 8, '10/10/2021', 8009, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(10, 'Reto 2', 8, '20/10/2021', 8010, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(11, 'Reto 3', 8, '30/10/2021', 8011, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(12, 'Reto 4', 8, '10/11/2021', 8012, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(13, 'Reto 5', 8, '20/11/2021', 8013, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(14, 'Reto 6', 8, '30/11/2021', 8014, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(15, 'Reto 7', 8, '10/12/2021', 8015, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(16, 'Reto 8', 8, '20/12/2021', 8016, 123400001, 202120777, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(17, 'Reto 1', 8, '10/10/2021', 8017, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(18, 'Reto 2', 8, '20/10/2021', 8018, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(19, 'Reto 3', 8, '30/10/2021', 8019, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(20, 'Reto 4', 8, '10/11/2021', 8020, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(21, 'Reto 5', 8, '20/11/2021', 8021, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(22, 'Reto 6', 8, '30/11/2021', 8022, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(23, 'Reto 7', 8, '10/12/2021', 8023, 123400001, 202120888, 1);
insert into Actividad(IDActividad, Descripcion, Numero_Horas, Fecha_límite, IDComentario, IDDOcente, IDEstudiante, IDAsig)
 values(24, 'Reto 8', 8, '20/12/2021', 8024, 123400001, 202120888, 1);

--poblamiento de la tabla comentario
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8001,'Se cumple la rúbrica reto 1 en cuanto a forma, contenido y descripción', 1, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8002,'Se cumple la rúbrica reto 2 en cuanto a forma, contenido y descripción', 2, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8003,'Se cumple la rúbrica reto 3 en cuanto a forma, contenido y descripción', 3, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8004,'Se cumple la rúbrica reto 4 en cuanto a forma, contenido y descripción', 4, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8005,'Se cumple la rúbrica reto 5 en cuanto a forma, contenido y descripción', 5, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8006,'Se cumple la rúbrica reto 6 en cuanto a forma, contenido y descripción', 6, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8007,'Se cumple la rúbrica reto 7 en cuanto a forma, contenido y descripción', 7, 101003);
insert into Comentario(IDComentario, Descripcion, IDActividad, IDUsuario)
 values(8008,'Se cumple la rúbrica reto 8 en cuanto a forma, contenido y descripción', 8, 101003);





