# last change 14 March 25

from flask import Blueprint, render_template, g, flash, render_template, request, url_for, redirect
from flask_auu.auth import login_required
from flask_auu.db import get_db

bp = Blueprint('profile', __name__)

@bp.route('/profile')
@login_required
def profile():
    db = get_db()
    
    user_data = db.execute(
        "SELECT VORNAME, NACHNAME, strftime('%d.%m.%Y', GebDatum) as GebDatum, PLZ, ORT, STRASSE, Hausnummer FROM PERSON WHERE PANR = ?",
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

@bp.route('/profile_update', methods = ("GET", "POST"))
@login_required
def profile_update():
    db = get_db()
    user_data = db.execute(
    "SELECT VORNAME, NACHNAME, strftime('%d.%m.%Y', GebDatum) as GebDatum, PLZ, ORT, STRASSE, Hausnummer FROM PERSON WHERE PANR = ?",
    (g.user['username'],)
    ).fetchone()
 
    tel_data = db.execute(
    "SELECT Telnummer From Telefonnummer WHERE PANR = ?", 
    (g.user['username'],)
    ).fetchall()

    # when user submits form
    if request.method == 'POST':
        if 'plz' in request.form:
            plz = request.form['plz']
            ort = request.form['ort']
            street = request.form['street']
            hausnummer = request.form['hausnummer']
            db = get_db()
            error = None
 
            #valide usr/pw not empty
            if not plz:
                error = "PLZ is required"
            elif not ort:
                error = 'City is required'
            elif not street:
                error = 'Street is required'
            elif not hausnummer:
                error = 'Number is required'

            if error is None:
                try:
                    db.execute(
                        "UPDATE Person SET PLZ = ?, ort = ?, strasse = ?, hausnummer = ? Where panr = ?",
                        (plz, ort, street, hausnummer, g.user['username'],)
                    )

                    db.commit()
                    flash("Profile updated successfully!","success")
                except db.Error:
                    error = f"An Error occured, please contact the system administrator"
                else:
                    # after storing usr/pw-> redirect to login
                    return redirect(url_for('profile'))

            flash(error, "danger")

        elif "add_phonenr" in request.form:
            telnr = request.form['add_phonenr']
            db = get_db()
            error = None

            if error is None:
                try:
                    db.execute(
                        "INSERT into TELEFONNUMMER (TELNUMMER,PANR) values (?,?)",(telnr,g.user['username'],)
                    )
                    db.commit()
                    flash(f"Telephone number {telnr} was added!", "success")
                except db.Error as e:
                    if "UNIQUE constraint failed" in str(e):
                        flash(f"Telephone number {telnr} already assigned! Choose a different one.", "danger")
                    else: 
                        flash("Database Error", "danger")
                
                except db.Error:
                    error = f"Could not add phone number please try again."
                else:
                    return redirect(url_for('profile_update'))




        elif "remove_phonenr" in request.form:
            telnr = request.form['remove_phonenr']
            db = get_db()
            error = None

            for x in tel_data:
                if x[0] == telnr:
                    error = None
                    break
                else:
                    error = f"Telephone number not assigned." 

            if error is None:
                try: 
                    db.execute(
                        "DELETE FROM TELEFONNUMMER WHERE TELNUMMER = ? AND PANR = ?",(telnr,g.user['username'],)
                    )
                    db.commit()
                    flash(f"Telephone number {telnr} was removed!", "success")
                except db.Error:
                    error = f"Could not remove phone number please try again."
                else:
                    return redirect(url_for('profile_update'))

        if error is not None:
            flash(error, "danger")


    return render_template('profile/profile_update.html', user_data=user_data, tel_data=tel_data)

