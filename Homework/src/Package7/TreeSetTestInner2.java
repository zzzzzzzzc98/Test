package Package7;

import java.util.*;

public class TreeSetTestInner2{
	public static void main(String[] args) {
		TreeSet c = new TreeSet(new Comparator(){
			public int compare(Object o1, Object o2){
				String s1 = (String)o1;
				String s2 = (String)o2;
				//����
				//return s1.compareTo(s2);
				//����
				return -s1.compareTo(s2);
			}
		});   
		c.add("HashSet");
		c.add("ArrayList");
		c.add("TreeMap");
		c.add("HashMap");
		c.add("TreeSet");
		c.add("LinkedList");
    
		Iterator it = c.iterator();
		while(it.hasNext())
			System.out.println(it.next());
	}	
}
