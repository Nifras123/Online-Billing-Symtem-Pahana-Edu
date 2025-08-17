<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) { 
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); 
        return; 
    }
    com.pahanaedu.model.Customer customer = (com.pahanaedu.model.Customer) request.getAttribute("customer");
%>
<%@ include file="../includes/header.jsp" %>

<div class="container my-5">
    <div class="card shadow-lg">
        <div class="card-header bg-info text-white">
            <h4>Customer Details</h4>
        </div>
        <div class="card-body">
            <% if (customer != null) { %>
                <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item"><strong>Account:</strong> <%=customer.getAccountNo()%></li>
                    <li class="list-group-item"><strong>Name:</strong> <%=customer.getName()%></li>
                    <li class="list-group-item"><strong>Address:</strong> <%=customer.getAddress()%></li>
                    <li class="list-group-item"><strong>Telephone:</strong> <%=customer.getTelephone()%></li>
                    <li class="list-group-item"><strong>Units Consumed:</strong> <%=customer.getUnitsConsumed()%></li>
                </ul>

                <a href="<%=request.getContextPath()%>/servlet/billing?accountNo=<%=customer.getAccountNo()%>" 
                   class="btn btn-success me-2">Calculate & Print Bill</a>
                <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Customer not found.
                </div>
                <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
            <% } %>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
