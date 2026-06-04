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
    
    <title>Checkout - Perishable Shop</title>
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
        <!-- Billing / Payment Form -->
        <div class="col-lg-7">
            <div class="glass-panel p-4 mb-4">
                <h2 class="h3 font-weight-bold mb-4" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                    <i class="fas fa-truck mr-2"></i>Shipping & Billing Details
                </h2>
                
                <form action="/buy" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    
                    <div class="form-group">
                        <label for="fullName" class="text-secondary font-weight-bold">Full Name</label>
                        <input type="text" class="form-control form-control-custom" id="fullName" value="${username}" required placeholder="Enter full name">
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="text-secondary font-weight-bold">Email Address</label>
                        <input type="email" class="form-control form-control-custom" id="email" value="${email}" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label for="shippingAddress" class="text-secondary font-weight-bold">Shipping Address</label>
                        <textarea class="form-control form-control-custom" id="shippingAddress" rows="3" required placeholder="Enter shipping address">${address}</textarea>
                    </div>

                    <h3 class="h4 font-weight-bold mt-5 mb-4 text-light">
                        <i class="fas fa-credit-card mr-2" style="color: var(--color-primary);"></i>Payment Method
                    </h3>
                    
                    <div class="form-group">
                        <div class="custom-control custom-radio mb-3 p-3 rounded" style="background: rgba(255,255,255,0.02); border: 1px solid var(--border-glass);">
                            <input type="radio" id="cod" name="paymentMethod" class="custom-control-input" checked>
                            <label class="custom-control-label pl-2 font-weight-bold text-light" for="cod">
                                Cash on Delivery (COD)
                            </label>
                            <p class="text-secondary small mb-0 pl-2 mt-1">Pay with cash when your items are delivered.</p>
                        </div>

                        <div class="custom-control custom-radio p-3 rounded" style="background: rgba(255,255,255,0.02); border: 1px solid var(--border-glass);">
                            <input type="radio" id="card" name="paymentMethod" class="custom-control-input" disabled>
                            <label class="custom-control-label pl-2 font-weight-bold text-secondary" for="card">
                                Credit / Debit Card (Disabled)
                            </label>
                            <p class="text-secondary small mb-0 pl-2 mt-1">Online payment gateway integrated for mock transactions.</p>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary-custom w-100 py-3 mt-4" style="font-size: 1.1rem;">
                        <i class="fas fa-check-circle mr-2"></i>Pay & Place Order
                    </button>
                </form>
            </div>
        </div>

        <!-- Cart Summary -->
        <div class="col-lg-5">
            <div class="glass-panel">
                <h3 class="h4 font-weight-bold mb-4" style="border-bottom: 1px solid var(--border-glass); padding-bottom: 15px;">Your Order</h3>
                
                <div class="mb-4" style="max-height: 250px; overflow-y: auto;">
                    <c:forEach var="product" items="${products}">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="d-flex align-items-center">
                                <img class="img-preview mr-3" src="${product.image}" alt="${product.name}" height="40px" width="40px">
                                <div>
                                    <h6 class="font-weight-bold mb-0 text-light">${product.name}</h6>
                                    <small class="text-secondary">${product.category.name}</small>
                                </div>
                            </div>
                            <span class="font-weight-bold text-success">$ ${product.price}</span>
                        </div>
                    </c:forEach>
                    <c:if test="${empty products}">
                        <p class="text-secondary">Your cart has no items.</p>
                    </c:if>
                </div>
                
                <div class="d-flex justify-content-between align-items-center mb-3 pt-3" style="border-top: 1px solid var(--border-glass);">
                    <span class="text-secondary">Subtotal</span>
                    <span class="font-weight-bold text-light">$ ${totalPrice}</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-secondary">Shipping</span>
                    <span class="font-weight-bold text-success">FREE</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-2 pt-3" style="border-top: 1px solid var(--border-glass);">
                    <span class="h5 font-weight-bold mb-0">Total Amount</span>
                    <span class="h4 font-weight-bold mb-0 text-success">$ ${totalPrice}</span>
                </div>
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
