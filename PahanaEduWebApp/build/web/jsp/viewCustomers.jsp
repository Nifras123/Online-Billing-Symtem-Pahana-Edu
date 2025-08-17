<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<%@ include file="../includes/header.jsp" %>

<h1 class="mb-4">Welcome, ${sessionScope.user}</h1>

<div class="card p-4 mb-4">
    <h2 class="mb-3">Customers</h2>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
                <tr>
                    <th>Account</th>
                    <th>Name</th>
                    <th>Units</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<com.pahanaedu.model.Customer> customers =
                    (List<com.pahanaedu.model.Customer>) request.getAttribute("customers");

                if (customers == null || customers.isEmpty()) {
            %>
                <tr>
                    <td colspan="4" class="text-center text-muted">No customers found. <a href="${pageContext.request.contextPath}/jsp/addCustomer.jsp">Add one now</a>.</td>
                </tr>
            <%
                } else {
                    for (com.pahanaedu.model.Customer c : customers) {
            %>
                <tr>
                    <td><%= c.getAccountNo() %></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getUnitsConsumed() %></td>
                    <td>
                        <a class="btn btn-sm btn-info text-light" href="<%= request.getContextPath() %>/servlet/customer?action=view&accountNo=<%= c.getAccountNo() %>">View</a>
                        <a class="btn btn-sm btn-warning" href="<%= request.getContextPath() %>/servlet/customer?action=edit&accountNo=<%= c.getAccountNo() %>">Edit</a>
                        <a class="btn btn-sm btn-danger" href="<%= request.getContextPath() %>/servlet/customer?action=delete&accountNo=<%= c.getAccountNo() %>" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
                        <a class="btn btn-sm btn-success" href="<%= request.getContextPath() %>/servlet/billing?accountNo=<%= c.getAccountNo() %>">Print Bill</a>
                    </td>
                </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>