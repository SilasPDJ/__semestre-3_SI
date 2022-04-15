package helloWorld;

import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class listaDeExercicios {

	public static void main(String[] args) {
		// method printArray() está sendo utilizado em diversos exercícios
		// ex12();
		// ex13();
		// ex14();
		ex15();
	}

	public static void ex15() {
		// make array
		int[] arr = new int[15];
		Scanner ent = new Scanner(System.in);
		for (int i = 0; i < arr.length; i++) {
			System.out.printf("Digite número para arr[%d]: ", i);
			arr[i] = ent.nextInt();
		}
		System.out.println("~~~~~ Array original ~~~~~");
		printArray(arr);

		System.out.println("~~~~ Array comapctado ~~~");
		int[] arrCompactado = compactArray(arr);
		printArray(arrCompactado);

	}

	private static int[] compactArray(int[] arr) {
		int maior = 0, menor = 0, counter4calc;

		int[] newArr = new int[arr.length];

		// declara o array intermediário
		counter4calc = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != 0) {
				newArr[i] = arr[i];
			} else {
				counter4calc++;
			}
		}
		// finaliza o algoritmo compactador
		int[] finalArr = new int[arr.length - counter4calc];
		int cont = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != 0) {
				finalArr[cont] = arr[i];
				cont++;
			}
		}
		// printa valor difenrete de 0 e incrementa no final
		return finalArr;

	}

	public static void ex14() {
		int tamArray = 10;
		int[] arr1 = getRandomArray(tamArray, -99, 99, true);
		int[] arr2 = getRandomArray(tamArray, -99, 99, true);

		int[] arrUnion = new int[arr1.length + arr2.length];

		System.arraycopy(arr1, 0, arrUnion, 0, arr1.length);
		System.arraycopy(arr2, 0, arrUnion, arr1.length, arr2.length);
		System.out.println("Mostra array 1");
		printArray(arr1);
		System.out.println("Mostra array 2");
		printArray(arr2);
		System.out.println("Mostra array da UNIÃO: ");
		printArray(arrUnion, tamArray);

	}

	public static void ex13() {
		int tamArray = 10;
		int i, j, valr;
		int[] arr1 = getRandomArray(tamArray, -10, 10, true);
		int[] arr2 = getRandomArray(tamArray, -10, 10, true);
		int[] arrInterseccao = new int[tamArray];

		// gera intersecção
		int num1, num2;
		for (i = 0; i < tamArray; i++) {
			num1 = arr1[i];
			for (j = 0; j < tamArray; j++) {
				num2 = arr2[j];
				if (num1 == num2) {
					arrInterseccao[i] = num1;
				}
			}
		}
		System.out.println("Mostra array 1");
		printArray(arr1);
		System.out.println("Mostra array 2");
		printArray(arr2);
		System.out.println("Mostra array intercção: ");
		// print array intersecção
		for (i = 0; i < tamArray; i++) {
			valr = arrInterseccao[i];
			if (valr != 0) {
				System.out.printf("%4d", valr);
			}
		}

	}

	private static int[] getRandomArray(int tam, int min, int max, boolean semRepetir) {
		int i, r;
		int[] arr = new int[tam];
		Random random = new Random();
		for (i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(min, max);
			if (semRepetir) {
				for (r = 0; r < tam; r++) {
					if (i != r) {
						while (arr[i] == arr[r] || arr[i] == 0) {// NÃO irei adicionar valores com 0 por causa do array
																	// intersecção
							arr[i] = random.nextInt(min, max);
						}
					}
				}
			}
		}
		return arr;
	}

	public static void ex12() {
		int num;
		int[] arrayInt = getRandomArray(10);
		System.out.println("~~~~\tArray completo: ~~~~");
		printArray(arrayInt);

		System.out.println("\n~ Mostra somente números primos ~");

		for (int i = 0; i < arrayInt.length; i++) {
			num = arrayInt[i];
			if (isPrimeNumber(num)) {
				System.out.printf("%4d", num);
			}
		}
	}

	protected static boolean isPrimeNumber(int num) {
		// return true => is prime;
		// return false=> is NOT prime
		int num2loop = num < 0 ? num * -1 : num;

		if (num != 0) {
			for (int i = 1; i <= num2loop; i++) {
				if (i != 1 && i != num2loop && num % i == 0) {
					return false;
				}
			}
			return true;
		} else {
			return false;
			// 0...
		}
	}

	public static void ex11() {
		int[] arrayNo7 = new int[100];
		int cont, calc;
		cont = 0;
		calc = 1;// 0 is multiple of 7;
		while (cont < 100) {
			while (calc % 7 == 0 || String.valueOf(calc).endsWith("7")) {
				calc++;
			}
			arrayNo7[cont] = calc;
			calc += 1;
			cont++;
		}
		printArray(arrayNo7, 25);
		// esse foi hard um pouco haha
	}

	private static void printArray(int[] array, int breakOn) {
		int i;
		for (i = 0; i < array.length; i++) {
			if (i % breakOn == 0) {
				System.out.println("");
			}
			System.out.printf("%4d ", array[i]); // better format for ex11;
		}
		System.out.println("");
	}

	public static void ex10() {
		Scanner ent = new Scanner(System.in);

		int vetA[] = new int[10];
		int vetB[] = new int[10];
		int vetC[] = new int[vetA.length + vetB.length];

		for (int i = 0; i < vetA.length; i++) {
			System.out.print("Digite o valor " + (i + 1) + " de " + vetA.length + " do vetor 1: ");
			vetA[i] = ent.nextInt();
		}
		System.out.println("");
		for (int i = 0; i < vetB.length; i++) {
			System.out.print("Digite o valor " + (i + 1) + " de " + vetB.length + " do vetor 2: ");
			vetB[i] = ent.nextInt();
		}

		for (int i = 0, j = 0, k = 0; i < vetC.length; i++) {
			if (i % 2 == 0) {
				vetC[i] = vetA[j++];
			} else {
				vetC[i] = vetB[k++];
			}
		}
		System.out.println("");
		for (int i = 0; i < vetC.length; i++) {
			System.out.print(vetC[i] + " ");
		}
	}

	public static void ex9() {
		int[] array50 = new int[50];
		for (int i = 0; i < array50.length; i++) {
			array50[i] = (i + 5 * i) % (i + 1);
		}
		printArray(array50);
	}

	public static void ex8() {
		// multiplos
		Scanner ent = new Scanner(System.in);
		int i; // número primo
		int[] array = getRandomArray(10, -100, 100);
		String numsPrint = "";
		printArray(array);
		int x = 0, contMultiplos = 0;

		while (x == 0) {
			System.out.print("\nDigite um número != 0 para contar seus múltiplos: ");
			x = ent.nextInt();
		}
		// contaMultiplos(x);

		for (i = 0; i < array.length; i++) {
			if (array[i] % x == 0) {
				contMultiplos++;
				numsPrint += String.valueOf(array[i] + " ");
			}
		}
		System.out.printf("\nAo total temos %2d múltiplos de %2d\n", contMultiplos, x);

		if (contMultiplos > 0) {
			System.out.println("São eles: ");
			System.out.println(numsPrint);

		} else {
			System.out.println("Não houve múltiplos de " + x);
		}

	}

	public static void ex7() {
		Scanner ent = new Scanner(System.in);
		double[] array = new double[5];
		// read array
		for (int i = 0; i < array.length; i++) {
			System.out.printf("Digite valor real para array[%d]: ", i);
			array[i] = ent.nextDouble();
		}

		// ler código inteiro
		int opcao = -1;
		while (true) {
			System.out.println("[0]: SAIR (finalizar)");
			System.out.println("[1]: MOSTRA ARRAY");
			System.out.println("[2]: MOSTRA ARRAY INVERTIDO");
			opcao = ent.nextInt();
			if (opcao < 0 || opcao > 2) {
				System.out.println("\nOção INVÁLIDA. Tente novamente.");
			} else {
				if (opcao == 0) {
					System.out.println("\nFIM!");
					break;
				} else if (opcao == 1) {
					for (var val : array) {
						System.out.printf("%6.2f", val);
					}

				} else if (opcao == 2) {
					for (int i = array.length - 1; i >= 0; i--) {

						System.out.printf("%6.2f", array[i]);
					}
				}
				System.out.println("\n");
			}

		}
	}

	protected static int[] checkerInList;

	public static void ex6() {

		int[] vector = getRandomArray(10, -20, 20);
		checkerInList = new int[10];
		Arrays.fill(checkerInList, -1); // remove position 0;

		for (int i = 0; i < vector.length; i++) {
			for (int r = vector.length - 1; r >= 0; r--) {
				if (vector[i] == vector[r] && i != r) {

					if (!isInCheck(i) || !isInCheck(r)) {
						checkerInList[i] = i;
						checkerInList[r] = r;
						System.out.println("Vetor na posição " + i + " é igual ao na posição " + r);

					}
				}
			}
		}
		printArray(vector);
	}

	private static boolean isInCheck(int argVal) {
		int val;
		for (int i = 0; i < checkerInList.length; i++) {
			val = checkerInList[i];
			if (val == argVal) {
				return true;
			}
		}
		return false;
	}

	public static void ex5() {
		Scanner scanner = new Scanner(System.in);
		int qtd, notaMaxima;
		double mediaAlunos;
		mediaAlunos = 0;
		qtd = 15;
		notaMaxima = 10;

		double[] notaAlunos = new double[qtd];
		System.out.println("A nota deve estar entre 0 e a notaMaxima");
		for (int i = 0; i < 15; i++) {
			while (true) {
				System.out.printf("Digite a nota do aluno %02d: ", i + 1);
				notaAlunos[i] = scanner.nextDouble();
				if (notaAlunos[i] < 0 || notaAlunos[i] > notaMaxima) {
					System.out.println("Tente novamente. O valor deve estar entre 0 e " + notaMaxima);
				} else {
					mediaAlunos += notaAlunos[i];
					break;
				}
			}
		}
		mediaAlunos /= qtd;

		System.out.println("\nA média das notas: ");
		printArray(notaAlunos);
		System.out.printf("É %.2f", mediaAlunos);

	}

	private static void printArray(double[] array) {
		int i;
		for (i = 0; i < array.length; i++) {
			System.out.printf("%.2f ", array[i]);
		}
		System.out.println("");
	}

	public static void ex4() {
		int soma;
		int[] A = { 1, 0, 5, -2, -5, 7 };
		soma = A[0] + A[1] + A[5];
		System.out.println("A soma das posições  A[0] + A[1] + A[5]; = " + soma);
		A[4] = 100;
		/*
		 * for (int v : A) { System.out.println(v); }
		 */
		for (int i = 0; i < A.length; i++) {
			System.out.println("A[" + i + "] = " + A[i]);
		}
	}

	public static void ex3() {
		int[] arr1, arr2, arrDiff, arrSoma, arrMult;
		int tam, i;
		tam = 20;

		arr1 = getRandomArray(tam, -100, 100);
		arr2 = getRandomArray(tam, -100, 100);

		arrDiff = new int[tam];
		arrSoma = new int[tam];
		arrMult = new int[tam];

		for (i = 0; i < tam; i++) {
			arrSoma[i] = arr1[i] + arr2[i];
			arrDiff[i] = arr1[i] - arr2[i];
			arrMult[i] = arr1[i] * arr2[i];
		}

		System.out.println("Array1: ");
		printArray(arr1);
		System.out.println("Array2: ");
		printArray(arr2);
		System.out.println("Diferença entre vetores, arr1 - arr2");
		printArray(arrDiff);
		System.out.println("Soma entre vetores, arr1 + arr2");
		printArray(arrSoma);
		System.out.println("Multiplicação entre vetores, arr1 * arr2");
		printArray(arrMult);
	}

	private static int[] getRandomArray(int tam, int min, int max) {
		int[] arr = new int[tam];
		Random random = new Random();
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(min, max);
		}
		return arr;
	}

	public static void ex2() {
		int[] arr1, arr2;
		arr1 = getRandomArray(10, true);
		System.out.println("Array 1: ");
		printArray(arr1);

		arr2 = new int[arr1.length];

		for (int i = 0; i < arr2.length; i++) {
			if (arr1[i] % 2 == 0) {
				arr2[i] = arr1[i] / 2;
			} else {
				arr2[i] = arr1[i] * 3;
			}
		}

		System.out.println("Array 2: ");
		printArray(arr2);
	}

	private static int[] getRandomArray(int tam, boolean onlyPositive) {
		int[] arr = new int[tam];
		Random random = new Random();

		int min, max;
		if (onlyPositive) {
			min = 1; // 0 is neutral
			max = 20;
		} else {
			min = -10;
			max = 10;
		}
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(min, max);
		}
		return arr;
	}

	public static void ex1() {
		Random random = new Random();

		int[] arr1, arr2;

		arr1 = getRandomArray(10);
		arr2 = new int[10];

		System.out.println("Normal Array: ");
		printArray(arr1); // normal way
		// reversed
		int i;
		for (i = arr1.length - 1; i >= 0; i--) {

			int pos2arr2;
			pos2arr2 = i - arr2.length + 1;
			if (pos2arr2 < 0) {
				pos2arr2 *= -1;
			}
			arr2[pos2arr2] = arr1[i];
		}
		System.out.println("Reversed Array: ");
		printArray(arr2);
		// random.nextInt(-10, 10);
	}

	private static int[] getRandomArray(int tam) {
		int[] arr = new int[tam];
		Random random = new Random();

		int min, max;
		min = -10;
		max = 10;
		for (int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(min, max);
		}
		return arr;
	}

	private static void printArray(int[] array) {
		int i;
		for (i = 0; i < array.length; i++) {
			System.out.printf("%1d ", array[i]);
		}
		System.out.println("\n");
	}

}
