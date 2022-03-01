# cloudees
Cloudees is a platform where users can upload images of clouds and find out what category do they belong to. It uses Deep Learning image classifiers to differentiate between the 9 major types of clouds, namely:- <br>

<ul>

  [Altocumulus](https://en.wikipedia.org/wiki/Altocumulus_cloud) <br>
  [Cirrus](https://en.wikipedia.org/wiki/Cirrus_cloud) <br>
  [Cirrocumulus](https://en.wikipedia.org/wiki/Cirrocumulus_cloud) <br>
  [Cirrostratus](https://en.wikipedia.org/wiki/Cirrostratus_cloud) <br>
  [Cumulonimbus](https://en.wikipedia.org/wiki/Cumulonimbus_cloud)  <br>
  [Cumulus](https://en.wikipedia.org/wiki/Cumulus_cloud) <br>
  [Nimbostratus](https://en.wikipedia.org/wiki/Nimbostratus_cloud) <br>
  [Stratocumulus](https://en.wikipedia.org/wiki/Stratocumulus_cloud) <br>
  [Stratus](https://en.wikipedia.org/wiki/Stratus_cloud) <br>
</ul>
<br>

<img src="https://media.discordapp.net/attachments/893813704032931870/943752266341576724/allcouds.png" width="80%"/>

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
- ```pip install -r requirements.txt```
- ```python app.py```

For performing the data augmentation locally:- <br>
- ```cd data_augmentation```
- ```python app.py```

For performing model training:- <br>
- ```cd Model_Training```
- ```python app.py```

For viewing the dataset:- <br>
- ```cd Dataset```

# Demo Video

https://youtu.be/nzDzdQV6-lo

# Screenshots

<img src="https://media.discordapp.net/attachments/873911486488121344/948257227783942184/unknown.png"/> <br>
<img src="https://media.discordapp.net/attachments/873911486488121344/948257334277312563/unknown.png"/> <br>
<img src="https://media.discordapp.net/attachments/873911486488121344/948257452539924480/unknown.png"/> <br>
<img src="https://media.discordapp.net/attachments/873911486488121344/948257563319869530/unknown.png"/> <br>

<img src="https://media.discordapp.net/attachments/873911486488121344/948258065013157949/Screenshot_20220301-220811.jpg" width="20%"/>
<img src="https://media.discordapp.net/attachments/873911486488121344/948258065315143720/Screenshot_20220301-220827.jpg" width="20%"/>
<img src="https://media.discordapp.net/attachments/873911486488121344/948258065315143720/Screenshot_20220301-220827.jpg" width="20%"/>
<img src="https://media.discordapp.net/attachments/873911486488121344/948258065591992420/Screenshot_20220301-220845.jpg" width="20%"/>
