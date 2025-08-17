<%@ page language="java" %>
<%@ page session="false" %>
<%@ include file="../includes/header.jsp" %>

<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow p-4" style="width: 350px;">
        <h3 class="text-center mb-4">Pahana Edu Login</h3>

        <form method="post" action="${pageContext.request.contextPath}/servlet/auth">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                    <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100">
                <i class="bi bi-box-arrow-in-right me-1"></i> Login
            </button>
        </form>

        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger mt-3" role="alert">
                ${requestScope.error}
            </div>
        </c:if>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>
