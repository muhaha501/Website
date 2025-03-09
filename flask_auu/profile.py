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
    
    return render_template('profile/profile.html', user_data=user_data)
