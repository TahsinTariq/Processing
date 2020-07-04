global w,h
n = []
arr = []
goal = []
rout = []
gcost = {}
parents = {}
searched = []
show = []
fcost = {}
queue = {}
R = [False]
def settings():
    global img
    img = loadImage("mediumMaze.png")
    ww = img.width
    hh = img.height
    size(ww,hh)
    n.append(img.width/32)
    n.append(img.height/32)
    
def setup():
    background(255)
    MakeArrayFromImage()
    # arr[13][18] = 'g'
    # arr[1][1] = 'a'
    # arr[3][3] = 'g'
    for i in xrange(len(arr)):
        goal.append([])
        for j in xrange(len(arr[i])):
            if arr[i][j] == 'P' or arr[i][j] == 'B': 
                goal[i].append(arr[i][j])
            elif arr[i][j] == 'a':
                goal[i].append('a')
            else: goal[i].append('P')
    # print(arr)
def draw():
    w = width/n[0]
    # print(show)
    # print(R)
    for j in range(0,n[0]):
        for i in range(0,n[1]):
            x = w * j + w / 2
            y = w * i + w / 2
            noStroke()
            if [i,j] in show:
                rectMode(CENTER)
                fill(56, 255, 56)
                rect(x, y, w, w)
            if (arr[i][j] == "a"):
                rectMode(CENTER)
                fill(238, 255, 5)
                rect(x, y, w, w)
            if (arr[i][j] == "P") and [i, j] not in show:
                rectMode(CENTER)
                fill(255, 72, 225)
                rect(x, y, w, w)
            if (arr[i][j] == "B"):
                rectMode(CENTER)
                fill(50, 60, 200)
                rect(x, y, w, w)
            if (arr[i][j] == "g") and [i, j] not in show:
                rectMode(CENTER)
                fill(255, 72, 225)
                rect(x, y, w, w)
            if (arr[i][j] == "g"):
                ellipseMode(CENTER)
                fill(255)
                ellipse(x, y, 10, 10)
    astar()
    # dfs()
    
    
def astar():    
    def route(v1, v2):
        if parents[v2] != 'NONE':
            route(v1, parents[v2])
################---------------------------------------------------PRINT ROUTE----------------------------##################################            
        rout.append(v2)
    
    def lowestCost(d1):
        hash_ = generatechild(d1);
        # print('             HASH          ',hash_);
        for n, c in hash_.items():
            if 1 + gcost[d1] < gcost[n] and n not in searched:
                gcost[n] = 1 + gcost[d1]
                fcost[n] = gcost[n] + c
                parents[n] = d1
                if n not in queue.keys():
                    queue[n] = fcost[n]
    if R[0]:
        if len(queue.keys()) >0:
            x = sorted(queue, key=queue.get, reverse=True)
            # print("QUWUW   :   "+ str(queue))
            node= x.pop()
            queue.pop(node)
            searched.append(node)
            sh = stringtoboard(node)
            for i in range(0,n[1]):
                for j in range(0,n[0]):
                    if  sh[i][j] == "a":
                        if [i,j] not in show:
                            show.append([i, j])
                        break
            println("Parents :  " + str(parents))
            println("Gcost :    " + str(gcost))
            println("fcost :    " + str(fcost[node]))
            print("queue :    " + str(queue))
            if numberofpellets(node) == 0:
                # try:
                print("found")
                route(boardtostring(arr), node)
                R[0] = False
                # except Exception as e:
                #     print('No path exists')
            print("\nsearching : ", node, " /\tfcost:", fcost[node])
            lowestCost(node)
        else:
            print('NO path Found')
            noLoop()
    
    
# def dfs():
#     if R[0]:
#         if len(queue.keys()) >0:
#             print(queue)
#             node = queue.pop()
#             if numberofpellets(node) == 0:
#                 print("found")
#                 # route(boardtostring(arr), node)
#                 R[0] = False 
#             if node not in searched:    
#         else:
#             print('NO path Found')
#             noLoop()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#------------------------------------------------------KEYPRESSED------------------------------#
def keyPressed() :
    i = 1
    j = 0
    for I in range(n[1]):
        for J in range(n[0]):
            if (arr[I][J] == "a"): 
                i = I
                j = J
                break
    println(str(key)+" " +str(i)+" " + str(j))
    if key =='w' and arr[i-1][j] !="B" :
        swap(i, j, i-1, j)
    
    if key =='s' and arr[i+1][j] !="B":
        swap(i, j, i+1, j)
    
    if key =='a' and arr[i][j-1]!="B": 
        swap(i, j, i, j-1)
    
    if key =='d' and arr[i][j+1]!= "B":
        swap(i, j, i, j+1)
        
    if key =='r':
        v1 = boardtostring(arr)
        parents[v1] = "NONE"
        gcost[v1] = 1
        fcost[v1] = h(v1)
        queue[v1] = fcost[v1]
        R[0] = True
    
    if key =='f':
        boa = mous()
        try:
            for I in range(0,n[1]):
                for J in range(0,n[0]):
                    arr[I][J] = boa[I][J]
        except:
            print('done')
