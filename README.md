# cloudees
Cloudees is a platform where users can upload images of clouds and find out what category do they belong to. It uses Deep Learning image classifiers to differentiate between the 9 major types of clouds, namely:- <br>

<ul>
  <li>Cirrus</li>
  <li>Cirrocumulus</li>
  <li>Cirrostratus</li>
  <li>Altocumulus</li>
  <li>Nimbostratus</li>
  <li>Cumulus</li>
  <li>Cumulonimbus</li>
  <li>Stratocumulus</li>
  <li>Stratus</li>
</ul>

todo: embed wikipedia links and add a combined screenshot

<br>

# Tech Stack
- For training the dataset, we used tensorflow running on habana with python being the primary language.
- For the android application, we used flutter and fed it with the tflite version of our model.
- For the Web application and API endpoint, we used Flask and hosted our keras model there itself.

# Running locally
- ```git clone https://github.com/shrutigupta5555/cloudees```
- cd to the directory you wanna run

For flutter, make sure you've flutter installed, then:- <br>
- ```cd Flutter_App```
- ```flutter run```

For Flask web and API, make sure you've python environment enabled, then:- <br>
- ```cd API_and_Web_Interface```
- ```pip install requirements.txt```
- ```python app.py```

For performing the data augmentation locally:- <br>
- ```cd Data_Augmentation```
- ```python app.py```

For performing model training:- <br>
- ```cd Model_Training```
- ```python app.py```

For viewing the dataset:- <br>
- ```cd Dataset```

# Demo Video

todo: add demo video link here

# Screenshots

todo: add screenshots here
