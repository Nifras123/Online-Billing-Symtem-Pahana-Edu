package com.pahanaedu.billing;

public class StandardBillingStrategy implements BillingStrategy {
    // Example slab: first 50 units = 5 per unit, next 50 = 7, above = 10
    @Override
    public double calculate(double units) {
        double bill = 0;
        double remaining = units;
        if (remaining <= 50) {
            bill += remaining * 5;
            remaining = 0;
        } else {
            bill += 50 * 5;
            remaining -= 50;
        }
        if (remaining > 0) {
            if (remaining <= 50) {
                bill += remaining * 7;
                remaining = 0;
            } else {
                bill += 50 * 7;
                remaining -= 50;
            }
        }
        if (remaining > 0) {
            bill += remaining * 10;
        }
        return bill;
    }
}

