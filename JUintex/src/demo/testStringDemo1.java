package demo;

import demo.StringDemo;
import junit.framework.TestCase;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class testStringDemo1 extends TestCase {
		private StringDemo str;
		protected void setUp(){
			str = new StringDemo();
		}	
		public void testSmallString1() {
			assertEquals("一个大写字母变小写",str.smallString("A"),"a");
			
		}
		public void testSmallString2() {
			assertEquals("一个小写字母变小写",str.smallString("b"),"b");
			
		}
		public void testSmallString3() {
			assertEquals("一个小写字母变大写",str.smallString("a"),"A");
			
		}
		public void testSmallString4() {
			assertEquals("两个大写字母变小写",str.smallString("AB"),"ab");
			
		}
		public void testSmallString5() {
			assertEquals("两个小写字母变小写",str.smallString("ab"),"ab");
			
		}
		public void testSmallString6() {
			assertEquals("两个大写字母反向变小写",str.smallString("BA"),"ab");
			
		}
		public void testSmallString7() {
			assertEquals("一个大写字母一个小写字母变小写",str.smallString("Ab"),"ab");
			
		}
		public void testSmallString8() {
			assertEquals("一个大写字母一个小写字母变大写",str.smallString("Ab"),"AB");
			
		}
		public void testSmallString9() {
			assertEquals("一个字符串变小写字符串",str.smallString("ZZC IS HANDSOME"),"zzc is handsome");
			
		}
		public void testSmallString10() {
			assertEquals("一个字符串变大写字符串",str.smallString("Zzc is handsome"),"zzc is handsome");
		}

}
