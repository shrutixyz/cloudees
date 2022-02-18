import os
from keras.models import load_model
from PIL import Image
import numpy as np

# loading the model
model = load_model('static/modell.h5')

# class of clouds
classes = ['altocumulus', 'cirrocumulus', 'cirrostratus', 'cirrus', 'cumulonimbus', 'cumulus', 'nimbostratus', 'stratocumulus', 'stratus']


def realpred(path):
    img = Image.open(path)                 # opening image through pil
    img = img.resize((224,224))            # resizing the image to 224*224
    img = np.asarray(img)                  # converting image to np array
    prediction = model.predict(np.resize(img, new_shape=(1,224,224,3)))   # running prediction
    os.remove(path)                        # delete the temporarily saved photo
    return classes[np.argmax(prediction)]  # return prediction