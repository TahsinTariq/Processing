letterList = "qwertyuiopasdfghjklzxcvbnm,  ."
l = len(letterList)

def setup():
    size(640, 480)
    colorMode(HSB, 360,100,100)
    background(0,18,90)
def draw():
    textSize(20)
    if mousePressed:
        if mouseX != 0 or mouseY!=0:
            text(letterList[int(random(l))], mouseX, mouseY)
    delay(100)
# for i in range(20):
#     print(letterList[int(random(l))])

def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
