from keras.models import load_model
from PIL import Image, ImageOps
import numpy as np

# Load the model
model = load_model('static/model_new.h5')
classes = ['altocumulus', 'cirrocumulus', 'cirrostratus', 'cirrus', 'cumulonimbus', 'cumulus', 'nimbostratus', 'stratocumulus', 'stratus']

# Create the array of the right shape to feed into the keras model
# The 'length' or number of images you can put into the array is
# determined by the first position in the shape tuple, in this case 1.
data = np.ndarray(shape=(1, 224, 224, 3), dtype=np.float32)
# Replace this with the path to your image
image = Image.open('static/imgimg.jpg')
#resize the image to a 224x224 with the same strategy as in TM2:
#resizing the image to be at least 224x224 and then cropping from the center
size = (224, 224)
image = ImageOps.fit(image, size, Image.ANTIALIAS)

#turn the image into a numpy array
image_array = np.asarray(image)
# Normalize the image
normalized_image_array = (image_array.astype(np.float32) / 127.0) - 1
# Load the image into the array
data[0] = normalized_image_array

print(data)

# run the inference
prediction = model.predict(data)[0].tolist()
# print(prediction[0])
print(prediction)

print(classes[prediction.index(max(prediction))])
# print(classes[np.argmax(prediction)])


# from PIL import Image
# from tensorflow import keras
# # from keras.models import load_model
# import cv2
# import numpy as np

classes = ['altocumulus', 'cirrocumulus', 'cirrostratus', 'cirrus', 'cumulonimbus', 'cumulus', 'nimbostratus', 'stratocumulus', 'stratus']

# model =  keras.models.load_model('static/model.h5')
# image = cv2.imread('static/lmao.png')
# image = cv2.resize(image, (224, 224))
# image = np.reshape(image, (1,224,224,3))

# prediction = model.predict(image)
# print(classes[np.argmax(prediction)])
