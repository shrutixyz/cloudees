from flask import Flask, render_template, request
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
    return "hello"

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
    return render_template('result.html')

if __name__ == "__main__":
    app.run(debug=True)