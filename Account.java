package sec01;

public class Account {
	
	String name;
	int balance;
	int option;
	int amount;
	
	void withdraw (int amount) {
		this.balance -= amount;
		System.out.println(amount + "금액이 출금되었습니다. " );
	}
	
	void deposit (int amount) {
		this.balance += amount;
		System.out.println(amount + "금액이 입금되었습니다. " );
	}
	
	void exit () {
		System.out.println(name + "님의 잔액은 " + balance + "원 입니다.");
	}
	
	Account (String name) {
		this.name = name;
		System.out.println(name + "님의 계좌가 만들어졌습니다.");
		System.out.println("출금:1 입금:2 종료:3");
	}

}
