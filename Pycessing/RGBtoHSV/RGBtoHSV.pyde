def RGBtoHSV(  r,  g,  b):
    minn = min( r, g, b )
    maxn = max( r, g, b )
    v = maxn
    delta = maxn - minn
    if( maxn != 0 ):
        s = delta / maxn
    else:
        s = 0
        h = -1
        return [h,s,v]
    if( r == maxn):
        h = ( g - b ) / delta
    elif( g == maxn ):
        h = 2 + ( b - r ) / delta
    else:
        h = 4 + ( r - g ) / delta
    h *= 60
    if( h < 0 ):
        h += 360
    return [h,s,v]

def setup():
    size(600, 600)


def draw():
    global r, g, b
    r = map(mouseX, 0,width, 1, 360)
    g = 150
    b = 50

    rgbRects()
    transformRects()
    # print(h, s, v)

def rgbRects():
    global r, g, b
    colorMode(RGB, 255,255,255)
    rgbcol = color(r, g, b)
    fill(rgbcol)
    rect(0,0,width/4, height/2)
    colorMode(HSB, 360,100, 100)

    fill(hue(rgbcol), 100, 100)
    rect(width/4,0,2*width/4, height/2)

    fill(0, saturation(rgbcol), 100)
    rect(2*width/4,0,3*width/4, height/2)

    fill(0, 100,brightness(rgbcol))
    rect(3*width/4,0,4*width/4, height/2)

def transformRects():
    global r, g, b
    a = RGBtoHSV(r,g,b)
    h = a[0]
    l = a[2]* (1 - (a[1]/2))
    if l == 0 or l ==1:
        s = 0
    else:
        s = (a[2] -l)/(min(l, 1-l))
    colorMode(HSB, 360, 1,1)
    fill(h,s,l)
    rect(0, height/2, width/4, height)