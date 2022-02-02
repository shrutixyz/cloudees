from os import path
from app import dirs
from PIL import Image
from pathlib import Path

def rotate():
    for d in dirs:
        directory = d
        files = Path(directory).glob('*')
        i=0
        for file in range(0,50):
            i+=1
            try:
                Original_Image = Image.open(f"{directory}/normal_{i}.jpg")
                rotated_image1 = Original_Image.rotate(90)
                rotated_image1.save(f'{directory}/rotate_A_normal_{i}.jpg')
                rotated_image2 = Original_Image.rotate(180)
                rotated_image2.save(f'{directory}/rotate_B_normal_{i}.jpg')
                rotated_image3 = Original_Image.rotate(270)
                rotated_image3.save(f'{directory}/rotate_C_normal_{i}.jpg')
                Original_Image2 = Image.open(f"{directory}/flipped_{i}.jpg")
                rotated_image4 = Original_Image2.rotate(90)
                rotated_image4.save(f'{directory}/rotate_A_flipped_{i}.jpg')
                rotated_image5 = Original_Image2.rotate(180)
                rotated_image5.save(f'{directory}/rotate_B_flipped_{i}.jpg')
                rotated_image6 = Original_Image2.rotate(270)
                rotated_image6.save(f'{directory}/rotate_C_flipped_{i}.jpg')
                print(f'done: {directory} {i}')
            except:
                continue