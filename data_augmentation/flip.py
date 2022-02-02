from app import dirs
from PIL import Image
from pathlib import Path


def flip():
    for d in dirs:
        directory = d
        files = Path(directory).glob('*')
        i=0
        # for file in files:
        for lol in range(0,50):
            # print(file)
            print(i)
            original_img = Image.open(f'{d}/normal_{lol}.jpg')
            if original_img != 'RGB':
                original_img = original_img.convert('RGB')
            vertical_img = original_img.transpose(method=Image.FLIP_LEFT_RIGHT)
            vertical_img.save(f'{directory}/flipped_{i}.jpg')
            # os.rename(file, f'{directory}/normal_{i}.jpg')
            i+=1