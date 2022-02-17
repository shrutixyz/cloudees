import cv2
import numpy as np
from keras.models import load_model
import tensorflow as tf

img = cv2.imread('static/cir.jpg')

img= cv2.resize(img, (224,224))
arr = np.array(img)

print(arr.shape)
arr = arr/255
arr = tf.reshape(arr, [1, 224, 224, 3])

model = load_model('static/modell.h5')
print(model.predict(arr))

print(np.argmax(arr))
