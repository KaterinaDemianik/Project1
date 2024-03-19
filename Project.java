import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
public class Project{
    public static void main(String [] args){  
        try {
        Scanner scanner = new Scanner(new File("/Users/katerina/Documents/GitHub/Project1/TextFile.txt")); 
        String input=scanner.nextLine();
        String [] dividedNumbersString=input.split(" ");
        String binaryStringSave="";
        long[] numbers = new long[dividedNumbersString.length];
            for (int i = 0; i < dividedNumbersString.length; i++) {
        String str = dividedNumbersString[i];

        boolean isNegative = str.startsWith("-");
            long num = 0;
            boolean value = true;
            for (int j = (isNegative ? 1 : 0); j < str.length(); j++) {
                char ch = str.charAt(j);
                if (ch >= '0' && ch <= '9') {
                    num = num * 10 + (ch - '0');
                }
            }
            if (value) {
                numbers[i] = isNegative ? -num : num;
                binaryStringSave += decimalToBinNegative(numbers[i]) + " ";
            }
        }

    System.out.println("Двійковий рядок:");
    System.out.println(binaryStringSave);
    bubbleSort(numbers);
    System.out.println("Відсортований двійковий рядок:");
    for (long num : numbers) {
    System.out.print(decimalToBinNegative(num) + " ");
}
    System.out.println("\nМедіана: " + MedianCalculating(numbers));
    System.out.println("Середнє арифметичне: " + AvarageNumberCalculating(numbers));
} catch (FileNotFoundException e) {
    System.out.println("Файл 'input.txt' не знайдено.");
    e.printStackTrace();
}
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

public static double MedianCalculating(long[] array){
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
public static String decimalToBinNegative(long num) {
    if (num < 0)
        return "-" + decimalToBinNegative(-num);
    else
        return ConvertingDecimalToBinary(num);
} 
public static int convertToDecimal(String input, int base) {
    int value = 0;
    int length = input.length();

    for (int i = 0; i < length; i++) {
        char digitChar = input.charAt(length - i - 1);
        int digitValue;

        if (Character.isDigit(digitChar)) {
            digitValue = digitChar - '0';

        } else {
            digitValue = 10 + digitChar - 'a';
        }
        value += digitValue * Math.pow(base, i);
    }

    return value;
}
} 
