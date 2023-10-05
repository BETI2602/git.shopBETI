<%-- 
    Document   : shop-page.jsp
    Created on : Jul 3, 2023, 4:06:34 PM
    Author     : ddand
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SHOP-BETI</title>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="/css/swiper-bundle.min.css">
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


        <header class="header" id="header">
            <nav class="nav container">
                <a href="<%= getServletContext().getContextPath()%>/Home/Trangchu" class="logo__item">BETI <span>®</span></a>
                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">

                        <li class="nav__item"><a href="/Home/Trangchu" class="nav__item-link">TRANG CHỦ</a></li>
                        <li class="nav__item"><a href="#attactive" class="nav__item-link">SẢN PHẨM</a></li>
                        <li class="nav__item"><a href="#footer" class="nav__item-link">LIÊN HỆ</a></li>
                            <%
                                if (session.getAttribute("acc") != null) {
                            %>
                        <li class="nav__item"><button class="nav__item-link" id="acc-menu"> ${sessionScope.fullname}</button></li>
                            <%
                            } else {
                            %>
                        <li class="nav__item"><button  class="nav__item-link" id="login-button">Đăng Nhập</button></li>
                            <%
                                }
                            %>
                    </ul>
                    <div class="acc__menu">
                        <a href="/Taikhoan/ChinhSua/<%=session.getAttribute("acc")%>" class="update__acc">Chỉnh sửa <i class='bx bx-edit-alt'></i></a>
                        <a href="/GioHang/tt/<%=session.getAttribute("acc")%>" class="basket__acc">Giỏ hàng <i class='bx bx-shopping-bag'></i></a>
                        <a href="/logout.jsp" class="lout__acc" onclick="return confirm('Đăng xuất ngay?')">Đăng xuất <i class='bx bx-log-out'></i></a>
                    </div>
                </div>
                <div class="nav__toggle" id="nav-toggle">
                    <div class="tg-one"></div>
                    <div class="tg-two"></div>
                    <div class="tg-three"></div>
                </div>
            </nav>
        </header>
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
                        <div>
                            <a><a href="forgot">Quên mật khẩu?</a>
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

            <section class="home">
                <div class="home__content container">
                    <h2 class="home__subtitle">Khám phá điều tuyệt nhất</h2>
                    <h1 class="home__title">Bạn đã sẵn sàng để <br>
                        bắt tay vào hành trình <br>
                        này hay chưa</h1>
                    <a href="#attactive" class="home__link">Khám phá ngay</a>    
                </div>
                <div class="home__container swiper-container">
                    <div class="home_wrap swiper-wrapper">
                        <!-- img 1 -->
                        <div class="home_slide swiper-slide">
                            <a href="/Home/Shop"><img src="/img/z4427798844403_2eb531fdcffb44d6956b3522cea4c5ee.jpg" alt=""
                                                      class="home_slide-img"></a>
                        </div>
                        <!-- img 2 -->
                        <div class="home_slide swiper-slide">
                            <a href="/Home/Shop"><img src="/img/z4427798841244_5e829ce037b870e01195bed04617c493.jpg" alt=""
                                                      class="home_slide-img"></a>
                        </div>
                        <!-- img 3 -->
                        <div class="home_slide swiper-slide">
                            <a href="/Home/Shop"><img src="/img/z4427798827121_9f84a5eb371ef551a40cb3cf6a3db225.jpg" alt=""
                                                      class="home_slide-img"></a>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section attractive" id="attactive">
                <h1 class="attractive_title">Tất cả sản phẩm</h1>
                <div class="attractive__container grid">
                    <!-- ======================== card 1 =================== -->
                    <%
                        SanPhamDAO dao = new SanPhamDAO();
                        ResultSet rs = dao.getAllSanPham();

                        while (rs.next()) {
                    %>
                    <div class="popup-area">
                        <button class="popup-area-button" id="btnclosepopup">x</button>
                        <iframe src="" class="popup-sanpham"  id="show-sanpham"></iframe>
                    </div>
                    <div class="attractive_card">
                        <div class="attactive_img" id="shop-card">
                            <a href="/SanPham/ChiTiet/<%= rs.getString("masanpham")%>"><img src="<%=rs.getString("hinhanh")%>" alt=""></a>
                        </div>
                        <div class="attactive_info attactive_info-one" id="shop-card">
                            <button onclick="showIframe('<%= rs.getString("masanpham")%>');document.querySelector('.background').classList.add('tab-hidden');" class="attactive_info-cart"><i class='bx bx-show-alt'></i></button>
                        </div>
                        <div class="attactive_info attactive_info-two" id="shop-card">
                            <a href="/GioHang/New/<%=session.getAttribute("acc")%>/<%=rs.getString("masanpham")%>" class="attactive_info-see"><i class='bx bxs-cart-add'></i></a>
                        </div>
                        <div class="attactive_info" id="main-card">
                            <a href="#" class="attactive_info-cart"><i class='bx bx-show-alt'></i></a>
                            <a href="#" class="attactive_info-see"><i class='bx bxs-cart-add'></i></a>
                        </div>
                        <div class="attactive_data">
                            <a href="/SanPham/ChiTiet/<%= rs.getString("masanpham")%>" class="attactive_name"><%= rs.getString("tensanpham")%></a>
                            <p class="attactive_price"><%= String.format("%,.0f đ", rs.getDouble("giatien"))%></p>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </section>
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
                                <p class="footer__link">Shop trang sức BETI</p>
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
                                <p class="footer__link">Email: beti.work@gmail.com</p>
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
        <script src="/js/scrollreveal.min.js"></script>
        <script src="/js/swiper-bundle.min.js"></script>
        <script src="/js/popup.js"></script>
        <script src="/js/main.js"></script>
        <%
            String alertMess = (String) request.getAttribute("alertMess");
            if (alertMess != null && !alertMess.isEmpty()) {
        %>
        <script>
                                alert("<%= alertMess%>");

        </script>
        <%
            }
        %>
        <%
            String alrtMess = (String) session.getAttribute("alrtMess");
            if (alrtMess != null && !alrtMess.isEmpty()) {
        %>
        <script>
            showAlert("<%=alrtMess%>");

        </script>
        <%
                session.setAttribute("alrtMess", null);
            }
        %>
        <%
            String triggerClick = (String) session.getAttribute("trigger");
            if (triggerClick != null && !triggerClick.isEmpty()) {
        %>
        <script>
            loginbutton = document.getElementById("login-button");
            loginbutton.click();
        </script>
        <%
            }
        %>
    </body>

</html>
