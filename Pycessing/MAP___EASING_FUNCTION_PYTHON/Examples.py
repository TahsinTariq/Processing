# # /* The map2() function supports the following easing types */
# LINEAR = 0
# QUADRATIC = 1
# CUBIC = 2
# QUARTIC = 3
# QUINTIC = 4
# SINUSOIDAL = 5
# EXPONENTIAL = 6
# CIRCULAR = 7
# SQRT = 8

# # /* When the easing is applied (in, out, or both) */
# EASE_IN = 0
# EASE_OUT = 1
# EASE_IN_OUT = 2

# # /*
# #  * A map() replacement that allows for specifying easing curves
# #  * with arbitrary exponents.
# #  *
# #  * value :   The value to map
# #  * start1:   The lower limit of the input range
# #  * stop1 :   The upper limit of the input range
# #  * start2:   The lower limit of the output range
# #  * stop2 :   The upper limit of the output range
# #  * type  :   The type of easing (see above)
# #  * when  :   One of EASE_IN, EASE_OUT, or EASE_IN_OUT
# #  */
# def map2(value, start1, stop1, start2, stop2, type, when):
#     b = start2
#     c = stop2 - start2
#     t = value - start1
#     d = stop1 - start1
#     p = 0.5
#     if type == LINEAR:
#         return c * t / d + b
#     elif type == SQRT:
#         if (when == EASE_IN):
#             t /= d
#             return c * pow(t, p) + b
#         elif (when == EASE_OUT):
#             t /= d
#             return c * (1 - pow(1 - t, p)) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * pow(t, p) + b
#             return c / 2 * (2 - pow(2 - t, p)) + b
#     elif type == QUADRATIC:
#         if (when == EASE_IN):
#             t /= d
#             return c * t * t + b
#         elif (when == EASE_OUT):
#             t /= d
#             return -c * t * (t - 2) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * t * t + b
#             t-=1
#             return -c / 2 * (t * (t - 2) - 1) + b

#     elif type == CUBIC:
#         if (when == EASE_IN):
#             t /= d
#             return c * t * t * t + b
#         elif (when == EASE_OUT):
#             t /= d
#             t-=1
#             return c * (t * t * t + 1) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * t * t * t + b
#             t -= 2
#             return c / 2 * (t * t * t + 2) + b

#     elif type == QUARTIC:
#         if (when == EASE_IN):
#             t /= d
#             return c * t * t * t * t + b
#         elif (when == EASE_OUT):
#             t /= d
#             t-=1
#             return -c * (t * t * t * t - 1) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * t * t * t * t + b
#             t -= 2
#             return -c / 2 * (t * t * t * t - 2) + b

#     elif type == QUINTIC:
#         if (when == EASE_IN):
#             t /= d
#             return c * t * t * t * t * t + b
#         elif (when == EASE_OUT):
#             t /= d
#             t-=1
#             return c * (t * t * t * t * t + 1) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * t * t * t * t * t + b
#             t -= 2
#             return c / 2 * (t * t * t * t * t + 2) + b

#     elif type == SINUSOIDAL:
#         if (when == EASE_IN):
#             return -c * cos(t / d * (PI / 2)) + c + b
#         elif (when == EASE_OUT):
#             return c * sin(t / d * (PI / 2)) + b
#         elif (when == EASE_IN_OUT):
#             return -c / 2 * (cos(PI * t / d) - 1) + b

#     elif type == EXPONENTIAL:
#         if (when == EASE_IN):
#             return c * pow(2, 10 * (t / d - 1)) + b
#         elif (when == EASE_OUT):
#             return c * (-pow(2, -10 * t / d) + 1) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return c / 2 * pow(2, 10 * (t - 1)) + b
#             t-=1
#             return c / 2 * (-pow(2, -10 * t) + 2) + b

#     elif type == CIRCULAR:
#         if (when == EASE_IN):
#             t /= d
#             return -c * (sqrt(1 - t * t) - 1) + b
#         elif (when == EASE_OUT):
#             t /= d
#             t-=1
#             return c * sqrt(1 - t * t) + b
#         elif (when == EASE_IN_OUT):
#             t /= d / 2
#             if (t < 1):
#                 return -c / 2 * (sqrt(1 - t * t) - 1) + b
#             t -= 2
#             return c / 2 * (sqrt(1 - t * t) + 1) + b


#     return 0


# # /*
# #  * A map() replacement that allows for specifying easing curves
# #  * with arbitrary exponents.
# #  *
# #  * value :   The value to map
# #  * start1:   The lower limit of the input range
# #  * stop1 :   The upper limit of the input range
# #  * start2:   The lower limit of the output range
# #  * stop2 :   The upper limit of the output range
# #  * v     :   The exponent value (e.g., 0.5, 0.1, 0.3)
# #  * when  :   One of EASE_IN, EASE_OUT, or EASE_IN_OUT
# #  */
# def map3( value,  start1,  stop1,  start2,  stop2,  v,  when):
#     b = start2
#     c = stop2 - start2
#     t = value - start1
#     d = stop1 - start1
#     p = v
#     out = 0
#     if (when == EASE_IN):
#         t /= d
#         out = c*pow(t, p) + b
#     elif (when == EASE_OUT):
#         t /= d
#         out = c * (1 - pow(1 - t, p)) + b
#     elif (when == EASE_IN_OUT):
#         t /= d/2
#         if (t < 1):
#             return c/2*pow(t, p) + b
#         out = c/2 * (2 - pow(2 - t, p)) + b

#         return out
