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
        return String.join(
                ",",
                quote(accountNo),
                quote(name),
                quote(address),
                quote(telephone),
                String.valueOf(unitsConsumed)
        );
    }

    public static Customer fromCSV(String line) {
        String[] parts = parseCSVLine(line);
        if (parts == null || parts.length < 5) return null;
        return new Customer(parts[0], parts[1], parts[2], parts[3], Double.parseDouble(parts[4]));
    }

    // RFC4180-style quoting for fields containing commas or quotes
    private static String quote(String s) {
        if (s == null) return "";
        boolean needsQuotes = s.indexOf(',') >= 0 || s.indexOf('"') >= 0 || s.indexOf('\n') >= 0 || s.indexOf('\r') >= 0;
        String out = s.replace("\"", "\"\"");
        return needsQuotes ? ("\"" + out + "\"") : out;
    }

    // Parser that supports both double-quote CSV and legacy backslash-escaped commas (\,)
    private static String[] parseCSVLine(String line) {
        if (line == null) return null;
        java.util.List<String> fields = new java.util.ArrayList<>();
        StringBuilder current = new StringBuilder();
        boolean inQuotes = false;
        for (int i = 0; i < line.length(); i++) {
            char c = line.charAt(i);
            if (inQuotes) {
                if (c == '"') {
                    // lookahead for escaped quote
                    if (i + 1 < line.length() && line.charAt(i + 1) == '"') {
                        current.append('"');
                        i++;
                    } else {
                        inQuotes = false;
                    }
                } else {
                    current.append(c);
                }
            } else {
                if (c == '"') {
                    inQuotes = true;
                } else if (c == '\\') {
                    // legacy escape for comma
                    if (i + 1 < line.length() && line.charAt(i + 1) == ',') {
                        current.append(',');
                        i++;
                    } else {
                        current.append(c);
                    }
                } else if (c == ',') {
                    fields.add(current.toString());
                    current.setLength(0);
                } else {
                    current.append(c);
                }
            }
        }
        fields.add(current.toString());
        return fields.toArray(new String[0]);
    }
}
