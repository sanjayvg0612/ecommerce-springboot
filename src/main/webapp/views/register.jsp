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
    
    <title>Sign Up - Perishable Shop</title>
</head>
<body>

<div class="auth-container">
    <div class="glass-panel auth-card">
        <div class="text-center mb-4">
            <h2 class="font-weight-bold mb-2" style="background: var(--gradient-primary); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                Create Account
            </h2>
            <p class="text-secondary">Please fill out this form to register</p>
        </div>

        <form action="newuserregister" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
            <div class="form-group">
                <label for="firstName" class="text-secondary font-weight-bold">Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="username" id="firstName" placeholder="Choose a username" required class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="email" class="text-secondary font-weight-bold">Email Address</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-envelope"></i></span>
                    </div>
                    <input type="email" name="email" id="email" required minlength="6" placeholder="yourname@example.com" class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="password" class="text-secondary font-weight-bold">Password</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-lock"></i></span>
                    </div>
                    <input type="password" name="password" id="password" required placeholder="Choose a secure password" class="form-control form-control-custom">
                </div>
            </div>
            
            <div class="form-group">
                <label for="address" class="text-secondary font-weight-bold">Address</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text input-group-text-custom"><i class="fas fa-map-marker-alt"></i></span>
                    </div>
                    <textarea class="form-control form-control-custom" rows="2" placeholder="Enter your full address" name="address" id="address"></textarea>
                </div>
            </div>
            
            <button type="submit" class="btn btn-primary-custom btn-block py-3 mt-4">
                <i class="fas fa-user-plus mr-2"></i>Sign Up
            </button>
            
            <div class="text-center mt-3">
                <span class="text-secondary">Already have an account? <a href="/login" style="color: var(--color-primary); font-weight: 500;">Login here</a></span>
            </div>
            
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