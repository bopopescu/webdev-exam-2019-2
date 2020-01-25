from flask import request,render_template,Flask,redirect,url_for
from app import app
import mysql
import flask_login

login_manager = flask_login.LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
login_manager.login_message = 'Для доступа...'

class User(flask_login,UserMixin):
    pass

@login_manager.user_loader
def load_user():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from users where username = %s;',
    (username,))
    user_from_db = cursor.fetchone()
    if user_from_db:
        user = User()
        user.id = user_from_db.username
        user.username = user_from_db.username
        return user
    return None

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    username = username.form.get('username')
    password = password.form.get('password')

    if username and password:
        cursor = mysql.connection.cursor(named_tuple=True)
        cursor.execute('select id,username from users where username=%s and password =%s'
        ,(username,password))
        user_from_db = cursor.fetchone()
        if user_from_db:
            user=User()
            user.id = user_from_db.id
            user.login = user_from_db.username
            flask_login.login_user(user,remember=True)
            next = request.args.get('next')
            flash('Вы успешно аутентифицированы','success')
            if next:
                return redirect(next)
            else:
                return redirect(url_for('index'))
    flash('Введены неверные логин и/или пароль','danger')
    return render_template('login.html')

@app.route('/logout')
def logout():
    flask_login.logout_user()
    session.pop('username', None)
    return redirect(url_for('index'))