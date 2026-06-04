<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- Bootstrap & FontAwesome CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <!-- Custom Style -->
    <link rel="stylesheet" href="/css/style.css">
    
    <title>Admin Login - Perishable Shop</title>
</head>
<body>

<div class="auth-container">
    <div class="glass-panel auth-card">
        <div class="text-center mb-4">
            <h2 class="font-weight-bold mb-2" style="background: linear-gradient(135deg, #a855f7, #ec4899); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                <i class="fas fa-tools mr-2"></i>Admin Portal
            </h2>
            <p class="text-secondary">Please enter your administrator credentials</p>
        </div>

        <form action="/admin/loginvalidate" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <div class="form-group">
                <label for="username" class="text-secondary font-weight-bold">Admin Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-user-shield"></i></span>
                    </div>
                    <input type="text" name="username" id="username" placeholder="Admin Username" required class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="password" class="text-secondary font-weight-bold">Password</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" id="password" placeholder="Admin Password" required class="form-control form-control-custom">
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary-custom btn-block py-3 mt-4" style="background: linear-gradient(135deg, #a855f7, #ec4899);">
                <i class="fas fa-lock-open mr-2"></i>Authenticate
            </button>
            
            <c:if test="${not empty msg}">
                <h5 class="text-center text-danger mt-3 font-weight-bold"><i class="fas fa-exclamation-circle mr-1"></i>${msg}</h5>
            </c:if>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
