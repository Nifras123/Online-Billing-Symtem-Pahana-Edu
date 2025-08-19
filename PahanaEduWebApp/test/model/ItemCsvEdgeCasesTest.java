package model;

import com.pahanaedu.model.Item;

public class ItemCsvEdgeCasesTest {
	public static void run() {
		// Basic
		assertRoundTrip(new Item("I1","Pencil", 10.0));
		// Zero price
		assertRoundTrip(new Item("I0","Free", 0.0));
		// Large price
		assertRoundTrip(new Item("I9","Expensive", 1_000_000.99));
		// Unicode
		assertRoundTrip(new Item("IΩ","Σ-Name", 12.34));
	}

	private static void assertRoundTrip(Item it) {
		String line = it.toCSV();
		Item p = Item.fromCSV(line);
		assertEquals(it.getId(), p.getId());
		assertEquals(it.getName(), p.getName());
		if (Math.abs(it.getPrice() - p.getPrice()) > 1e-9) {
			throw new AssertionError("Price mismatch");
		}
	}

	private static void assertEquals(String e, String a) {
		if (e == null ? a != null : !e.equals(a)) {
			throw new AssertionError("Expected: " + e + ", Actual: " + a);
		}
	}
}


