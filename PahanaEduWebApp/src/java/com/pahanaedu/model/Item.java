package com.pahanaedu.model;

public class Item {
    private String id;
    private String name;
    private double price;

    public Item() {}
    public Item(String id, String name, double price) { this.id = id; this.name = name; this.price = price; }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String toCSV() {
        return String.join(",", id, name, String.valueOf(price));
    }
    public static Item fromCSV(String line) {
        String[] p = line.split(",", -1);
        if (p.length < 3) return null;
        return new Item(p[0], p[1], Double.parseDouble(p[2]));
    }
}
