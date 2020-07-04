global w,h
n = 20
arr = []
goal = []
def settings():
    global img
    img = loadImage("world.png")
    ww = img.width
    hh = img.height
    size(ww,hh)

def setup():
    background(255)
    MakeArrayFromImage()
    for i in xrange(len(arr)):
        goal.append([])
        for j in xrange(len(arr[i])):
            goal[i].append(arr[i][j])
    arr[1][1] = 'a'
    goal[13][18] = 'a'
    goal[3][18] = 'a'
    goal[1][4] = 'a'
    print(goal)
def draw():
    image(img,0,0)
    global n2
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
            if arr[i][j] =="a" and goal [i][j] =="a":
                print("EATTEM!!!!")
                goal[i][j] = "P"
            if (goal[i][j] == "a"):
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
def swap( a,  b,  c,  d):
    t = arr[a][b]
    arr[a][b]= arr[c][d]
    arr[c][d] = t

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        print(v2)
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
        # println("fcost :    " + str(fcost))
        # print("queue :    " + str(queue))
        if node == v2:
            try:
                print("found")
                route(v1, v2)
            except Exception as e:
                print('No path exists')
            return None
        # print("\nsearching : ", node, " /\tfcost:", fcost[node])
        lowestCost(node)
    print('NO path Found')
######################################################################## MANHATTEN ------>> HURISTICS
def h(v1):
    g2 = stringtoboard(goal)
    Board = stringtoboard(v1)
    sum =0;
    for i in range(0,n):
        for j in range(0,n):
            for k in range(0,n):
                for l in range(0,n):
                    if Board[i][j] == g2[k][l]:
                        sum += abs(i-k) +abs(j-l)
#####################################################################  GENERATE -------->> CHILD
def generatechild(node):
    no = stringtoboard(node)
    child = {}
    i = 1
    def move( a,  b,  c,  d):
        t = no[a][b]
        no[a][b]= no[c][d]
        no[c][d] = t 
    j = 0
    for I in range(0,n):
        for J in range(0,n):
            if no[I][J] == "0": 
                i = I
                j = J
    if i-1 >=0 :
        move(i, j, i-1, j)
        name = boardtostring(no)
        child[name] = h(name)
        gcost[name] = 999999
        move(i,j,i-1,j)
    if i+1<n:
        move(i, j, i+1, j)
        name = boardtostring(no)
        child[name] = h(name)
        gcost[name] = 999999
        move(i, j, i+1, j)
    if j-1 >=0: 
        move(i, j, i, j-1)
        name = boardtostring(no)
        child[name] = h(name)
        gcost[name] = 999999
        move(i, j, i, j-1)
    if j +1 < n: 
        move(i, j, i, j+1)
        name = boardtostring(no)
        child[name] = h(name)
        gcost[name] = 999999
        move(i, j, i, j+1)
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
    for i in range(n):
        Board.append([])
        for j in range(n):
            Board[i].append([])
            Board[i][j] = v1[n*i + j]
    return Board
#####################################################################   IMAGE -------->> ARRAY
def MakeArrayFromImage():
    w = width/n
    for j in range(n/2,height,w):
        arr.append([])
        for i in range(n/2,width,w):
            loc = i + (j)* width
            r = red(img.pixels[loc])
            if r <= 50:
                # fill(0)
                # rect(i, j, 10,10)
                arr[j/w].append("B")
            else:
                # fill(0)
                # rect(i, j, 10,10)
                arr[j/w].append("P")
    # print(arr)
    # print(len(arr), len(arr[0]))
