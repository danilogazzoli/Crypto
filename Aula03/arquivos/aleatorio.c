#include <stdio.h>

static unsigned long long next = 12345;

int aleatorio (void) {
  next = (next * 1103515245 + 12345) & 0x7fffffff;
  return next;
}

void semente (unsigned seed) {
  next = seed;
}

int main () {

  int i;
  for (i = 0; i < 10; i++) {
     printf("Posicao: %d, numero aleatorio: %d\n", i, aleatorio());
  }

  return 0;
}

