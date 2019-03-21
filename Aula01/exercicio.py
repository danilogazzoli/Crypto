# _*_ coding: utf-8 _*_
print "------Exercicio 1 ----------------"
alphabet_size= 26

try:
    try:
        
        arq = open('misterio.txt', 'r').read()
        print arq
        for linha in arq:
            print linha

    finally:
        arq.close()  
except:
    print "Deu um erro ao tentar abrir o arquivo."