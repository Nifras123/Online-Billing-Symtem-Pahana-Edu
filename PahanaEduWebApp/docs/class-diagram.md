# Pahana Edu Billing System - Class Diagram

## Overview
This document provides a comprehensive class diagram for the Pahana Edu Billing System, a Jakarta EE web application for managing customers, items, and billing.

## Class Diagram

```mermaid
classDiagram
    %% Servlet Classes
    class AuthServlet {
        -String ADMIN_USER
        -String ADMIN_PASS
        +doPost(HttpServletRequest, HttpServletResponse)
        +doGet(HttpServletRequest, HttpServletResponse)
    }
    
    class CustomerServlet {
        -CustomerDAO dao
        +init()
        +doPost(HttpServletRequest, HttpServletResponse)
        +doGet(HttpServletRequest, HttpServletResponse)
    }
    
    class ItemServlet {
        -ItemDAO dao
        +init()
        +doPost(HttpServletRequest, HttpServletResponse)
        +doGet(HttpServletRequest, HttpServletResponse)
    }
    
    class BillingServlet {
        -CustomerDAO dao
        -BillingStrategy strategy
        +init()
        +doGet(HttpServletRequest, HttpServletResponse)
    }
    
    %% Model Classes
    class Customer {
        -String accountNo
        -String name
        -String address
        -String telephone
        -double unitsConsumed
        +Customer()
        +Customer(String, String, String, String, double)
        +getAccountNo() String
        +setAccountNo(String)
        +getName() String
        +setName(String)
        +getAddress() String
        +setAddress(String)
        +getTelephone() String
        +setTelephone(String)
        +getUnitsConsumed() double
        +setUnitsConsumed(double)
        +toCSV() String
        +fromCSV(String) Customer
        -quote(String) String
        -parseCSVLine(String) String[]
    }
    
    class Item {
        -String id
        -String name
        -double price
        +Item()
        +Item(String, String, double)
        +getId() String
        +setId(String)
        +getName() String
        +setName(String)
        +getPrice() double
        +setPrice(double)
        +toCSV() String
        +fromCSV(String) Item
    }
    
    %% DAO Classes
    class CustomerDAO {
        -String path
        -FileStorage fs
        +CustomerDAO(ServletContext)
        +getAll() List~Customer~
        +findByAccountNo(String) Customer
        +add(Customer)
        +update(Customer)
        +delete(String)
    }
    
    class ItemDAO {
        -String path
        -FileStorage fs
        +ItemDAO(ServletContext)
        +getAll() List~Item~
        +findById(String) Item
        +add(Item)
        +update(Item)
        +delete(String)
    }
    
    %% Storage Classes
    class FileStorage {
        -static FileStorage instance
        -ServletContext ctx
        -FileStorage(ServletContext)
        +init(ServletContext)
        +getInstance() FileStorage
        +readAllLines(String) List~String~
        +writeAllLines(String, List~String~)
        +getRealPath(String) String
    }
    
    %% Billing Classes
    class BillingStrategy {
        <<interface>>
        +calculate(double) double
    }
    
    class StandardBillingStrategy {
        +calculate(double) double
    }
    
    
    
    %% Relationships
    AuthServlet --> CustomerServlet : redirects to
    AuthServlet --> ItemServlet : redirects to
    AuthServlet --> BillingServlet : redirects to
    
    CustomerServlet --> CustomerDAO : uses
    CustomerServlet --> Customer : manages
    ItemServlet --> ItemDAO : uses
    ItemServlet --> Item : manages
    BillingServlet --> CustomerDAO : uses
    BillingServlet --> BillingStrategy : uses
    BillingServlet --> Customer : processes
    
    CustomerDAO --> FileStorage : uses
    CustomerDAO --> Customer : manages
    ItemDAO --> FileStorage : uses
    ItemDAO --> Item : manages
    
         StandardBillingStrategy ..|> BillingStrategy : implements
```

## Class Descriptions

### Servlet Layer
- **AuthServlet**: Handles user authentication (login/logout) with hardcoded admin credentials
- **CustomerServlet**: Manages customer CRUD operations (Create, Read, Update, Delete)
- **ItemServlet**: Manages item CRUD operations for inventory
- **BillingServlet**: Handles billing calculations and bill generation

### Model Layer
- **Customer**: Represents customer data with CSV serialization/deserialization support
- **Item**: Represents inventory items with basic CSV support

### Data Access Layer
- **CustomerDAO**: Data Access Object for customer operations using file-based storage
- **ItemDAO**: Data Access Object for item operations using file-based storage
- **FileStorage**: Singleton utility class for file I/O operations

### Business Logic Layer
- **BillingStrategy**: Interface for billing calculation strategies
- **StandardBillingStrategy**: Implementation of tiered billing calculation



## Key Design Patterns

1. **MVC Pattern**: Servlets (Controller), JSPs (View), Models (Model)
2. **DAO Pattern**: Data Access Objects for database/file operations
3. **Strategy Pattern**: BillingStrategy interface for different billing algorithms
4. **Singleton Pattern**: FileStorage for centralized file operations
5. **Factory Pattern**: CSV parsing methods in model classes

## Data Flow

1. **Authentication**: AuthServlet → Session Management
2. **Customer Management**: CustomerServlet → CustomerDAO → FileStorage → CSV Files
3. **Item Management**: ItemServlet → ItemDAO → FileStorage → CSV Files
4. **Billing**: BillingServlet → CustomerDAO → BillingStrategy → Bill Generation

## File Structure
```
src/java/com/pahanaedu/
├── servlet/          # Controller layer
├── model/           # Data models
├── dao/             # Data access layer
├── storage/         # File storage utilities
└── billing/         # Business logic
```

This class diagram shows a well-structured Jakarta EE application with clear separation of concerns and proper layering.
