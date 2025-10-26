// 메서드 오버로딩 
package sec01;

public class Calc {
	
	int sum (int a, int b) {
		return a + b;
	}
	
	int sum (int a, int b, int c) {
		return a + b + c;
	}
	
	public static void main(String[] args) {
		Calc c1 = new Calc();
		
		System.out.println(c1.sum(10, 20));
		System.out.println(c1.sum(10, 20, 30));
	}
}
