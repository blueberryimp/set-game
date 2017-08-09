import datetime
from sqlalchemy import create_engine
#session is a regular python class which can be directly instantiated
#sessionmaker class is used to create a top level Session configuration
#which can then be used throughout the app
from sqlalchemy.orm import sessionmaker
from model import *

#an engine which the Session will use for connection
engine = create_engine('postgresql:///users', echo=True)

# create a Session class
Session = sessionmaker(bind=engine)
#create a Session
session = Session()

user = User('blueberryimp', 'michelle', 'luu', 'blueberryimps@gmail.com', 'xkcd', 27)
session.add(user)

user = User('munki', 'munki', 'luu', 'munkie@munkie.io', 'xkcd', 27)
session.add(user)

# commit the records to the database
session.commit()
