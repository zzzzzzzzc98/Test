package Package2;

import java.util.*;	

public class Chapter9 {
	//�ж��ǲ�������
		public boolean isPrimeNum (int n) 
		{
	  		int i; 
	  		for (i = 2; i < n/2; i++) 
			{   
				if(n%i == 0)
	    			break;
	  		}
	  		if(i >= n/2)   
				return true;
	  			return false;
		}
	 
	 	//��֤��°ͺղ���
	 	public void getGoldbachNum (int n) 
		{
	  		if(n < 6  ||  n%2 == 1)
	  		{
	   			System.out.println (n + "�������°ͺղ���!");
	   			return;
	  		}
	  		for(int i=2; i<= n-1; i++)
	  		{
	   			if(this.isPrimeNum(i) && this.isPrimeNum(n - i))
	   			{
	    				System.out.println (n + "=" + i + "+" + (n-i));
	    				break;
	   			}
	  		}
	 	}
	 
		public static void main (String[] args) 
		{  
			Chapter9 gc = new Chapter9();
	  		Scanner in = new Scanner(System.in); //��������������in 
	  	
	  		System.out.print ("������Ҫ��֤����(n>=6):");
	  		int n;
	  		n = in.nextInt();//����n
	  
	  		gc.getGoldbachNum(n);//��֤��°ͺղ���
	 	}
}
