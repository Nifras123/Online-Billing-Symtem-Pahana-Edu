<%@ page session="true" %>
<%
 if (session.getAttribute("user")==null) { 
     response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); 
     return; 
 }
%>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="title mb-1"><i class="bi bi-person-plus me-2"></i>Add New Customer</h1>
                <div class="subtitle">Register a new customer account</div>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Customers
                </a>
            </div>
        </div>
    </div>

    <!-- Add Customer Form -->
    <div class="card card-elevated">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="bi bi-person-plus me-2"></i>Customer Information</h5>
        </div>
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/servlet/customer" class="row g-3">
                <input type="hidden" name="action" value="add" />

                <div class="col-md-6">
                    <label class="form-label fw-bold">Account Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-hash"></i></span>
                        <input name="accountNo" class="form-control" placeholder="Enter account number" required />
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">Customer Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input name="name" class="form-control" placeholder="Enter customer name" required />
                    </div>
                </div>

                <div class="col-12">
                    <label class="form-label fw-bold">Address</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                        <textarea name="address" class="form-control" rows="3" placeholder="Enter customer address"></textarea>
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">Telephone</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                        <input name="telephone" class="form-control" placeholder="Enter phone number" />
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label fw-bold">Units Consumed</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lightning"></i></span>
                        <input name="units" type="number" step="0.01" class="form-control" placeholder="0.00" required />
                    </div>
                </div>

                <div class="col-12">
                    <hr class="my-4">
                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-person-plus me-1"></i>Add Customer
                        </button>
                        <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-outline-secondary">
                            <i class="bi bi-x-circle me-1"></i>Cancel
                        </a>
                    </div>
                </div>
            </form>

            <c:if test="${not empty requestScope.success}">
                <div class="alert alert-success mt-3">
                    <i class="bi bi-check-circle me-2"></i>${requestScope.success}
                </div>
            </c:if>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
