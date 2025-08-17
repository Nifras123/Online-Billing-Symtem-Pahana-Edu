<%@ page session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<%@ include file="../includes/header.jsp" %>

<div class="card p-4 mb-4">
    <h2 class="mb-3">Help - Pahana Edu Billing System</h2>
    <ul class="list-group list-group-flush mb-4">
        <li class="list-group-item">
            <i class="bi bi-person-lock text-primary me-2"></i>
            Login with <strong>admin/admin123</strong>
        </li>
        <li class="list-group-item">
            <i class="bi bi-person-plus text-success me-2"></i>
            Use <strong>Add Customer</strong> to register new customer accounts
        </li>
        <li class="list-group-item">
            <i class="bi bi-box-seam text-warning me-2"></i>
            Use <strong>Manage Items</strong> to maintain shop items
        </li>
        <li class="list-group-item">
            <i class="bi bi-speedometer2 text-info me-2"></i>
            From <strong>Dashboard</strong> you can view, edit, delete customers and print bills
        </li>
    </ul>
    <a href="<%=request.getContextPath()%>/jsp/dashboard.jsp" class="btn btn-secondary">
        Back to Dashboard
    </a>
</div>

<%@ include file="../includes/footer.jsp" %>
