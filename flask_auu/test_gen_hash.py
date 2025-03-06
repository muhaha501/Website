import functools
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import check_password_hash, generate_password_hash

# kleiner Test mit dem Password gen war nur für mich kann gerne gelöscht werden
pwd2 = "Go4two!"
pwd = "Go4one!"
# generiertes Password einer frühereren session
hashpwd_man = "scrypt:32768:8:1$y26YWNPocHhG4fTM$774fcf6989e300b36006a8903243303d4c3b651640aa3ab806932a8cf54f8f05c4458c667b64a5ac369957aa98cb2865edae8442f4a7a4d8c82b086b81145a18"
hashpwd = generate_password_hash(pwd)
print(hashpwd)
print(check_password_hash(hashpwd_man, pwd))