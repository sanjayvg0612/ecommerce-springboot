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
    
    <title>Admin Dashboard - Perishable Shop</title>
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
                    <a class="nav-link nav-link-custom active" href="/admin/">Dashboard</a>
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
    <div class="glass-panel text-center py-5 mb-5">
        <i class="fas fa-user-shield fa-4x mb-3 text-light" style="filter: drop-shadow(0 0 10px rgba(129, 140, 248, 0.4));"></i>
        <h1 class="display-4 font-weight-bold" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
            Welcome Back, Admin
        </h1>
        <p class="lead text-secondary">Manage your inventory, customers, and operations from this central Admin Panel.</p>
    </div>

    <div class="row justify-content-center">
        <!-- Categories Card -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card-custom h-100 d-flex flex-column text-center p-4">
                <div class="my-4">
                    <i class="fas fa-tags fa-3x" style="color: var(--color-primary);"></i>
                </div>
                <h3 class="h4 font-weight-bold mb-3">Categories</h3>
                <p class="text-secondary mb-4 flex-grow-1">Create, view, update, and manage catalog categories for all grocery products.</p>
                <a href="/admin/categories" class="btn btn-primary-custom w-100 py-3">
                    <i class="fas fa-cog mr-2"></i>Manage Categories
                </a>
            </div>
        </div>

        <!-- Products Card -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card-custom h-100 d-flex flex-column text-center p-4">
                <div class="my-4">
                    <i class="fas fa-box-open fa-3x" style="color: var(--color-accent);"></i>
                </div>
                <h3 class="h4 font-weight-bold mb-3">Products</h3>
                <p class="text-secondary mb-4 flex-grow-1">Control products stock levels, add new listings, modify details, and upload image preview URLs.</p>
                <a href="/admin/products" class="btn btn-primary-custom w-100 py-3" style="background: var(--gradient-primary);">
                    <i class="fas fa-cog mr-2"></i>Manage Products
                </a>
            </div>
        </div>

        <!-- Customers Card -->
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card-custom h-100 d-flex flex-column text-center p-4">
                <div class="my-4">
                    <i class="fas fa-users fa-3x" style="color: #10b981;"></i>
                </div>
                <h3 class="h4 font-weight-bold mb-3">Customers</h3>
                <p class="text-secondary mb-4 flex-grow-1">Monitor registered customer accounts, view locations, addresses, and user profiles details.</p>
                <a href="/admin/customers" class="btn btn-primary-custom w-100 py-3" style="background: linear-gradient(135deg, #10b981, #059669); box-shadow: 0 4px 12px rgba(16, 185, 129, 0.2);">
                    <i class="fas fa-cog mr-2"></i>Manage Customers
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