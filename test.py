import math
from math import gcd
from Crypto.Util.number import long_to_bytes

# Given values
n = 95377480177653444486506355040399700497776075820208152508213343816258882303953
e1 = 65537
c1 = 44031676856116591884422505851415878139596481455242794174140087608927130463026
e2 = 3
c2 = 94559344477591808533837720951979825780592407074604523639320289251496313169352

def extended_gcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = extended_gcd(b % a, a)
        return (g, x - (b // a) * y, y)

def common_modulus_attack(c1, c2, e1, e2, n):
    # Check if exponents are coprime
    if gcd(e1, e2) != 1:
        raise ValueError("Exponents e1 and e2 must be coprime")
    
    # Get coefficients using extended Euclidean algorithm
    g, u, v = extended_gcd(e1, e2)
    
    # Handle negative exponents
    if u < 0:
        c1 = pow(c1, -1, n)
        term1 = pow(c1, -u, n)
    else:
        term1 = pow(c1, u, n)
    
    if v < 0:
        c2 = pow(c2, -1, n)
        term2 = pow(c2, -v, n)
    else:
        term2 = pow(c2, v, n)
    
    # Recover the original message
    m = (term1 * term2) % n
    return m

# Recover the message
try:
    m = common_modulus_attack(c1, c2, e1, e2, n)
    message = long_to_bytes(m)
    print("Recovered message:", message.decode())
except ValueError as e:
    print("Error:", e)
except:
    print("An error occurred during decryption")
