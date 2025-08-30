# Pahana Edu Billing System - Test Cases

## Overview
This document contains comprehensive test cases for the Pahana Edu Billing System, covering all major functionality including authentication, customer management, item management, billing calculations, and edge cases.

## Test Case Categories

### 1. Authentication & Authorization Tests
### 2. Customer Management Tests
### 3. Item Management Tests
### 4. Billing System Tests
### 5. Data Validation Tests
### 6. Edge Cases & Error Handling Tests
### 7. CSV Data Processing Tests
### 8. Session Management Tests

---

## Test Cases

| Task No | Test Type | Section | Input | Expected Output | Test Data |
|---------|-----------|---------|-------|-----------------|-----------|
| **AUTHENTICATION & AUTHORIZATION TESTS** |
| 1 | Admin Login | Authentication | Username: "admin", Password: "admin123" | Login successful, redirect to dashboard | Valid credentials |
| 2 | Admin Login | Authentication | Username: "admin", Password: "wrongpass" | Error: "Invalid username or password" | Invalid password |
| 3 | Admin Login | Authentication | Username: "wronguser", Password: "admin123" | Error: "Invalid username or password" | Invalid username |
| 4 | Admin Login | Authentication | Username: "", Password: "" | Form validation error | Empty fields |
| 5 | Admin Login | Authentication | Username: "admin", Password: "" | Form validation error | Empty password |
| 6 | Admin Login | Authentication | Username: "", Password: "admin123" | Form validation error | Empty username |
| 7 | Admin Login | Authentication | Username: "ADMIN", Password: "admin123" | Error: "Invalid username or password" | Case sensitive |
| 8 | Admin Login | Authentication | Username: "admin ", Password: "admin123" | Error: "Invalid username or password" | Trailing space |
| 9 | Admin Login | Authentication | Username: " admin", Password: "admin123" | Error: "Invalid username or password" | Leading space |
| 10 | Admin Login | Authentication | Username: "admin", Password: "admin123 " | Error: "Invalid username or password" | Trailing space in password |
| 11 | Admin Login | Authentication | Username: "admin", Password: " admin123" | Error: "Invalid username or password" | Leading space in password |
| 12 | Admin Login | Authentication | Username: "admin", Password: "Admin123" | Error: "Invalid username or password" | Case sensitive password |
| 13 | Admin Login | Authentication | Username: "admin", Password: "admin1234" | Error: "Invalid username or password" | Extra character |
| 14 | Admin Login | Authentication | Username: "admin", Password: "admin12" | Error: "Invalid username or password" | Missing character |
| 15 | Admin Login | Authentication | Username: "admin", Password: "123admin" | Error: "Invalid username or password" | Reversed password |
| 16 | Admin Login | Authentication | Username: "admin", Password: "admin123" | Session created, user logged in | Valid login |
| 17 | Admin Logout | Authentication | Click logout button | Session invalidated, redirect to login | Logout functionality |
| 18 | Session Timeout | Authentication | Wait for session timeout | Redirect to login page | Session management |
| 19 | Unauthorized Access | Authorization | Access dashboard without login | Redirect to login page | Access control |
| 20 | Unauthorized Access | Authorization | Access customer list without login | Redirect to login page | Access control |

| **CUSTOMER MANAGEMENT TESTS** |
| 21 | Add Customer | Customer CRUD | Valid customer data | Customer added successfully | Account: "C001", Name: "John Doe", Address: "123 Main St", Phone: "1234567890", Units: 150.5 |
| 22 | Add Customer | Customer CRUD | Duplicate account number | Error: Account number already exists | Account: "C001" (existing) |
| 23 | Add Customer | Customer CRUD | Empty account number | Form validation error | Account: "" |
| 24 | Add Customer | Customer CRUD | Empty customer name | Form validation error | Name: "" |
| 25 | Add Customer | Customer CRUD | Empty units consumed | Form validation error | Units: "" |
| 26 | Add Customer | Customer CRUD | Invalid units (negative) | Form validation error | Units: -50 |
| 27 | Add Customer | Customer CRUD | Invalid units (zero) | Form validation error | Units: 0 |
| 28 | Add Customer | Customer CRUD | Invalid units (text) | Form validation error | Units: "abc" |
| 29 | Add Customer | Customer CRUD | Very long account number | Customer added successfully | Account: "C" + "0".repeat(100) |
| 30 | Add Customer | Customer CRUD | Very long customer name | Customer added successfully | Name: "A".repeat(500) |
| 31 | Add Customer | Customer CRUD | Very long address | Customer added successfully | Address: "B".repeat(1000) |
| 32 | Add Customer | Customer CRUD | Special characters in name | Customer added successfully | Name: "José María O'Connor-Smith" |
| 33 | Add Customer | Customer CRUD | Special characters in address | Customer added successfully | Address: "123 Main St, Apt #4B, City, State 12345" |
| 34 | Add Customer | Customer CRUD | Phone with special characters | Customer added successfully | Phone: "+1-234-567-8900" |
| 35 | Add Customer | Customer CRUD | Phone with spaces | Customer added successfully | Phone: "123 456 7890" |
| 36 | Add Customer | Customer CRUD | Phone with dashes | Customer added successfully | Phone: "123-456-7890" |
| 37 | Add Customer | Customer CRUD | Phone with parentheses | Customer added successfully | Phone: "(123) 456-7890" |
| 38 | Add Customer | Customer CRUD | Phone with country code | Customer added successfully | Phone: "+91 98765 43210" |
| 39 | Add Customer | Customer CRUD | Decimal units | Customer added successfully | Units: 150.75 |
| 40 | Add Customer | Customer CRUD | Large units value | Customer added successfully | Units: 999999.99 |
| 41 | View Customer | Customer CRUD | Valid account number | Customer details displayed | Account: "C001" |
| 42 | View Customer | Customer CRUD | Invalid account number | Error: Customer not found | Account: "INVALID" |
| 43 | View Customer | Customer CRUD | Empty account number | Error: Customer not found | Account: "" |
| 44 | Edit Customer | Customer CRUD | Valid customer data | Customer updated successfully | Update name: "Jane Doe" |
| 45 | Edit Customer | Customer CRUD | Update account number | Error: Account number cannot be changed | Account: "C002" |
| 46 | Edit Customer | Customer CRUD | Update with invalid data | Form validation error | Units: -100 |
| 47 | Delete Customer | Customer CRUD | Valid account number | Customer deleted successfully | Account: "C001" |
| 48 | Delete Customer | Customer CRUD | Invalid account number | Error: Customer not found | Account: "INVALID" |
| 49 | List Customers | Customer CRUD | No customers | Message: "No customers found" | Empty database |
| 50 | List Customers | Customer CRUD | Multiple customers | All customers displayed | 5 customers in database |

