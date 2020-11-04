# from Java_file import drawRect
from openSimplex import *
simplex = OpenSimplex()
def setup():
	size(640,640)

def draw():
	background(255)
	r = simplex.noise2d(mouseX, mouseY)*50
	ellipse(mouseX, mouseY, r, r)
	# drawRect()
	print(r)