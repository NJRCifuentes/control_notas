# importar la librería del framework de flask
from flask import Flask, redirect, url_for, render_template, request
import sqlite3  
app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Handle POST Request here
        return render_template('login.html')
    return render_template('login.html')

@app.route('/registro', methods=['GET', 'POST'])
def registro():
    if request.method == 'POST':
        return render_template('registro.html')
    return render_template('registro.html')

@app.route('/dashboard-admin', methods=['GET', 'POST'])
def dashAdmin():
    if request.method == 'POST':
        return render_template('dashboard-admin.html')
    return render_template('dashboard-admin.html')

@app.route('/actividades', methods=['GET','POST'])
def actividades():
        if request.method=='POST':
            return render_template('actividades.html')
        return render_template('actividades.html')

@app.route('/crearactividad',methods=['GET','POST'])
def crearactividad():
    if request.method=='POST':
        return render_template('crear-actividad.html')
    return render_template('crear-actividad.html')

@app.route('/detalleactividad',methods=['GET','POST'])
def detalleactividad():
    return render_template('detalle-actividad.html')

@app.route('/cursos',methods=['GET','POST'])
 
def cursos():
    if request.method=='POST':
       return render_template('cursos.html')
    return render_template('cursos.html')
      
#Aquí se redirige al usuario hacia el detalle de cursos- busqueda estudiante
 
@app.route('/detallecurso',methods=['GET','POST'])
 
def detallecurso():
    return render_template('detalle-curso.html')
 
#Aquí se redirige al usuario hacia el detalle de cursos- busqueda docente
 
@app.route('/detallecursodocente',methods=['GET','POST'])
 
def detallecursodocente():
    return render_template('detalle-cursos-docente.html')
 
#Aquí se redirige al usuario hacia el detalle de cursos- busqueda admin
 
@app.route('/detallecursoadmin',methods=['GET','POST'])
 
def detallecursoadmin():
    return render_template('detalle-cursos-admin.html')
#Aquí se redirige al usuario hacia la pagina principal del superadministrado
 
@app.route('/pagprincipaladmin',methods=['GET','POST'])
 
def pagprincipaladmin():
    return render_template('pag-principal-admin.html')
#Aquí se redirige al usuario hacia el detalle de busqueda de usuarios- estudiante
 
@app.route('/busquedaestudiantes',methods=['GET','POST'])
 
def busquedaestudiantes():
    return render_template('busqueda-estudiantes.html')
 
 
#Aquí se redirige al usuario hacia el detalle de busqueda de usuarios- docentes
 
@app.route('/busquedadocentes',methods=['GET','POST'])
def busquedadocentes():
    return render_template('busqueda-docente.html')
 
@app.route("/informacion_estudiante")
def InformacionEstudiante():
    return "Información del Estudiante"

@app.route("/informacion_docente")
def InformacionDocente():
    return "Comentarios de la actividad"

@app.route("/actividades_comentarios")
def ActividadesComentarios():
    return "Comentarios de la actividad"

@app.route('/notas', methods=['GET', 'POST'])
def notas():
    if request.method == 'POST':
        return render_template('notas.html')
    return render_template('notas.html')

@app.route('/notas/detalle', methods=['GET', 'POST'])
def detalle():
    if request.method == 'POST':
        return render_template('detallenotas.html')
    return render_template('detallenotas.html')

###### 

@app.route('/edicion', methods=['GET', 'POST'])
def edicion():
    if request.method == 'POST':
        return render_template('edicion.html')
    return render_template('edicion.html')


@app.route('/guardar-registro', methods=['GET', 'POST'])
def guardar_registro():
    msg = "msg"  
    if request.method == "POST":  
        try:          
            usuario = request.form["user"]
            contraseña = "12346"
            nombres = request.form["name"]
            apellidos =  request.form["lastname"]
            tipoid = "cc"
            numeroid = 123458
            email = request.form["email"]  
            perfil = request.form["profile"]  
            pregrado = request.form["grade"]
            fechanacimiento = request.form["birth-date"]
            pais = request.form["country"]
            estado = "activo"
            with sqlite3.connect("Sistema_Notas_EIA.db") as con:  
                cur = con.cursor()  
                cur.execute("INSERT into Usuarios (Usuario, Contraseña, Nombres, Apellidos, Tipo_Identificacion, Numero_Identificacion, Email, IDPerfil, Pregrado, Fecha_Nacimiento, Pais, Estado) values (?,?,?,?,?,?,?,?,?,?,?,?)",(usuario,contraseña,nombres,apellidos, tipoid,numeroid, email, perfil, pregrado, fechanacimiento, pais,estado))  
                con.commit()  
                msg = "Se agregó el usuario correctamente"  
        except:  
            con.rollback()  
            msg = "ERROR: NO se agregó el usuario correctamente"    
        finally:  
            return render_template("registro.html",msg = msg)  
            con.close()  

@app.route('/guardar_curso', methods=['GET', 'POST'])
def guardar_curso():
    msg = "msg"  
    if request.method == "POST":  
        try:          
            curso = request.form["curso"]  
            ciclo = request.form["ciclo"]  
            with sqlite3.connect("Sistema_Notas_EIA.db") as con:  
                cur = con.cursor()  
                cur.execute("INSERT into Curso (NombreCurso, Ciclo) values (?,?)",(curso, ciclo))  
                con.commit()  
                msg = "Se agregó el curso correctamente"  
        except:  
            con.rollback()  
            msg = "ERROR: NO se agregó el curso correctamente"    
        finally:  
            return render_template("pag-principal-admin.html",msg = msg)  
            con.close()  
         
            
