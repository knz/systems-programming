import random
import math

w = [4,4,3,7,4,5,5,5,4,5,10]

def gen():
    x = [min(10, random.randint(8, 160)/8.0) for i in range(11)]
    n = random.randint(0,3)
    for i in range(n):
        p = random.randint(0, len(x)-1)
        x[p] = 1.0
    return x

def grade(v):
    Cbase = []
    Cextra = []
    for g in v:
        if g >= 6:
            Cextra.append(g-6)
        else:
            Cextra.append(0)

    #print(Cbase, Cextra)
    B = min(6*8, sum(v))/8
    Eavg =  sum((x*y for x,y in zip(Cextra, w))) / sum(w)
    E = math.floor(2 * Eavg)/2
    #print(B, E)


    if B < 6:
        g = B
    else:
        g = B + E
    g = round(2*g)/2
    return g
    rg = round(2*refgrade(v))/2
    if g > rg:
        return g
    else:
        return rg

def refgrade(v):
    #return sum(v)/len(v)
    return math.floor(2*sum( (x*y for x,y in zip(v, w) ) )/float(sum(w)))/2

for i in range(4000):
    x = gen()
    rg = refgrade(x)
    g = grade(x)
    print (rg, g, g-rg, x)
