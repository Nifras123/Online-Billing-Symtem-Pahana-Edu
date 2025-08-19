package billing;

import com.pahanaedu.billing.StandardBillingStrategy;

public class StandardBillingStrategyTest {
	public static void run() {
		StandardBillingStrategy s = new StandardBillingStrategy();
		assertDoubleEquals(0.0, s.calculate(0));
		assertDoubleEquals(50.0, s.calculate(10)); // 10 * 5
		assertDoubleEquals(250.0, s.calculate(50)); // 50 * 5
		assertDoubleEquals(257.0, s.calculate(51)); // 50*5 + 1*7
		assertDoubleEquals(600.0, s.calculate(100)); // 50*5 + 50*7
		assertDoubleEquals(800.0, s.calculate(120)); // 50*5 + 50*7 + 20*10
	}

	private static void assertDoubleEquals(double expected, double actual) {
		if (Math.abs(expected - actual) > 1e-9) {
			throw new AssertionError("Expected: " + expected + ", Actual: " + actual);
		}
	}
}


