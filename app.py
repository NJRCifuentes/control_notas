# importar la librería del framework de flask
from flask import Flask, redirect, url_for, render_template, request

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


if __name__ == '__main__':
    # DEBUG is SET to TRUE. CHANGE FOR PROD
    app.run(port=5000, debug=True)
