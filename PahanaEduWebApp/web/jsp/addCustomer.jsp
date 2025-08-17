<%@ page session="true" %>
<%
 if (session.getAttribute("user")==null) { 
     response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); 
     return; 
 }
%>
<%@ include file="../includes/header.jsp" %>

<div class="card p-4">
    <h2 class="mb-3">Add New Customer</h2>
    <form method="post" action="${pageContext.request.contextPath}/servlet/customer">
        <input type="hidden" name="action" value="add" />

        <div class="mb-3">
            <label class="form-label">Account No</label>
            <input name="accountNo" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Name</label>
            <input name="name" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <textarea name="address" class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Telephone</label>
            <input name="telephone" class="form-control" />
        </div>

        <div class="mb-3">
            <label class="form-label">Units Consumed</label>
            <input name="units" type="number" step="0.01" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary">Add</button>
    </form>

    <c:if test="${not empty requestScope.success}">
        <div class="alert alert-success mt-3">${requestScope.success}</div>
    </c:if>
</div>

<%@ include file="../includes/footer.jsp" %>
