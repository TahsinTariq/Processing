from block_VIA import *
iter = 1
grid = [
    [0,  0,  0, "p"],
    [0,"b",0, "n"],
    [0,"b", 0,0,"p"]
]
# grid = [
#     [0,  0,  0, "p"],
#     [0,"b",0, "n"],
#     [0,  0,  0,0]
# ]
UP = (0, -1)
DOWN = (0, 1)
LEFT = (-1, 0)
RIGHT = (1, 0)
actions = [UP, DOWN, LEFT, RIGHT]
def update(agrid):
    global iter
    iter+=1
    temp = agrid
    l = 0.9
    n_x = len(temp)
    n_y = len(temp[0])
    delta = 0
    for i in range(n_x):
        for j in range(n_y):
            if temp[i][j].isDigit:
                temp[i][j].pval = temp[i][j].val
    for i in range(n_x):
        for j in range(n_y):
            if temp[i][j].isDigit:
                cmax = 0
                # print("/n/n/n/n  iter: "+ str(iter))
                for a in actions:
                    c = 0
                    # print("/n"+ str(a))
                    for t in actions:
                        T = t
                        if not -1<i+T[0]<n_x or not -1<j+T[1]<n_y or temp[i+T[0]][j+T[1]].val == "b":
                            T = (0,0)
                        if not addTuple(a,t) == (0,0):
                            if addTuple(a,t) == addTuple(a,a) or addTuple(a,t) == a:
                                c += bellman(0.8, temp[i][j].pval, l, temp[i+T[0]][j+T[1]].pval)
                            else:
                                c += bellman(0.1, temp[i][j].pval, l, temp[i+T[0]][j+T[1]].pval)
                        # print(c)
                    if c > cmax:
                        cmax = c
                        temp[i][j].dir = (a[1],a[0])
                delta = max(delta, abs(cmax - temp[i][j].val))
                temp[i][j].val = cmax
    if delta <= 0.005*(1-l)/l:
        print(iter)
        noLoop()
    return temp
addT = lambda a: sum(a)
def addTuple(t1,t2):
    return tuple(map(addT, zip(t1,t2)))
def bellman(T, current, l, side):
    return T * (0 + l * side)


def settings():
    global grid, w, h, rez
    rez = 150
    h = len(grid) * rez
    w = len(grid[0]) * rez
    size(w, h)
def setup():
    global agrid
    colorMode(HSB, 360,100,100)
    stroke(0,100,0)
    agrid = []
    for i in range(len(grid)):
        agrid.append([])
        for j in range(len(grid[0])):
            agrid[i].append(block(grid[i][j]))

def draw():
    global agrid, iter
    noLoop()
    # agrid = update(agrid)
    for i in range(0, w, rez):
        for j in range(0, h, rez):
            if agrid[j / rez][i / rez].val == 'p':
                fill(250,80,90)
            elif agrid[j / rez][i / rez].val == "n":
                fill(0, 80, 90)
            elif agrid[j / rez][i / rez].val == "b":
                fill(45, 80, 90)
            else:
                g = map(agrid[j / rez][i / rez].val, 0, 1, 0, 100)
                fill(122, 90, g)
            rect(i, j, rez, rez)
            textAlign(CENTER, CENTER)
            fill(0,0,100)
            textSize(22)
            pushMatrix()
            translate(rez / 2, rez / 2)
            if agrid[j / rez][i / rez].isDigit:
                text(agrid[j / rez][i / rez].val, i, j)
            else: text(agrid[j / rez][i / rez].pval, i, j)
            if agrid[j / rez][i / rez].isDigit:
                agrid[j / rez][i / rez].showDir(i,j)
            popMatrix()
    agrid = update(agrid)
    if iter ==100:
        noLoop()
    delay(500)
def mousePressed():
    redraw()
