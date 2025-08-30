package model;

import com.pahanaedu.model.Customer;

public class CustomerCsvEdgeCasesTest {
	public static void run() {
		// Empty optional fields
		Customer c1 = new Customer("A", "", "", "", 0);
		assertRoundTrip(c1);

		// Commas, backslashes, unicode
		Customer c2 = new Customer("AC,02", "Älice, Ω", "No\\, 5, Main", "077,123", 1.0);
		assertRoundTrip(c2);

		// Long strings
		String longStr = "x".repeat(1000);
		Customer c3 = new Customer(longStr, longStr, longStr, longStr, 9999.99);
		assertRoundTrip(c3);

		// Floating precision
		Customer c4 = new Customer("B", "Bob", "Addr", "071", 123.456789);
		assertRoundTrip(c4);
	}

	private static void assertRoundTrip(Customer c) {
		String line = c.toCSV();
		Customer p = Customer.fromCSV(line);
		assertEquals(c.getAccountNo(), p.getAccountNo());
		assertEquals(c.getName(), p.getName());
		assertEquals(c.getAddress(), p.getAddress());
		assertEquals(c.getTelephone(), p.getTelephone());
		if (Math.abs(c.getUnitsConsumed() - p.getUnitsConsumed()) > 1e-9) {
			throw new AssertionError("Units mismatch");
		}
	}

	private static void assertEquals(String e, String a) {
		if (e == null ? a != null : !e.equals(a)) {
			throw new AssertionError("Expected: " + e + ", Actual: " + a);
		}
	}
}


