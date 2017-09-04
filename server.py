from jinja2 import StrictUndefined
from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from model import connect_to_db, db, User, Card, Gamestate, Cardstate
from random import choice
from sqlalchemy import func


app = Flask(__name__)
app.secret_key = 'xkcd'

app.jinja_env.auto_reload = True


@app.route('/')
def index():
    cards = Card.query.order_by(func.random()).all()
    #cards = Card.query.order_by(func.random()).limit(12).all()
    return render_template('index.html', cards=cards)

@app.route('/sample')
def sample():
    cards = Card.query.order_by(func.random()).all()
    return render_template('sample.html', cards=cards)


@app.route('/register', methods=['GET'])
def register_form():
    return render_template('register.html')


@app.route("/register", methods=['POST'])
def register():
    """Registration process"""
    username = request.form['username']
    fname = request.form['fname']
    lname = request.form['lname']
    password = request.form['password']
    email = request.form['email']

    new_user = User(username=username, fname=fname, lname=lname,
                    password=password, email=email)
    print new_user
    db.session.add(new_user)
    db.session.commit()

    flash('Thanks for your registration!')
    return redirect('/')

@app.route('/login', methods=['GET'])
def login_form():
    return render_template('login.html')


@app.route('/login', methods=['POST'])
def login():

    email = str(request.form['email'])
    password = str(request.form['password'])

    user = User.query.filter_by(email=email).first()
    if not user:
        flash("No such user")
        return redirect("/login")

    if user.password != password:
        flash("Incorrect password! Please enter again!")
        return redirect("/login")

    session["user_id"] = user.user_id

    flash("Logged in")
    return redirect("/")

@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")

@app.route("/users/<user_id>")
def show_users():
    users = User.query.all()
    return render_template('user.html', users=users)

# @app.route("/users/<int:user_id>")
# def user_detail(user_id):
#     """Show info about user."""

#     user = User.query.options(db.joinedload('gamestate').joinedload('users')).get(user_id)
#     return render_template("profile.html", user=user)


@app.route('/gamestate', methods=['POST'])
def gamestate_process():
    score = int(request.form.get('score'))
    gamestate= Gamestate(user_id=session["user_id"], score=score)
    db.session.add(gamestate)
    db.session.commit()
    return jsonify(result=score)



@app.route('/gamestate', methods=['GET'])
def gamestate():
    gamestate = Gamestate.query.all()
    return render_template('gamestate.html', gamestate=gamestate)




if __name__ == "__main__":
    connect_to_db(app)
    app.run(debug=True, host='0.0.0.0', port=5000)
