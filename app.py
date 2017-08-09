from flask import Flask, flash, redirect, render_template, request, session, abort
from wtforms import Form, TextField, TextAreaField, validators, StringField, SubmitField, BooleanField
import os
from sqlalchemy.orm import sessionmaker
from flask_debugtoolbar import DebugToolbarExtension
from model import *
from jinja2 import StrictUndefined
engine = create_engine('postgresql:///users', echo=True)

DEBUG = True
app = Flask(__name__)
app.config.from_object(__name__)
app.config['SECRET_KEY'] = 'xkcd'

@app.route('/')
def index():
    if not session.get('logged_in'):
        return render_template('login.html')
    else:
        return render_template('index.html')

@app.route('/register', methods=['GET'])
def register_form():
    return render_template('register.html')

@app.route("/register", methods=['POST'])
def register():
    """Registration process"""
        #get form variables
    username = request.form['username']
    fname = request.form['fname']
    lname = request.form['lname']
    password = request.form['password']
    email = request.form['email']
    age = int(request.form['age'])

    new_user = User(username=username, fname=fname, lname=lname,
                    password=password, email=email, age=age)

    session.add(new_user)
    sesssion.commit()
    flash('Thanks for registration ' + username)
    return index()

@app.route('/login', methods=['GET', 'POST'])
def login_form():
    return render_template('login.html')


@app.route('/login', methods=['POST'])
def login():

    username = str(request.form['username'])
    password = str(request.form['password'])

    Session = sessionmaker(bind=engine)
    s = Session()
    query = s.query(User).filter(User.username.in_([username]), User.password.in_([password]))
    user = query.first()
    if user:
        session['logged_in'] = True
    else:
        flash('wrong password!')
    return index()

@app.route("/logout")
def logout():
    session['logged_in'] = False
    return index()

if __name__ == "__main__":
    app.secret_key = os.urandom(12)
    app.run(debug=True,host='0.0.0.0', port=5000) 