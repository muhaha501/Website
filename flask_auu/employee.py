from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.exceptions import abort

from flask_auu.auth import login_required
from flask_auu.db import get_db

#define the blueprint
bp = Blueprint('employee', __name__)

@bp.route('/employee')
@login_required
def employee():

    #document the session
    session['history'] = session['history'] + "/employee\n ... "
    flash(session['history'])


   
    db = get_db()
    emplpers = db.execute(
            'SELECT Vorname, Nachname, Gebdatum, AngestelltenNr, Kontonummer, Kontostand, BLZ, Person.PANr as PANr' 
            ' FROM Person, Angestellter_besitzt_Gehaltskonto'
            ' WHERE Person.PANr = Angestellter_besitzt_Gehaltskonto.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    kapitaenlist = None
    technikerlist = None
    if emplpers is not None:
        technikerlist = db.execute(
            'SELECT Ausbildung, Techniker.Typennummer as Typennummer, Bruttoregistertonnen, Besatzungsstaerke, Typenbezeichnung, Herstellername'
            ' FROM Techniker, Schiffstyp'
            ' WHERE Techniker.Typennummer = Schiffstyp.Typennummer and Techniker.PANr = ?', (emplpers['PANr'],)
        ).fetchall()
        kapitaenlist = db.execute(
            'SELECT Kapitaen.KapitaenpatentNr AS KapitaenpatentNr, seemeilen, typennummer, passagennummer'
            ' FROM Kapitaen, Fahren'
            ' WHERE Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr and Kapitaen.PANr = ?', (emplpers['PANr'],)
        ).fetchall()    
    else:
        return render_template('non_employee/non_employee.html',) 
    
    if kapitaenlist:
        return render_template('employee/kapitaen.html', emplpers=emplpers, kapitaenlist=kapitaenlist)

    return render_template('employee/techniker.html', emplpers=emplpers, technikerlist=technikerlist) 
