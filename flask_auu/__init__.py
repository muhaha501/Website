# __init__.py
# last change 14 March 25
# - contains application factory
# - tells Python that the flaskr/ directory is a package

import os
from flask import Flask
from werkzeug.middleware.proxy_fix import ProxyFix

def create_app(test_config=None):
    #create and configure the app
    # __name__ is name of current Python module
    # instance_relative_config=True tells app that config files are relative to instance folder
    app = Flask(__name__, instance_relative_config=True)

    #flask behind a proxy:
    # https://flask.palletsprojects.com/en/2.2.x/deploying/proxy_fix/?highlight=reverse%20proxy
    app.wsgi_app = ProxyFix(
        app.wsgi_app, x_for=1, x_proto=1, x_host=1, x_prefix=1
    )

    app.config.from_mapping(
            # used by Flask to keep data safe
            # TODO: when deployed dev -> random value
            SECRET_KEY='dev',
            # path of sqlite database file
            DATABASE=os.path.join(app.instance_path,'flaskauu.sqlite'),
    )
    # flush needed as stdout is BUFFERED
    print('Database created...', flush=True)

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_mapping(test_config)

    #ensure the instance folder exists - Flask does it not automatically
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # initialize db
    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)

    # no url_prefix -> index view at
    from . import auu
    app.register_blueprint(auu.bp)
    app.add_url_rule('/', endpoint='index')

    #from . import exams
    #app.register_blueprint(exams.bp)
    #app.add_url_rule('/exams', endpoint='exams')

    from . import bookings
    app.register_blueprint(bookings.bp)
    app.add_url_rule('/bookings', endpoint='bookings')
    app.add_url_rule('/bookings/new_booking', endpoint='new_bookings')

    from . import employee
    app.register_blueprint(employee.bp)
    app.add_url_rule('/employee', endpoint='employee')

    #from . import library
    #app.register_blueprint(library.bp)
    #app.add_url_rule('/library', endpoint='search')
    #app.add_url_rule('/library/search', endpoint='search')
    #app.add_url_rule('/library/borrowedbooks', endpoint='borrowedbooks')

    from . import profile
    app.register_blueprint(profile.bp)
    app.add_url_rule('/profile', endpoint='profile')
    app.add_url_rule('/profile_update', endpoint='profile_update')

    return app