package com.pahanaedu.servlet;

import com.pahanaedu.dao.CustomerDAO;
import com.pahanaedu.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CustomerServlet extends HttpServlet {
    private CustomerDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new CustomerDAO(getServletContext());
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            Customer c = new Customer(req.getParameter("accountNo"), req.getParameter("name"),
                    req.getParameter("address"), req.getParameter("telephone"),
                    Double.parseDouble(req.getParameter("units")));
            dao.add(c);
            req.setAttribute("success", "Customer added.");
            req.getRequestDispatcher("/jsp/addCustomer.jsp").forward(req, resp);
        } else if ("update".equals(action)) {
            Customer c = new Customer(req.getParameter("accountNo"), req.getParameter("name"),
                    req.getParameter("address"), req.getParameter("telephone"),
                    Double.parseDouble(req.getParameter("units")));
            dao.update(c);
            resp.sendRedirect(req.getContextPath() + "/jsp/viewCustomers.jsp");
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("list".equals(action)) {
            List<Customer> list = dao.getAll();
            req.setAttribute("customers", list);
            req.getRequestDispatcher("/jsp/viewCustomers.jsp").forward(req, resp);
        } else if ("edit".equals(action)) {
            String acc = req.getParameter("accountNo");
            Customer c = dao.findByAccountNo(acc);
            req.setAttribute("customer", c);
            req.getRequestDispatcher("/jsp/editCustomer.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            String acc = req.getParameter("accountNo");
            dao.delete(acc);
            resp.sendRedirect(req.getContextPath() + "/servlet/customer?action=list");
        } else if ("view".equals(action)) {
            String acc = req.getParameter("accountNo");
            Customer c = dao.findByAccountNo(acc);
            req.setAttribute("customer", c);
            req.getRequestDispatcher("/jsp/displayAccount.jsp").forward(req, resp);
        }
    }
}
