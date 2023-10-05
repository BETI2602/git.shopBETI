window.addEventListener('load', () => {
    var loadingscreen = document.querySelector('.loader');
    if (loadingscreen) {
        loadingscreen.classList.add("loader_hidden");
        loadingscreen.addEventListener('transitionend', () => {
            document.body.style.overflow = "auto";
            document.body.classList.remove("loader");
        });
    }
});







/*============================= FORM ==================================*/

let fit = /^[a-zA-Z]+[a-zA-Z0-9._-]+@[a-zA-Z._-]+\.[a-zA-Z.]{2,}$/;
function checkEmail() {
    let email = document.getElementById("email").value;

    if (fit.test(email)) {
        return true;
    } else {
        return false;
    }
}
function checklogEmail() {
    let logemail = document.getElementById("logemail").value;
    if (fit.test(logemail)) {
        return true;
    } else {
        return false;
    }
}

function checkName() {
    const acc = document.getElementById("name").value;

    if (acc == null || acc == "" || acc.length > 50) {
        return false;
        //  accT.innerHTML = "Please enter name size 0 to 50";
    } else {
        return true;
        // accT.innerHTML = "";
    }
}

function checkPass() {
    let password = document.getElementById("password").value;
    if (password.length < 6 || password.length > 20) {
        return false;
    } else {
        return true;
    }
}
function checklogPass() {
    let logpassword = document.getElementById("logpassword").value;
    if (logpassword.length < 6 || logpassword.length > 20) {
        return false;
    } else {
        return true;
    }
}
function checkRepass() {
    let rePassword = document.getElementById("repassword").value;
    let password = document.getElementById("password").value;
    if (rePassword.length < 6 || rePassword.length > 20) {
        return false;
    } else {
        if (rePassword != password) {
            return false;
        } else {
            return true;
        }
    }
}
function checkTel() {
    const tele = document.getElementById("txtPhone").value;
    const te = /^[0][0-9]{9}$/;
    if (tele == "" || te.test(tele)) {
        return true;
    } else {
        return false;
    }
}
// function checkAddress() {
//   const address = document.getElementById("address").value;

//   if (address == null || address == "") {
//       return false;
//       //  accT.innerHTML = "Please enter name size 0 to 50";
//   } else {
//       return true;
//       // accT.innerHTML = "";
//   }
// }
function dateIsValid() {
    const dateStr = document.getElementById("txtDate").value;
    const regex = /^\d{4}-\d{2}-\d{2}$/;

    const date = new Date(dateStr);
    const currentDate = new Date();

    const timestamp = date.getTime();
    if (dateStr.match(regex) === null) {
        return false;
        // alert("kga");
    } else {
        if (typeof timestamp !== 'number' || Number.isNaN(timestamp)) {
            return false;
            // alert("kga");
        } else {
            if (date > currentDate) {
                return false;
            } else {
                return true;
            }
        }
    }
}

function checkUpName() {
    const acc = document.getElementById("txtHoten").value;

    if (acc === null || acc === "" || acc.length > 100) {
        return false;
        //  accT.innerHTML = "Please enter name size 0 to 50";
    } else {
        return true;
        // accT.innerHTML = "";
    }
}
function checkAddress() {
    const adres = document.getElementById("txtAddress").value;

    if (adres.length > 500) {
        return false;
        //  accT.innerHTML = "Please enter name size 0 to 50";
    } else {
        return true;
        // accT.innerHTML = "";
    }
}

var loginform = document.getElementById("login-form");
if (loginform) {
    loginform.addEventListener('submit', function (event) {
        let logeerror = document.getElementById("logeerror");
        let logperror = document.getElementById("logperror");
        let check = true;
        if (checklogEmail() == false) {
            check = false;
            logeerror.innerHTML = "Email không hợp lệ";
        } else {
            logeerror.innerHTML = "";
        }
        if (checklogPass() == false) {
            check = false;
            logperror.innerHTML = "Mật khẩu phải từ 6 đến 20";

        } else {
            logperror.innerHTML = "";
        }
        if (!check) {
            event.preventDefault();
        }
    });
}


