from math import atan2, degrees
from collections import namedtuple


class Point:
    def __init__(self, x, y):
        self.x, self.y = float(x), float(y)

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __ne__(self, other):
        return not self == other

    def __gt__(self, other):
        if self.x > other.x:
            return True
        elif self.x == other.x:
            return self.y > other.y
        return False

    def __lt__(self, other):
        return not self > other

    def __ge__(self, other):
        if self.x > other.x:
            return True
        elif self.x == other.x:
            return self.y >= other.y
        return False

    def __le__(self, other):
        if self.x < other.x:
            return True
        elif self.x == other.x:
            return self.y <= other.y
        return False

    def __add__(self, other):
        return Point(self.x+other.x, self.y+other.y)

    def __sub__(self, other):
        return Point(self.x-other.x, self.y-other.y)

    def __truediv__(self, other):
        return Point(self.x/other, self.y/other)

    def __repr__(self):
        return (self.x, self.y)

    def __hash__(self):
        return hash(self.x)


def _construct_points(list_of_tuples):
    points = []
    if list_of_tuples:
        for p in list_of_tuples:
            try:
                points.append(Point(p[0], p[1]))
            except (IndexError, TypeError):
                print(
                    "Ignoring deformed point "+ p+". All points must have at least 2 coordinates."
                )
    return points


def _validate_input(points):
    if not points:
        raise ValueError("Expecting a list of points but got "+points)

    if isinstance(points, set):
        points = list(points)

    try:
        if hasattr(points, "__iter__") and not isinstance(points[0], Point):
            if isinstance(points[0], (list, tuple)):
                points = _construct_points(points)
            else:
                raise ValueError(
                    "Expecting an iterable of type Point, list or tuple. "
                    "Found objects of type "+ type(points[0])+" instead"
                )
        elif not hasattr(points, "__iter__"):
            raise ValueError(
                "Expecting an iterable object but got an non-iterable type "+points)
    except TypeError:
        print("Expecting an iterable of type Point, list or tuple.")
        raise

    return points


def _det(a, b, c):
    det = (a.x * b.y + b.x * c.y + c.x * a.y) - (a.y * b.x + b.y * c.x + c.y * a.x)
    return det

def _angle(a, b, c):
    return degrees(atan2( c.y - b.y,  c.x - b.x) - atan2(a.y - b.y, a.x - b.x));

def convex_hull_recursive(points):

    points = sorted(_validate_input(points))
    n = len(points)

    left_most_point = points[0]
    right_most_point = points[n - 1]

    convex_set = {left_most_point, right_most_point}
    upper_hull = []
    lower_hull = []

    for i in range(1, n - 1):
        det = _det(left_most_point, right_most_point, points[i])

        if det > 0:
            upper_hull.append(points[i])
        elif det < 0:
            lower_hull.append(points[i])

    _construct_hull(upper_hull, left_most_point, right_most_point, convex_set)
    _construct_hull(lower_hull, right_most_point, left_most_point, convex_set)

    return sorted(convex_set)


def _construct_hull(points, left, right, convex_set):
    if points:
        extreme_point = None
        extreme_point_distance = float("-inf")
        candidate_points = []

        for p in points:
            det = _det(left, right, p)

            if det > 0:
                candidate_points.append(p)

                if det > extreme_point_distance:
                    extreme_point_distance = det
                    extreme_point = p

        if extreme_point:
            _construct_hull(candidate_points, left, extreme_point, convex_set)
            convex_set.add(extreme_point)
            _construct_hull(candidate_points, extreme_point, right, convex_set)

class Triangle:

    def __init__(self, a, b, c):
        self.a, self.b, self.c = sorted((a, b, c))
        self.x, self.y ,self.r = 0,0,0

    def __repr__(self):
        return (self.a, self.b, self.c)

    def isCoincident(self):
        return self.a == self.b or self.b == self.c or self.c == self.a

    def area(self):
        area = 0.5*((self.b.x-self.a.x)*(self.c.y-self.b.y)-(self.b.y-self.a.y)*(self.c.x-self.b.x))
        if ( area == 0 ):
            print('Failed: points are either collinear or not distinct')
            return 0
        return area

    def inCircle(self, p):
        """
            returns boolean whether the Point p is inside the circumCircle of the triangle
        """
        # if self.isCoincident():
        #     return False
        # a = self.a - p
        # b = self.b - p
        # c = self.c - p
        # val = (
        #         (a.x*a.x + a.y*a.y) * (b.x*c.y-c.x*b.y) -
        #         (b.x*b.x + b.y*b.y) * (a.x*c.y-c.x*a.y) +
        #         (c.x*c.x + c.y*c.y) * (a.x*b.y-b.x*a.y)
        #     )
        # print(val)
        # return val >= 0
        return dist(p.x, p.y, self.x, self.y)<=self.r

    def circumCircle(self):
        """
            returns the center and the radius of the circumCircle of the triangle
        """
        circle = namedtuple('circle', ['x', 'y', 'r'])
        a,b,c = self.a, self.b, self.c
        d = 2 * (a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y))
        ua = ((a.x * a.x + a.y * a.y) * (b.y - c.y) + (b.x * b.x + b.y * b.y) * (c.y - a.y) + (c.x * c.x + c.y * c.y) * (a.y - b.y)) / d
        ub = ((a.x * a.x + a.y * a.y) * (c.x - b.x) + (b.x * b.x + b.y * b.y) * (a.x - c.x) + (c.x * c.x + c.y * c.y) * (b.x - a.x)) / d
        # cir = circle(ua, ub, d)
        # return cir

        A = self.area()
        x = ua
        y = ub
        # xnum = ((c.y - a.y)*(b.y - a.y)*(c.y - b.y)) - ((b.x**2 - a.x**2)*(c.y - b.y)) + ((c.x**2 - b.x**2)*(b.y - a.y))
        # x = xnum/(-4*A)
        # y =  (-1*(b.x - a.x)/(b.y - a.y))*(x-0.5*(a.x + b.x)) + 0.5*(a.y + b.y)
        den = 4*A
        num = ( (((b.x-a.x)**2) + ((b.y-a.y)**2)) * (((c.x-b.x)**2)+((c.y-b.y)**2)) * (((a.x-c.x)**2)+((a.y-c.y)**2)) )**(0.5)
        R = abs(num/den)
        self.x, self.y ,self.r = x,y,R
        cir = circle(x,y,R)
        return cir

    def sharesVertex(self, t):
        return self.a == t.a or self.b == t.b or self.c == t.c


