<%@ page session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<%@ include file="../includes/header.jsp" %>

<div class="container my-5">
    <h1 class="mb-4">Welcome, ${sessionScope.user}</h1>
    <p class="text-muted mb-5">Quick access to key sections of Pahana Edu Billing System</p>

    <div class="row g-4">
        <!-- Add Customer -->
        <div class="col-md-3">
            <div class="card shadow-lg border-0 h-100 text-center p-3 hover-card">
                <div class="card-body">
                    <h5 class="card-title">Add Customer</h5>
                    <p class="card-text text-muted">Register new customer accounts</p>
                    <a href="${pageContext.request.contextPath}/jsp/addCustomer.jsp" class="btn btn-primary">Go</a>
                </div>
            </div>
        </div>

        <!-- Manage Items -->
        <div class="col-md-3">
            <div class="card shadow-lg border-0 h-100 text-center p-3 hover-card">
                <div class="card-body">
                    <h5 class="card-title">Manage Items</h5>
                    <p class="card-text text-muted">Add, update, and remove shop items</p>
                    <a href="${pageContext.request.contextPath}/servlet/item?action=list" class="btn btn-warning text-white">Go</a>
                </div>
            </div>
        </div>

        <!-- View Customers -->
        <div class="col-md-3">
            <div class="card shadow-lg border-0 h-100 text-center p-3 hover-card">
                <div class="card-body">
                    <h5 class="card-title">View Customers</h5>
                    <p class="card-text text-muted">Browse, edit, or delete customer accounts</p>
                    <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-success">Go</a>
                </div>
            </div>
        </div>

        <!-- Help -->
        <div class="col-md-3">
            <div class="card shadow-lg border-0 h-100 text-center p-3 hover-card">
                <div class="card-body">
                    <h5 class="card-title">Help</h5>
                    <p class="card-text text-muted">How to use the system</p>
                    <a href="${pageContext.request.contextPath}/jsp/help.jsp" class="btn btn-info text-white">Go</a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .hover-card {
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    .hover-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.15);
    }
</style>

<%@ include file="../includes/footer.jsp" %>
