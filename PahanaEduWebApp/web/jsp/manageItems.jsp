<%@page import="java.util.List"%>
<%@ page session="true" %>
<%
  if (session.getAttribute("user")==null) { response.sendRedirect(request.getContextPath() + "/jsp/login.jsp"); return; }
  List<com.pahanaedu.model.Item> items = (List<com.pahanaedu.model.Item>) request.getAttribute("items");
%>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="title mb-1"><i class="bi bi-box-seam me-2"></i>Manage Items</h1>
                <div class="subtitle">Add, update, and manage your inventory items</div>
            </div>
            <div class="d-flex gap-2">
                <button class="btn btn-outline-primary" data-bs-toggle="collapse" data-bs-target="#addItemForm">
                    <i class="bi bi-plus-circle me-1"></i>Add New Item
                </button>
                <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <!-- Add Item Form (Collapsible) -->
    <div class="card card-elevated mb-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Item</h5>
        </div>
        <div class="collapse show" id="addItemForm">
            <div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/servlet/item" class="row g-3">
                    <input type="hidden" name="action" value="add" />
                    <div class="col-md-3">
                        <label class="form-label fw-bold">Item ID</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-hash"></i></span>
                            <input class="form-control" name="id" placeholder="Enter item ID" required />
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label class="form-label fw-bold">Item Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-tag"></i></span>
                            <input class="form-control" name="name" placeholder="Enter item name" required />
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label fw-bold">Price (Rs.)</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-currency-rupee"></i></span>
                            <input class="form-control" name="price" type="number" step="0.01" placeholder="0.00" required />
                        </div>
                    </div>
                    <div class="col-md-2 d-flex align-items-end">
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="bi bi-plus-circle me-1"></i>Add Item
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Items List -->
    <div class="card card-elevated">
        <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-list-ul me-2"></i>Current Items</h5>
            <span class="badge bg-light text-dark"><%= items != null ? items.size() : 0 %> items</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-modern align-middle mb-0">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 80px;">#</th>
                            <th>Item ID</th>
                            <th>Name</th>
                            <th class="text-end">Price (Rs.)</th>
                            <th class="text-center" style="width: 120px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (items != null && !items.isEmpty()) {
                            int index = 1;
                            for (com.pahanaedu.model.Item it : items) { %>
                                <tr>
                                    <td class="text-center text-muted-2"><%= index++ %></td>
                                    <td><strong><%= it.getId() %></strong></td>
                                    <td><%= it.getName() %></td>
                                    <td class="text-end"><strong>Rs. <%= String.format("%.2f", it.getPrice()) %></strong></td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <button class="btn btn-sm btn-outline-info" title="Edit Item">
                                                <i class="bi bi-pencil"></i>
                                            </button>
                                            <a class="btn btn-sm btn-outline-danger" 
                                               href="<%= request.getContextPath() %>/servlet/item?action=delete&id=<%= it.getId() %>"
                                               onclick="return confirm('Are you sure you want to delete <%= it.getName() %>?');"
                                               title="Delete Item">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                        <%  }
                           } else { %>
                                <tr>
                                    <td colspan="5" class="text-center py-5">
                                        <div class="text-muted-2">
                                            <i class="bi bi-box-seam" style="font-size: 3rem; opacity: 0.5;"></i>
                                            <p class="mt-3 mb-0">No items found. Add your first item above.</p>
                                        </div>
                                    </td>
                                </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

