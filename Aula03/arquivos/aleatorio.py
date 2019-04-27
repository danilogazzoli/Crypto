import numpy as np

nnext=12345

def aleatorio ():
   global nnext
   nnext = (1103515245 * nnext + 12345) & 0x7fffffff
   return nnext

def semente (seed):
   global nnext
   nnext = seed

for n in xrange(10):
   print ('Posicao: ', n, ' numero aleatorio: ', aleatorio())
