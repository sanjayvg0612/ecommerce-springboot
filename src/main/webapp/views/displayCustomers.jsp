<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- Bootstrap & FontAwesome CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <!-- Custom Style -->
    <link rel="stylesheet" href="/css/style.css">
    
    <title>Customer Directory - Admin</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="/admin/">
            <i class="fas fa-tools mr-2"></i>Admin Panel
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/admin/">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/admin/profileDisplay">Profile</a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn btn-danger-custom py-2 px-3" href="/admin/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="container my-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h2 font-weight-bold mb-0" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            Customer Directory
        </h1>
    </div>

    <!-- Customers Table -->
    <div class="glass-panel p-4" style="overflow-x: auto;">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">Email Address</th>
                    <th scope="col">Physical Address</th>
                    <th scope="col">Role</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td class="font-weight-bold" style="color: var(--color-primary);">
                            <i class="fas fa-user mr-2 text-secondary"></i>${customer.username}
                        </td>
                        <td>${customer.email}</td>
                        <td class="text-secondary">${customer.address}</td>
                        <td>
                            <c:choose>
                                <c:when test="${customer.role == 'ROLE_ADMIN'}">
                                    <span class="badge badge-warning" style="background: rgba(245, 158, 11, 0.15); color: #f59e0b; font-weight: 600; padding: 6px 12px; border: 1px solid rgba(245, 158, 11, 0.3);">
                                        Administrator
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-info" style="background: rgba(59, 130, 246, 0.15); color: #3b82f6; font-weight: 600; padding: 6px 12px; border: 1px solid rgba(59, 130, 246, 0.3);">
                                        Customer
                                    </span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:if test="${empty customers}">
            <div class="text-center py-5">
                <i class="fas fa-users-slash fa-3x mb-3 text-secondary"></i>
                <h4 class="text-secondary">No registered customers found.</h4>
            </div>
        </c:if>
    </div>
</main>

<footer class="text-center py-4 border-top mt-5" style="border-color: var(--border-glass) !important; background: rgba(10, 11, 14, 0.5);">
    <div class="container">
        <p class="text-secondary mb-0">&copy; 2026 Perishable Shop. All rights reserved.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>