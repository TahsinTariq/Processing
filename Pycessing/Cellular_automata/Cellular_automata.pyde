add_library('VideoExport')
rec = False
n = 50
s = []
def settings():
    size(700,700)
def setup():
    background(255)
    noStroke()
    global videoExport
    if rec:
        dst = str(hour()) + "_" + str(minute()) +"_" + str(second()) + "_" + str(millis())
        videoExport = VideoExport(this,dst+".mp4")
        videoExport.setQuality(100, 128)
        # videoExport.setFrameRate(2)
        videoExport.startMovie()
        
    global string1
    string1 = []
    for i in range(n):
        string1.append([])
        s.append([])
        for j in range(n):
            # s[i].append(int(random(2)))
            # string1[i].append(int(random(2)))
            # s[i].append([])
            # if 30>i>20 and 30>j>20:
            #     string1[i].append(int(random(2)))
            # else: string1[i].append(1)
            string1[i].append(0)
            s[i].append(0)
    s[5][5] = 1
    s[5][6] = 1
    s[6][6] = 1
    s[6][5] = 1
    # s[2][3] = 1
    
def draw():
    global string1, s
    rules()
    # print(string1)
    for i in range(n):
        for j in range(n):
            fill(string1[i][j]*255)
            # ellipse(i,j, width/n,height/n)
            rect(i*width/n,j*height/n, width/n,height/n)
    # string1 = s
    s = string1
    delay(500)
    if rec:
        videoExport.saveFrame()
        
def rules():
    for x in range(n):
        for y in range(n):
            total = 0
            for xoff in range(-1,2):
                for yoff in range(-1,2):
                    if total >= 4 or (xoff==0 and yoff ==0) or (x==0 and xoff ==-1) or (y == 0 and yoff == -1) or (x == n - 1 and xoff == 1) or (y == n - 1 and yoff == 1):
                        continue
                    if s[x+xoff][y+yoff] == 0:
                        total+=1
            if (total ==2 and s[x][y] == 0) or total ==3:
                string1[x][y] = 0
            else:
                string1[x][y] = 1
def keyPressed():
    if key == 's':
        save("outputs/" + str(hour()) + "_" + str(minute()) +
             "_" + str(second()) + "_" + str(millis()) + ".jpg")
    if key == 'q' and rec:
        videoExport.endMovie()
        exit()                
