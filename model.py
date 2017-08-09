#import database connection from server.py
from sqlalchemy import *
from sqlalchemy import Column, DateTime, Integer, String, ForeignKey, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, backref

engine = create_engine('postgresql://users', echo=True)

Base = declarative_base()

# # create a Session class
# Session = sessionmaker(binds={
#     User: create_engine('postgresql://users'),
#     Card: create_engine('postgresql://cards'),
#     Gamestate: create_engine('postgresql://game-states'),
#     })
#create a Session
Session = sessionmaker(binds=engine)
session = Session()
#import all models then execute this to create any tables that do not exist
Base.metadata.create_all(engine)

#created a class 'User'
class User(Base):
    """Player for set game website."""
    #assign class User with the tablename of "users"
    __tablename__ = 'users'

    user_id = Column(Integer, autoincrement=True, primary_key=True)
    username = Column(String(24), nullable=False)
    fname = Column(String(64), nullable=False)
    lname = Column(String(64), nullable=False)
    email = Column(String(64), nullable=False)
    password = Column(String(64), nullable=False)
    age = Column(Integer, nullable=True)

    def __init__(self, username, fname, lname, email, password, age):
        """method will run the first time we create a new user."""
        self.username = username
        self.fname = fname
        self.lname = lname
        self.email = email
        self.password = password
        self.age = age

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s fname=%s, lname=%s, username=%s email=%s age=%d>" % (
            self.user_id, self.fname, self.lname, self.username, self.email, self.age)

# class Card(Base):
#     """Card for set game website."""

#     __tablename__ = "cards"

#     card_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
#     card_name = db.Column(db.String(4), nullable=False)
#     card_image = db.Column(db.String(64), nullable=False)
#     shape = db.Column(db.String(64), nullable=False)
#     pattern = db.Column(db.String(64), nullable=False)
#     color = db.Column(db.String(64), nullable=False)
#     number = db.Column(db.Integer, nullable=False)

#       def __init__(self, card_id, card_name, card_image, shape, pattern, color, number):
#         """method will run the first time we create a new user."""
#         self.card_id = card_id
#         self.card_name = card_name
#         self.card_image = card_image
#         self.shape = shape
#         self.pattern = pattern
#         self.color = color
#         self.number = number

#     def __repr__(self):
#         """Provide helpful representation when printed."""

#         return "<Card card_id=%s card_name=%s card_image=%s shape=%s pattern=%s color=%s number=%s>" % (
#             self.card_id, self.card_name, self.card_image, self.shape, self.pattern, self.color, self.number)



# class Gamestate(Base):
#     """Gamestate for set game website."""

#     __tablename__ = "game-states"

#     gamestate_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
#     user_id = db.Column(db.Integer, ForeignKey('user.user_id'), nullable=False)
#     username = db.Column(db.String(24), ForeignKey('user.username'), nullable=False)
#     score = db.Column(db.Integer, nullable=False)

# # Define relationship to user
#     user = db.relationship("User",
#                            backref=db.backref("gamestate", order_by=gamestate_id))

#     def __repr__(self):
#         """Provide helpful representation when printed."""

#         return "<User Game user_game_id=%s user_id=%s match_id=%s score=%s>" % (
#             self.gamestate_id, self.user_id, self.username, self.score)
