


from data_augmentation.crop import crop
from data_augmentation.flip import flip
from data_augmentation.overlay import overlay
from data_augmentation.rotate import rotate
from data_augmentation.scale import scale


dirs = ['1. Cirrus', '2. Cirrocumulus', '3. Cirrostratus', '4. Altocumulus', '6. Nimbostratus', '7. Cumulus', '8. Cumulonimbus', '9. Stratocumulus', '10. Stratus']

crop()
flip()
overlay()
rotate()
scale()