<%-- 
    Document   : teacherprofilefeed
    Created on : 17 Δεκ 2018, 4:27:16 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>WorkWise Html Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/animate.css"  />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/flatpickr.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome-font-awesome.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/font-awesome.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick-theme.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/style.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/responsive.css"/>">

    <script>
        function checkCoverPhoto()
        {
            var fileInput = document.getElementById('coverimgupload');
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
            if (fileInput.files[0].size > 1024000) {
                alert("Image too big (max 100kb");
                isValidFile = false;
            }
            if (isValidFile === true) {
                var photoForm = document.getElementById("photoUp");
                photoForm.action = '${pageContext.request.contextPath}/teacher/CoverPhotoUpload.htm';
                photoForm.submit();
            }
        }

        function checkProfilePhoto()
        {

            var fileInput = document.getElementById('prflimgupload');
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
            if (fileInput.files[0].size > 1024000) {
                alert("Image too big (max 100kb");
                isValidFile = false;
            }
            if (isValidFile === true) {
                var photoForm = document.getElementById("profphotoUp");
                photoForm.action = '${pageContext.request.contextPath}/teacher/ProfilePhotoUpload.htm';
                photoForm.submit();
            }
        }


    </script>

</head>


<body>


    <div class="wrapper">
        <header>
            <div>
                <jsp:include page="teachernavbar.jsp" />
            </div>
        </header>
        <section class="cover-sec">
            <div>${covererrormsg} </div>
            <img src="/images/${user.coverpic}" height="400" width="1600"  alt="">
            <a  href="#"  onclick="document.getElementById('coverimgupload').click();">
                <form id="photoUp" id="file" class="fa fa-camera" onchange="checkCoverPhoto()" method="POST"  enctype="multipart/form-data" >
                    <input type="file" name="file" id="coverimgupload" style="display:none" multiple/> </form>Change Image</a>

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
                                            <img src="/images/${user.profilepic}" height="170" width="170"   alt="">
                                            <a href="${pageContext.request.contextPath}/ProfilePhotoUpload.htm" title="">
                                                <a  href="#"  onclick="document.getElementById('prflimgupload').click();">
                                                    <form id="profphotoUp" id="file" class="fa fa-camera" onchange="checkProfilePhoto()" method="POST"  enctype="multipart/form-data" >
                                                        <input type="file" name="file" id="prflimgupload" style="display:none" multiple/> </form></a>
                                                <div>${profileerrormsg}</div>
                                        </div><!--user-pro-img end-->

                                        <table style="width:100%">
                                            <tr>
                                                <td style="float: left; margin-left:10px; "><a href="${user.github}"><i class="fa fa-globe"></i>Github</a></th>
                                            </tr>
                                            <tr>
                                                <td style="float: left; margin-left:10px; "><a href="${user.linkedin}" ><i class="fa fa-linkedin"></i>LinkedIn</a></td>
                                            </tr>
                                        </table>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="main-ws-sec">
                                    <div class="user-tab-sec">
                                        <h3>${user.firstname} ${user.lastname}</h3>
                                        <div class="star-descp">
                                            <span>${user.email  }</span>

                                        </div><!--star-descp end-->
                                        <div class="tab-feed st2">
                                            <ul>

                                                <li data-tab="info-dd">
                                                    <a href="#" title="">
                                                        <img src="<c:url value="/resources/webfiles/images/ic2.png"/>" alt="">
                                                        <span>Info</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div><!-- tab-feed end-->
                                    </div><!--user-tab-sec end-->
                                    <div class="product-feed-tab current" id="info-dd">
                                        <div class="user-profile-ov">
                                            <h3><a href="#" title="" class="overview-open">Overview</a> <a href="#" title="" class="overview-open"><i class="fa fa-pencil"></i></a></h3>
                                            <p>${user.overview}</p>
                                        </div><!--user-profile-ov end-->
                                        <div class="user-profile-ov">
                                            <h3><a href="#" title="" class="lct-box-open">Location</a> <a href="#" title="" class="lct-box-open"><i class="fa fa-pencil"></i></a> <a href="#" title=""><i class="fa fa-plus-square"></i></a></h3>
                                            <h4>India</h4>
                                            <p>151/4 BT Chownk, Delhi </p>
                                        </div><!--user-profile-ov end-->
                                        <div class="user-profile-ov">
                                            <h3><a href="#" title="" class="skills-open">Skills</a> <a href="#" title="" class="skills-open"><i class="fa fa-pencil"></i></a> <a href="#"><i class="fa fa-plus-square"></i></a></h3>
                                            <ul>
                                                <li><a href="#" title="">HTML</a></li>
                                                <li><a href="#" title="">PHP</a></li>
                                                <li><a href="#" title="">CSS</a></li>
                                                <li><a href="#" title="">Javascript</a></li>
                                                <li><a href="#" title="">Wordpress</a></li>
                                                <li><a href="#" title="">Photoshop</a></li>
                                                <li><a href="#" title="">Illustrator</a></li>
                                                <li><a href="#" title="">Corel Draw</a></li>
                                            </ul>
                                        </div><!--user-profile-ov end-->
                                    </div><!--product-feed-tab end-->

                                </div><!--main-ws-sec end-->
                            </div>
                            <div class="col-lg-3">
                                <div class="right-sidebar">

                                </div><!--right-sidebar end-->
                            </div>
                        </div>
                    </div><!-- main-section-data end-->
                </div> 
            </div>
        </main>

        <div class="overview-box" id="overview-box">
            <div class="overview-edit">
                <h3>Overview</h3>
                <spring:form  modelAttribute="tea" action="${pageContext.request.contextPath}/teacher/updateOverview.htm" method="POST">
                    <spring:textarea path ="overview" rows = "5" cols = "30" />
                    <button type="submit" class="save">Save</button>
                    <button type="submit" class="cancel">Cancel</button>
                </spring:form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

        <div class="overview-box" id="experience-box">
            <div class="overview-edit">
                <h3>Experience</h3>
                <form>
                    <input type="text" name="subject" placeholder="Subject">
                    <textarea></textarea>
                    <button type="submit" class="save">Save</button>
                    <button type="submit" class="save-add">Save & Add More</button>
                    <button type="submit" class="cancel">Cancel</button>
                </form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

        <div class="overview-box" id="education-box">
            <div class="overview-edit">
                <h3>Education</h3>
                <form>
                    <input type="text" name="school" placeholder="School / University">
                    <div class="datepicky">
                        <div class="row">
                            <div class="col-lg-6 no-left-pd">
                                <div class="datefm">
                                    <input type="text" name="from" placeholder="From" class="datepicker">	
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                            <div class="col-lg-6 no-righ-pd">
                                <div class="datefm">
                                    <input type="text" name="to" placeholder="To" class="datepicker">
                                    <i class="fa fa-calendar"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="text" name="degree" placeholder="Degree">
                    <textarea placeholder="Description"></textarea>
                    <button type="submit" class="save">Save</button>
                    <button type="submit" class="save-add">Save & Add More</button>
                    <button type="submit" class="cancel">Cancel</button>
                </form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

        <div class="overview-box" id="location-box">
            <div class="overview-edit">
                <h3>Location</h3>
                <form>
                    <div class="datefm">
                        <select>
                            <option>Country</option>
                            <option value="pakistan">Pakistan</option>
                            <option value="england">England</option>
                            <option value="india">India</option>
                            <option value="usa">United Sates</option>
                        </select>
                        <i class="fa fa-globe"></i>
                    </div>
                    <div class="datefm">
                        <select>
                            <option>City</option>
                            <option value="london">London</option>
                            <option value="new-york">New York</option>
                            <option value="sydney">Sydney</option>
                            <option value="chicago">Chicago</option>
                        </select>
                        <i class="fa fa-map-marker"></i>
                    </div>
                    <button type="submit" class="save">Save</button>
                    <button type="submit" class="cancel">Cancel</button>
                </form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

        <div class="overview-box" id="skills-box">
            <div class="overview-edit">
                <h3>Skills</h3>
                <ul>
                    <li><a href="#" title="" class="skl-name">HTML</a><a href="#" title="" class="close-skl"><i class="la la-close"></i></a></li>
                    <li><a href="#" title="" class="skl-name">php</a><a href="#" title="" class="close-skl"><i class="la la-close"></i></a></li>
                    <li><a href="#" title="" class="skl-name">css</a><a href="#" title="" class="close-skl"><i class="la la-close"></i></a></li>
                </ul>
                <form>
                    <input type="text" name="skills" placeholder="Skills">
                    <button type="submit" class="save">Save</button>
                    <button type="submit" class="save-add">Save & Add More</button>
                    <button type="submit" class="cancel">Cancel</button>
                </form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

        <div class="overview-box" id="create-portfolio">
            <div class="overview-edit">
                <h3>Create Portfolio</h3>
                <form>
                    <input type="text" name="pf-name" placeholder="Student Name">

                    <!--                    <div type="file" name="file"></div>-->
                    <div class="epi-sec">
                        <ul class="descp">
                            <li>${projectsApply.filename}</li>

                        </ul>
                        <ul class="bk-links">                                                        
                            <li><a href="${pageContext.request.contextPath}/download/${projectsApply.projectId}.html" title="" class="bid_now">Download</a></li>
                        </ul>
                    </div>

                    <input type="text" name="grade" placeholder="eg 70/100">
                    <button type="submit" class="save">Save</button>

                </form>
                <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
            </div><!--overview-edit end-->
        </div><!--overview-box end-->

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

                    <p><img src="<c:url value="/resources/webfiles/images/cp.png"/>" alt="">Copyright 2018</p>
                    <img class="fl-rgt" src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" alt="">
                </div>
            </div>
        </footer>
    </div><!--theme-layout end-->

    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/vjs/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/flatpickr.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>

</body>
</html>