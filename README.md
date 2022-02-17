# cloudees
Cloudees is a platform where users can upload images of clouds and find out what category do they belong to. It uses Deep Learning image classifiers to differentiate between the 9 major types of clouds, namely:- <br>

<ul>
  <li>[Altocumulus](https://en.wikipedia.org/wiki/Altocumulus_cloud)</li>
  <li>[Cirrus](https://en.wikipedia.org/wiki/Cirrus_cloud)</li>
  <li>[Cirrocumulus](https://en.wikipedia.org/wiki/Cirrocumulus_cloud)</li>
  <li>[Cirrostratus](https://en.wikipedia.org/wiki/Cirrostratus_cloud)</li>
  <li>[Cumulonimbus](https://en.wikipedia.org/wiki/Cumulonimbus_cloud)</li>  
  <li>[Cumulus](https://en.wikipedia.org/wiki/Cumulus_cloud)</li>
  <li>[Nimbostratus](https://en.wikipedia.org/wiki/Nimbostratus_cloud)</li>
  <li>[Stratocumulus](https://en.wikipedia.org/wiki/Stratocumulus_cloud)</li>
  <li>[Stratus](https://en.wikipedia.org/wiki/Stratus_cloud)</li>
</ul>
<br>

<img src="https://media.discordapp.net/attachments/893813704032931870/943744988490133524/cloudsall.png" width="80%"/>

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
