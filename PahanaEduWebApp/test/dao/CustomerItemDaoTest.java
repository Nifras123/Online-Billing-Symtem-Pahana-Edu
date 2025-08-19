package dao;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Customer;
import com.pahanaedu.model.Item;
import jakarta.servlet.ServletRegistration;
import support.FakeServletContext;

import java.io.File;
import java.util.List;

public class CustomerItemDaoTest {
	public static void run() throws Exception {
		File tmp = new File("build/test/tmp");
		if (!tmp.exists()) tmp.mkdirs();
		FakeServletContext ctx = new FakeServletContext(tmp) {
                    @Override
                    public ServletRegistration.Dynamic addJspFile(String string, String string1) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    @Override
                    public int getSessionTimeout() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    @Override
                    public void setSessionTimeout(int i) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }
                };

		CustomerDAO cdao = new CustomerDAO(ctx);
		ItemDAO idao = new ItemDAO(ctx);

		// Clean start
		new java.io.File(ctx.getRealPath("/WEB-INF/data/customers.csv")).delete();
		new java.io.File(ctx.getRealPath("/WEB-INF/data/items.csv")).delete();

		Customer c = new Customer("A100","Bob","No 1","0711111111", 12.0);
		cdao.add(c);
		List<Customer> customers = cdao.getAll();
		if (customers.size() != 1) throw new AssertionError("Expected 1 customer");

		Customer fetched = cdao.findByAccountNo("A100");
		if (fetched == null || !"Bob".equals(fetched.getName())) throw new AssertionError("Find failed");

		fetched.setName("Bobby");
		cdao.update(fetched);
		Customer updated = cdao.findByAccountNo("A100");
		if (!"Bobby".equals(updated.getName())) throw new AssertionError("Update failed");

		cdao.delete("A100");
		if (cdao.findByAccountNo("A100") != null) throw new AssertionError("Delete failed");

		Item it = new Item("I9","Pen", 50.0);
		idao.add(it);
		if (idao.findById("I9") == null) throw new AssertionError("Item add/find failed");

		it.setPrice(55.0);
		idao.update(it);
		if (Math.abs(idao.findById("I9").getPrice() - 55.0) > 1e-9) throw new AssertionError("Item update failed");

		idao.delete("I9");
		if (idao.findById("I9") != null) throw new AssertionError("Item delete failed");
	}
}


