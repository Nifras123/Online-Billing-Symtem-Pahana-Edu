package com.pahanaedu.model;

public class Customer {
    private String accountNo;
    private String name;
    private String address;
    private String telephone;
    private double unitsConsumed;

    public Customer() {}

    public Customer(String accountNo, String name, String address, String telephone, double unitsConsumed) {
        this.accountNo = accountNo;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
        this.unitsConsumed = unitsConsumed;
    }

    public String getAccountNo() { return accountNo; }
    public void setAccountNo(String accountNo) { this.accountNo = accountNo; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getTelephone() { return telephone; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public double getUnitsConsumed() { return unitsConsumed; }
    public void setUnitsConsumed(double unitsConsumed) { this.unitsConsumed = unitsConsumed; }

    public String toCSV() {
        return String.join(",", escape(accountNo), escape(name), escape(address), escape(telephone), String.valueOf(unitsConsumed));
    }

    public static Customer fromCSV(String line) {
        String[] parts = line.split(",", -1);
        if (parts.length < 5) return null;
        return new Customer(unescape(parts[0]), unescape(parts[1]), unescape(parts[2]), unescape(parts[3]), Double.parseDouble(parts[4]));
    }

    private static String escape(String s) {
        return s == null ? "" : s.replace(",", "\\,");
    }
    private static String unescape(String s) {
        return s == null ? "" : s.replace("\\,", ",");
    }
}