var regisform = document.getElementById("regis-form");
if (regisform) {

    regisform.addEventListener('submit', function (e) {

        let nerror = document.getElementById("nerror");
        let eerror = document.getElementById("eerror");
        let perror = document.getElementById("perror");
        let reperror = document.getElementById("reperror");
        let check = true;

        if (checkName() == false) {
            check = false;
            nerror.innerHTML = "Hãy nhập họ tên";
        } else {
            nerror.innerHTML = "";
        }
        if (checkEmail() == false) {
            check = false;
            eerror.innerHTML = "Email không hợp lệ";
        } else {
            eerror.innerHTML = "";
        }
        if (checkPass() == false) {
            check = false;
            perror.innerHTML = "Mật khẩu phải từ 6 đến 20";

        } else {
            perror.innerHTML = "";
        }
        if (checkRepass() == false) {
            check = false;
            reperror.innerHTML = "Mật khẩu nhập lại không trùng khớp";

        } else {
            reperror.innerHTML = "";
        }
        console.log(check);

        if (!check) {
            e.preventDefault();
        }
    });
}

var updateform = document.getElementById("update-form");
if (updateform) {
    updateform.addEventListener('submit', function (even) {

        let nerror = document.getElementById("upnerror");
        let derror = document.getElementById("upderror");
        let terror = document.getElementById("upterror");
        let aerror = document.getElementById("upaerror");
        let check = true;

        if (checkUpName() == false) {
            check = false;
            nerror.innerHTML = "Họ tên không được để trống";
        } else {
            nerror.innerHTML = "";
        }
        if (dateIsValid() == false) {
            check = false;
            derror.innerHTML = "Ngày sinh không hợp lệ";
        } else {
            derror.innerHTML = "";
        }
        if (checkTel() == false) {
            check = false;
            terror.innerHTML = "Số điện thoại không hợp lệ";

        } else {
            terror.innerHTML = "";
        }
        if (checkAddress() == false) {
            check = false;
            aerror.innerHTML = "Địa chỉ quá dài";
        } else {
            aerror.innerHTML = "";
        }
        console.log(check);

        if (!check) {
            even.preventDefault();
        }
    });
}

var adminLogin = document.getElementById("admin-login");
if (adminLogin) {
    console.log("ahsf");
    adminLogin.addEventListener('submit', function (eve) {
        console.log("ahsf");
        let adeError = document.getElementById("adeError");
        let adpError = document.getElementById("adpError");
        let check = true;
        if (checklogEmail() == false) {
            check = false;
            adeError.innerHTML = "Email không hợp lệ";
        } else {
            adeError.innerHTML = "";
        }
        if (checklogPass() == false) {
            check = false;
            adpError.innerHTML = "Mật khẩu phải từ 6 đến 20";

        } else {
            adpError.innerHTML = "";
        }
        if (!check) {
            addRequire();
            eve.preventDefault();
        }
    });
}
function removeRequire() {
    document.getElementById("logemail").removeAttribute('required');
    document.getElementById("logpassword").removeAttribute('required');
}
function addRequire() {
    document.getElementById("logemail").required = true;
    document.getElementById("logpassword").required = true;
}

let menu = document.querySelector(".nav__toggle");
const navMenu = document.getElementById('nav-menu');
const navToggle = document.getElementById('nav-toggle');


if (navToggle) {
    navToggle.addEventListener('click', () => {
        menu.classList.toggle("move");
        navMenu.classList.toggle('nav__menu-show');
    });
}

let loginbutton = document.getElementById("login-button");
const loginmenu = document.getElementById("login-page");
let closebutton = document.getElementById("close-login");
const bg = document.querySelector('.background');
if (loginbutton) {
    loginbutton.addEventListener('click', () => {
        loginmenu.classList.add('login-effect');
        bg.classList.add('tab-hidden');
        // Ngăn cuộn trang
        document.body.style.overflow = "hidden";
    });
    if (bg) {
        bg.addEventListener('click', () => {
            loginmenu.classList.remove('login-effect');
            bg.classList.remove('tab-hidden');
            // Ngăn cuộn trang
            document.body.style.overflow = "auto";
        });
    }
}

