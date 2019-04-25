
public class StringDemo {
	public StringDemo() {
	}
	public String smallString(String str) {// ×Ö·û´®±äÐ¡Ð´
		String temp = "error";
		if (str.equals("") || str == null) {
			return temp;
		}
		String s = str.toLowerCase();
		return s;
	}

}
