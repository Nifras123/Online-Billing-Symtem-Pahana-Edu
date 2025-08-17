<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Billing System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar-brand { font-weight: bold; }
        .card { border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/jsp/dashboard.jsp">Pahana Edu</a>
      <div class="collapse navbar-collapse">
          <ul class="navbar-nav ms-auto">
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/addCustomer.jsp">Add Customer</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/servlet/item?action=list">Manage Items</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/servlet/customer?action=list">List Customers</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/help.jsp">Help</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/servlet/auth?action=logout">Logout</a></li>
          </ul>
      </div>
  </div>
</nav>
<div class="container mt-4">
 
