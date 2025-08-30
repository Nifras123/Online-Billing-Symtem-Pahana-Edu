package dao;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;
import support.FakeServletContext;
import jakarta.servlet.ServletRegistration;

import java.io.File;

public class ItemDaoBulkTest {
	public static void run() throws Exception {
		File tmp = new File("build/test/tmp-bulk-items");
		if (!tmp.exists()) tmp.mkdirs();
		FakeServletContext ctx = new FakeServletContext(tmp) {
			@Override public ServletRegistration.Dynamic addJspFile(String a, String b) { return null; }
			@Override public int getSessionTimeout() { return 0; }
			@Override public void setSessionTimeout(int i) {}
		};
		ItemDAO dao = new ItemDAO(ctx);
		new java.io.File(ctx.getRealPath("/WEB-INF/data/items.csv")).delete();

		// Insert 30 items
		for (int i = 1; i <= 30; i++) dao.add(new Item("I"+i, "Item"+i, i*1.0));
		if (dao.getAll().size() != 30) throw new AssertionError("Bulk insert failed");
		if (!"Item1".equals(dao.findById("I1").getName())) throw new AssertionError("First check failed");
		if (!"Item30".equals(dao.findById("I30").getName())) throw new AssertionError("Last check failed");

		// Update 10
		for (int i = 1; i <= 10; i++) {
			Item it = dao.findById("I"+i);
			it.setPrice(it.getPrice() + 0.5);
			dao.update(it);
		}
		for (int i = 1; i <= 10; i++) {
			if (Math.abs(dao.findById("I"+i).getPrice() - (i + 0.5)) > 1e-9) throw new AssertionError("Update bulk failed");
		}

		// Delete 5
		for (int i = 1; i <= 5; i++) dao.delete("I"+i);
		if (dao.getAll().size() != 25) throw new AssertionError("Bulk delete failed");
	}
}


