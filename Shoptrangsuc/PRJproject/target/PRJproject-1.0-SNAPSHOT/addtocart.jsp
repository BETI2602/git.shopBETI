<%-- 
    Document   : addtocart
    Created on : Jul 17, 2023, 6:23:07 PM
    Author     : ddand
--%>

<%@page import="Models.SanPham"%>
<%@page import="DAOs.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SanPhamDAO spDAO = new SanPhamDAO();
            SanPham sp = spDAO.getSanPham((String) request.getAttribute("idsp"));
            if (sp == null) {
                response.sendRedirect("/");
            } else {

        %>
        <form action="/GioHang" method="post">
            <input type="hidden" name="txtidkh" value="<%=(String)session.getAttribute("idkh")%>">
            <input type="hidden" name="txtidsp" value="<%=sp.getMasp()%>">
            <input type="hidden" name="txttensp" value="<%=sp.getTensp()%>">
            <input type="hidden" name="txtgiatien" value="<%=sp.getGiatien() %>">
            <input type="hidden" name="txtsoluong" value="<%=sp.getSoluong() %>">
            <input type="hidden" name="txthinhanh" value="<%=sp.getHinhanh() %>">
            <input type="submit" name="btnsubmit" value="submit" id="submit">
        </form>
        <%
            }
        %>
        <script>
            const submit = document.getElementById("submit");
            submit.click();
        </script>
    </body>
</html>