| **ITEM MANAGEMENT TESTS** |
| 51 | Add Item | Item CRUD | Valid item data | Item added successfully | ID: "I001", Name: "Laptop", Price: 999.99 |
| 52 | Add Item | Item CRUD | Duplicate item ID | Error: Item ID already exists | ID: "I001" (existing) |
| 53 | Add Item | Item CRUD | Empty item ID | Form validation error | ID: "" |
| 54 | Add Item | Item CRUD | Empty item name | Form validation error | Name: "" |
| 55 | Add Item | Item CRUD | Empty price | Form validation error | Price: "" |
| 56 | Add Item | Item CRUD | Negative price | Form validation error | Price: -50.00 |
| 57 | Add Item | Item CRUD | Zero price | Form validation error | Price: 0.00 |
| 58 | Add Item | Item CRUD | Invalid price (text) | Form validation error | Price: "abc" |
| 59 | Add Item | Item CRUD | Very high price | Item added successfully | Price: 999999.99 |
| 60 | Add Item | Item CRUD | Very small price | Item added successfully | Price: 0.01 |
| 61 | Add Item | Item CRUD | Price with many decimals | Item added successfully | Price: 123.456789 |
| 62 | Add Item | Item CRUD | Special characters in name | Item added successfully | Name: "Laptop Pro™ 2024" |
| 63 | Add Item | Item CRUD | Very long item name | Item added successfully | Name: "A".repeat(500) |
| 64 | Add Item | Item CRUD | Very long item ID | Item added successfully | ID: "I" + "0".repeat(100) |
| 65 | Edit Item | Item CRUD | Valid item data | Item updated successfully | Update price: 899.99 |
| 66 | Edit Item | Item CRUD | Update with invalid data | Form validation error | Price: -100 |
| 67 | Delete Item | Item CRUD | Valid item ID | Item deleted successfully | ID: "I001" |
| 68 | Delete Item | Item CRUD | Invalid item ID | Error: Item not found | ID: "INVALID" |
| 69 | List Items | Item CRUD | No items | Message: "No items found" | Empty database |
| 70 | List Items | Item CRUD | Multiple items | All items displayed | 10 items in database |

| **BILLING SYSTEM TESTS** |
| 71 | Calculate Bill | Billing | 0 units consumed | Bill: Rs. 0.00 | Units: 0 |
| 72 | Calculate Bill | Billing | 25 units consumed | Bill: Rs. 125.00 | Units: 25 (5 per unit) |
| 73 | Calculate Bill | Billing | 50 units consumed | Bill: Rs. 250.00 | Units: 50 (5 per unit) |
| 74 | Calculate Bill | Billing | 75 units consumed | Bill: Rs. 500.00 | Units: 75 (50×5 + 25×7) |
| 75 | Calculate Bill | Billing | 100 units consumed | Bill: Rs. 750.00 | Units: 100 (50×5 + 50×7) |
| 76 | Calculate Bill | Billing | 125 units consumed | Bill: Rs. 1000.00 | Units: 125 (50×5 + 50×7 + 25×10) |
| 77 | Calculate Bill | Billing | 200 units consumed | Bill: Rs. 1750.00 | Units: 200 (50×5 + 50×7 + 100×10) |
| 78 | Calculate Bill | Billing | Decimal units (25.5) | Bill: Rs. 127.50 | Units: 25.5 |
| 79 | Calculate Bill | Billing | Very high units (10000) | Bill: Rs. 98750.00 | Units: 10000 |
| 80 | Generate Bill | Billing | Valid customer account | Bill generated successfully | Account: "C001" |
| 81 | Generate Bill | Billing | Invalid customer account | Error: Customer not found | Account: "INVALID" |
| 82 | Generate Bill | Billing | Customer with zero units | Bill with zero amount | Units: 0 |
| 83 | Print Bill | Billing | Valid bill | Print dialog opens | Valid bill data |
| 84 | Bill Display | Billing | Customer details | All customer info displayed | Name, address, phone, units |
| 85 | Bill Calculation | Billing | Edge case units | Correct calculation | Units: 49.99, 50.01, 99.99, 100.01 |

