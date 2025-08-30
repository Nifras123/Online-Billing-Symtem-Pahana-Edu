<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
  if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
    return;
  }
%>
<%@ include file="../includes/header.jsp" %>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="page-header mb-4">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="title mb-1"><i class="bi bi-people me-2"></i>Manage Customers</h1>
                <div class="subtitle">Browse, manage and bill your customers</div>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/jsp/addCustomer.jsp" class="btn btn-primary">
                    <i class="bi bi-person-plus me-1"></i>Add New Customer
                </a>
                <a href="${pageContext.request.contextPath}/jsp/dashboard.jsp" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </div>

    <!-- Customers List -->
    <div class="card card-elevated">
        <div class="card-header bg-info text-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-list-ul me-2"></i>Current Customers</h5>
            <span class="badge bg-light text-dark"><%= request.getAttribute("customers") != null ? ((List)request.getAttribute("customers")).size() : 0 %> customers</span>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-modern align-middle mb-0">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 80px;">#</th>
                            <th>Account No</th>
                            <th>Customer Name</th>
                            <th>Address</th>
                            <th>Telephone</th>
                            <th class="text-center">Units</th>
                            <th class="text-center" style="width: 200px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        List<com.pahanaedu.model.Customer> customers =
                            (List<com.pahanaedu.model.Customer>) request.getAttribute("customers");

                        if (customers == null || customers.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="7" class="text-center py-5">
                                <div class="text-muted-2">
                                    <i class="bi bi-people" style="font-size: 3rem; opacity: 0.5;"></i>
                                    <p class="mt-3 mb-0">No customers found. <a href="${pageContext.request.contextPath}/jsp/addCustomer.jsp" class="text-primary">Add your first customer</a>.</p>
                                </div>
                            </td>
                        </tr>
                    <%
                        } else {
                            int index = 1;
                            for (com.pahanaedu.model.Customer c : customers) {
                    %>
                        <tr>
                            <td class="text-center text-muted-2"><%= index++ %></td>
                            <td><strong><%= c.getAccountNo() %></strong></td>
                            <td><%= c.getName() %></td>
                            <td><small class="text-muted-2"><%= c.getAddress() != null ? c.getAddress() : "-" %></small></td>
                            <td><small class="text-muted-2"><%= c.getTelephone() != null ? c.getTelephone() : "-" %></small></td>
                            <td class="text-center"><strong><%= c.getUnitsConsumed() %></strong></td>
                            <td class="text-center">
                                <div class="btn-group" role="group">
                                    <a class="btn btn-sm btn-outline-info" 
                                       href="<%= request.getContextPath() %>/servlet/customer?action=view&accountNo=<%= c.getAccountNo() %>"
                                       title="View Details">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a class="btn btn-sm btn-outline-warning" 
                                       href="<%= request.getContextPath() %>/servlet/customer?action=edit&accountNo=<%= c.getAccountNo() %>"
                                       title="Edit Customer">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a class="btn btn-sm btn-outline-success" 
                                       href="<%= request.getContextPath() %>/servlet/billing?accountNo=<%= c.getAccountNo() %>"
                                       title="Print Bill">
                                        <i class="bi bi-printer"></i>
                                    </a>
                                    <a class="btn btn-sm btn-outline-danger" 
                                       href="<%= request.getContextPath() %>/servlet/customer?action=delete&accountNo=<%= c.getAccountNo() %>" 
                                       onclick="return confirm('Are you sure you want to delete <%= c.getName() %>?');"
                                       title="Delete Customer">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
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
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>