def swap( a,  b,  c,  d):
    t = arr[a][b]
    if arr[c][d] != "g":
        arr[a][b]= arr[c][d]
    else: arr[a][b] = "P"
    arr[c][d] = t
    
def numberofpellets(string):
    count = 0
    for i in string:
        if i == "g":
            count+=1
    return count
    
    
    
    
    
    
    
def mous():
    if rout:
        r = rout.pop(0)
        return stringtoboard(r)
def h2(n):
    return h(n)
######################################################################## MANHATTEN ------>> HURISTICS
def h(v1):
    Board = stringtoboard(v1)
    sum =0
    # sum = 9999999
    I = 0
    J = 0
    for i in range(0,n[1]):
        for j in range(0,n[0]):
            if  Board[i][j] == "a":
                I = i
                J = j
    for k in range(0,n[1]):
        for l in range(0,n[0]):
            if Board[k][l] == "g":
                sum += abs(I-k) +abs(J-l) #- int(sqrt((I-k)**2 +(J-l)**2)) - 5*numberofpellets(v1)
                # sum += sqrt((I-k)**2 +(J-l)**2)
                # sum = min(sum, sqrt((I-k)**2 +(J-l)**2))
    return sum
#####################################################################  GENERATE -------->> CHILD
def generatechild(node):
    no = stringtoboard(node)
    child = {}
    i = 1
    def move( a,  b,  c,  d, theno):
        thenode = stringtoboard(theno)
        t = thenode[a][b]
        if thenode[c][d] == 'g':
            thenode[a][b]= 'P'
        else: thenode[a][b] = thenode[c][d]
        thenode[c][d] = t
        return boardtostring(thenode)
    j = 0
    for I in range(0,n[1]):
        for J in range(0,n[0]):
            if no[I][J] == "a": 
                i = I
                j = J
    if no[i-1][j] != "B" :
        name = move(i, j, i-1, j, node)
        child[name] = h(name)
        gcost[name] = 999999
    if no[i+1][j] != "B":
        name = move(i, j, i+1, j, node)
        child[name] = h(name)
        gcost[name] = 999999
    if no[i][j-1] != "B": 
        name = move(i, j, i, j-1, node)
        child[name] = h(name)
        gcost[name] = 999999
    if no[i][j +1] !="B": 
        name = move(i, j, i, j+1, node)
        child[name] = h(name)
        gcost[name] = 999999
    # print("child of "+ str(node) + str(child))
    return child
#####################################################################    BOARD --------->> STRING
def boardtostring(Board):
    string = ""
    for i in Board:
        for j in i:
            string+=j
    return string
#####################################################################   STRING ------->> BOARD
def stringtoboard(v1):
    Board = []
    for i in range(n[1]):
        Board.append([])
        for j in range(n[0]):
            Board[i].append(v1[i*n[0] + j])
    return Board
#####################################################################   IMAGE -------->> ARRAY
def MakeArrayFromImage():
    w = width/n[0]
    for j in range(n[1]/2,height,w):
        arr.append([])
        for i in range(n[0]/2,width,w):
            loc = i + (j)* width
            r = red(img.pixels[loc])
            g = green(img.pixels[loc])
            b = blue(img.pixels[loc])
            if r == 50 and g ==60 and b == 200:
                # fill(0)
                # rect(i, j, 10,10)
                arr[j/w].append("B")
            elif r == 255 and g == 72 and b == 225:
                # fill(0)
                # rect(i, j, 10,10)
                arr[j/w].append("P")
            elif r == 238 and g == 255 and b == 5:
                arr[j/w].append("a")
            elif r == 255 and g == 255 and b == 255:
                arr[j/w].append("g")
                
                
                
class Node:
    def __init__(self, state, parent, actionTaken, stepCost, pathCost):
        self.state = state
        self.parent = parent
        self.actionTaken = actionTaken
        self.stepCost = stepCost
        self.pathCost = pathCost
