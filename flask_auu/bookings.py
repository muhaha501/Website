# last change 15 March 25

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
    #flash(session['history'])

    db = get_db()
    passpers = db.execute(
            "SELECT Vorname, Nachname, strftime('%d.%m.%Y', Gebdatum) as Gebdatum, Passagiernr" 
            ' FROM Person, Passagier'
            ' WHERE Person.PANr = Passagier.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()

    #DEBUG: print(matrnrper, flush=True)
    bookinglist_future = None
    bookinglist_past = None
    if passpers is not None:
        bookinglist_future = db.execute(
            #Remark: " instead of ' because of SQL internal string concatenation
            "SELECT buchungsnummer, strftime('%d.%m.%Y', datum) as datum, klasse, abfahrtszeit, ankunftszeit, abfahrtshafen, zielhafen"
            ' FROM Buchen, Passage'
            " WHERE Buchen.Passagennummer = Passage.Passagennummer AND Buchen.PassagierNr = ? and date(Datum) >= date('now')"
            ' order by datum', (passpers['PassagierNr'],)
        ).fetchall()
        bookinglist_past = db.execute(
            #Order by date latest first
            "SELECT buchungsnummer, strftime('%d.%m.%Y', datum) as datum, klasse, abfahrtszeit, ankunftszeit, abfahrtshafen, zielhafen"
            ' FROM Buchen, Passage'
            " WHERE Buchen.Passagennummer = Passage.Passagennummer AND Buchen.PassagierNr = ? and date(Datum) < date('now')"
            ' order by datum DESC', (passpers['PassagierNr'],)
        ).fetchall()    
    else:
        return render_template('non_passagier/non_passagier.html',) 
    return render_template('bookings/bookings.html', passpers=passpers, bookinglist_future=bookinglist_future, bookinglist_past=bookinglist_past)


@bp.route('/bookings/new_booking', methods=('POST','GET'))
@login_required
def new_booking():
    db = get_db()
    passpers = db.execute(
            "SELECT Vorname, Nachname, strftime('%d.%m.%Y', Gebdatum) as Gebdatum, Passagiernr" 
            ' FROM Person, Passagier'
            ' WHERE Person.PANr = Passagier.PANr and Person.PANr = ? ', (g.user['username'],)
    ).fetchone()
    if passpers is not None:
        abfahrtshafen_liste = db.execute("Select DISTINCT Abfahrtshafen from Passage").fetchall()
        abfahrtshafen_liste = [hafen['Abfahrtshafen'] for hafen in abfahrtshafen_liste]
        zielhafen_liste = []
        if request.method == 'POST':
            pressed_button = request.form.get('button_submit')
            abfahrtshafen = request.form['abfahrtshafen']
            zielhafen = request.form['zielhafen']
            date = request.form['date']
            print("Datum:" + date)
            if abfahrtshafen != "-- Wählen Sie einen Abfahrtshafen --":
                zielhafen_liste = db.execute("Select DISTINCT Zielhafen from Passage where Abfahrtshafen = ?", (abfahrtshafen,)).fetchall()
                zielhafen_liste = [hafen['Zielhafen'] for hafen in zielhafen_liste]
            if pressed_button:

                today = datetime.date.today()
                date = datetime.datetime.strptime(date, '%Y-%m-%d').date()

                if date < today:
                    flash('The date is in the past. Please select a future date.', category='danger')
                    return redirect(url_for('bookings.new_booking'))
                klasse = request.form['klasse']
                passage = db.execute("Select Passagennummer from Passage where Abfahrtshafen = ? and Zielhafen = ?", (abfahrtshafen,zielhafen,)).fetchone()['Passagennummer']
                passpers = db.execute(
                    "SELECT Vorname, Nachname, strftime('%d.%m.%Y', Gebdatum) as Gebdatum, Passagiernr"
                    ' FROM Person, Passagier'
                    ' WHERE Person.PANr = Passagier.PANr and Person.PANr = ? ', (g.user['username'],)
                ).fetchone()['PassagierNr']
                buchungsnummer = db.execute("Select max(Buchungsnummer) as Buchungsnummer from Buchen").fetchone()['Buchungsnummer']
                buchungsnummer = int(buchungsnummer[1:])+1
                buchungsnummer = "B"+str(buchungsnummer).zfill(3)
                db.execute(
                    'INSERT INTO Buchen (Buchungsnummer, Datum, Klasse, PassagierNr, Passagennummer)'
                    ' VALUES (?, ?, ?, ?, ?)',
                    (buchungsnummer, date, klasse, passpers, passage)
                )
                db.commit()
                return redirect(url_for('bookings.bookings'))

        else:
            abfahrtshafen = "-- Choose a departure port --"
            zielhafen = "-- Choose a destination port --"
        return render_template('bookings/new_booking.html', abfahrtshafen_liste=abfahrtshafen_liste, zielhafen_liste=zielhafen_liste, abfahrtshafen=abfahrtshafen, zielhafen=zielhafen)

    else:
        return render_template('non_passagier/non_passagier.html',)
