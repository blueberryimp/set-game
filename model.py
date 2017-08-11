from flask import Flask
from flask_sqlalchemy import SQLAlchemy
#connection to PostgresQL database through flask sqlalchemy helper library

DB_URI = "postgresql:///game"

db = SQLAlchemy()

#created a class 'User'
class User(db.Model):
    """Player for set game website."""
    #assign class User with the tablename of "users"
    __tablename__ = 'users'

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    username = db.Column(db.String(24), nullable=False)
    fname = db.Column(db.String(64), nullable=False)
    lname = db.Column(db.String(64), nullable=False)
    email = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)
    age = db.Column(db.Integer, nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s fname=%s, lname=%s, username=%s email=%s age=%d>" % (
            self.user_id, self.fname, self.lname, self.username, self.email, self.age)

class Card(db.Model):
    """Card for set game website."""

    __tablename__ = "cards"

    card_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    card_name = db.Column(db.String(4), nullable=False)
    card_image = db.Column(db.String(64), nullable=False)
    color = db.Column(db.String(64), nullable=False)
    shape = db.Column(db.String(64), nullable=False)
    pattern = db.Column(db.String(64), nullable=False)
    number = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Card card_id=%s card_name=%s card_image=%s color=%s shape=%s pattern=%s number=%s>" % (
            self.card_id, self.card_name, self.card_image, self.color, self.shape, self.pattern, self.number)


class Gamestate(db.Model):
    """Gamestate for set game website."""

    __tablename__ = "gamestate"

    gamestate_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False, index=True)
    score = db.Column(db.Integer, nullable=False)

    user = db.relationship("User", backref=db.backref('gamestate'))

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Gamestate gamestate_id=%s user_id=%s username=%s score=%s>" % (
            self.gamestate_id, self.user_id, self.username, self.score)


def connect_to_db(app):
    """Connect the database to our Flas app."""

    #Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLACHEMY_ECHO'] = True
    db.app = app
    db.init_app(app)

    db.create_all()



if __name__ == "__main__":

    from server import app

    connect_to_db(app)
    print "Connected to DB."
