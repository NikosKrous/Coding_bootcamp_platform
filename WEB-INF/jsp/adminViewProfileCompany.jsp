<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${company.name}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/animate.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome-font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick-theme.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/style.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/responsive.css"/> ">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js"></script>


        <script>
            function initialize() {
                var lang, lot;
                navigator.geolocation.getCurrentPosition(function (position) {
                    lang = position.coords.latitude;
                    lot = position.coords.longitude;
                    var mapProp = {
                        center: new google.maps.LatLng(lang, lot),
                        zoom: 10,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);

                    var marker = new google.maps.Marker({
                        position: {
                            lat: lang,
                            lng: lot
                        },
                        map: map,
                        title: 'Hi its me'
                    });
                });
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>

    <body>
        <div class="wrapper">

            <header>
                <div class="container">
                    <div class="header-data">
                        <jsp:include page="adminnavbar.jsp" />
                    </div>
                </div>
            </header>

            <section class="cover-sec">
                <img src="/images/${companyView.coverpic}" height="400" width="1600" alt="">
            </section>
            <main>
                <div class="main-section">
                    <div class="container">
                        <div class="main-section-data">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="main-left-sidebar">
                                        <div class="user_profile">
                                            <div class="user-pro-img">
                                                <img src="/images/${companyView.profilepic}" height="170" width="170" alt="">
                                            </div>
                                            <div class="user_pro_status">
                                            </div>
                                            <ul class="social_links">
                                                <li><a href="#" title=""><i class="la la-globe"></i> www.${companyView.name}.com</a></li>
                                                <li><a href="#" title=""><i class="la la-linkedin"></i> Http://www.linkedin.com/${companyView.name}</a></li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="main-ws-sec">
                                        <div class="user-tab-sec">
                                            <h3>${companyView.name}</h3>
                                            <div class="star-descp">
                                                <span>Established Since ${companyView.established}</span>
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star-half-o"></i></li>
                                                </ul>
                                            </div>
                                            <div class="tab-feed">
                                                <ul>
                                                    <li data-tab="feed-dd" class="active">
                                                        <a href="#" title="">
                                                            <img src="<c:url value="/resources/webfiles/images/ic1.png"/>" alt="">
                                                            <span>Jobs</span>
                                                        </a>
                                                    </li>
                                                    <li data-tab="info-dd">
                                                        <a href="#" title="">
                                                            <img src="<c:url value="/resources/webfiles/images/ic2.png"/>" alt="">
                                                            <span>About US</span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product-feed-tab current" id="feed-dd">
                                            <div class="posts-section">
                                                <c:forEach items="${jobsList}" var="jobs">
                                                    <div class="post-bar">
                                                        <div class="post_topbar">
                                                            <div class="usy-dt">
                                                                <img src="/images/${companyView.profilepic}" height="50" width="50" alt="">
                                                                <div class="usy-name">
                                                                    <h3>${companyView.name}</h3>
                                                                    <span><img src="images/clock.png" alt=""></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="epi-sec">

                                                        </div>
                                                        <div class="job_descp">
                                                            <h3>${jobs.title}</h3>
                                                            <p>${jobs.description}</p>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="product-feed-tab" id="info-dd">
                                            <div class="user-profile-ov">
                                                <h3><a title="" class="overview-open">Overview</a> <a title="" class="overview-open"><i class=""></i></a></h3>
                                                <p>${companyView.description}</p>
                                            </div>
                                            <div class="user-profile-ov st2">
                                                <h3><a title="" class="esp-bx-open">Established Since </a><a title="" class="esp-bx-open"><i class=""></i></a> <a title="" class="esp-bx-open"><i class=""></i></a></h3>
                                                <span>${companyView.established}</span>
                                            </div>
                                            <div class="user-profile-ov">
                                                <h3><a title="" class="lct-box-open">Location</a> <a href="#" title="" class="lct-box-open"></a> <a title="" class="lct-box-open"></a></h3>
                                                <div id="googleMap" style="width:500px;height:350px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="right-sidebar">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </main>
            <footer>
                <div class="footy-sec mn no-margin">
                    <div class="container">
                        <ul>
                            <li><a href="#" title="">Help Center</a></li>
                            <li><a href="#" title="">Privacy Policy</a></li>
                            <li><a href="#" title="">Community Guidelines</a></li>
                            <li><a href="#" title="">Cookies Policy</a></li>
                            <li><a href="#" title="">Career</a></li>
                            <li><a href="#" title="">Forum</a></li>
                            <li><a href="#" title="">Language</a></li>
                            <li><a href="#" title="">Copyright Policy</a></li>
                        </ul>
                        <p><img src="#" alt="">Copyright 2018</p>
                        <img class="fl-rgt" src="" alt="">
                    </div>
                </div>
            </footer>
        </div>

        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.mCustomScrollbar.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/scrollbar.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>
    </body>
</html>
