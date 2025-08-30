package com.pahanaedu.dao;

import com.pahanaedu.model.Item;
import com.pahanaedu.storage.FileStorage;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.util.*;

public class ItemDAO {
    private final String path = "/WEB-INF/data/items.csv";
    private FileStorage fs;

    public ItemDAO(ServletContext ctx) {
        FileStorage.init(ctx);
        fs = FileStorage.getInstance();
    }

    public synchronized List<Item> getAll() throws IOException {
        List<String> lines = fs.readAllLines(path);
        List<Item> out = new ArrayList<>();
        for (String l : lines) {
            Item it = Item.fromCSV(l);
            if (it != null) out.add(it);
        }
        return out;
    }

    public synchronized Item findById(String id) throws IOException {
        for (Item it : getAll()) if (it.getId().equals(id)) return it;
        return null;
    }

    public synchronized void add(Item it) throws IOException {
        List<String> lines = fs.readAllLines(path);
        lines.add(it.toCSV());
        fs.writeAllLines(path, lines);
    }

    public synchronized void update(Item updated) throws IOException {
        List<Item> all = getAll();
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getId().equals(updated.getId())) {
                all.set(i, updated);
                break;
            }
        }
        List<String> lines = new ArrayList<>();
        for (Item it : all) lines.add(it.toCSV());
        fs.writeAllLines(path, lines);
    }

    public synchronized void delete(String id) throws IOException {
        List<Item> all = getAll();
        all.removeIf(it -> it.getId().equals(id));
        List<String> lines = new ArrayList<>();
        for (Item it : all) lines.add(it.toCSV());
        fs.writeAllLines(path, lines);
    }
}
