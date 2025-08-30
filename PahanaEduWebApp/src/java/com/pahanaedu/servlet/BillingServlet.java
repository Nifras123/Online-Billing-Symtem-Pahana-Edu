package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.billing.StandardBillingStrategy;
import com.pahanaedu.billing.BillingStrategy;
import com.pahanaedu.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BillingServlet extends HttpServlet {
    private CustomerDAO dao;
    private BillingStrategy strategy = new StandardBillingStrategy();

    @Override
    public void init() { dao = new CustomerDAO(getServletContext()); }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String acc = req.getParameter("accountNo");
        Customer c = dao.findByAccountNo(acc);
        if (c == null) {
            req.setAttribute("error", "Customer not found.");
            req.getRequestDispatcher("/jsp/dashboard.jsp").forward(req, resp);
            return;
        }
        double units = c.getUnitsConsumed();
        double amount = strategy.calculate(units);
        req.setAttribute("customer", c);
        req.setAttribute("amount", amount);
        req.getRequestDispatcher("/jsp/printBill.jsp").forward(req, resp);
    }
}
