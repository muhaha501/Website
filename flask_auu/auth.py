# last change 11 March 23

import functools
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

from flask_auu.db import get_db

#create blueprint named auth
bp = Blueprint('auth', __name__, url_prefix='/auth')

# associate URL /register with register view function
# when Flask receives request to /auth/register ->
#    will call register view and return value as response
@bp.route('/register', methods=('GET', 'POST'))
def register():
    # when user submits form
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        name = request.form['name']
        surname = request.form['surname']
        dob = request.form['date_of_birth']
        plz = request.form['plz']
        ort = request.form['ort']
        street = request.form['street']
        hausnummer = request.form['hausnummer']
        db = get_db()
        error = None

        #valide usr/pw not empty
        if not username:
            error = 'Username is required.'
        elif not name:
            error = 'Name is required'
        elif not surname:
            error = 'Surname is required'
        elif not password:
            error = 'Password is required.'
        elif not dob:
            error = 'Date of Birth is required'
        elif not plz:
            error = "PLZ is required"
        elif not ort:
            error = 'City is required'
        elif not street:
            error = 'Street is required'
        elif not hausnummer:
            error = 'Number is required'

        if error is None:
            try:
                db.execute(
                    "INSERT INTO user (username, password) VALUES (?, ?)",
                    (username, generate_password_hash(password)),
                )
                db.execute(
                    "INSERT INTO PERSON (PANR,GebDatum,VORNAME,NACHNAME,PLZ,ORT,STRASSE,Hausnummer) values (?, ?, ?, ?, ?, ?, ?, ?)",
                    (username, dob, name, surname, plz, ort, street, hausnummer),
                )
                passagier_nr = 'P-' + username
                db.execute(
                    "INSERT INTO Passagier (PassagierNr, PANr) values (?,?)",
                    (passagier_nr, username)
                )
                db.commit()
            except db.Error:
                error = f"An Error occured, please contact the system administrator"
            else:
                # after storing usr/pw-> redirect to login
                return redirect(url_for('auth.login'))

        # in case of error
        flash(error)

    db = get_db()
    pannr = int(db.execute(
        ' select username from user '
        ' order by username DESC '
        ' LIMIT 1 ').fetchone()[0])

    print(pannr)
    pannr += 1
    pannr = str(pannr)
    #html rendering
    return render_template('auth/register.html', pannr = pannr)

@bp.route('/login', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None
        user = db.execute(
            'SELECT * FROM user WHERE username = ?', (username,)
        ).fetchone()
        #fetchone returns  one row from the query

        if user is None:
            error = 'Incorrect username.'

        #hash submitted password and compare
        elif not check_password_hash(user['password'], password):
            error = 'Incorrect password.'

        if error is None:
            #session is a dict that stores data across request
            # user id stored in session!
            session.clear()
            session['user_id'] = user['id']
            return redirect(url_for('index'))

        flash(error)

    return render_template('auth/login.html')

#register a function that runs before view function
#    no matter what URL is requested
# load_logged_in_user checks if user id is stored in session
@bp.before_app_request
def load_logged_in_user():
    user_id = session.get('user_id')

    if session.get('history') is None:
        session['history'] = "Usage history since last login:\n"

    if user_id is None:
        g.user = None
    else:
        #abfrage ob Mitarbeiter if True -> g.user_mit else g.user
        #Überprüfen das man nicht mehr zu login kommt wenn g.user ODER g.user_mit not none sind
        g.user = get_db().execute(
            'SELECT * FROM user WHERE id = ?', (user_id,)
        ).fetchone()

@bp.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))

#using the lib functionality requires a user to be logged in
#use a decorator to check for each view if login!
# this decorator is used for all the online lib functionality
def login_required(view):
    @functools.wraps(view)
    def wrapped_view(**kwargs):
        if g.user is None:
            #url_for generates the endpoints
            return redirect(url_for('auth.login'))

        return view(**kwargs)

    return wrapped_view