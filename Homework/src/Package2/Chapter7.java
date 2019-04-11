package Package2;

public class Chapter7 {
	public static void main(String[] args) 
	{
		int[] arr = new int[100];
		System.out.print("�������Ϊ��");
		for(int i = 0; i < arr.length; i++) 
		{
			arr[i] = (int) (Math.random() * 1000);
			System.out.print(arr[i] + ",");
		}
		System.out.println();
		StringBuilder primeBuilder = new StringBuilder();
		StringBuilder notPrimeBuilder = new StringBuilder();
		for(int i : arr) 
		{
			if(isPrime(i)) 
			{
				primeBuilder.append(i + ",");
			} 
			else 
			{
				notPrimeBuilder.append(i + ",");
			}
		}
		System.out.println("�����У�" + primeBuilder.toString());
		System.out.println("�������У�" + notPrimeBuilder.toString());
	}
	public static boolean isPrime(int n) {
	boolean flag = true;
	if(n < 2) 
	{
		flag = false;
	}
	for(int i = 2; i < Math.sqrt(n); i++) 
	{
		if(n % i == 0) 
		{
			flag = false;
		}
	}
	return flag;
	}
}
