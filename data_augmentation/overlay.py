from PIL import Image
import cv2

def overlay():
    for i in range(1,16):
        background = cv2.imread(f'{i}.jpg')
    # height, width = background.shape
        image = Image.open(f'{i}.jpg')
        width, height = image.size
        overlay = cv2.imread('orange.jpg')
        overlay = cv2.resize(overlay, (width,height))

        added_image = cv2.addWeighted(background,0.6,overlay,0.7,0)

        cv2.imwrite(f'{i+100}.jpg', added_image)
        print(i)