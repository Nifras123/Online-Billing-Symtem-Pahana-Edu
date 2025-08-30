package billing;

import com.pahanaedu.billing.StandardBillingStrategy;

public class BillingMoreTests {
	private static final StandardBillingStrategy S = new StandardBillingStrategy();

	public static void run() {
		// Integer unit checks 0..20
		for (int u = 0; u <= 20; u++) {
			double expected = expectedFor(u);
			assertDoubleEquals(expected, S.calculate(u));
		}
		// Boundaries around 50
		int[] around50 = {49, 50, 51, 55, 60};
		for (int u : around50) {
			assertDoubleEquals(expectedFor(u), S.calculate(u));
		}
		// Boundaries around 100
		int[] around100 = {99, 100, 101, 120, 150};
		for (int u : around100) {
			assertDoubleEquals(expectedFor(u), S.calculate(u));
		}
		// Fractional units
		double[] fractions = {0.1, 1.5, 10.25, 49.5, 50.0, 50.5, 75.75, 99.99, 100.0, 100.25};
		for (double u : fractions) {
			assertDoubleEquals(expectedFor(u), S.calculate(u));
		}
	}

	private static double rate(double index) {
		// unit index is 1-based
		if (index <= 50) return 5.0;
		if (index <= 100) return 7.0;
		return 10.0;
	}

	private static double expectedFor(double units) {
		// Accumulate using single-unit rates to avoid duplicating production branching
		double sum = 0.0;
		double remaining = units;
		int whole = (int)Math.floor(units);
		for (int i = 1; i <= whole; i++) {
			sum += rate(i);
		}
		double fractional = units - whole;
		if (fractional > 0) {
			sum += rate(whole + 1) * fractional;
		}
		return sum;
	}

	private static void assertDoubleEquals(double expected, double actual) {
		if (Math.abs(expected - actual) > 1e-6) {
			throw new AssertionError("Expected: " + expected + ", Actual: " + actual);
		}
	}
}


