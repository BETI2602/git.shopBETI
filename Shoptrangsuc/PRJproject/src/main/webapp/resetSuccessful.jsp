<%-- 
    Document   : resetSuccesful
    Created on : Jul 15, 2023, 9:58:40 PM
    Author     : ADMIN
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Password Reset Successful</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            
            .container {
                margin-top: 50px;
            }
            
            .card {
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #ffffff;
            }
            
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            
            p {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .btn-primary {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="container ">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <h1>Password Reset Successful</h1>
                        <p>Your password has been successfully reset.</p>
                        <a href="/Home" class="btn btn-dark">Login</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
