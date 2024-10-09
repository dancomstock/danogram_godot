from PIL import Image
import numpy as np
im = Image.open("apple5.png")
print(im)
# im = im.load()
# a = np.asarray(im)
# print(a)
# b = im.getpixel((4,4))
# print(b)
# c = im[4,4]
# c = im[4,4]
# print(c)

def rgb_to_hex(red, green, blue):
	"""Return color as #rrggbb for the given color values."""
	return '#%02x%02x%02x' % (red, green, blue)

# print(im.getpalette())
solution = []
palette = ['#ffffff']
x,y = im.size
print(im.size)
for i in range(y):
	solution.append([])
	for j in range(x):
		print(f'{i},{j}')
		r, g, b, _ = im.getpixel((j,i))
		# print(pixel)
		color = rgb_to_hex(r,g,b)
		if color not in palette:
			palette.append(color)
		solution[i].append(palette.index(color))
		# print(f'{j},{i}')
		# l[i].append(rgb_to_hex(*im.getpixel((j,i))))

# print(l)
print(f'solution:{solution}')
print(f'palette:{palette}')