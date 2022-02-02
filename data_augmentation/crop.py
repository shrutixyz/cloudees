

from os import path
from app import dirs
from PIL import Image
from pathlib import Path


def crop():
    for d in dirs:
        try:
            directory = d
            files = Path(directory).glob('*')
            i=0
            for file in files:
                print(file)
                im = Image.open(f'{file}')
                # if im != 'RGB':
                #     im = im.convert('RGB')
                width, height = im.size   # Get dimensions
                if width>height:
                    h=height
                    w=height
                else:
                    h=width
                    w=width
                left = (width - w)/2
                top = (height - h)/2
                right = (width + w)/2
                bottom = (height + h)/2
                im = im.crop((left, top, right, bottom))
                im.save(f'{file}')
                print(f'done: {i}')
                i+=1
        except:
            continue