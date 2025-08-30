<%@ page session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<%@ include file="../includes/header.jsp" %>

<div class="container my-5">
    <div class="page-header mb-4">
        <h1 class="title mb-1">Welcome, ${sessionScope.user}</h1>
        <div class="subtitle">Quick access to key sections of the Pahana Edu Billing System</div>
    </div>

    <div class="row g-4">
        <!-- Manage Items -->
        <div class="col-md-6">
            <div class="card feature-card h-100 text-center p-3">
                <div class="card-body">
                    <h5 class="card-title">Manage Items</h5>
                    <p class="card-text text-muted-2">Add, update, and remove shop items</p>
                    <a href="${pageContext.request.contextPath}/servlet/item?action=list" class="btn btn-warning text-white"><i class="bi bi-box-seam me-1"></i> Open</a>
                </div>
            </div>
        </div>

        <!-- Manage Customers -->
        <div class="col-md-6">
            <div class="card feature-card h-100 text-center p-3">
                <div class="card-body">
                    <h5 class="card-title">Manage Customers</h5>
                    <p class="card-text text-muted-2">Add new customers or view existing ones</p>
                    <div class="d-flex gap-2 justify-content-center">
                        <a href="${pageContext.request.contextPath}/jsp/addCustomer.jsp" class="btn btn-primary"><i class="bi bi-person-plus me-1"></i> Add New</a>
                        <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-success"><i class="bi bi-people me-1"></i> View All</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
