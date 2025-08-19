package model;

import com.pahanaedu.model.Customer;
import com.pahanaedu.model.Item;

public class CustomerItemCsvTest {
	public static void run() {
		Customer c = new Customer("A001","Alice","12, High Rd","0771234567", 75.5);
		String line = c.toCSV();
		Customer parsed = Customer.fromCSV(line);
		assertEquals("A001", parsed.getAccountNo());
		assertEquals("Alice", parsed.getName());
		assertEquals("12, High Rd", parsed.getAddress());
		assertEquals("0771234567", parsed.getTelephone());
		assertDoubleEquals(75.5, parsed.getUnitsConsumed());

		Item it = new Item("I01","Book", 120.0);
		String l2 = it.toCSV();
		Item it2 = Item.fromCSV(l2);
		assertEquals("I01", it2.getId());
		assertEquals("Book", it2.getName());
		assertDoubleEquals(120.0, it2.getPrice());
	}

	private static void assertEquals(String expected, String actual) {
		if (expected == null ? actual != null : !expected.equals(actual)) {
			throw new AssertionError("Expected: " + expected + ", Actual: " + actual);
		}
	}

	private static void assertDoubleEquals(double expected, double actual) {
		if (Math.abs(expected - actual) > 1e-9) {
			throw new AssertionError("Expected: " + expected + ", Actual: " + actual);
		}
	}
}


