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
    techniker = db.execute(
            'SELECT Vorname, Nachname, Gebdatum, AngestelltenNr, Kontonummer, Kontostand, BLZ, Person.PANr as PANr, Techniker.Lizenznummer as Lizenznummer, Techniker.Typennummer as Typennummer' 
            ' FROM Person, Angestellter_besitzt_Gehaltskonto, Techniker'
            ' WHERE Person.PANr = Angestellter_besitzt_Gehaltskonto.PANr and Person.PANr = Techniker.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    kapitaen = db.execute(
            'SELECT Vorname, Nachname, Gebdatum, AngestelltenNr, Kontonummer, Kontostand, BLZ, Person.PANr as PANr' 
            ' FROM Person, Angestellter_besitzt_Gehaltskonto, Kapitaen'
            ' WHERE Person.PANr = Angestellter_besitzt_Gehaltskonto.PANr and Person.PANr = Kapitaen.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    if techniker is not None:
        schiffstyp = db.execute(
            'SELECT Ausbildung, Techniker.Lizenznummer as Lizenznummer, Techniker.Typennummer as Typennummer, Bruttoregistertonnen, Besatzungsstaerke, Typenbezeichnung, Herstellername'
            ' FROM Techniker, Schiffstyp'
            ' WHERE Techniker.Typennummer = Schiffstyp.Typennummer and Techniker.PANr = ?', (techniker['PANr'],)
        ).fetchall()
        schifflist = db.execute(
            ' SELECT Schiffstyp.Herstellername as Herstellername, InventarNr, Baujahr, Seemeilen, LogbuchNr'
            ' from Schiffstyp '
            ' join Schiffexemplar_hat_Logbuch on Schiffstyp.Typennummer = Schiffexemplar_hat_Logbuch.Typennummer'
            ' where '
            ' Schiffstyp.Typennummer = ?', (techniker['Typennummer'],)
        ).fetchall()
        return render_template('employee/techniker.html', emplpers=techniker, technikerlist=schiffstyp, schifflist=schifflist)
    if kapitaen is not None:
        kapitaenlist = db.execute(
            'SELECT Kapitaen.KapitaenpatentNr AS KapitaenpatentNr, seemeilen, typennummer, passagennummer'
            ' FROM Kapitaen, Fahren'
            ' WHERE Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr and Kapitaen.PANr = ?', (kapitaen['PANr'],)
        ).fetchall()
        return render_template('employee/kapitaen.html', emplpers=kapitaen, kapitaenlist=kapitaenlist)

    return render_template('non_employee/non_employee.html',)

