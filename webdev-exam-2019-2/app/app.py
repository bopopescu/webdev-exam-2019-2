from flask import Flask, request, session,redirect, url_for, render_template,flash
from mysql_db import MySQL
import flask_login
import mysql.connector as connector
from collections import namedtuple
app = Flask(__name__)
application = app

app.config.from_pyfile('config.py')

mysql = MySQL(app)

login_manager = flask_login.LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'
login_manager.session_protection = "strong"
login_manager.login_message = 'Для доступа к данной странице пожалуйста авторизуйтесь'

ADMIN_ROLE_ID = 11
TECHNICK_USER = 12

def is_admin():
    return flask_login.current_user.role_id == ADMIN_ROLE_ID

def is_support():
    return flask_login.current_user.role_id == SUPPORT_ROLE_ID

def load_roles():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select id,name from roles;')
    roles = cursor.fetchall()
    cursor.close()
    return roles

@app.route('/')
def index():
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from users')
    users = cursor.fetchall()
    cursor.close()
    return render_template('index.html', users=users)

class UsersPolicy:
    def __init__(self,record=None):
        self.record = record

    def create(self):
        is_creating_user = flask_login.current_user.id == self.record
        return is_admin() or is_creating_user

    def delete(self):
        return is_admin()

    def edit(self):
        is_editing_user = flask_login.current_user.id == self.record
        return is_admin() or is_editing_user or is_support

class User(flask_login.UserMixin):
    def can(self, action, record=None):
        policy = UsersPolicy(record=record)
        method = getattr(policy,action,None)
        if method:
            return method()
        return False

@login_manager.user_loader
def load_user(id):
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from users where id = %s;',
    (id,))
    user_from_db = cursor.fetchone()
    if user_from_db:
        user = User()
        user.id = user_from_db.username
        user.username = user_from_db.username
        user.role_id = user_from_db.role_id
        return user
    return None

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    username = request.form.get('username')
    password = request.form.get('password')

    if username and password:
        cursor = mysql.connection().cursor(named_tuple=True)
        cursor.execute('select id,username,role_id from users where username=%s and password =%s'
        ,(username,password))
        user_from_db = cursor.fetchone()
        if user_from_db:
            user=User()
            user.id = user_from_db.id
            user.login = user_from_db.username
            user.role_id = user_from_db.role_id
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

@app.route('/users/new')
@flask_login.login_required
def new():
    if not flask_login.current_user.can('create'):
        flash('К сожалению, у вас недостаточно прав для выполнения данного действия','danger')
        return redirect(url_for('index'))
    return render_template('new.html', user={}, roles=load_roles())

@app.route('/users/<int:id>/edit')
@flask_login.login_required
def edit(id):
    cursor = mysql.connection().cursor(named_tuple=True)
    cursor.execute('select * from users where id=%s;',(id,))
    user = cursor.fetchone()
    cursor.close()
    if not flask_login.current_user.can('edit',record=user):
        flash('К сожалению, у вас недостаточно прав для выполнения данного действия','danger')
        return redirect(url_for('index'))
    return render_template('edit.html', user=user, roles=load_roles())

@app.route('/users/<int:id>/update',methods = ['POST'])
@flask_login.login_required
def update(id):
    username =   request.form.get('username')
    password =   request.form.get('password')
    fio =   request.form.get('FIO')
    role_id =    request.form.get('role')
    if not role_id:
        role_id = None
    query = ''' 
    update users set date = %s,user=%s,type=%s,status=%s,message=%s where id=%s;
    '''
    values = (date,user,type,status,message,id)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash('Введены некорректные данные. Ошибка сохранения', 'danger')
        user = {
            'id':        id,
            'user':      user,
            'type':      type,
            'сообщение': сообщение,
        }
        return render_template('edit.html',user=user,roles=load_roles())
    mysql.connection().commit()
    flash('Данные пользователя успешно обновлены!', 'success')
    
    return redirect(url_for('index'))

@app.route('/users/create',methods=['POST','GET'])
@flask_login.login_required
def create():
    date =   request.form.get('date')
    user =   request.form.get('user')
    type =   request.form.get('type')    
    message =    request.form.get('message')
    
    query = ''' 
    insert into users (date,user,type,message)
    values (%s, %s, %s, %s, %s,%s ,%s);
    '''
    values = (date,user,type,status,message)
    cursor = mysql.connection().cursor(named_tuple=True)
    try:
        cursor.execute(query, values)
    except connector.errors.DatabaseError:
        flash('Введены некорректные данные. Ошибка сохранения', 'danger')
        user = {
            'date':      date,
            'user':      user,
            'type':      type,
            'status':    status, 
            'message':   message,             
        }
        return render_template('new.html',user=user,roles=load_roles())
    mysql.connection().commit()
    flash('Обращение успешно создано!', 'success')
    
    return redirect(url_for('index'))

@app.route('/users/<int:id>/delete',methods=['POST'])
@flask_login.login_required
def delete(id):
    if not flask_login.current_user.can('delete'):
        flash('К сожалению, у вас недостаточно прав для выполнения данного действия','danger')
        return redirect(url_for('index'))

    cursor = mysql.connection().cursor(named_tuple=True)
    query = '''
    delete from appeal where id=%s
    '''
    try:
        cursor.execute(query,(id,))
    except connector.errors.DatabaseError:
        flash('Введены некорректные данные. Ошибка удаления', 'danger')

    mysql.connection().commit()
    flash('Обращение успешно удалено!','success')
    return redirect(url_for('index'))