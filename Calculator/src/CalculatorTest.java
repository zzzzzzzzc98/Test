import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {
	public static Calculator a = new Calculator();
	
	@Before
	public void setUp() throws Exception {
		a.clear();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAdd() {
		a.add(2);
		a.add(2);
		assertEquals(4,a.getResult());
	}

	@Test
	public void testSubstract() {
		a.clear();
		a.substract(3);
		assertEquals(-3,a.getResult());
	}

	@Test
	public void testMultiply() {
		a.clear();
		a.add(22);
		a.multiply(2);
		assertEquals(44,a.getResult());
	}

	@Test
	public void testDivide() {
		a.clear();
		a.add(20);
		a.divide(4);
		assertEquals(5,a.getResult());
	}

	@Test
	public void testSquare() {
		a.clear();
		a.add(2);
		a.square(2);
		assertEquals(4,a.getResult());
	}

	@Test(timeout=1000)
	public void testSquareRoot() {
		a.squareRoot(1);
	}

	@Test
	public void testClear() {
		a.clear();
	}

	@Test
	public void testGetResult() {
		fail("Not yet implemented");
	}

	@Test
	public void testObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetClass() {
		
	}

}
