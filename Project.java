import java.util.Scanner;
public class Project{
    public static void main(String [] args){  
        Scanner scanner=new Scanner(System.in);
        System.out.println("Введіть рядок цілих чисел*(через пробіл)");
        String input=scanner.nextLine();
        String [] divideNumbersString=input.split(" ");
        String binaryStringSave="";
}

public static void bubbleSort(long[] array) {
    for (int i = 0; i < array.length - 1; i++) {
        for (int j = 0; j < array.length - i - 1; j++) {
            if (array[j] > array[j + 1]) {
                long temporary = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temporary;
            }
        }
    }
}

} 