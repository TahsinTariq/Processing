from block_VIA import *
grid = [
    [0,  0,  0, "p"],
    [0, 'b', 0, "n"],
    [0,  0,  0,  0]
]
def settings():
    global grid, w, h, rez
    rez = 100
    h = len(grid)*rez
    w = len(grid[0])*rez
    size(w, h)
def setup():
    global agrid
    agrid = []
    for i in range(len(grid)):
        agrid.append([])
        for j in range(len(grid[0])):
            agrid[i].append(block(grid[i][j]))
def draw():
    global agrid
    # print(str(grid))
    for i in range(0, w, rez):
        for j in range(0, h, rez):
            fill(random(255))
            if agrid[j/rez][i/rez].val =="p":
                fill(0,0, 255)
            elif agrid[j/rez][i/rez].val =="n":
                fill(255,0,0)
            elif agrid[j/rez][i/rez].val =="b":
                fill(150,150,250)
            else:
                g = map(agrid[j/rez][i/rez].val, 0,1, 0,255) 
                fill(0,g,0)
            rect(i, j, rez, rez)
            textAlign(CENTER, CENTER)
            fill(255)
            textSize(26)
            pushMatrix()
            translate(rez/2, rez/2)
            text(agrid[j/rez][i/rez].val, i, j)
            popMatrix()
    agrid = update(agrid)
    
def update(agrid):
    temp = agrid
    l = 0.9
    for i in range(len(temp)):
        for j in range(len(temp[0])):
            if isinstance(temp[i][j].val, (int, float)):
                temp[i][j].pval = temp[i][j].val
                c = 0
                # temp[i][j].val = random(1)
                for k in range(-1, 2):
                    for l in range(-1, 2):
                        if k != l or k==-1 and l == 1 or k == 1 and l == -1:   
                            try:
                                c = max(c, bellman(temp[i][j].pval))
                            except:
                                pass
                temp[i][j].val = c
                
    return temp
            
def bellman(T, current, l, side):
    return T + (current + l * side)
             
