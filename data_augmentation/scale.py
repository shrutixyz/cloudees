from app import dirs
from PIL import Image

def scale():
    for d in dirs:
        i=0
    for x in range(400):
        try:
            
            im = Image.open(f'{d}/{x}.jpg')
        except:
            continue
        if im != 'RGB':
            im = im.convert('RGB')
        width, height = im.size
        w=width/1.2
        h=height/1.2
        left = (width - w)/2
        top = (height - h)/2
        right = (width + w)/2
        bottom = (height + h)/2
        imlol = im.crop((left, top, right, bottom))
        imlol.save(f'{d}/scale1_{x}.jpg')

        w=width/1.5
        h=height/1.5
        left = (width - w)/2
        top = (height - h)/2
        right = (width + w)/2
        bottom = (height + h)/2
        imd = im.crop((left, top, right, bottom))
        imd.save(f'{d}/scale2_{x}.jpg')

        print("done for: "+d+" "+str(x))