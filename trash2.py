E1 = 400 - 700j
E2 = -410 - 390j
E3 = -700 + 610j
J5 = -2 + 2j
z1 = 0
z2 = -1j/(1000 * 33.3 * 10 ** (-6))
z3 = 30
z4 = 90
z5 = 20 + 90j
z6 = 90 - 100j
I1 = -2 + 2j
"""print(f'z4 + z3 = {z4} + {z3} = {z4 + z3}')
print(f'E2 + I1 * z6 = {E2} + {I1 * z6} = {E2 + I1 * z6}')
print(f'E1 * z4 = {E1} * {z4} = {E1 * z4}')
print(f'E3 * z4 = {E3} * {z4} = {E3 * z4}')
print(f'z2 + z4 + z6 = {z2} + {z4} + {z6} = {z2 + z4 + z6}')
print(f'z4 ^ 2 = {z4} ^ 2 = {z4 * z4}')

"""
I3 = ((z4 + z3) * (E2 + I1 * z6) + E1 * z4 + E3 * z4) / ((z2 + z4 + z6) * (z3 + z4) - z4 * z4)
I2 = (E3 + E1 + I3 * z4) / (z4 + z3)
#print(f'E3 + E1 + I33 * z4 = {E3} + {E1} + {I3} * {z4} = {E3 + E1 + I3 * z4}')


from math import *

###

I1 = -2 + 2j
I2 = -4 - 3j
I3 = -2 - 3j

i1 = I2 - I1
i2 = I3
i3 = I2
i4 = I2 - I3
i5 = I1
i6 = I1 - I3



U = i5 * z5 + i2 * z2 + i3 * z3 - E2 - E3

I2_ = (E1 + E2 + E3 - I1 * (z2 + z3)) / (z6 + z2 + z3)

i6_ = I2_
i2_ = I2_ + I1


Uab = E2 - i6_ * z6 - i2_ * z2

r = ((z6 + z2) * z3) / (z6 + z2 + z3)
print(i4)
print(Uab / (r + z4))
"""print(i1)
print(i2)
print(i3)
print(i4)
print(i5)
print(i6)
print('---')
print(U)
print(E2)

iz6 = (90 - 100j) * (-7181.4-164336.3j) / 31307.8
iz2 = (-1j*(10**4) * (-69797-101720.7j) / (31307.8 * 333))
print(Uab)"""
#print(z2 * i2_, (-1017207000+697970000j) / 10425497.4)
print(Uab / (r + z4))