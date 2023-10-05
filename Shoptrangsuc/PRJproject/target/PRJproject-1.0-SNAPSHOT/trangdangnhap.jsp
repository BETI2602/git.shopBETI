<%-- 
    Document   : trangdangnhap
    Created on : Jul 10, 2023, 3:23:59 PM
    Author     : ddand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang admin</title>
        <link rel="stylesheet" href="/css/style.css">
    </head>

    <body>
        <div class="loader">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        <%
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                //                String user=null;
                boolean flag = false;
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("quantri") && !cookie.getValue().equals("")) {
                        flag = true;
                        //                        user = c.getValue();
                        break;
                    }
                }
                if (flag) {
                    response.sendRedirect("/Admin/Sanpham");
                }
            }
        %>
        <div class="admin_background">
            <div class="container admin_page">
                <h1 class="admin_page-title">Đăng nhập cho Admin</h1>
                <form action="/Admin" method="post" class="login_form" id="admin-login">
                    <div class="login_form-area">
                        <input type="text" class="login_form-input" name="adEmail" id="logemail" required>
                        <label>Email</label>
                    </div>
                    <p id="adeError"></p>
                    <div class="login_form-area">
                        <input type="password" class="login_form-input" name="adPass" id="logpassword" required>
                        <label>Password</label>
                    </div>
                    <p id="adpError"></p>
                    <input type="submit" class="login_form-submit" onclick="removeRequire()" name="btnLogin" value="Login">

                    <%if (request.getAttribute("alertMess") != null) {%>
                    <p class="alertMess"><%=request.getAttribute("alertMess")%></p>
                    <%} else {%>
                    <p class="alertMess"></p>
                        <%}%>
                </form>
            </div>
        </div>
        <script src="/js/scrollreveal.min.js"></script>
        <script src="/js/main.js"></script>
    </body>

</html>
