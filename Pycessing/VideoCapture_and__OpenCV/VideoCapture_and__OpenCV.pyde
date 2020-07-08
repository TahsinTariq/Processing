add_library('video')

def setup():
    size(640,480)
    global vid
    print(Capture.list())
    vid = Capture(this, width, height)
    vid.start()
    
def captureEvent(vid):
    vid.read()

def draw():
    image(vid, 0,0, width, height)
