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
    
    <title>User Profile - Perishable Shop</title>
</head>
<body>

<!-- Role-based Navbar -->
<sec:authorize access="hasRole('ADMIN')">
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
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/admin/">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom active" href="/admin/profileDisplay">Profile</a></li>
                    <li class="nav-item ml-2"><a class="btn btn-danger-custom py-2 px-3" href="/admin/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</sec:authorize>

<sec:authorize access="hasRole('USER')">
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
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/user/products">Products</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom" href="/cart"><i class="fas fa-shopping-cart mr-1"></i>Cart</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-custom active" href="/profileDisplay"><i class="fas fa-user-circle mr-1"></i>Profile</a></li>
                    <li class="nav-item ml-2"><a class="btn btn-danger-custom py-2 px-3" href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</sec:authorize>

<main class="container my-5 d-flex justify-content-center">
    <div class="glass-panel w-100" style="max-width: 600px;">
        <div class="text-center mb-4">
            <i class="fas fa-user-cog fa-3x mb-3" style="color: var(--color-primary);"></i>
            <h2 class="font-weight-bold mb-2">User Profile</h2>
            <p class="text-secondary">Update your profile settings below</p>
        </div>

        <form action="updateuser" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="userid" value="${userid}">
            
            <div class="form-group">
                <label for="firstName" class="text-secondary font-weight-bold">Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="username" id="firstName" required placeholder="Your Username*" value="${username}" class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="email" class="text-secondary font-weight-bold">Email Address</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-envelope"></i></span>
                    </div>
                    <input type="email" name="email" id="email" required minlength="6" placeholder="Email*" value="${email}" class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="password" class="text-secondary font-weight-bold">Password</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-lock"></i></span>
                    </div>
                    <input type="password" name="password" id="password" placeholder="Leave blank to keep existing password" class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="address" class="text-secondary font-weight-bold">Address</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span>
                    </div>
                    <textarea class="form-control form-control-custom" rows="3" placeholder="Enter Your Address" name="address" id="address">${address}</textarea>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary-custom btn-block py-3 mt-4">
                <i class="fas fa-save mr-2"></i>Save Changes
            </button>
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
</body>
</html>