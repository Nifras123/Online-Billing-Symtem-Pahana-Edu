public class TestRunner {
	public static void main(String[] args) throws Exception {
		int failures = 0;
		try { billing.StandardBillingStrategyTest.run(); System.out.println("Billing tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { billing.BillingMoreTests.run(); System.out.println("Billing more tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { model.CustomerItemCsvTest.run(); System.out.println("Model CSV tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { model.CustomerCsvEdgeCasesTest.run(); System.out.println("Customer CSV edge tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { model.ItemCsvEdgeCasesTest.run(); System.out.println("Item CSV edge tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { dao.CustomerItemDaoTest.run(); System.out.println("DAO tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { dao.CustomerDaoBulkTest.run(); System.out.println("Customer DAO bulk tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		try { dao.ItemDaoBulkTest.run(); System.out.println("Item DAO bulk tests: OK"); } catch (Throwable t) { t.printStackTrace(); failures++; }
		if (failures > 0) {
			System.err.println("Tests failed: " + failures);
			System.exit(1);
		}
		System.out.println("All tests passed");
	}
}


