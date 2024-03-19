/*
Structure:
BaseProject- для обчислення медіани та середнього значення:
Головна ідея програми, метод ініціалізації змінних, виведення даних
Метод зчитування десяткових чисел
Метод конвертації десяткових чисел у бінарні
Метод сортуваня бінарного масиву злиттям(основна логіка)
Метод для злиття двох підмасивів сортування
Метод обчислення медіани відсортованого масиву бінарних чисел
Метод для обчислення середнього значення з цього ж масиву
Метод для повернення десяткового значення бінарного числа 
*/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
public class BaseProject {
    //Головний метод і ідея програми
    public static void main(String[] args) throws IOException {
        System.out.println("Введіть десяткові числа, розділені пробілом:");
        Long[] decimalNumbers = readDecimalNumbersFromInput();
        BinaryNumber[] binaryNumbers = convertToBinary(decimalNumbers);
        mergeSort(binaryNumbers, 0, binaryNumbers.length - 1);
        long median = calculateMedian(binaryNumbers);
        double average = calculateAverage(binaryNumbers);
        System.out.println("Результат:");
        System.out.println(median);
        System.out.println(average);
    }
     //Метод для зчитування десяткових чисел з консолі
     private static Long[] readDecimalNumbersFromInput() throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String line = reader.readLine();
        String[] tokens = line.trim().split("\\s+");
        Long[] decimalNumbers = new Long[tokens.length];
        for (int i = 0; i < tokens.length; i++) {
            try {
                decimalNumbers[i] = Long.parseLong(tokens[i]);
            } catch (NumberFormatException e) {
                // Ігноруємо некоректні числа
            }
        }
        return decimalNumbers;
    }

    private static BinaryNumber[] convertToBinary(Long[] decimalNumbers) {
        BinaryNumber[] binaryNumbers = new BinaryNumber[decimalNumbers.length];
        for (int i = 0; i < decimalNumbers.length; i++) {
            binaryNumbers[i] = new BinaryNumber(decimalNumbers[i]);{
                String binary = "";
                while (decimalNumbers[i] != 0) {
                    int remainder = (int) (decimalNumbers[i] % 2);
                    binary = remainder + binary;
                    decimalNumbers[i] /= 2;
                }
            }
        }
        return binaryNumbers;
    }
    
    //клас, який представляє бінарне число
    private static class BinaryNumber implements Comparable<BinaryNumber> {
        private final long value;

    //Конструктор, який створює об'єкт бінарного числа з десяткового числа
    public BinaryNumber(long decimalNumber) {
        this.value = Math.min(decimalNumber, Short.MAX_VALUE);
    }

    //Метод, що повертає значення бінарного числа
    public long getValue() {
        return value;
    }

    //Порівняння двох бінарних чисел
    @Override
    public int compareTo(BinaryNumber other) {
        return Long.compare(this.value, other.value);
    }
    }
}