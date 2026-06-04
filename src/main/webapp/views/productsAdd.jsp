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
    
    <title>Add Product - Admin</title>
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

<main class="container my-5 d-flex justify-content-center">
    <div class="glass-panel w-100" style="max-width: 800px;">
        <h2 class="font-weight-bold mb-4" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            <i class="fas fa-box-open mr-2"></i>Add a New Product
        </h2>
        
        <form action="/admin/products/add" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name" class="text-secondary font-weight-bold">Product Name</label>
                        <input type="text" class="form-control form-control-custom" required name="name" id="name" placeholder="Enter product name">
                    </div>
                    
                    <div class="form-group">
                        <label for="categoryid" class="text-secondary font-weight-bold">Category</label>
                        <select class="form-control form-control-custom" name="categoryid" id="categoryid" required style="color: var(--text-primary);">
                            <option value="" disabled selected>Select a Category</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="price" class="text-secondary font-weight-bold">Price ($)</label>
                        <input type="number" class="form-control form-control-custom" required name="price" id="price" min="1" placeholder="Enter price">
                    </div>

                    <div class="form-group">
                        <label for="weight" class="text-secondary font-weight-bold">Weight (grams)</label>
                        <input type="number" class="form-control form-control-custom" required name="weight" id="weight" min="1" placeholder="Enter weight in grams">
                    </div>

                    <div class="form-group">
                        <label for="quantity" class="text-secondary font-weight-bold">Available Quantity</label>
                        <input type="number" class="form-control form-control-custom" required name="quantity" id="quantity" min="1" placeholder="Enter quantity">
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="description" class="text-secondary font-weight-bold">Product Description</label>
                        <textarea class="form-control form-control-custom" rows="4" name="description" id="description" placeholder="Enter product details" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="productImage" class="text-secondary font-weight-bold">Product Image URL</label>
                        <input type="text" class="form-control form-control-custom" required name="productImage" id="productImage" placeholder="Enter direct image link">
                    </div>

                    <div class="form-group text-center">
                        <p class="text-secondary font-weight-bold text-left">Image Preview</p>
                        <div class="p-3 d-inline-block rounded" style="background: rgba(255,255,255,0.02); border: 1px dashed var(--border-glass);">
                            <img src="https://via.placeholder.com/150?text=No+Image" alt="Preview" id="imgPreview" class="img-preview" height="120px" width="120px">
                        </div>
                    </div>

                    <div class="d-flex justify-content-end mt-4">
                        <a href="/admin/products" class="btn btn-secondary-custom mr-2 py-3 px-4">Cancel</a>
                        <button type="submit" class="btn btn-primary-custom py-3 px-4">Add Product</button>
                    </div>
                </div>
            </div>
        </form>
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

<script>
    document.getElementById('productImage').addEventListener('input', function(e) {
        var preview = document.getElementById('imgPreview');
        preview.src = e.target.value.trim() || 'https://via.placeholder.com/150?text=No+Image';
    });
</script>
</body>
</html>