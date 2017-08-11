from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Card, Gamestate

app = Flask(__name__)
app.secret_key = 'xkcd'

@app.route('/')
def index():
        return render_template('index.html')

@app.route('/sample')
def sample():
        return render_template('sample.html')

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
    print new_user
    db.session.add(new_user)
    db.session.commit()

    flash('Thanks for registration!')
    return redirect('/')

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
    connect_to_db(app)
    app.run(debug=True, host='0.0.0.0', port=5000)

  
