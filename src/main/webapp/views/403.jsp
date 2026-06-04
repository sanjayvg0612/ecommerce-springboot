<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>403 - Forbidden</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <!-- Custom Style -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <div class="auth-container">
        <div class="glass-panel text-center p-5" style="max-width: 500px;">
            <i class="fas fa-exclamation-triangle fa-4x mb-4 text-warning" style="filter: drop-shadow(0 0 10px rgba(245, 158, 11, 0.4));"></i>
            <h1 class="display-5 font-weight-bold mb-3" style="background: linear-gradient(135deg, #ef4444, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                403 - Access Denied
            </h1>
            <p class="text-secondary mb-4">
                Sorry, you do not have permission to access this page. Please return to the homepage or login with different credentials.
            </p>
            <a href="/" class="btn btn-primary-custom py-3 px-4">
                <i class="fas fa-home mr-2"></i>Go to Homepage
            </a>
        </div>
    </div>
</body>
</html>
