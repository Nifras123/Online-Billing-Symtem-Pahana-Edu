package dao;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import support.FakeServletContext;
import jakarta.servlet.ServletRegistration;

import java.io.File;

public class CustomerDaoBulkTest {
	public static void run() throws Exception {
		File tmp = new File("build/test/tmp-bulk");
		if (!tmp.exists()) tmp.mkdirs();
		FakeServletContext ctx = new FakeServletContext(tmp) {
			@Override public ServletRegistration.Dynamic addJspFile(String a, String b) { return null; }
			@Override public int getSessionTimeout() { return 0; }
			@Override public void setSessionTimeout(int i) {}
		};
		CustomerDAO dao = new CustomerDAO(ctx);
		new java.io.File(ctx.getRealPath("/WEB-INF/data/customers.csv")).delete();

		// Insert 30 customers and verify size and spot-checks
		for (int i = 1; i <= 30; i++) {
			dao.add(new Customer("A"+i, "Name"+i, "Addr"+i, "070"+i, i));
		}
		if (dao.getAll().size() != 30) throw new AssertionError("Bulk insert failed");
		if (!"Name1".equals(dao.findByAccountNo("A1").getName())) throw new AssertionError("First check failed");
		if (!"Name30".equals(dao.findByAccountNo("A30").getName())) throw new AssertionError("Last check failed");

		// Update 10 records
		for (int i = 1; i <= 10; i++) {
			Customer c = dao.findByAccountNo("A"+i);
			c.setName(c.getName()+"X");
			dao.update(c);
		}
		for (int i = 1; i <= 10; i++) {
			if (!dao.findByAccountNo("A"+i).getName().endsWith("X")) throw new AssertionError("Update bulk failed");
		}

		// Delete 5 records
		for (int i = 1; i <= 5; i++) dao.delete("A"+i);
		if (dao.getAll().size() != 25) throw new AssertionError("Bulk delete failed");
	}
}


