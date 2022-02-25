# API AND WEB INTERFACE

This directory contains all the flask code that was written in order to make our website and our API. The API receives POST request from either web or our flutter app, performs the resizing, sends the image to model situated in static/model.h5 and then the model returns the prediction as a response, which is then fetched and shown to the user. Templates directory contains all html files, static directory contains the model, app.py directory has all the routes and flask setup, and predict.py has the code to predict values.

# Running Locally

- ```pip install -r requirements.txt```
- ```python app.py```
