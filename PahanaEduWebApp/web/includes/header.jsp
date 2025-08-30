<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Billing System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar-brand { font-weight: bold; }
        .card { border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark app-navbar">
  <div class="container-fluid position-relative">
      <a class="navbar-brand mx-auto d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/jsp/dashboard.jsp">
          <i class="bi bi-lightning-charge-fill"></i>
          <span>Pahana Edu</span>
      </a>
      <div class="position-absolute end-0">
          <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/help.jsp">Help</a></li>
              <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/servlet/auth?action=logout">Logout</a></li>
          </ul>
      </div>
  </div>
</nav>
<div class="container mt-4">
 
