import numpy as np
import sys

alphabet_size = 26

#Frequencia de letras: portugues!
pfreq = [ 0.1463, 0.0104, 0.0388, 0.0499, 0.1257, 0.0102, 
          0.0130, 0.0128, 0.0618, 0.0040, 0.0002, 0.0278, 
          0.0474, 0.0505, 0.1073, 0.0252, 0.0120, 0.0653, 
          0.0781, 0.0434, 0.0463, 0.0167, 0.0001, 0.0021, 
          0.0001, 0.0047 ]

#Frequencia de letras: ingles!
ifreq = [ 0.0817, 0.0149, 0.0278, 0.0425, 0.1270, 0.0223, 
          0.0202, 0.0610, 0.0697, 0.0015, 0.0077, 0.0403, 
          0.0241, 0.0675, 0.0751, 0.0193, 0.0010, 0.0599, 
          0.0633, 0.0906, 0.0276, 0.0098, 0.0236, 0.0015, 
          0.0197, 0.0007 ]

#--------------------------------------------
#Descrever o que faz: ...
def matching (freq):
   best_fit = 1e100
   best_rotate = 0
   Sum = sum(elem for elem in freq)
   for rotate in xrange(0, alphabet_size, 1):
      fit = 0
      for i in xrange(0, alphabet_size, 1):
         d = float(freq[(i + rotate) % alphabet_size])/float(Sum) - pfreq[i]
         fit += (d * d)/pfreq[i]
      if fit < best_fit:
         best_fit = fit
         best_rotate = rotate
   return best_rotate

#--------------------------------------------
#Descrever o que faz: ...
def freq_every_nth (msg, interval):
   accu = alphabet_size * [0]
   key = ""
   for j in xrange(0, interval, 1):
      freq = alphabet_size * [0]
      for i in xrange(j, len(msg), interval):
         freq[ord(msg[i].lower())-ord('a')] += 1
      rotate = matching (freq);
      key = key + chr(rotate + ord('a'))
      for i in xrange(0, alphabet_size, 1):
         accu[i] += freq[(i + rotate) % alphabet_size];
 
   Sum = sum(elem for elem in accu)
 
   ret = 0
   for i in xrange(0, alphabet_size, 1):
      d = float(accu[i])/float(Sum) - pfreq[i];
      ret += (d*d)/pfreq[i];
 
   return ret, key
 
#--------------------------------------------
txt = []

with open(sys.argv[1]) as file:
   for line in file:
      line = line.rstrip()
      for character in line:
         if character is not ' ' and character is not '\n':
            txt.append (character)  

best_fit = 1e100;

for interval in xrange(1, 30, 1):
   fit, key = freq_every_nth (txt, interval);
   print ('Fitness: ', "{0:.7f}".format(fit), ', Tamanho: ', "{0:2d}".format(len(key)), ', Chave: ', key),
   if fit < best_fit:
      best_fit = fit;
      print ('<--- melhor no momento!');
   else:
      print ('');
