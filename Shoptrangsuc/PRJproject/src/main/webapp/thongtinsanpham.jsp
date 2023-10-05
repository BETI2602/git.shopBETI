<%-- 
    Document   : thongtinsanpham
    Created on : Jul 5, 2023, 2:36:36 PM
    Author     : Dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.SanPhamDAO"%>
<%@page import="Models.SanPham"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="/css/style.css">
        <title>Thông tin sản phẩm</title>
    </head>

    <body>
        <div class="loader">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
        <header class="header" id="header">
            <nav class="nav container">
                <a href="<%= getServletContext().getContextPath()%>/Home/Trangchu" class="logo__item">BETI <span>®</span></a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><a href="/Home/Trangchu" class="nav__item-link">TRANG CHỦ</a></li>
                        <li class="nav__item"><a href="/Home/Shop" class="nav__item-link">SẢN PHẨM</a></li>
                        <li class="nav__item"><a href="#" class="nav__item-link">LIÊN HỆ</a></li>
                            <%
                                if (session.getAttribute("acc") != null) {
                            %>
                        <li class="nav__item"><button class="nav__item-link" id="acc-menu"> ${sessionScope.fullname}</button></li>
                            <%
                            } else {
                            %>
                        <li class="nav__item"><button  class="nav__item-link" id="login-button">ĐĂNG NHẬP</button></li>
                            <%
                                }
                            %>
                    </ul>
                    <div class="acc__menu">
                        <a href="<%= getServletContext().getContextPath()%>/Taikhoan/ChinhSua/<%=session.getAttribute("acc")%>" class="update__acc">Chỉnh sửa <i class='bx bx-edit-alt'></i></a>
                        <a href="/GioHang/tt/<%=session.getAttribute("acc")%>" class="basket__acc">Giỏ hàng <i class='bx bx-shopping-bag'></i></a>
                        <a href="/logout.jsp" class="lout__acc" onclick="return confirm('Đăng xuất ngay?')">Đăng xuất <i
                                class='bx bx-log-out'></i></a>
                    </div>
                </div>
                <div class="nav__toggle" id="nav-toggle">
                    <div class="tg-one"></div>
                    <div class="tg-two"></div>
                    <div class="tg-three"></div>
                </div>
            </nav>
        </header>

        <%
            SanPham sp = (SanPham) session.getAttribute("thongtinsanpham");
        %>
        <main class="main" id="main">
            <div class="background"></div>
            <div class="login-page login-hidden" id="login-page">
                <div class="login__menu">
                    <button class="close__login" id="close-login"><i class='bx bx-x'></i></button>
                    <button class="login__button login-button-effect" id="btnlogin">Đăng nhập</button>
                    <button class="login__button" id="btnregis">Đăng ký</button>
                </div>
                <div class="login__nav" id="login-tab">
                    <form action="/TaiKhoan" method="post" id="login-form" class="form">
                        <label for="email">Đăng nhập với email</label>
                        <div>
                            <input type="email" class="login__input" placeholder="Nhập email" id="logemail" name="txtEmaillg">
                            <p id="logeerror"></p>
                        </div>
                        <div>
                            <input type="password" class="login__input" placeholder="Nhập mật khẩu" id="logpassword" name="txtPasslg">
                            <p id="logperror"></p>
                        </div>
                        <div>
                            <input type="submit" class="login__submit" value="Đăng nhập" name="btnLog">
                        </div>
                    </form>
                </div>
                <div class="regis__nav tab-closen" id="regis-tab">

                    <form action="/TaiKhoan" method="post" class="form" id="regis-form" >
                        <label for="email">Đăng ký để được trải nghiệm những tính năng mua sắm dành cho bạn</label>
                        <div>
                            <input type="text" class="login__input" placeholder="Nhập họ tên" id="name" name="txtName">
                            <p id="nerror"></p>
                        </div>
                        <div>
                            <input type="email" class="login__input" placeholder="Nhập email ví dụ:example@gmail.com" id="email" name="txtEmail">
                            <p id="eerror"></p>
                        </div>
                        <div>
                            <input type="password" class="login__input" placeholder="Tạo mật khẩu" id="password" name="txtPass">
                            <p id="perror"></p>
                        </div>
                        <div>
                            <input type="password" class="login__input" placeholder="Nhập lại mật khẩu" id="repassword">
                            <p id="reperror"></p>
                        </div>
                        <div>
                            <input type="submit" class="login__submit" value="Đăng Ký" name="btnRegis">
                        </div>
                        <p class="label">Khi nhấn vào đăng ký nghĩa là bạn đồng ý với các <a href="#">điều khoản</a> của chúng tôi </p>

                    </form>

                </div>
            </div>

            <session class="product" id="product">
                <div class="grid product__container">
                    <div class="product__img">
                        <img src="<%= sp.getHinhanh()%>" alt="" class="product__img-img">
                    </div>
                    <div class="product__data">
                        <div class="product__description">
                            <h1 class="product__title"><%= sp.getTensp()%></h1>
                            <p class="product__id">Mã sản phẩm: <span><%= sp.getMasp()%></span></p>
                            <h2 class="product_price"><%= String.format("%,.0f", (double) sp.getGiatien())%><span>đ</span> </h2>
                            <p>Thiết kế độc quyền từ Hàn quốc</p>
                            <p class="product__chatlieu">Chất liệu: <%=sp.getChatlieu()%></p>
                            <p class="product__loại">Loại: <%= sp.getLoai()%></p>
                            <p class="product_info">Giá tham khảo, có thể thay đổi theo trọng lượng, size tay và giá của từng
                                thời điểm</p>
                        </div>
                        <div class="product__privacy grid">
                            <p class="product__privacy-traodoi"><i class='bx bx-repeat'></i>Đổi miễn phí trong 72 giờ</p>
                            <p class="product__privacy-baohanh"><i class='bx bx-check-circle'></i>Bảo hành trọn đời</p>
                            <p class="product__privacy-tragop"><i class='bx bx-coin'></i>Trả góp 0%</p>
                            <p class="product__privacy-ship"><i class='bx bxs-plane-alt'></i>Miễn phí giao hàng toàn quốc</p>
                        </div>
                        <div class="product__exInfo">
                            <button class="shop__map" id="btnMap"><i class='bx bxs-map'></i>Tìm cửa hàng gần bạn</button>
                            <!--<div class="product__order">-->
                                <a href="/GioHang/New/<%=session.getAttribute("acc")%>/<%=sp.getMasp()%>" class="btnOrder">Thêm vào giỏ hàng</a>
                            <!--</div>-->
                            <p class="need_help">Cần giúp đỡ? <i class='bx bxs-phone'></i><a href="tel:0848 882 371">0848 882
                                    371</a></p>
                        </div>
                    </div>
                </div>
            </session>
            <div class="shop__location shop___show">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2336.0503044302386!2d105.75894345993137!3d10.037258342964487!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1688619975699!5m2!1svi!2s"
                    width="90%" height="600" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
            <session class="session" id="mayLike">
                <h1 class="product__title-footer">Bạn Có Thể Thích</h1>
                <div class="product__more swiper-container">
                    <div class="swiper-wrapper">
                        <%
                            SanPhamDAO dao = new SanPhamDAO();
                            ResultSet rs = dao.getAllSanPham();
                            int i = 0;
                            int count = 0;
                            int arr[] = {3, 10, 14, 15, 19};
                            while (i < 5) {
                                rs.next();
                                count++;
                                if (count == arr[i]) {
                        %>
                        <div class="swiper-slide product__card">
                            <div class="product__more-img">
                                <a href="/SanPham/ChiTiet/<%=rs.getString("masanpham")%>">
                                    <img src="<%= rs.getString("hinhanh")%>" alt="">
                                </a>
                            </div>
                            <div class="product__more-data">
                                <a class="product__card-title" href="/SanPham/ChiTiet/<%=rs.getString("masanpham")%>"><%= rs.getString("tensanpham")%></a>
                                <p class="product__card-price"><%= String.format("%,.0f đ", rs.getDouble("giatien"))%></p>
                            </div>
                        </div>
                        <%
                                    i++;
                                }
                            }
                        %>
                    </div>
                    <div class="swiper-button-next btn-next"></div>
                    <div class="swiper-button-prev btn-pre"></div>
                </div>
            </session>
        </main>
        <footer class="footer" id="footer">
            <div class="footer__container container">
                <div class="footer__info">
                    <div class="footer__logo">
                        <h1>BETI<span>®</span></h1>
                    </div>
                    <div class="footer__social">
                        <a href="#" class="footer__social-link"><i class='bx bxl-facebook-square'></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxl-instagram-alt'></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxs-envelope'></i></a>
                        <a href="#" class="footer__social-link"><i class='bx bxl-tiktok'></i></a>
                    </div>
                </div>
                <div class="footer__content grid">
                    <div class="footer__data">
                        <h2 class="footer__title">Hỗ Trợ Khách Hàng</h2>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách thanh toán</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách đổi trả</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách vận chuyển</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Hướng dẫn mua hàng</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                    <div class="footer__data">
                        <h2 class="footer__title ft_2">Liên Kết</h2>
                        <ul class="footer__list">
                            <li class="footer__item"><a href="#" class="footer__link">Về BOTI</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">NEWs/EVENTS</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Hỗ trợ kỹ thuật</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Điều khoản sử dụng</a></li>
                            <li class="footer__item"><a href="#" class="footer__link">Liên Hệ</a></li>
                        </ul>
                    </div>
                    <div class="footer__data">
                        <h2 class="footer__title">Thông tin chi tiết</h2>
                        <ul class="footer__list">
                            <li class="footer__item">
                                <p class="footer__link">Shop trang sức BOTI</p>
                            </li>
                            <li class="footer__item">
                                <p class="footer__link">Số 35, Phạm Ngũ Lão, <br> Quận Tân Bình, <br> TP Hồ Chí Minh</p>
                            </li>
                            <li class="footer__item">
                                <p class="footer__link">Đã được chứng nhận <br> bởi bộ trang sức</p>
                            </li>
                            <li class="footer__item">
                                <p class="footer__link">Tel: 0848882371</p>
                            </li>
                            <li class="footer__item">
                                <p class="footer__link">Email: boti.work@gmail.com</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer__right">
                    <img src="https://bobui.vn/assets/img/logoSaleNoti.png" alt="" class="footer__right-img">
                    <p class="footer__right-p">COPYRIGHT © 2022 BETI<span>®</span> ALL RIGHT RESERVED.</p>
                </div>
            </div>
        </footer>
        <a class="scroll__up" id="scroll-up" href="#">
            <i class='bx bx-arrow-to-top'></i>
        </a>
        <script src="/js/swiper-bundle.min.js"></script>
        <script src="/js/main.js"></script>
    </body>

</html>
