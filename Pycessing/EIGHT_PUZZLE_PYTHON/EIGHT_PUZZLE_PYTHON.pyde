def boardtostring(Board):
    string = ""
    for i in Board:
        for j in i:
            string+=j
    return string
n = 3
# board = [["1", "2", "3"], 
#          ["7", "8", "6"], 
#          ["4", "5", "0"]]
board = [["0", "5", "4"], 
         ["1", "6", "2"], 
         ["7", "3", "8"]]
# board = [["1", "2", "3","4"], 
#          ["5", "6", "7", "8"], 
#          ["9", "10", "11", "12"],
#          ["13", "14", "15", "0"]]
# board = [["4", "5", "8"], ["1", "0", "3"], ["7", "6", "2"]]
# board = [["7", "4", "5"], ["1", "0", "6"], ["8", "3", "2"]]
b = boardtostring(board)
# Goal = [["1", "2", "3"],
#         ["4", "5", "6"], 
#         ["7", "8", "0"]]
Goal = [["0","1", "2" ],
        ["3","4", "5"], 
        ["6", "7", "8"]]
goal = boardtostring(Goal)
def setup():
  size(600, 600)
  
def draw():
  #-------------------------------------Drawing Grid---------------------------------------#
  background(255)
  stroke(0)
  strokeWeight(10)
  w = width/n
  h = height/n
  for i in range(w,width,w):
    line(i, 0, i, height)
    line(0, i, width, i)
  #------------------------------------Drawing Digits---------------------------------------#
  for j in range(0,n) :
    for i in range(0,n) :
        x = w * j + w / 2
        y = h * i + h / 2
        spot = board[i][j]
        if (spot == "0") :
            rectMode(CENTER)
            rect(x, y, w, h)
        textSize(100)
        fill(255, 150, 190)
        textAlign(CENTER)
        text(spot, x, y)
#-------------------------------Rest of the freaking thing-----------------------------------#  
def keyPressed() :
    i = 1
    j = 0
    for I in range(0,n):
        for J in range(0,n):
            if board[I][J] == "0": 
                i = I
                j = J
    println(str(key)+" " +str(i)+" " + str(j))
    if key =='w' and i-1 >=0 :
        swap(i, j, i-1, j)
    
    if key =='s' and i+1<n:
        swap(i, j, i+1, j)
    
    if key =='a' and j-1 >=0: 
        swap(i, j, i, j-1)
    
    if key =='d' and j +1 < n: 
        swap(i, j, i, j+1)
    if key =='r':
        b = boardtostring(board)
        if count(b)%2 == count(goal)%2:
            print('SEARCHING ... ... ... ...')
            AStar(b, goal)
        else: print("UNSOLVABLE")
    if key =='f':
        boa = mous()
        try:
            for I in range(0,n):
                for J in range(0,n):
                    board[I][J] = boa[I][J]
        except:
            print('done')
def count(S):
    S = S.replace("0","")
    count = 0
    for i in range(len(S)):
        for j in range(i , len(S)):
            if S[i]>S[j]:
                count +=1
    return count
def swap( a,  b,  c,  d):
    t = board[a][b]
    board[a][b]= board[c][d]
    board[c][d] = t
def mous():
    if rout:
        r = rout.pop(0)
        return stringtoboard(r)
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
    return sum
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
def stringtoboard(v1):
    Board = []
    for i in range(n):
        Board.append([])
        for j in range(n):
            Board[i].append([])
            Board[i][j] = v1[n*i + j]
    return Board
