package com.pahanaedu.servlet;

import com.pahanaedu.dao.ItemDAO;
import com.pahanaedu.model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ItemServlet extends HttpServlet {
    private ItemDAO dao;

    @Override
    public void init() { dao = new ItemDAO(getServletContext()); }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            Item it = new Item(
                req.getParameter("id"),
                req.getParameter("name"),
                Double.parseDouble(req.getParameter("price"))
            );
            dao.add(it);
            resp.sendRedirect(req.getContextPath() + "/servlet/item?action=list");
            
        } else if ("update".equals(action)) {
            Item it = new Item(
                req.getParameter("id"),
                req.getParameter("name"),
                Double.parseDouble(req.getParameter("price"))
            );
            dao.update(it);
            resp.sendRedirect(req.getContextPath() + "/servlet/item?action=list");
        }
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("list".equals(action) || action==null) {
            List<Item> items = dao.getAll();
            req.setAttribute("items", items);
            req.getRequestDispatcher("/jsp/manageItems.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            dao.delete(req.getParameter("id"));
            resp.sendRedirect(req.getContextPath() + "/servlet/item?action=list");
        }
    }
}
