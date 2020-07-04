global w,h
n = 19
n2 = 7
arr = []
goal = []
foodless = []
def settings():
    global img
    img = loadImage("worldT1.png")
    ww = img.width
    hh = img.height
    size(ww,hh)

def setup():
    background(255)
    MakeArrayFromImage()
    # arr[1][1] = 'a'
    for i in xrange(len(arr)):
        goal.append([])
        for j in xrange(len(arr[i])):
            if arr[i][j] == 'P' or arr[i][j] == 'B': 
                goal[i].append(arr[i][j])
            elif arr[i][j] == 'a':
                goal[i].append('a')
            else: goal[i].append('P')
    print(arr)
def draw():
    # image(img,0,0)
    n2 = n * height/ width
    w = width/n
    h = height/n
    for j in range(0,n):
        for i in range(0,n2):
            x = w * j + w / 2
            y = w * i + w / 2
            if (arr[i][j] == "a"):
                rectMode(CENTER)
                fill(238, 255, 5)
                rect(x, y, w, w)
            if (arr[i][j] == "P"):
                rectMode(CENTER)
                fill(255, 72, 225)
                rect(x, y, w, w)
            if (arr[i][j] == "B"):
                rectMode(CENTER)
                fill(50, 60, 200)
                rect(x, y, w, w)
            if (arr[i][j] == "g"):
                rectMode(CENTER)
                fill(255, 72, 225)
                rect(x, y, w, w)
                ellipseMode(CENTER)
                fill(255)
                noStroke()
                ellipse(x, y, 10, 10)
#------------------------------------------------------KEYPRESSED------------------------------#
def keyPressed() :
    i = 1
    j = 0
    for I in range(n2):
        for J in range(n):
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
    
###############################################################         R       ###################
    if key =='r':
        b = boardtostring(arr)
        g = boardtostring(goal)
        AStar(b, g)
    
    if key =='f':
        boa = mous()
        try:
            for I in range(0,n2):
                for J in range(0,n):
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
    
    
##################################################################    ****  A STAR  **** 
rout = []
gcost = {}
def AStar(v1 , v2):
    parents = {}
    searched = []
    fcost = {}
    queue = {}
    def route(v1, v2):
        if parents[v2] != 'NONE':
            route(v1, parents[v2])
################---------------------------------------------------PRINT ROUTE----------------------------##################################            
        # print(v2)
        rout.append(v2)
    parents[v1] = "NONE"
    gcost[v1] = 0
    fcost[v1] = h(v1)
    queue[v1] = fcost[v1]
    def lowestCost(d1):
        hash_ = generatechild(d1);
        # print('             HASH          ',hash_);
        for n, c in hash_.items():
            if c + gcost[d1] < gcost[n] and n not in searched:
                gcost[n] = c + gcost[d1]
                fcost[n] = gcost[n] + h(n)
                parents[n] = d1
                if n not in queue.keys():
                    queue[n] = fcost[n]
    while queue:
        x = sorted(queue, key=queue.get, reverse=True)
        # print("QUWUW   :   "+ str(queue))
        node= x.pop()
        queue.pop(node)
        searched.append(node)
        # println("Parents :  " + str(parents))
        # println("Gcost :    " + str(gcost))
        # println("fcost :    " + str(fcost[node]))
        # print("queue :    " + str(queue))
#_______________________________________________________________________PROBLEM_______________________#
        if numberofpellets(node) == 0:
            try:
                print("found")
                route(v1, node)
            except Exception as e:
                print('No path exists')
            return None
        # with open("file.txt", 'a') as f:
        #     f.write(node)
        #     f.write("\n\n")
        #     f.write(str(queue))
        #     f.write("\n\n")
       # print("\nsearching : ", node, " /\tfcost:", fcost[node])
        lowestCost(node)
    print('NO path Found')
######################################################################## MANHATTEN ------>> HURISTICS
def h(v1):
    # g2 = stringtoboard(v1)
    # # g2 = goal
    # Board = stringtoboard(v1)
    # # Board = v1
    # sum =0;
    # I = 0
    # J = 0
    # for i in range(0,n2):
    #     for j in range(0,n):
    #         if  Board[i][j] == "a":
    #             I = i
    #             J = j
    # for k in range(0,n2):
    #     for l in range(0,n):
    #         if g2[k][l] == "g":
    #             sum += abs(I-k) +abs(J-l)
    #             # sum += sqrt((I-k)**2 +(J-l)**2)
    return numberofpellets(v1)
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
    for I in range(0,n2):
        for J in range(0,n):
            if no[I][J] == "a": 
                i = I
                j = J
    # for I in range(len(node)):
    #     if node[I] == 'a':
    #         j = int((I+1)/n)
    #         i = (I+1)%n2
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
    for i in range(n2):
        Board.append([])
        for j in range(n):
            Board[i].append(v1[i*n + j])
            # Board[i][j] = v1[i*n + j]
    return Board
#####################################################################   IMAGE -------->> ARRAY
def MakeArrayFromImage():
    w = width/n
    for j in range(n/2,height,w):
        arr.append([])
        for i in range(n/2,width,w):
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
    # print(arr)
    # print(len(arr), len(arr[0]))
