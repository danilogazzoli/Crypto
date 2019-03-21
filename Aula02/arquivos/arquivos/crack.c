#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

/*Frequência de letras: português!*/
const double pfreq[] = {
   0.1463, 0.0104, 0.0388, 0.0499, 0.1257, 0.0102, 
   0.0130, 0.0128, 0.0618, 0.0040, 0.0002, 0.0278, 
   0.0474, 0.0505, 0.1073, 0.0252, 0.0120, 0.0653, 
   0.0781, 0.0434, 0.0463, 0.0167, 0.0001, 0.0021, 
   0.0001, 0.0047 };

/*Frequência de letras: inglês!*/
const double ifreq[] = {
   0.0817, 0.0149, 0.0278, 0.0425, 0.1270, 0.0223, 
   0.0202, 0.0610, 0.0697, 0.0015, 0.0077, 0.0403, 
   0.0241, 0.0675, 0.0751, 0.0193, 0.0010, 0.0599, 
   0.0633, 0.0906, 0.0276, 0.0098, 0.0236, 0.0015, 
   0.0197, 0.0007 };

/*Descrever o que faz: ... */
int matching (const double *freq) {
    double sum = 0, fit, d, best_fit = 1e100;
    int i, rotate, best_rotate = 0;
    for (i = 0; i < 26; i++) {
        sum += freq[i];
    }   
    for (rotate = 0; rotate < 26; rotate++) {
        fit = 0;
        for (i = 0; i < 26; i++) {
            d = freq[(i + rotate) % 26] / sum - pfreq[i];
            fit += d * d / pfreq[i];
        }
        if (fit < best_fit) {
            best_fit = fit;
            best_rotate = rotate;
        }
    }
    return best_rotate;
}
 
/*Descrever o que faz: ... */
double freq_every_nth(const int *msg, int msg_size, int interval, char *key) {
   
   double sum, d, ret;
   double freq[26], accu[26] = {0};
   int i, j, rotate;
   
   for (j = 0; j < interval; j++) {
      for (i = 0; i < 26; i++) {
          freq[i] = 0;
      }   
      for (i = j; i < msg_size; i += interval) {
          freq[msg[i]]++;
      }
      key[j] = rotate = matching (freq);

      key[j] += 'a';

      for (i = 0; i < 26; i++) {
          accu[i] += freq[(i + rotate) % 26];
      }    
   }
 
   for (i = 0, sum = 0; i < 26; i++) {
      sum += accu[i];
   }   
 
   for (i = 0, ret = 0; i < 26; i++) {
      d = accu[i] / sum - pfreq[i];
      ret += d * d / pfreq[i];
   }
 
   key[interval] = '\0';
   return ret;
}
 
int main (int argc, char *argv[]) {

   /*Permite arquivos com no máximo 100.000 caracteres!*/
   int file_size = 100000;
   int txt[file_size];

   /*Leitura do arquivo de entrada: */
   FILE *ifile = fopen (argv[1], "r");
   /*Você pode usar assim também: */
   //FILE *ifile = fopen ("cifrado.txt", "r"); 

   int len = 0;
   while (!feof(ifile)) {
      char c;
      /*Lendo um caractere do arquivo!*/
      fscanf(ifile,"%c",&c); 
      if ( (c != ' ') && (c != '\n') ) { 
         /*Transformando: {a, b, c, ..., z} -> {0, 1, 2, ..., 25}*/
         txt[len++] = c - 'a';
      }
   }
 
   int interval;
   double fit, best_fit = 1e100;
   char key[100];
   /*?*/
   for (interval = 1; interval <= 30; interval++) {
      fit = freq_every_nth (txt, len, interval, key);
      printf("Fitness: %2.7f, Tamanho: %2d, Chave: %s", fit, interval, key);
      if (fit < best_fit) {
         best_fit = fit;
         printf(" <--- melhor até o momento");
      }
      printf("\n");
   }
   return 0;
}
