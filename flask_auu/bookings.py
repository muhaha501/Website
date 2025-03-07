from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.exceptions import abort

from flask_auu.auth import login_required
from flask_auu.db import get_db

#define the blueprint
bp = Blueprint('bookings', __name__)

@bp.route('/bookings')
@login_required
def bookings():

    #document the session
    session['history'] = session['history'] + "/bookings\n ... "
    flash(session['history'])

    db = get_db()
    matrnrper = db.execute(
            'SELECT vorname, nachname, gebdatum, passagiernr' 
            'From Person, Passagier'
            'WHERE Person.PANr = Passagier.PANr and Person.PANr = ?', (g.user['username'],)
    ).fetchone()

    #DEBUG: print(matrnrper, flush=True)
    examlist = None
    if matrnrper is not None:
        examlist = db.execute(
            #Remark: " instead of ' because of SQL internal string concatenation
            "SELECT (pe.vorname||' '||pe.nachname) Pruefer, v.V_Bezeichnung Vorlesung, Note, SWS ECTS"
            " FROM Prueft pr, Personen pe, Vorlesungen v"
            " WHERE pr.PAnr=pe.PAnr and pr.V_Bezeichnung=v.V_Bezeichnung"
            " and pr.Matrikelnummer = ?", (matrnrper['Matrikelnummer'],)
        ).fetchall()
    else:
        return render_template('guest/guest.html',)
    return render_template('bookings/bookings.html', matrnrper=matrnrper, examlist=examlist)
