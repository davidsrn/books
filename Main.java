import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);

		int a;
		String numbers;
		int result = 0;
		a = input.nextInt();

		for(int i = 0; i<a; i++) {
			numbers=input.next();
			for(int j = 0; j< numbers.length(); j++) {
				if(j+1>=numbers.length()) {
					result += toNumber(numbers.charAt(j));
//					System.out.println(result);
				}else {
					if(toNumber(numbers.charAt(j))<toNumber(numbers.charAt(j+1))) {
						result += toNumber(numbers.charAt(j+1))-toNumber(numbers.charAt(j));
//						System.out.println(result);
						j+=2;;
					}else if(toNumber(numbers.charAt(j+1))==toNumber(numbers.charAt(j)))){
						if(j+3>numbers.length()){
							result += toNumber(numbers.charAt(j+1))+toNumber(numbers.charAt(j));
						}
					}else {
						result += toNumber(numbers.charAt(j));
						System.out.println(result);
					}
				}
			}

		System.out.println(result);

		result=0;
		}

	}

	public static int toNumber(char a) {
		if(a == 'M') {
			return 1000;
		}else if(a == 'X') {
			return 10;
		}else if(a == 'C') {
			return 100;
		}else if(a == 'I') {
			return 1;
		}else if(a == 'V') {
			return 5;
		}else if(a == 'L') {
			return 50;
		}else if(a == 'D') {
			return 500;
		}else {
			return 0;
		}
	}

	public static int checkNext(char <){

	}
}
