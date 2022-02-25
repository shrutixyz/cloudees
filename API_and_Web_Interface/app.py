import string
from flask import Flask, redirect, render_template, request
import requests
import random

from predict import realpred
app = Flask(__name__)
app.config["DEBUG"] = True

## gotta define model path here
# model = keras.models.load_model('<path>')

pred_classes = ["altocumulus", "cirrocumulus", "cirrostratus", "cirrus", "cumulonimbus", "cumulus", "nimbostratus", "stratocumulus", "stratus"]

@app.route('/')
def index():

    # home page
    return render_template('index.html')

@app.route('/predict', methods = ['POST'])
def predict():
    # data = request.files
    imagefile = request.files.get('sent_file')
    res = ''.join(random.choices(string.ascii_uppercase +
                             string.digits, k = 10))
    imagefile.save(f'static/{res}.jpg')
    prediction = realpred(f'static/{res}.jpg')

    return str(prediction)

@app.route('/about')
def about():

    #about page of cloudees
    return render_template('about.html')

@app.route('/upload')
def upload():

    # upload image here (only gallery not camera)
    return render_template('upload.html')



@app.route('/result')
def result():

    #about page of cloudees
    prediction = [1,2,3,4,5,6,7,8,9]
    return render_template('result.html', pred=prediction)


@app.route('/predictweb', methods = ['POST'])
def predictweb():
    print("LMAOO")
    imagefile = request.files.get('img', '')
    # data = request.files
    r = requests.post(url = 'http://cloudees.herokuapp.com/predict', files={'sent_file': imagefile})
    restext = r.text
    print(f"The pastebin URL {restext}")
    print("came here")
    return render_template('result.html', response=restext)

if __name__ == "__main__":
    app.run(debug=True)