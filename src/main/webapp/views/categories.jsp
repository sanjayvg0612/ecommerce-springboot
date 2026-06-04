<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>

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
    
    <title>Manage Categories - Admin</title>
    
    <style>
        .modal-content {
            background: var(--bg-secondary) !important;
            border: 1px solid var(--border-glass) !important;
            border-radius: var(--radius-lg);
            color: var(--text-primary);
        }
        .modal-header {
            border-bottom: 1px solid var(--border-glass) !important;
        }
        .modal-footer {
            border-top: 1px solid var(--border-glass) !important;
        }
    </style>
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
            Manage Categories
        </h1>
        <button type="button" class="btn btn-primary-custom" data-toggle="modal" data-target="#exampleModalCenter">
            <i class="fas fa-plus mr-2"></i>Add Category
        </button>
    </div>

    <!-- Add Category Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form action="categories" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Add New Category</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group mb-0">
                            <label for="name" class="text-secondary font-weight-bold">Category Name</label>
                            <input type="text" name="categoryname" class="form-control form-control-custom" id="name" required placeholder="Enter category name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary-custom" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary-custom">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Categories Table -->
    <div class="glass-panel p-4" style="overflow-x: auto;">
        <table class="table table-custom">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Category Name</th>
                    <th scope="col" class="text-center">Delete</th>
                    <th scope="col" class="text-center">Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td class="font-weight-bold" style="color: var(--color-primary);">${category.id}</td>
                        <td class="font-weight-bold">${category.name}</td>
                        <td class="text-center">
                            <form action="categories/delete" method="post" class="m-0">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="id" value="${category.id}">
                                <button type="submit" class="btn btn-danger-custom btn-sm py-2 px-3">
                                    <i class="fas fa-trash-alt mr-1"></i>Delete
                                </button>
                            </form>
                        </td>
                        <td class="text-center">
                            <!-- Update Trigger Button -->
                            <button type="button" class="btn btn-secondary-custom btn-sm py-2 px-3" data-toggle="modal" data-target="#exampleModalCenter2"
                                    onclick="document.getElementById('categoryname').value = '${category.name}'; document.getElementById('categoryid').value = '${category.id}';">
                                <i class="fas fa-edit mr-1"></i>Update
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty categories}">
            <div class="text-center py-5">
                <i class="fas fa-tags fa-3x mb-3 text-secondary"></i>
                <h4 class="text-secondary">No categories available.</h4>
            </div>
        </c:if>
    </div>

    <!-- Update Category Modal -->
    <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form action="categories/update" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="modal-header">
                        <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Update Category</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body text-left">
                        <div class="form-group">
                            <label for="categoryid" class="text-secondary font-weight-bold">Category ID</label>
                            <input class="form-control form-control-custom" type="number" readonly name="categoryid" id="categoryid" value="0">
                        </div>
                        <div class="form-group mb-0">
                            <label for="categoryname" class="text-secondary font-weight-bold">Category Name</label>
                            <input class="form-control form-control-custom" type="text" name="categoryname" id="categoryname" required placeholder="Enter new category name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary-custom" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary-custom">Update Changes</button>
                    </div>
                </form>
            </div>
        </div>
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