package sec01;

import java.util.Scanner;

public class Student {
	
	String name;
	int rollno;
	int age;
	
	void print () {
		System.out.println(rollno + " " + name + "학생의 나이는 " + age + "입니다.");
	}
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Student s1 = new Student();
		
		System.out.println("이름: ");
		System.out.println("학번: ");
		System.out.println("나이: ");
		
		s1.name = sc.nextLine();
		s1.rollno = sc.nextInt();
		s1.age = sc.nextInt();
		
		s1.print();
		
		sc.close();
	}

	
}



