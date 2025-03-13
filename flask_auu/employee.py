import sqlite3
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
    #flash(session['history'])


   
    db = get_db()

    if request.method == 'POST':
        if 'returnlogbuch' in request.form:
            returnlogbuch = request.form['returnlogbuch']

            logbuch_return = db.execute(
                'SELECT * FROM Status_der_Entlehnung WHERE LogbuchNr = ?', (returnlogbuch,)
            ).fetchone()
            logbuch_check = db.execute(
                "SELECT * FROM Schiffexemplar_hat_Logbuch WHERE LogbuchNr = ?", (returnlogbuch,)
            ).fetchone()

            if not logbuch_check:
                flash(f"Logbook {returnlogbuch} does not exist! Try another Logbook.", "danger")
                return redirect(request.url)
            
            if logbuch_return:

                techniker = db.execute(
                    'SELECT Lizenznummer FROM Techniker WHERE PANr = ?', (g.user['username'],)
                ).fetchone()

                kapitaen = db.execute(
                    'SELECT KapitaenpatentNr FROM Kapitaen WHERE PANr = ?', (g.user['username'],)
                ).fetchone()

                if techniker and techniker['Lizenznummer'] == logbuch_return['TechnikerNr']:
                    db.execute(
                        'DELETE FROM STATUS_der_ENTLEHNUNG WHERE LogbuchNr = ? AND TechnikerNr = ?',
                        (returnlogbuch, techniker['Lizenznummer'])
                    )
                    flash("Logbook successfully returned!", "success")
                elif kapitaen and kapitaen['KapitaenpatentNr'] == logbuch_return['KapitaenpatentNr']:
                    db.execute(
                        'DELETE FROM STATUS_der_ENTLEHNUNG WHERE LogbuchNr = ? AND KapitaenpatentNr = ?',
                        (returnlogbuch, kapitaen['KapitaenpatentNr'])
                    )
                    flash("Logbook successfully returned!", "success")
                else:
                    flash(f"Can't return Logbook {returnlogbuch}! \n Select a Logbook you have checked out!", "danger")
                db.commit()
            else:
                flash(f"Logbook {returnlogbuch} has not been checked out! Try another Logbook.", "danger")
 
        elif 'logbuchnr' in request.form:
            logbuchnr = request.form['logbuchnr']

            logbuch_exists = db.execute(
                "SELECT * FROM Schiffexemplar_hat_Logbuch WHERE LogbuchNr = ?", (logbuchnr,)
            ).fetchone()

            if logbuch_exists:
                techniker = db.execute(
                    'SELECT Lizenznummer'
                    ' FROM Techniker T'
                    ' JOIN Schiffexemplar_hat_Logbuch S on T.Typennummer = S.Typennummer'
                    ' WHERE PANr = ? AND Logbuchnr = ?', (g.user['username'],logbuchnr)
                ).fetchone()
                kapitaen = db.execute(
                    'SELECT KapitaenpatentNr FROM Kapitaen WHERE PANr = ?', (g.user['username'],)
                ).fetchone()

                if techniker:
                    try:
                        db.execute(
                            "INSERT INTO STATUS_der_ENTLEHNUNG (LogbuchNr, TechnikerNr, Datum, PANr) VALUES (?, ?, DATE('now'), ?)",
                            (logbuchnr, techniker['Lizenznummer'], g.user['username']),
                        )
                        flash(f"Logbook {logbuchnr} sucessfully checked out!", "success")
                    except (sqlite3.Error) as e:
                        if "UNIQUE constraint failed" in str(e):
                            flash(f"Logbook {logbuchnr} already checked out! Choose a different one.", "danger")
                        else: 
                            flash("Database Error", "danger")
                elif kapitaen:
                    try:
                        db.execute(
                            "INSERT INTO STATUS_der_ENTLEHNUNG (LogbuchNr, KapitaenpatentNr, Datum, PANr) VALUES (?, ?, DATE('now'), ?)",
                            (logbuchnr, kapitaen['KapitaenpatentNr'], g.user['username']),
                        )
                        flash(f"Logbook {logbuchnr} sucessfully checked out!", "success")
                    except (sqlite3.Error) as e:
                        if "UNIQUE constraint failed" in str(e):
                            flash(f"Logbook {logbuchnr} already checked out! Choose a different one.", "danger")
                        else: 
                            flash("Database Error", "danger")
                else: 
                    flash(f"Not permitted to check out Logbook: {logbuchnr} \n Choose a logbook you are permitted to check out!", "danger")
                db.commit()
            else:
                flash(f"Not possible to check out Logbook: {logbuchnr} \n Logbook does not exist", "danger")


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
            " SELECT Schiffstyp.Herstellername as Herstellername, InventarNr, Baujahr, Seemeilen, LogbuchNr"
            ' from Schiffstyp '
            ' join Schiffexemplar_hat_Logbuch on Schiffstyp.Typennummer = Schiffexemplar_hat_Logbuch.Typennummer'
            ' where Schiffstyp.Typennummer = ?', (techniker['Typennummer'],) 
        ).fetchall()
        ausgeliehen_tech = db.execute(
        " select S.LogbuchNr, strftime('%d.%m.%Y', Datum) as Datum, Vorname, Nachname, S.PANR"
        ' from Status_der_Entlehnung S '
        ' join Person P on S.PANr = P.PANr'
        ' join Schiffexemplar_hat_Logbuch T on S.LogbuchNr = T.LogbuchNr'
        ' WHERE T.Typennummer = ?'
        ' order by S.LogbuchNr', (techniker['Typennummer'],)
        ).fetchall()
        return render_template('employee/techniker.html', emplpers=techniker, technikerlist=schiffstyp, schifflist=schifflist, ausgeliehen=ausgeliehen_tech)
    if kapitaen is not None:
        future_passages = db.execute(
            " select Buchen.Passagennummer, strftime('%d.%m.%Y', Buchen.Datum) as Datum, Passage.Abfahrtshafen, Passage.Zielhafen, Schiffstyp.Herstellername, Schiffstyp.Typenbezeichnung "
            ' from Kapitaen '
            ' join Fahren on Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr '
            ' join Buchen on Fahren.Passagennummer = Buchen.Passagennummer '
            ' join Passage on Buchen.Passagennummer = Passage.Passagennummer'
            ' join Schiffstyp on Fahren.Typennummer = Schiffstyp.Typennummer'
            " where Fahren.KapitaenpatentNr = ? and date(Buchen.Datum) >= date('now'); ", (kapitaen['KapitaenpatentNr'],)
        ).fetchall()
        past_passages = db.execute(
            " select Buchen.Passagennummer, strftime('%d.%m.%Y', Buchen.Datum) as Datum, Passage.Abfahrtshafen, Passage.Zielhafen, Schiffstyp.Herstellername, Schiffstyp.Typenbezeichnung"
            ' from Kapitaen '
            ' join Fahren on Kapitaen.KapitaenpatentNr = Fahren.KapitaenpatentNr '
            ' join Buchen on Fahren.Passagennummer = Buchen.Passagennummer '
            ' join Passage on Buchen.Passagennummer = Passage.Passagennummer'
            ' join Schiffstyp on Fahren.Typennummer = Schiffstyp.Typennummer'
            " where Fahren.KapitaenpatentNr = ? and date(Buchen.Datum) < date('now'); ", (kapitaen['KapitaenpatentNr'],)
        ).fetchall()
        ausgeliehen_all = db.execute(
        " select LogbuchNr, strftime('%d.%m.%Y', Datum) as Datum, Vorname, Nachname, S.PANR"
        ' from Status_der_Entlehnung S '
        ' join Person P on S.PANr = P.PANr'
        ' order by LogbuchNr'
        ).fetchall()
        return render_template('employee/kapitaen.html', emplpers=kapitaen, future_passages=future_passages, past_passages=past_passages, ausgeliehen=ausgeliehen_all )

    return render_template('non_employee/non_employee.html',)