class Edge:

    def __init__(self, a, b):
        self.a, self.b = a, b

    def __ne__(self, other):
        return other != None

    def __eq__(self, other):
        return other == None

    def __repr__(self):
        return (self.a, self.b)

    def isCoincident(self):
        return self.a == self.b

# class Triangulate:

def compare(p1, p2):
    if p1 == p2:
        return 0
    elif p1 > p2:
        return 1
    else: return -1





def triangulate(pxyz):
    # sort vertex array in increasing x values
    pxyz =sorted(_validate_input(pxyz))
    """
        Find the maximum and minimum vertex bounds.
        This is to allow calculation of the bounding triangle
    """
    Max = Point(-float('inf'),-float('inf'))
    Min = Point(float('inf'),float('inf'))
    for p in pxyz:
        Max.x = max(Max.x, p.x)
        Max.y = max(Max.y, p.y)
        Min.x = min(Min.x, p.x)
        Min.y = min(Min.y, p.y)

    diff = Max - Min
    dmax = max(diff.x, diff.y)
    mid = (Max+Min)/2

    """
        Set up the supertriangle
        This is a triangle which encompasses all the sample points.
        The supertriangle coordinates are added to the end of the
        vertex list. The supertriangle is the first triangle in
        the triangle list.
    """
    # for the Triangles
    triangles = []
    # for complete Triangles
    complete = []

    a = Point(mid.x - 2 * dmax, mid.y - dmax)
    b = Point(mid.x, mid.y + 2 * dmax)
    c = Point(mid.x + 2 * dmax, mid.y - dmax)
    superTriangle = Triangle(a,b,c)
    triangles.append(superTriangle)

    # edge = []
    for p in pxyz:
        edges = []

        """
            Set up the edge buffer.
            If the point (xp,yp) lies inside the circumcircle then the
            three edges of that triangle are added to the edge buffer
            and that triangle is removed.
        """
        print('triangles : '+triangles)
        print('p : '+p)

        for t in triangles:
            if t in complete:
                continue
            # print(t)
            cir = t.circumCircle()
            print('cir : '+cir)
            if (cir.x+cir.r > p.x):
                complete.append(t)
            if t.inCircle(p):
                edges.append(Edge(t.a, t.b))
                edges.append(Edge(t.b, t.c))
                edges.append(Edge(t.c, t.a))
                triangles.remove(t)
        """
            Tag multiple edges
            Note: if all triangles are specified anticlockwise then all
            interior edges are opposite pointing in direction.
        """
        print('complete : '+ complete)
        print('edges : '+ edges)
        temp = -1
        for e1 in edges[:-1]:
            for e2 in edges[1:]:
                # print(e1,e2)
                if e1!= None or e2!=None:
                # if e1.b!= None or e2.b !=None:
                    if e1.a == e2.b and e1.b == e2.a:
                        # try:
                        edges[edges.index(e1)] = None
                        edges[edges.index(e2)] = None
                        # except:
                        #     pass
                    if e1.a == e2.a and e1.b == e2.b:
                        # try:
                        edges[edges.index(e1)] = None
                        edges[edges.index(e2)] = None
                        # except:
                        #     pass

        """
            Form new triangles for the current point
            Skipping over any tagged edges.
            All edges are arranged in clockwise order.
        """
        for e in edges:
            if e == None:
                continue
            triangles.append(Triangle(e.a, e.b, p))
        print('\n')

    # Remove triangles with supertriangle vertices
    for t in triangles[:-1]:
        if t.sharesVertex(superTriangle):
            triangles.remove(t)

    return triangles














# def main():
#     points = [
#         (0, 3),
#         (2, 2),
#         (1, 1),
#         (2, 1),
#         (3, 0),
#         (0, 0),
#         (3, 3),
#         (2, -1),
#         (2, -4),
#         (1, -3),
#     ]
#     # results_recursive = convex_hull_recursive(points)
#     # print(results_recursive)

#     a = Point(0,2)
#     b = Point(-2,0)
#     c = Point(2,0)
#     t = Triangle(a,b,c)
#     # print(_angle(a,b,c))
#     p = Point(1, 0)
#     # val = t.inCircle(p)
#     val = t.circumCircle()
#     print(val)
#     # print(points)
#     # t = triangulate(points)
#     # print(t)

# if __name__ == "__main__":
#     main()