| **CSV DATA PROCESSING TESTS** |
| 86 | CSV Export | Data Export | Customer data | CSV file generated | Customer list export |
| 87 | CSV Export | Data Export | Item data | CSV file generated | Item list export |
| 88 | CSV Import | Data Import | Valid CSV format | Data imported successfully | Standard CSV |
| 89 | CSV Import | Data Import | CSV with quotes | Data imported successfully | "Name, "Address"" |
| 90 | CSV Import | Data Import | CSV with commas in data | Data imported successfully | "Name", "Address, City" |
| 91 | CSV Import | Data Import | CSV with newlines | Data imported successfully | "Name", "Address\nCity" |
| 92 | CSV Import | Data Import | CSV with special characters | Data imported successfully | "José", "O'Connor" |
| 93 | CSV Import | Data Import | Empty CSV file | Error: No data found | Empty file |
| 94 | CSV Import | Data Import | Malformed CSV | Error: Invalid format | Corrupted data |
| 95 | CSV Import | Data Import | CSV with missing fields | Error: Incomplete data | Missing required fields |

| **EDGE CASES & ERROR HANDLING TESTS** |
| 96 | Large Data | Performance | 1000 customers | System handles load | Bulk data test |
| 97 | Large Data | Performance | 1000 items | System handles load | Bulk data test |
| 98 | Concurrent Access | Threading | Multiple users | Data consistency maintained | Race condition test |
| 99 | File Corruption | Data Integrity | Corrupted CSV file | Error handled gracefully | File system test |
| 100 | Disk Space | System | Full disk | Error: Insufficient space | System resource test |
| 101 | Memory Usage | Performance | Large datasets | Memory usage optimized | Resource management |
| 102 | Network Timeout | Connectivity | Slow connection | Timeout handled | Network simulation |
| 103 | Invalid Characters | Input Validation | SQL injection attempt | Input sanitized | Security test |
| 104 | XSS Prevention | Security | Script tags in input | Scripts not executed | Security test |
| 105 | Session Hijacking | Security | Invalid session | Access denied | Security test |

| **SESSION & NAVIGATION TESTS** |
| 106 | Navigation | UI | Dashboard links | All links functional | Navigation test |
| 107 | Navigation | UI | Back button functionality | Previous page loaded | Browser navigation |
| 108 | Navigation | UI | Breadcrumb navigation | Correct path shown | UI navigation |
| 109 | Responsive Design | UI | Mobile view | Layout adapts correctly | Responsive test |
| 110 | Responsive Design | UI | Tablet view | Layout adapts correctly | Responsive test |
| 111 | Responsive Design | UI | Desktop view | Layout displays correctly | Responsive test |
| 112 | Browser Compatibility | UI | Chrome browser | All features work | Browser test |
| 113 | Browser Compatibility | UI | Firefox browser | All features work | Browser test |
| 114 | Browser Compatibility | UI | Safari browser | All features work | Browser test |
| 115 | Browser Compatibility | UI | Edge browser | All features work | Browser test |

## Test Execution Guidelines

### Prerequisites
- Application deployed and running
- Test database with sample data
- Test environment configured
- All dependencies installed

### Test Data Setup
1. **Valid Admin Credentials**: admin/admin123
2. **Sample Customers**: 5-10 test customers with various data
3. **Sample Items**: 5-10 test items with various prices
4. **Edge Case Data**: Special characters, very long strings, boundary values

### Test Environment
- **Browser**: Chrome, Firefox, Safari, Edge
- **Screen Sizes**: Mobile (320px), Tablet (768px), Desktop (1024px+)
- **Network Conditions**: Normal, Slow, Offline simulation

### Test Execution Order
1. Authentication tests
2. Basic CRUD operations
3. Business logic tests
4. Edge cases
5. Performance tests
6. Security tests
7. UI/UX tests

### Expected Results
- All tests should pass
- Error messages should be user-friendly
- System should handle edge cases gracefully
- Performance should be acceptable under load
- Security vulnerabilities should be absent

### Reporting
- Test results documented
- Failed tests logged with details
- Performance metrics recorded
- Security issues reported immediately
- Recommendations for improvements

This comprehensive test suite covers all aspects of the Pahana Edu Billing System and ensures robust functionality across different scenarios and conditions.

