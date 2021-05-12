#! /bin/bash

nginx
gunicorn -b 0.0.0.0:5000 --chdir xi-speech-synthesizer --workers 1 --worker-class gevent --log-level DEBUG  api:app

