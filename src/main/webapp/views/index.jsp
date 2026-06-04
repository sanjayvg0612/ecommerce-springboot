<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
    
    <title>Perishable Shop - Home</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="/">
            <i class="fas fa-shopping-basket mr-2"></i>Perishable Shop
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
		
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <span class="navbar-text ml-3 text-light font-weight-bold">
                Welcome, ${ username }
            </span>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/user/products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/cart">
                        <i class="fas fa-shopping-cart mr-1"></i>Cart
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/profileDisplay">
                        <i class="fas fa-user-circle mr-1"></i>Profile
                    </a>
                </li>
                <li class="nav-item ml-2">
                    <a class="btn btn-danger-custom py-2 px-3" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<main class="container my-5">
    <div class="glass-panel text-center mb-5 py-5" style="position: relative; overflow: hidden;">
        <h1 class="display-4 font-weight-bold mb-3" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            Perishable Shop
        </h1>
        <p class="lead text-secondary" style="max-width: 600px; margin: 0 auto;">
            Experience fresh grocery shopping like never before. Handpicked quality, delivered straight to your doorstep with speed and security.
        </p>
    </div>

    <div class="row">
        <c:if test="${not empty msg}">
            <div class="col-12 text-center my-5">
                <div class="glass-panel py-5">
                    <i class="fas fa-box-open fa-3x mb-3 text-secondary"></i>
                    <h3 class="text-secondary">${msg}</h3>
                </div>
            </div>
        </c:if>
        
        <c:forEach var="product" items="${products}">
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card-custom h-100 d-flex flex-column">
                    <div style="height: 180px; display: flex; align-items: center; justify-content: center; background: rgba(255,255,255,0.02); border-bottom: 1px solid var(--border-glass); padding: 15px;">
                        <img class="img-preview" src="${product.image}" alt="${product.name}" style="max-height: 100%; max-width: 100%; object-fit: contain;">
                    </div>
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <span class="badge badge-secondary mb-2" style="background: rgba(255,255,255,0.08); font-weight: 500;">
                                ${product.category.name}
                            </span>
                            <h4 class="h5 mb-2 font-weight-bold" style="color: var(--text-primary);">${product.name}</h4>
                            <p class="text-secondary small mb-3 text-truncate-3" style="min-height: 48px;">
                                ${product.description}
                            </p>
                        </div>
                        <div>
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-secondary">Price</span>
                                <span class="h5 font-weight-bold mb-0 text-success">$ ${product.price}</span>
                            </div>
                            <a href="/cart/add?id=${product.id}" class="btn btn-primary-custom w-100">
                                <i class="fas fa-cart-plus mr-2"></i>Add to Cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<footer class="text-center py-4 border-top" style="border-color: var(--border-glass) !important; background: rgba(10, 11, 14, 0.5);">
    <div class="container">
        <p class="text-secondary mb-0">&copy; 2026 Perishable Shop. All rights reserved.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>