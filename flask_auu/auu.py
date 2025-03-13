# last change 11 March 23

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.exceptions import abort

from flask_auu.auth import login_required
from flask_auu.db import get_db

bp = Blueprint('main', __name__)

@bp.route('/')
def index():

    #document the session
    session['history'] = session['history'] + "/index\n ... "
    #flash(session['history'])

    db = get_db()
    passpers = None
    if g.user is not None:
        passpers = db.execute(
                'SELECT Nachname' 
                ' FROM Person'
                ' WHERE Person.PANr = ?', (g.user['username'],)
        ).fetchone()


    return render_template('index.html', passpers=passpers)
