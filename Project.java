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

public static void MedianCalculating(long[] array){
    int length=array.length;
    if (length% 2==0){
        return (array[length / 2] + array[length / 2 - 1]) / 2.0;
    } else {
        return array[length / 2];
    }
}

public static String ConvertingDecimalToBinary(long num) {
    if (num == 0)
        return "0";
    String result = "";
    while (num > 0) {
        long remainder = num % 2;
        if (remainder < 10)
            result = remainder + result;
        num /=2;
    }
    return result;
}
public static double AvarageNumberCalculating(long[] array) {
    long sum = 0;
    for (long num : array) {
        sum += num;
    }
    return (double) sum / array.length;
}
} 
