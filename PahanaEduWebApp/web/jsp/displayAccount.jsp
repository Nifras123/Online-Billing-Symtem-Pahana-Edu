<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) { 
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); 
        return; 
    }
    com.pahanaedu.model.Customer customer = (com.pahanaedu.model.Customer) request.getAttribute("customer");
%>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="title mb-1"><i class="bi bi-person-circle me-2"></i>Customer Details</h1>
                <div class="subtitle">View complete customer information and account details</div>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Customers
                </a>
            </div>
        </div>
    </div>

    <!-- Customer Details Card -->
    <div class="card card-elevated">
        <div class="card-header bg-info text-white">
            <h5 class="mb-0"><i class="bi bi-person-circle me-2"></i>Account Information</h5>
        </div>
        <div class="card-body">
            <% if (customer != null) { %>
                <div class="row">
                    <div class="col-md-8">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="d-flex align-items-center p-3 border rounded">
                                    <i class="bi bi-hash me-3 text-primary" style="font-size: 1.5rem;"></i>
                                    <div>
                                        <h6 class="mb-0 text-muted-2">Account Number</h6>
                                        <h5 class="mb-0"><%=customer.getAccountNo()%></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-center p-3 border rounded">
                                    <i class="bi bi-person me-3 text-success" style="font-size: 1.5rem;"></i>
                                    <div>
                                        <h6 class="mb-0 text-muted-2">Customer Name</h6>
                                        <h5 class="mb-0"><%=customer.getName()%></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-center p-3 border rounded">
                                    <i class="bi bi-geo-alt me-3 text-warning" style="font-size: 1.5rem;"></i>
                                    <div>
                                        <h6 class="mb-0 text-muted-2">Address</h6>
                                        <h6 class="mb-0"><%=customer.getAddress() != null ? customer.getAddress() : "Address not provided"%></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-center p-3 border rounded">
                                    <i class="bi bi-telephone me-3 text-info" style="font-size: 1.5rem;"></i>
                                    <div>
                                        <h6 class="mb-0 text-muted-2">Telephone</h6>
                                        <h6 class="mb-0"><%=customer.getTelephone() != null ? customer.getTelephone() : "Phone not provided"%></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-light text-dark">
                            <div class="card-body text-center">
                                <i class="bi bi-lightning-charge text-warning mb-3" style="font-size: 2rem;"></i>
                                <h6 class="text-muted mb-2">Current Usage</h6>
                                <h3 class="text-primary mb-0"><%=customer.getUnitsConsumed()%> kWh</h3>
                                <small class="text-muted">Units Consumed</small>
                            </div>
                        </div>
                    </div>
                </div>

                <hr class="my-4">
                
                <!-- Action Buttons -->
                <div class="d-flex gap-2 justify-content-center">
                    <a href="<%=request.getContextPath()%>/servlet/billing?accountNo=<%=customer.getAccountNo()%>" 
                       class="btn btn-success">
                        <i class="bi bi-receipt me-1"></i>Calculate & Print Bill
                    </a>
                    <a href="<%=request.getContextPath()%>/servlet/customer?action=edit&accountNo=<%=customer.getAccountNo()%>" 
                       class="btn btn-warning">
                        <i class="bi bi-pencil me-1"></i>Edit Customer
                    </a>
                    <a href="${pageContext.request.contextPath}/servlet/customer?action=list" 
                       class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left me-1"></i>Back to Customers
                    </a>
                </div>
            <% } else { %>
                <div class="text-center py-5">
                    <i class="bi bi-exclamation-triangle text-warning mb-3" style="font-size: 3rem;"></i>
                    <h5 class="text-muted-2">Customer Not Found</h5>
                    <p class="text-muted-2 mb-4">The requested customer account could not be found in the system.</p>
                    <a href="${pageContext.request.contextPath}/servlet/customer?action=list" class="btn btn-primary">
                        <i class="bi bi-arrow-left me-1"></i>Back to Customers
                    </a>
                </div>
            <% } %>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
