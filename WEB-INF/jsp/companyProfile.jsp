<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Company Profile</title>
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
            function checkProfilePhoto()
            {
                var fileInput = document.getElementById('profimgupload');
                var extn = fileInput.value.split('.').pop().toLowerCase();
                var allowedExtensions = ['jpeg', 'jpg', '.png'];
                var isValidFile = false;
                for (var index in allowedExtensions)
                {
                    if (extn === allowedExtensions[index])
                    {
                        isValidFile = true;
                    }
                }
                if (!isValidFile) {
                    alert('Allowed Extensions are : *.' + allowedExtensions.join(', *.'));
                    isValidFile = false;
                }
                if (fileInput.files[0].size > 102400000000) {
                    alert("Image too big (max 10000kb)");
                    isValidFile = false;
                }
                if (isValidFile === true) {
                    var photoForm = document.getElementById("photoUpProfile");
                    photoForm.action = '${pageContext.request.contextPath}/company/ProfilePhotoUpload.htm';
                    photoForm.submit();
                }
            }
        </script>

        <script>
            function checkCoverPhoto()
            {
                var fileInput = document.getElementById('covimgupload');
                var extn = fileInput.value.split('.').pop().toLowerCase();
                var allowedExtensions = ['jpeg', 'jpg', '.png'];
                var isValidFile = false;
                for (var index in allowedExtensions)
                {
                    if (extn === allowedExtensions[index])
                    {
                        isValidFile = true;
                    }
                }
                if (!isValidFile) {
                    alert('Allowed Extensions are : *.' + allowedExtensions.join(', *.'));
                    isValidFile = false;
                }
                if (fileInput.files[0].size > 102400) {
                    alert("Image too big (max 100kb)");
                    isValidFile = false;
                }
                if (isValidFile === true) {
                    var photoForm = document.getElementById("photoUpCover");
                    photoForm.action = '${pageContext.request.contextPath}/company/CoverPhotoUpload.htm';
                    photoForm.submit();
                }
            }
        </script>


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
                <div>
                    <jsp:include page="companyNavBar.jsp" />       
                </div>
            </header>

            <section class="cover-sec">
                <img src="/images/${company.coverpic}" height="400" width="1600"  alt="">
                <a  href="#"  onclick="document.getElementById('covimgupload').click();">
                    <form id="photoUpCover" id="file" class="fa fa-camera" onchange="checkCoverPhoto()" method="POST"  enctype="multipart/form-data" >
                        <input type="file" name="file" id="covimgupload" style="display:none" multiple/> </form>Change Image</a>
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
                                                <img src="/images/${company.profilepic}" height="170" width="170"  alt="">
                                                <a  href="#"  onclick="document.getElementById('profimgupload').click();">
                                                    <form id="photoUpProfile" id="file" class="fa fa-camera" onchange="checkProfilePhoto()" method="POST"  enctype="multipart/form-data" >
                                                        <input type="file" name="file" id="profimgupload" style="display:none" multiple/> </form></a>
                                            </div>
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="float: left; margin-left:10px; "><a href="${company.getWebsite()}"><i class="fa fa-globe"></i>website</a></th>
                                                    <td><a href="#" title="" class="" id="social-box"></a></th>
                                                </tr>
                                                <tr>
                                                    <td style="float: left; margin-left:10px; "><a href="${company.getLinkedin()}" ><i class="fa fa-linkedin"></i>LinkedIn</a></td>
                                                    <td><a href="#" title="" class=""></a></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="main-ws-sec">
                                        <div class="user-tab-sec">
                                            <h3>${company.name} </h3>

                                            <div class="star-descp">
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
                                                            <span>About Us</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="post-topbar">
                                            <div class="user-picy">
                                                <img src="/images/${company.profilepic}" height="50" width="50" alt="">
                                            </div>
                                            <div class="post-st">
                                                <ul>
                                                    <li><a class="post-jb active" href="#" title="">Post a Job</a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="product-feed-tab current" id="feed-dd">
                                            <div class="posts-section">
                                                <c:forEach items="${jobsList}" var="jobs">
                                                    <div class="post-bar">
                                                        <div class="post_topbar">
                                                            <div class="usy-dt">
                                                                <img src="/images/${jobs.companyid.profilepic}" height="50" width="50" alt="">
                                                                <div class="usy-name">
                                                                    <h3>${jobs.companyid.name}</h3>
                                                                    <span><img src="images/clock.png" alt=""></span>
                                                                </div>
                                                            </div>
                                                            <div class="ed-opts">
                                                                <a href="#" title="" class="ed-opts-open"><i class="la la-ellipsis-v"></i></a>
                                                                <ul class="ed-options">
                                                                    <li><a href="${pageContext.request.contextPath}/company/deleteJobs.htm?jobsId=${jobs.id}" title="">Delete</a></li>
                                                                </ul>
                                                            </div>
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
                                                <h3><a href="#" title="" class="overview-open">Overview</a> <a href="#" title="" class="overview-open"><i class="fa fa-pencil"></i></a></h3>
                                                <p>${company.description}</p>
                                            </div>
                                            <div class="user-profile-ov st2">
                                                <h3><a href="#" title="" class="esp-bx-open">Established Since </a><a href="#" title="" class="esp-bx-open"><i class="fa fa-pencil"></i></a> <a href="#" title="" class="esp-bx-open"></a></h3>
                                                <span>${company.established}</span>
                                            </div>

                                            <div class="user-profile-ov">
                                                <h3><a href="#" title="" class="lct-box-open">Location</a> <a href="#" title="" class="lct-box-open"><i class="fa fa-pencil"></i></a> <a href="#" title="" class="lct-box-open"></a></h3>
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

            <div class="post-popup job_post">
                <div class="post-project">
                    <h3>Post a job</h3>
                    <div class="post-project-fields">
                        <spring:form modelAttribute="job" action="${pageContext.request.contextPath}/company/addJobs.htm" method="POST">
                            <div class="row">
                                <div class="col-lg-12">
                                    <spring:input path="title" type="text" name="title" placeholder="Title" />
                                </div>
                                <div class="col-lg-12">
                                    <spring:textarea path="description" name="description" placeholder="Description"></spring:textarea>
                                    </div>
                                    <div class="col-lg-12">
                                        <ul>
                                            <li><button class="active" type="submit" value="post">Post</button></li>
                                        </ul>
                                    </div>
                                </div>
                        </spring:form>
                    </div>
                    <a href="#" title=""><i class="la la-times-circle-o"></i></a>
                </div>
            </div>

            <div class="overview-box" id="overview-box">
                <div class="overview-edit">
                    <h3>Overview</h3>
                    <span>5000 character left</span>
                    <spring:form modelAttribute="companyForUpdate" action="${pageContext.request.contextPath}/company/updateCompanyDescription.htm" method="POST">
                        <spring:textarea path="description"></spring:textarea>
                            <button  type="submit" class="save" name="save" value="Save">Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

            <div class="overview-box" id="establish-box">
                <div class="overview-edit">
                    <h3>Established Since</h3>
                    <spring:form modelAttribute="companyForUpdate" action="${pageContext.request.contextPath}/company/updateCompanyEstablished.htm" method="POST">
                        <div class="sn-field">
                            <spring:input path="established" required="required" type="date" placeholder="2018-12-31"  max="2017-12-31" />
                            <i class=""></i>
                        </div>
                        <button type="submit" class="save">Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

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
                        <p><img  src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" height="30" width="30" alt="">Copyright 2018</p>
                        <img class="fl-rgt" src="images/logo2.png" alt="">
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
