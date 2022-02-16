from flask import Flask, redirect, render_template, request
import requests
import keras
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
    # get image as form data

    # run prediction
    # prediction = model.predict([[0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4,0,1,2,3,4]])

    # return class value at index
    # prediction = pred_classes[prediction]

    # return value
    print("came here")
    return "hemlo"

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
    data = request.files
    r = requests.post(url = 'http://127.0.0.1:5000/predict', data = data)
    pastebin_url = r.text
    print(f"The pastebin URL {pastebin_url}")
    print("came here")
    return pastebin_url

if __name__ == "__main__":
    app.run(debug=True)