@app.route('/guardar_asignatura', methods=['GET', 'POST'])
def guardar_asignatura():
    msg = "msg"  
    if request.method == "POST":  
        try:          
            asignatura = request.form["asignatura"]  
            numactividades = int(request.form["numactividades"])  
            with sqlite3.connect("Sistema_Notas_EIA.db") as con:  
                cur = con.cursor()  
                cur.execute("INSERT into Actividad (NombreAsig, Num_Actividades) values (?,?)",(asignatura, numactividades))  
                con.commit()  
                msg = "Se agregó la asignatura correctamente"  
        except:  
            con.rollback()  
            msg = "ERROR: NO se agregó el asignatura correctamente"    
        finally:  
            return render_template("pag-principal-admin.html",msg = msg)  
            con.close()  
            

@app.route('/eliminar_estudiante', methods=['GET', 'POST'])
def eliminar_estudiante():
    if request.method == 'POST':
        return render_template('eliminar-estudiante.html')
    return render_template('eliminar-estudiante.html')

       
@app.route("/eliminarestudiante", methods = ['POST'])  
def eliminarestudiante():  
    msg = "msg"  
    user = request.form["usuario"] 
    with sqlite3.connect("Sistema_Notas_EIA.db") as con:   
        try: 
            cur = con.cursor()  
            cur.execute("delete from Usuarios where IDUsuario=?",(user))  
            msg = "Registro eliminado exitosamente"  
        except:  
            print(sqlite3.Error.mensaje)
            msg = "No se pudo eliminar"
        finally:  
            return render_template("busqueda-estudiantes.html",msg = msg) 
        
@app.route("/resultadosestudiantes")  
def resultadosestudiantes():  
    con = sqlite3.connect("Sistema_Notas_EIA.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select IDUsuario, Usuario, Nombres, Apellidos, Pregrado from Usuarios")  
    rows = cur.fetchall()  
    return render_template("busqueda-estudiantes.html",rows = rows)  
      

@app.route('/crearasignatura',methods=['GET','POST'])
def crearasignatura():
    if request.method=='POST':
        return render_template('crear-asignatura.html')
    return render_template('crear-asignatura.html')


@app.route('/crearcurso',methods=['GET','POST'])
def crearcurso():
    if request.method=='POST':
        return render_template('crear-curso.html')
    return render_template('crear-curso.html')


@app.route('/cursosadmin',methods=['GET','POST'])
 
def cursosadmin():
    if request.method=='POST':
       return render_template('cursosadmin.html')
    return render_template('cursosadmin.html')
      

@app.route('/busquedaestudiantes',methods=['GET','POST'])
 
def busquedaestudiantes():
    con = sqlite3.connect("Sistema_Notas_EIA.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select IDUsuario, Usuario, Nombres, Apellidos, Pregrado from Usuarios where IDPerfil='Estudiante'")  
    rows = cur.fetchall()  
    return render_template("busqueda-estudiantes.html",rows = rows)  
 
 
#Aquí se redirige al usuario hacia el detalle de busqueda de usuarios- docentes
 
@app.route('/busquedadocentes',methods=['GET','POST'])
def busquedadocentes():
    con = sqlite3.connect("Sistema_Notas_EIA.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select IDUsuario, Usuario, Nombres, Apellidos from Usuarios where IDPerfil='Profesor' ")  
    rows = cur.fetchall()  
    return render_template('busqueda-docente.html',rows = rows)

# Busqueda cursos
 
@app.route('/busquedacurso',methods=['GET','POST'])
 
def busquedacurso():
    con = sqlite3.connect("Sistema_Notas_EIA.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select IDCurso, NombreCurso, Ciclo from Curso")  
    rows = cur.fetchall()  
    return render_template("cursosadmin.html",rows = rows)  
 
 

#Editar usuarios 

@app.route('/editarusuarios',methods=['GET','POST'])
def updateSqliteTable():
    if request.method == "POST":  
        id = int(request.form["idusuario"])
        usuario = request.form["usuario"]
        identificacion = int(request.form["identificacion"])
        nombres = request.form["nombre"]
        apellidos =  request.form["apellido"]
        email = request.form["correo"]  
        perfil = request.form["perfil"]  
        estado = request.form["estado"]  
        pregrado = request.form["pregrado"]
        fechanacimiento = request.form["fechanacimiento"]
        pais = request.form["pais"]
        with sqlite3.connect('Sistema_Notas_EIA.db') as sqliteConnection:
            try:
                cursor = sqliteConnection.cursor()
                sql_update_query = """UPDATE Usuarios SET usuario = ?, nombres = ?, apellidos = ?, Numero Identificacion = ?, email = ?, perfil= ?, pregrado = ?, fechanacimiento = ?, pais = ?, estado = ?  where id = ?"""
                columnvalues = (usuario, nombres, apellidos, identificacion, email, perfil, pregrado, fechanacimiento, pais, estado, id)
                cursor.execute(sql_update_query, columnvalues)
                sqliteConnection.commit()
                print("Se editó el usuario exitosamente")
                cursor.close()

            except sqlite3.Error as error:
                print("Fallo al editar usuario", error)
            finally:
                    return render_template('pag-principal-admin.html')


if __name__ == '__main__':
    # DEBUG is SET to TRUE. CHANGE FOR PROD
    app.run(port=5000, debug=True)
