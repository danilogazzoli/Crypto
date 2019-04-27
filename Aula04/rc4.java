import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class rc4 {

    public static int i = 0;

    public static int j = 0;

    public static void KSA (char K[], int M, char S[], int N) {
       /*???*/
    }

    public static char PRGA (char S[], int N) {
       /*???*/
    }

    public static void main(String[] args) {
       File file = new File(args[0]);
       if (!file.exists()) {
          System.out.println(args[0] + " does not exist.");
          return;
       }
       if (!(file.isFile() && file.canRead())) {
          System.out.println(file.getName() + " cannot be read from.");
          return;
       }
       try {
          FileInputStream fis = new FileInputStream(file);
          char current;
          int N = 256;
          char K[] = new char[7];
          K[0] = 'r'; K[1] = 'o'; K[2] = 'd'; K[3] = 'r'; K[4] = 'i'; K[5] = 'g'; K[6] = 'o';
          char S[] = new char[256];
          /*???*/
          while (fis.available() > 0) {
             current = (char) fis.read();
             /*Nao modifique o intervalo do caractere em current, nem trate espacos ou nova linha!*/
             /*???*/
          }
       } catch (IOException e) {
          e.printStackTrace();
       }
    } 
}

