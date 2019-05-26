/*Author: Rodrigo Minetto!*/
#include <stdio.h>
#include <math.h>
#include <time.h>

typedef long long int ulong;

/*Fast modular exponentiation: {q^x mod n}*/
ulong Square_Multiply (ulong q, ulong x, ulong n){
   ulong r = 1;
   while (x > 0) {
      if ((x % 2) == 1) {
         r = (r * q) % n; /*Multiply (MUL)*/
         if (r < 0) { printf("overflow"); }
      }
      x /= 2;
      q = (q * q) % n; /*Square (SQ)*/
      if (q < 0) { printf("overflow"); }
   }
   return r;
}

/*Extended euclidean algorithm: {m*a + n*b = d -> mdc or gdc}!*/
ulong Extended_Euclides (ulong m, ulong n, ulong *a, ulong *b) {
  ulong d;
  if (n == 0) {
    *a = 1;
    *b = 0;
    return m;
  }
  else {
    d = Extended_Euclides (n, m % n, a, b);
    ulong e = *a, f = *b;
    *a = f;
    *b = e - f*(m/n);
    return d;
  }
}

int main () {

   srand(time(NULL));

   /*Escolha dois primos p e q!*/   
   ulong p = 11;  /*Exemplo da aula*/
   //ulong p = 7867;
   ulong q = 13; /*Exemplo da aula*/
   //ulong q = 5701;
   ulong n = p * q;
   ulong phi = (p - 1) * (q - 1);
   
   /*Choosing public exponent e*/
   ulong e, x, y, mdc;
   do {
      //e = rand() % (phi - 1) + 1; 
      e = 7; /*Exemplo da aula*/
      mdc = Extended_Euclides (phi, e, &x, &y);
   } while (mdc != 1);

   ulong d = y % phi;
   while (d < 0) { d += phi; }

   printf("Chave pública (%lld,%lld) - Chave privada: (%lld,%lld)\n", e, n, d, n);


	//exercicio 02

    ulong sign_x, xl;
	e = 131; 
	n = 9797;

	sign_x = 6292;
	x = 123;
	xl = Square_Multiply(sign_x, e, n);
	if (xl == x){printf("A opcao A eh verdadeira! \n");}

	sign_x = 4768;
	x = 4333;
	xl = Square_Multiply(sign_x, e, n);
	if (xl == x){printf("A opcao B eh verdadeira! \n");}

	sign_x = 1424;
	x = 4333;
	xl = Square_Multiply(sign_x, e, n);
	if (xl == x){printf("A opcao C eh verdadeira! \n");}



   

   return 0;
}





