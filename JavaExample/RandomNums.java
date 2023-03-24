package JavaExample;

import java.util.Random;

public class RandomNums {
    public static void main(String[] args) {
        Random r = new Random();
        int randomInt;
        for (int i=1; i<=5; i++) {
            randomInt = r.nextInt(100 + 100) - 100 + 1;
            System.out.print(randomInt + ", ");
        }
    }
}
