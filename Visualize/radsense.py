#sens1 = (10, 'n')
#sens2 = (5, 's')
#sens3 = (8, 'e')
#sens4 = (12, 'w')

from radgenerator import rad_gen

def finder(n, s, e, w):
    half = max(n[0], s[0], e[0], w[0])

    if half == n[0]:
        hi = n
        second = max(e[0], w[0])
        if second == e[0]:
            hi2 = e
            quad = 1
        elif second == w[0]:
            hi2 = w
            quad = 2
    elif half == s[0]:
        hi = s
        second = max(e[0], w[0])
        if second == e[0]:
            hi2 = e
            quad = 4
        elif second == w[0]:
            hi2 = w
            quad = 3
    elif half == e[0]:
        hi = e
        second = max(n[0], s[0])
        if second == n[0]:
            hi2 = n
            quad = 1
        elif second == s[0]:
            hi2 = s
            quad = 4
    elif half == w[0]:
        hi = w
        second = max(n[0], s[0])
        if second == n[0]:
            hi2 = n
            quad = 2
        elif second == s[0]:
            hi2 = s
            quad = 3

    total = hi[0] + hi2[0]
    percentage = hi[0]/total

    if quad == 1:
        base = 90
    elif quad == 2:
        base = 180
    elif quad == 3:
        base = 270
    elif quad == 4:
        base = 360

    angle = percentage * base

    print("Highest Value: " + str(hi) + "\n",
    "Second Highest: " + str(hi2) + "\n",
    "Quadrant: " + str(quad) + "\n",
    "Percentage towards highest: " + str(percentage) + "\n",
    "Angle: " + str(angle) + "\n")

for i in rad_gen():
    sens1 = (i[0], 'n')
    sens2 = (i[1], 's')
    sens3 = (i[2], 'e')
    sens4 = (i[3], 'w')
    finder(sens1, sens2, sens3, sens4)
    input()
