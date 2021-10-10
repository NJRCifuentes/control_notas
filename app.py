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

if __name__ == '__main__':
    # DEBUG is SET to TRUE. CHANGE FOR PROD
    app.run(port=5000, debug=True)
