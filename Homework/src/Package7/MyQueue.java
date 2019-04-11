package Package7;

import java.util.*;

public class MyQueue 
{
	private ArrayList data;
	
	public MyQueue(){
		data = new ArrayList();		
	}

	public void in(Object o){
		data.add(o);
	}

	public Object out(){
		int size = data.size();
		if(size>0)
			return data.remove(0);
		else 
			return null;
	}

	public int getSize(){
		return data.size();
	}
}
