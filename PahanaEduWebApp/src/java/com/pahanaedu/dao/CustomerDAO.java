package com.pahanaedu.dao;

import com.pahanaedu.model.Customer;
import com.pahanaedu.storage.FileStorage;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.util.*;

public class CustomerDAO {
    private final String path = "/WEB-INF/data/customers.csv";
    private FileStorage fs;

    public CustomerDAO(ServletContext ctx) {
        FileStorage.init(ctx);
        fs = FileStorage.getInstance();
    }

    public synchronized List<Customer> getAll() throws IOException {
        List<String> lines = fs.readAllLines(path);
        List<Customer> out = new ArrayList<>();
        for (String l : lines) {
            Customer c = Customer.fromCSV(l);
            if (c != null) out.add(c);
        }
        return out;
    }

    public synchronized Customer findByAccountNo(String acc) throws IOException {
        for (Customer c : getAll()) if (c.getAccountNo().equals(acc)) return c;
        return null;
    }

    public synchronized void add(Customer c) throws IOException {
        List<String> lines = fs.readAllLines(path);
        lines.add(c.toCSV());
        fs.writeAllLines(path, lines);
    }

    public synchronized void update(Customer updated) throws IOException {
        List<Customer> all = getAll();
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getAccountNo().equals(updated.getAccountNo())) {
                all.set(i, updated);
                break;
            }
        }
        List<String> lines = new ArrayList<>();
        for (Customer c : all) lines.add(c.toCSV());
        fs.writeAllLines(path, lines);
    }

    public synchronized void delete(String accountNo) throws IOException {
        List<Customer> all = getAll();
        all.removeIf(c -> c.getAccountNo().equals(accountNo));
        List<String> lines = new ArrayList<>();
        for (Customer c : all) lines.add(c.toCSV());
        fs.writeAllLines(path, lines);
    }
}
