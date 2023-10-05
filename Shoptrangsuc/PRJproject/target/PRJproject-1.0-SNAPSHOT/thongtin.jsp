<%-- 
    Document   : thongtin
    Created on : Jun 6, 2023, 6:27:50 PM
    Author     : ddand
--%>

<%@page import="Models.KhachHang"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.KhachHangDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Thong Tin</title>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#thongtin').DataTable();
            });
        </script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    </head>
    <body>
        <h1>Thông Tin Cá nhân</h1>


        <table id="thongtin">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Họ và tên</th>
                    <th>Email</th>
                    <th>Năm sinh</th>
                    <th>Giới tính</th> 
                    <th>Địa chỉ</th>
                    <th>Điện thoại</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    String id = request.getParameter("id");
                    KhachHangDAO dao = new KhachHangDAO();
                    KhachHang rsKhach = dao.GetKhachHangid(id);
                    if(rsKhach!=null) {
                %>
                <tr>
                    
            <td><%=rsKhach.getMakhachhang() %></td>
            <td><%=rsKhach.getHoten() %></td>
            <td><%=rsKhach.getEmail() %></td>
            <td><%=rsKhach.getNgaysinh() %></td>
            <td><%=rsKhach.getGioitinh() %></td>
            <td><%=rsKhach.getDiachi() %></td>
            <td><%=rsKhach.getDienthoai()%></td>
            <td>
                <a href="themthongtin.jsp?id=<%= rsKhach.getMakhachhang() %>">Thêm thông tin</a>
            </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
