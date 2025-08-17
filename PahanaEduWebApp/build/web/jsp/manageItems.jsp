<%@page import="java.util.List"%>
<%@ page session="true" %>
<%
  if (session.getAttribute("user")==null) { response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); return; }
  List<com.pahanaedu.model.Item> items = (List<com.pahanaedu.model.Item>) request.getAttribute("items");
%>
<%@ include file="../includes/header.jsp" %>

<div class="card p-4 mb-4">
    <h2 class="mb-3">Manage Items</h2>
    
    <form method="post" action="${pageContext.request.contextPath}/servlet/item" class="row g-3 mb-4">
        <input type="hidden" name="action" value="add" />
        <div class="col-md-3">
            <label class="form-label">Item ID</label>
            <input class="form-control" name="id" required />
        </div>
        <div class="col-md-4">
            <label class="form-label">Name</label>
            <input class="form-control" name="name" required />
        </div>
        <div class="col-md-3">
            <label class="form-label">Price</label>
            <input class="form-control" name="price" type="number" step="0.01" required />
        </div>
        <div class="col-md-2 d-flex align-items-end">
            <button type="submit" class="btn btn-primary w-100">Add Item</button>
        </div>
    </form>

    <h3 class="mb-3">Existing Items</h3>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price (Rs.)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (items != null && !items.isEmpty()) {
                    for (com.pahanaedu.model.Item it : items) { %>
                        <tr>
                            <td><%= it.getId() %></td>
                            <td><%= it.getName() %></td>
                            <td><%= String.format("%.2f", it.getPrice()) %></td>
                            <td>
                                <a class="btn btn-sm btn-danger"
                                   href="<%= request.getContextPath() %>/servlet/item?action=delete&id=<%= it.getId() %>"
                                   onclick="return confirm('Are you sure you want to delete this item?');">
                                   Delete
                                </a>
                            </td>
                        </tr>
                <%  }
                   } else { %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">
                                No items found. Add a new one above.
                            </td>
                        </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

