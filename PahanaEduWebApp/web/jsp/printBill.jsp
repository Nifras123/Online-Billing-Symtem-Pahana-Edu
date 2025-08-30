<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) { 
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); 
        return; 
    }
    com.pahanaedu.model.Customer c = (com.pahanaedu.model.Customer) request.getAttribute("customer");
    Double amount = (Double) request.getAttribute("amount");
%>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="title mb-1"><i class="bi bi-receipt me-2"></i>Customer Bill</h1>
                <div class="subtitle">Generate and print customer billing statement</div>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Customers
                </a>
            </div>
        </div>
    </div>

    <!-- Bill Details -->
    <div class="card card-elevated">
        <div class="card-header bg-success text-white text-center">
            <h4 class="mb-0"><i class="bi bi-receipt me-2"></i>Electricity Bill Statement</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-person-circle me-2 text-primary" style="font-size: 1.5rem;"></i>
                                <div>
                                    <h5 class="mb-0"><%= c.getName() %></h5>
                                    <small class="text-muted-2">Customer Name</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-hash me-2 text-info" style="font-size: 1.5rem;"></i>
                                <div>
                                    <h5 class="mb-0"><%= c.getAccountNo() %></h5>
                                    <small class="text-muted-2">Account Number</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-geo-alt me-2 text-warning" style="font-size: 1.5rem;"></i>
                                <div>
                                    <h6 class="mb-0"><%= c.getAddress() != null ? c.getAddress() : "Address not provided" %></h6>
                                    <small class="text-muted-2">Billing Address</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-telephone me-2 text-success" style="font-size: 1.5rem;"></i>
                                <div>
                                    <h6 class="mb-0"><%= c.getTelephone() != null ? c.getTelephone() : "Phone not provided" %></h6>
                                    <small class="text-muted-2">Contact Number</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-light text-dark">
                        <div class="card-body text-center">
                            <h6 class="text-muted mb-2">Billing Summary</h6>
                            <div class="d-flex justify-content-between mb-2">
                                <span>Units Consumed:</span>
                                <strong><%= c.getUnitsConsumed() %> kWh</strong>
                            </div>
                            <hr class="my-2">
                            <div class="d-flex justify-content-between">
                                <span class="h6 mb-0">Total Amount:</span>
                                <span class="h5 mb-0 text-success">Rs. <%= String.format("%.2f", amount) %></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-footer text-center">
            <div class="d-flex gap-2 justify-content-center">
                <button class="btn btn-success" onclick="window.print()">
                    <i class="bi bi-printer me-1"></i>Print Bill
                </button>
                <button class="btn btn-outline-primary" onclick="window.print()">
                    <i class="bi bi-download me-1"></i>Save as PDF
                </button>
                <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-outline-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Customers
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
