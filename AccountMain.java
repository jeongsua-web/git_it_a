package sec01;

import java.util.Scanner;

public class AccountMain {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Account a1 = new Account("정수아");

		int option = 0;
		int amount = 0;

		while (option != 3) {
			
			option = sc.nextInt();

			if (option == 1 || option == 2) {
				System.out.println("금액입력: ");
				amount = sc.nextInt();
			}

			switch (option) {
			case 1:
				a1.withdraw(amount);

				break;
			case 2:
				a1.deposit(amount);

				break;
			case 3:
				a1.exit();

				break;

			default:
				System.out.println("1, 2, 3 중에 눌러라.");
				break;
			}

		}
		sc.close();
	}
}
