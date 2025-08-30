package com.pahanaedu.storage;

import jakarta.servlet.ServletContext;
import java.io.*;
import java.util.*;

public class FileStorage {
    private static FileStorage instance;
    private ServletContext ctx;
    private FileStorage(ServletContext ctx){ this.ctx = ctx; }

    public static synchronized void init(ServletContext ctx) {
        if (instance == null) instance = new FileStorage(ctx);
    }
    public static FileStorage getInstance() { return instance; }

    public synchronized List<String> readAllLines(String relativePath) throws IOException {
        String full = ctx.getRealPath(relativePath);
        File f = new File(full);
        if (!f.exists()) {
            f.getParentFile().mkdirs();
            f.createNewFile();
        }
        List<String> lines = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(f))) {
            String line;
            while ((line = br.readLine()) != null) lines.add(line);
        }
        return lines;
    }

    public synchronized void writeAllLines(String relativePath, List<String> lines) throws IOException {
        String full = ctx.getRealPath(relativePath);
        File f = new File(full);
        if (!f.exists()) {
            f.getParentFile().mkdirs();
            f.createNewFile();
        }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(f, false))) {
            for (String l : lines) {
                bw.write(l);
                bw.newLine();
            }
        }
    }

    public String getRealPath(String rel) { return ctx.getRealPath(rel); }
}
