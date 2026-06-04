<%@page import="java.util.*"%>
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
    
    <title>Perishable Shop - Your Cart</title>
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
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-custom" href="/user/products">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-custom active" href="/cart">
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
    <div class="row">
        <div class="col-lg-8">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h2 font-weight-bold mb-0" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                    Your Shopping Cart
                </h1>
                <a class="btn btn-primary-custom" href="/user/products">
                    <i class="fas fa-plus mr-2"></i>Add Product
                </a>
            </div>

            <div class="glass-panel p-4" style="overflow-x: auto;">
                <table class="table table-custom">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Preview</th>
                            <th scope="col">Product Name</th>
                            <th scope="col" class="text-right">Price</th>
                            <th scope="col">Description</th>
                            <th scope="col" class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td class="font-weight-bold" style="color: var(--color-primary);">${product.id}</td>
                                <td>
                                    <img class="img-preview" src="${product.image}" alt="${product.name}" height="55px" width="55px">
                                </td>
                                <td class="font-weight-bold">${product.name}</td>
                                <td class="text-right font-weight-bold text-success">$ ${product.price}</td>
                                <td style="max-width: 200px;" class="text-secondary text-truncate">${product.description}</td>
                                <td class="text-center">
                                    <form action="/cart/delete" method="post" class="m-0">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="id" value="${product.id}">
                                        <button type="submit" class="btn btn-danger-custom btn-sm py-2 px-3">
                                            <i class="fas fa-trash-alt mr-1"></i>Remove
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty products}">
                    <div class="text-center py-5">
                        <i class="fas fa-shopping-basket fa-3x mb-3 text-secondary"></i>
                        <h4 class="text-secondary">Your cart is empty.</h4>
                    </div>
                </c:if>
            </div>
        </div>

        <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="glass-panel">
                <h3 class="h4 font-weight-bold mb-4" style="border-bottom: 1px solid var(--border-glass); padding-bottom: 15px;">Order Summary</h3>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-secondary">Subtotal</span>
                    <span class="font-weight-bold text-light">$ ${totalPrice}</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-secondary">Shipping</span>
                    <span class="font-weight-bold text-success">FREE</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-4 pt-3" style="border-top: 1px solid var(--border-glass);">
                    <span class="h5 font-weight-bold mb-0">Total</span>
                    <span class="h4 font-weight-bold mb-0 text-success">$ ${totalPrice}</span>
                </div>
                <a href="/buy" class="btn btn-primary-custom w-100 py-3" style="font-size: 1.1rem;">
                    <i class="fas fa-credit-card mr-2"></i>Proceed to Checkout
                </a>
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