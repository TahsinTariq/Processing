import os
import sys
import math


def get_seed(random_seed=''):
    max_seed = 1000000
    if random_seed == '':
        return int(random(0, max_seed))
    else:
        try:
            random_seed = int(random_seed)
            if random_seed < max_seed:
                return random_seed
            else:
                return random_seed - max_seed
        except:
            seed_list = [ord(x) for x in random_seed]
            random_seed = sum(seed_list)
            if random_seed < max_seed:
                return random_seed
            else:
                return random_seed - max_seed

def set_seed(random_seed=0):
    from random import seed
    random_seed = int(random_seed)
    seed(random_seed) # This only applys to the Python random functions
    randomSeed(random_seed) # This only applys to the Processing random functions

def save_frame_timestamp(filename, timestamp='', random_seed=000, output_dir='output'):
    '''Saves each frame with a structured filename to allow for tracking all output'''
    filename = filename.replace('\\', '')
    filename = filename.replace('/', '')
    output_filename = os.path.join(output_dir, '{}_{}_{}_####.png'.format(timestamp, filename, random_seed))
    saveFrame(output_filename)
    print(output_filename)


def save_timestamp(filename, timestamp='', output_dir='output'):
    '''Saves image with a structured filename to allow for tracking all output'''
    filename = filename.replace('\\', '')
    filename = filename.replace('/', '')
    output_filename = os.path.join(output_dir, '{}_{}_####.png'.format(timestamp, filename))
    save(output_filename)
    print(output_filename)


def random_list_value(val_list):
    '''Returns a random value from a list'''
    index = int(random(0, len(val_list)))
    value = val_list[index]
    return value


def random_centered(value_og, offset=5):
    '''Randomly varies value_og within the offset range'''
    value = random(value_og-offset, value_og+offset)
    return value


def random_gaussian_limit(min_val, max_val):
    '''Same as built-in randomGaussian but truncated to within a range'''
    new_val = max_val*randomGaussian()+min_val
    if new_val < min_val:
        new_val = min_val
    elif new_val > max_val:
        new_val = max_val
    return new_val


def circle_points(origin_x, origin_y, r=50, a=0):
    '''Returns cartesian coordinates given a circle origin, radius, and angle'''
    x = origin_x + (r * cos(a))
    y = origin_y + (r * sin(a))
    return x, y

def circle_points_list(origin_x, origin_y, r=50, a=0):
    '''Returns cartesian coordinates given a circle origin, radius, and angle'''
    x = origin_x + (r * cos(a))
    y = origin_y + (r * sin(a))
    return [x, y]

def range_float(start_val, end_val, inc_val):
    '''
    Allows for similar functionality to built-in range() but with float step values
    Adapted from http://code.activestate.com/recipes/66472/
    '''
    start_val = float(start_val)
    end_val = float(end_val)
    inc_val = float(inc_val)

    count = int(math.ceil((end_val - start_val) / inc_val))

    L = [None,] * count

    L[0] = start_val
    for i in xrange(1,count):
        L[i] = L[i-1] + inc_val
    return L

def push():
    pushMatrix()
    pushStyle()

def pop():
    popMatrix()
    popStyle()
