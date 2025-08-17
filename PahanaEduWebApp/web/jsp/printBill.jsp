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

<div class="container my-5">
    <div class="card shadow">
        <div class="card-header text-center bg-primary text-white">
            <h4>Customer Bill</h4>
        </div>
        <div class="card-body">
            <h5 class="card-title">Customer: <%= c.getName() %></h5>
            <p><strong>Account No:</strong> <%= c.getAccountNo() %></p>
            <p><strong>Units Consumed:</strong> <%= c.getUnitsConsumed() %></p>
            <p><strong>Total Amount:</strong> Rs. <%= String.format("%.2f", amount) %></p>
        </div>
        <div class="card-footer text-center">
            <button class="btn btn-success me-2" onclick="window.print()">
                <i class="bi bi-printer"></i> Print
            </button>
            <a href="<%=request.getContextPath()%>/jsp/dashboard.jsp" class="btn btn-secondary">
                <i class="bi bi-arrow-left"></i> Back
            </a>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
