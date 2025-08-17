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
    <div class="card shadow">
        <div class="card-header bg-warning text-dark">
            <h4>Edit Customer</h4>
        </div>
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/servlet/customer">
                <input type="hidden" name="action" value="update" />

                <div class="mb-3">
                    <label class="form-label">Account No</label>
                    <input name="accountNo" class="form-control" 
                           value="<%=customer != null ? customer.getAccountNo() : ""%>" readonly />
                </div>

                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input name="name" class="form-control"
                           value="<%=customer != null ? customer.getName() : ""%>" required />
                </div>

                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input name="address" class="form-control"
                           value="<%=customer != null ? customer.getAddress() : ""%>" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Telephone</label>
                    <input name="telephone" class="form-control"
                           value="<%=customer != null ? customer.getTelephone() : ""%>" />
                </div>

                <div class="mb-3">
                    <label class="form-label">Units Consumed</label>
                    <input name="units" type="number" step="0.01" class="form-control"
                           value="<%=customer != null ? customer.getUnitsConsumed() : 0%>" required />
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
                <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
