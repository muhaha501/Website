from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.exceptions import abort

from flask_auu.auth import login_required
from flask_auu.db import get_db

#define the blueprint
bp = Blueprint('employee', __name__)

@bp.route('/employee', methods = ("GET", "POST"))
@login_required
def employee():

    #document the session
    session['history'] = session['history'] + "/employee\n ... "
    flash(session['history'])


   
    db = get_db()

    if request.method == 'POST':
        if 'returnlogbuch' in request.form:
            returnlogbuch = request.form['returnlogbuch']

            techniker = db.execute(
                'SELECT Lizenznummer FROM Techniker WHERE PANr = ?', (g.user['username'],)
            ).fetchone()
            kapitaen = db.execute(
                'SELECT KapitaenpatentNr FROM Kapitaen WHERE PANr = ?', (g.user['username'],)
            ).fetchone()

            if techniker:
                db.execute(
                    'DELETE FROM STATUS_der_ENTLEHNUNG WHERE LogbuchNr = ? AND TechnikerNr = ?',
                    (returnlogbuch, techniker['Lizenznummer'])
                )
            elif kapitaen:
                db.execute(
                    'DELETE FROM STATUS_der_ENTLEHNUNG WHERE LogbuchNr = ? AND KapitaenpatentNr = ?',
                    (returnlogbuch, kapitaen['KapitaenpatentNr'])
                )
            db.commit()

        elif 'logbuchnr' in request.form:
            logbuchnr = request.form['logbuchnr']

            logbuch_exists = db.execute(
                "SELECT * FROM Schiffexemplar_hat_Logbuch WHERE LogbuchNr = ?", (logbuchnr,)
            ).fetchone()

            if logbuch_exists:
                techniker = db.execute(
                    'SELECT Lizenznummer FROM Techniker WHERE PANr = ?', (g.user['username'],)
                ).fetchone()
                kapitaen = db.execute(
                    'SELECT KapitaenpatentNr FROM Kapitaen WHERE PANr = ?', (g.user['username'],)
                ).fetchone()

                if techniker:
                    db.execute(
                        "INSERT INTO STATUS_der_ENTLEHNUNG (LogbuchNr, TechnikerNr, Datum, PANr) VALUES (?, ?, DATE('now'), ?)",
                        (logbuchnr, techniker['Lizenznummer'], g.user['username']),
                    )
                elif kapitaen:
                    db.execute(
                        "INSERT INTO STATUS_der_ENTLEHNUNG (LogbuchNr, KapitaenpatentNr, Datum, PANr) VALUES (?, ?, DATE('now'), ?)",
                        (logbuchnr, kapitaen['KapitaenpatentNr'], g.user['username']),
                    )
                db.commit()
    
    # Alle ausgeliehennen Bücher
    ausgeliehen = db.execute(
        " select LogbuchNr, strftime('%d.%m.%Y', Datum) as Datum, Vorname, Nachname, S.PANR"
        ' from Status_der_Entlehnung S '
        ' join Person P on S.PANr = P.PANr'
        ' order by LogbuchNr'
    ).fetchall()

    techniker = db.execute(
            " SELECT Vorname, Nachname, strftime('%d.%m.%Y', Gebdatum) as Gebdatum, AngestelltenNr, Kontonummer, Kontostand, BLZ, Person.PANr as PANr, Techniker.Lizenznummer as Lizenznummer, Techniker.Typennummer as Typennummer" 
            ' FROM Person, Angestellter_besitzt_Gehaltskonto, Techniker'
            ' WHERE Person.PANr = Angestellter_besitzt_Gehaltskonto.PANr and Person.PANr = Techniker.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    kapitaen = db.execute(
            " SELECT Vorname, Nachname, strftime('%d.%m.%Y', Gebdatum) as Gebdatum, AngestelltenNr, Kontonummer, Kontostand, BLZ, Person.PANr as PANr, Kapitaen.KapitaenpatentNr "
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
            " SELECT Schiffstyp.Herstellername as Herstellername, InventarNr, strftime('%d.%m.%Y', Baujahr) as Baujahr, Seemeilen, LogbuchNr"
            ' from Schiffstyp '
            ' join Schiffexemplar_hat_Logbuch on Schiffstyp.Typennummer = Schiffexemplar_hat_Logbuch.Typennummer'
            ' where '
            ' Schiffstyp.Typennummer = ?', (techniker['Typennummer'],)
        ).fetchall()
        return render_template('employee/techniker.html', emplpers=techniker, technikerlist=schiffstyp, schifflist=schifflist, ausgeliehen=ausgeliehen)
    if kapitaen is not None:
        future_passages = db.execute(
            " select Buchen.Passagennummer, strftime('%d.%m.%Y', Buchen.Datum) as Datum, Passage.Abfahrtshafen, Passage.Zielhafen, Schiffstyp.Herstellername, Schiffstyp.Typenbezeichnung "
            ' from Kapitaen '
            ' join Fahren on Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr '
            ' join Buchen on Fahren.Passagennummer = Buchen.Passagennummer '
            ' join Passage on Buchen.Passagennummer = Passage.Passagennummer'
            ' join Schiffstyp on Fahren.Typennummer = Schiffstyp.Typennummer'
            " where Fahren.KapitaenpatentNr = ? and date(Buchen.Datum) <= date('now'); ", (kapitaen['KapitaenpatentNr'],)
        ).fetchall()
        past_passages = db.execute(
            " select Buchen.Passagennummer, strftime('%d.%m.%Y', Buchen.Datum) as Datum, Passage.Abfahrtshafen, Passage.Zielhafen, Schiffstyp.Herstellername, Schiffstyp.Typenbezeichnung"
            ' from Kapitaen '
            ' join Fahren on Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr '
            ' join Buchen on Fahren.Passagennummer = Buchen.Passagennummer '
            ' join Passage on Buchen.Passagennummer = Passage.Passagennummer'
            ' join Schiffstyp on Fahren.Typennummer = Schiffstyp.Typennummer'
            " where Fahren.KapitaenpatentNr = ? and date(Buchen.Datum) > date('now'); ", (kapitaen['KapitaenpatentNr'],)
        ).fetchall()
        return render_template('employee/kapitaen.html', emplpers=kapitaen, future_passages=future_passages, past_passages=past_passages, ausgeliehen=ausgeliehen )

    return render_template('non_employee/non_employee.html',)

