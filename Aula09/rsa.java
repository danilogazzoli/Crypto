import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class rsa {

    /*Fast modular exponentiation: {q^x mod n}*/
    public static long Square_Multiply (long q, long x, long n){
       long r = 1;
       while (x > 0) {
          if ((x % 2) == 1) {
             r = (r * q) % n; /*Multiply (MUL)*/
             if (r < 0) { System.out.printf("overflow\n"); }
          }
          x /= 2;
          q = (q * q) % n; /*Square (SQ)*/
          if (q < 0) { System.out.printf("overflow\n"); }
       }
       return r;
    }

    public static long[] Extended_Euclides (long m, long n) {
       if (n == 0)
          return new long[] {m, 1, 0};

       long[] vals = Extended_Euclides (n, m % n);
       long d = vals[0];
       long e = vals[1];
       long f = vals[2];
       long a = f;
       long b = e - f * (m/n);
       return new long[] {d, a, b};
    }


    public static void main(String[] args) {
       Random ran = new Random(); 
       /*Escolha dois primos p e q!*/
       //long p = 3;   /*Exemplo da aula!*/
       long p = 7867;   
       //long q = 11; /*Exemplo da aula!*/ 
       long q = 5701; 
       long n = p * q;
       long phi = (p - 1) * (q - 1);
       long e, x, y, mdc;
       do {
          e = ran.nextInt(Integer.SIZE - 1) % (phi - 1) + 1;
          //e = 3; /*Exemplo da aula!*/
          long vals[] = Extended_Euclides (phi, e);
          mdc = vals[0]; 
          x = vals[1]; 
          y = vals[2]; 
       } while (mdc != 1);

       long d = y % phi;
       while (d < 0) { d += phi; }

       System.out.printf("Chave pública (%d,%d) - Chave privada: (%d,%d)\n", e, n, d, n);
    } 
}

