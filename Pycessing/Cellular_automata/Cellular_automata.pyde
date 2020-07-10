add_library('VideoExport')
rec = False
n = 100
s = []
def setup():
    size(800,800)
    background(255)
    noStroke()
    global videoExport
    if rec:
        dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        videoExport = VideoExport(this,dst+".mp4")
        videoExport.startMovie()
        videoExport.setQuality(100, 128)
        videoExport.setFrameRate(2)
    global string1
    string1 = []
    for i in range(n):
        string1.append([])
        s.append([])
        for j in range(n):
            s[i].append([])
            # if 30>i>20 and 30>j>20:
            #     string1[i].append(int(random(2)))
            # else: string1[i].append(1)
            string1[i].append(1)
    
def draw():
    global string1, s
    rules()
    # print(string1)
    for i in range(0,width, width/n):
        for j in range(0, height, height/n):
            # fill(string1[i/8][j/8]*255)
            fill(s[i/8][j/8]*255)
            # ellipse(i,j, width/n,height/n)
            rect(i,j, width/n,height/n)
    string1 = s
    if rec:
        videoExport.saveFrame()
def rules():
    for i in range(n):
        for j in range(n):
            total = 0
            try:
                for x in range(-1,2):
                    for y in range(-1,2):
                        if x!=0 and y!=0:
                            total+=string1[i+x][j+y]
            except: pass
            finally:
                # print(total)
                if total ==2 or total ==3:
                    s[i][j] = 1
                else:
                    s[i][j] = 0
def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'q':
        videoExport.endMovie()
        exit()                