if (closebutton) {
    closebutton.addEventListener('click', () => {
        loginmenu.classList.remove('login-effect');
        bg.classList.remove('tab-hidden');
        // Ngăn cuộn trang
        document.body.style.overflow = "auto";
    });

}


let btnlogin = document.getElementById("btnlogin");
let btnregis = document.getElementById("btnregis");
let logintab = document.getElementById("login-tab");
let registab = document.getElementById("regis-tab");
if (btnlogin) {
    btnlogin.addEventListener('click', () => {
        logintab.classList.remove('tab-closen');
        btnlogin.classList.add('login-button-effect');
        btnregis.classList.remove('login-button-effect');
        registab.classList.add('tab-closen');
    });
}
if (btnregis) {
    btnregis.addEventListener('click', () => {
        registab.classList.remove('tab-closen');
        btnregis.classList.add('login-button-effect');
        btnlogin.classList.remove('login-button-effect');
        logintab.classList.add('tab-closen');
    });
}


let btnsearch = document.getElementById("btnSearch");
let showSearch = document.querySelector('.nav_admin-right');
if (btnsearch) {
    btnsearch.addEventListener('click', () => {
        showSearch.classList.toggle("input_search-show");
    });
}

function scrollHeader() {
    const nav = document.getElementById('header');
    if (this.scrollY >= 200)
        nav.classList.add('scroll-header');
    else
        nav.classList.remove('scroll-header');
}
const nav = document.getElementById('header');
if(nav){
window.addEventListener('scroll', scrollHeader);
}
const element = document.querySelector('.header');
if (element) {
    const computedStyle = getComputedStyle(element);
    const height = computedStyle.getPropertyValue('height');
    document.documentElement.style.setProperty('--header-height', height);
}

const homecontain = document.querySelector('.home__container');
if (homecontain) {
    var swiper = new Swiper(".home__container", {
        simulateTouch: false,
        grabCursor: true,
        effect: "fade",
        autoplay: true,
        loop: true,
        speed: 1000
    });
}

var attimg = document.querySelectorAll('.attractive_card');
// var attinfo = document.querySelectorAll('.attactive_info');
if (attimg) {
    attimg.forEach(element => {
        element.addEventListener('mouseover', () => {
            element.classList.add("attactive_show");
        });
        element.addEventListener('mouseout', () => {
            element.classList.remove("attactive_show");
        });

    });
}

var accmenu = document.getElementById("acc-menu");
var accshow = document.querySelector('.acc__menu');
if (accmenu != null) {
    accmenu.addEventListener('click', () => {
        accshow.classList.toggle("acc__show");
    });
}
var btnMap = document.getElementById("btnMap");
var mapShow = document.querySelector('.shop__location');
if (btnMap != null) {
    btnMap.addEventListener('click', () => {
        mapShow.classList.toggle("shop__show");
    });
}

const productmore = document.querySelector('.product__more');
if (productmore) {
    var mswiper = new Swiper(".product__more", {
        slidesPerView: 1,
        spaceBetween: 30,
        autoplay: true,
        delay: 100,
        speed: 1000,
        loop: true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        breakpoints: {
            // when window width is >= 320px
            320: {
                slidesPerView: 2,
                spaceBetween: 20
            },
            // when window width is >= 480px
            567: {
                slidesPerView: 3,
                spaceBetween: 20
            },
            // when window width is >= 640px
            968: {
                slidesPerView: 4,
                spaceBetween: 20
            }
        }
    });
}

function scrollUp() {
    const scrollIcon = document.getElementById('scroll-up');
    if (this.scrollY >= 200)
        scrollIcon.classList.add('showscroll');
    else
        scrollIcon.classList.remove('showscroll');
}
window.addEventListener('scroll', scrollUp);

const sr = ScrollReveal({
    distance: '60px',
    duration: 2800
});
if (sr) {
    sr.reveal(`.attractive_card`, {
        origin: 'top'
    });
    sr.reveal(`.home__content,.about__content,.about__imgleft,.about__contentleft`, {
        origin: 'left'
    });
    sr.reveal(`.home__link`, {
        origin: 'left',
        interval: 100
    });
    sr.reveal(`.about__imgright,.about__contentright`, {
        origin: 'right'
    });
}



