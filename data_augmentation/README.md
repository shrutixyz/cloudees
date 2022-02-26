# Data Augmentation

This directory contains the code we used to augment our data, in simple words, increase the size of our dataset by changing various properties of existing dataset. For data augmentation, we essentially did the following:-

- Flipping horizontally
- Rotating [90, 180, 270 degrees]
- Adding sunset overlay
- Scaling [120% and 150%]

# Data Preprocessing

For making our data uniform, we needed it to have same size for every image. So, we cropped the images to square and resized them all to be 224 x 224 pixels each.
