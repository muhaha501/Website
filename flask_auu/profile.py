from flask import Blueprint, render_template, g
from flask_auu.auth import login_required
from flask_auu.db import get_db

bp = Blueprint('profile', __name__)

@bp.route('/profile')
@login_required
def profile():
    db = get_db()
    
    user_data = db.execute(
        'SELECT VORNAME, NACHNAME, GebDatum, PLZ, ORT, STRASSE, Hausnummer FROM PERSON WHERE PANR = ?', 
        (g.user['username'],)
    ).fetchone()

    # Check if the user is a Techniker
    techniker = db.execute(
        'SELECT * FROM Techniker WHERE PANR = ?', (g.user['username'],)
    ).fetchone()

    # Check if the user is a Captain
    captain = db.execute(
        'SELECT * FROM Kapitaen WHERE PANR = ?', (g.user['username'],)
    ).fetchone()

    # Check if the user is a Passenger
    passenger = db.execute(
        'SELECT * FROM Passagier WHERE PANR = ?', (g.user['username'],)
    ).fetchone()

    user_tel = db.execute(
        'SELECT TELNUMMER FROM TELEFONNUMMER WHERE PANR = ?', 
        (g.user['username'],)
    ).fetchall()



    if captain:
        role = 'Captain'
    elif techniker:
        role = 'Technician'
    elif passenger:
        role = 'Passenger'
    else:
        role = 'Guest'

    return render_template('profile/profile.html', user_data=user_data, user_tel=user_tel, role=role)
