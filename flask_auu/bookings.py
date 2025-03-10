import datetime 
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
    passpers = db.execute(
            'SELECT Vorname, Nachname, Gebdatum, Passagiernr' 
            ' FROM Person, Passagier'
            ' WHERE Person.PANr = Passagier.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    #DEBUG: print(matrnrper, flush=True)
    bookinglist_future = None
    bookinglist_past = None
    if passpers is not None:
        bookinglist_future = db.execute(
            #Remark: " instead of ' because of SQL internal string concatenation
            'SELECT buchungsnummer, datum, klasse, abfahrtszeit, ankunftszeit, abfahrtshafen, zielhafen'
            ' FROM Buchen, Passage'
            " WHERE Buchen.Passagennummer = Passage.Passagennummer AND Buchen.PassagierNr = ? and date(Datum) >= date('now')"
            ' order by datum', (passpers['PassagierNr'],)
        ).fetchall()
        bookinglist_past = db.execute(
            #Order by date latest first
            'SELECT buchungsnummer, datum, klasse, abfahrtszeit, ankunftszeit, abfahrtshafen, zielhafen'
            ' FROM Buchen, Passage'
            " WHERE Buchen.Passagennummer = Passage.Passagennummer AND Buchen.PassagierNr = ? and date(Datum) < date('now')"
            ' order by datum DESC', (passpers['PassagierNr'],)
        ).fetchall()    
    else:
        return render_template('non_passagier/non_passagier.html',) 
    return render_template('bookings/bookings.html', passpers=passpers, bookinglist_future=bookinglist_future, bookinglist_past=bookinglist_past)
