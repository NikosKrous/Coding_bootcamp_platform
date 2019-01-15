<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>StudentHome</title>
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
                    photoForm.action = '${pageContext.request.contextPath}/student/CoverPhotoUpload.htm';
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
                    photoForm.action = '${pageContext.request.contextPath}/student/ProfilePhotoUpload.htm';
                    photoForm.submit();
                }
            }


        </script>

    </head>

    <body>

        <div class="wrapper">

            <header>
                <div class="container">
                    <div class="header-data">
                        <jsp:include page="student_nav.jsp" />
                    </div>
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
                                            </div>
                                            <table style="width:100%">
                                                <tr>
                                                    <td><a href="${user.getGithub()}"><i class="fa fa-github"></i> GitHub </a></td>
                                                </tr>
                                                <tr>
                                                    <td ><a href="${user.getLinkedin()}" ><i class="fa fa-linkedin"></i> LinkedIn </a></td>
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
                                                <span>${user.title}</span>
                                            </div>
                                            <div class="tab-feed st2">
                                                <ul>
                                                    <li data-tab="info-dd">
                                                        <a href="#" title="">
                                                            <img src="<c:url value="/resources/webfiles/images/ic2.png"/>" alt="">
                                                            <span>Info</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="product-feed-tab current" id="info-dd">
                                            <div class="user-profile-ov">
                                                <h3><a href="#" title="" class="overview-open">Overview</a> <a href="#" title="" class="overview-open"><i class="fa fa-pencil"></i></a>
                                                    <p>${user.getOverview()}</p>
                                            </div>

                                            <div class="user-profile-ov st2">
                                                <h3><a href="#" title="" class="exp-bx-open">Experience </a><a href="#" title="" class="exp-bx-open"><i class="fa fa-plus-square"></i></a></h3>
                                                        <c:forEach items="${user.studentExperienceCollection}" var="experience">
                                                    <h4>${experience.exprerience.title}<a href="#" title=""></i></a></h4>
                                                    <span>${experience.exprerience.startDate}  to  ${experience.exprerience.endDate}</span>
                                                    <p>${experience.exprerience.summary}</p>
                                                </c:forEach>
                                            </div>

                                            <div class="user-profile-ov">
                                                <h3><a href="#" title="" class="ed-box-open">Education</a> <a href="#" title="" class="ed-box-open"><i class="fa fa-pencil"></i></a> <a href="#" title="" class="ed-box-open2"><i class="fa fa-plus-square"></i></a></h3>
                                                        <c:forEach items="${user.studentEducationCollection}" var="education">
                                                    <h3>${education.education.university}</h3>
                                                    <h2>${education.education.degree}</h2>
                                                    <span>${education.education.startDate}  to  ${education.education.endDate}</span>
                                                    <p>${education.education.description}</p>
                                                </c:forEach>
                                            </div>

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
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-3">
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
                        <p><img src="<c:url value="/resources/webfiles/images/cp.png"/>" alt="">Copyright 2018</p>
                        <img class="fl-rgt" src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" alt="">
                    </div>
                </div>
            </footer>

            <div class="overview-box" id="overview-box">
                <div class="overview-edit">
                    <h3>Overview</h3>
                    <spring:form  modelAttribute="student" action="${pageContext.request.contextPath}/student/updateStudent.htm" method="POST">
                        <spring:textarea path ="overview" rows = "5" cols = "30" />
                        <button type="submit" >Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

            <div class="overview-box" id="experience-box">
                <div class="overview-edit">
                    <h3>Experience</h3>
                    <spring:form  modelAttribute="experience" action="${pageContext.request.contextPath}/student/updateExperience.htm" method="POST">
                        <div><spring:input path ="title" name ="title" type="text" placeholder="Title" /></div>
                        <div><spring:input path ="summary" name ="summary" type="text" placeholder="Summary"/></div>
                        <div><spring:input path ="startDate" name ="start_date" type="date" placeholder="Start date" /></div>
                        <div><spring:input path ="endDate" name ="end_date" type="date" placeholder="End date"/></div>
                        <div><spring:input path ="location" name ="location" type="text" placeholder="Location"/></div>
                        <button type="submit" class="save" >Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

            <div class="overview-box" id="experience-box2">
                <div class="overview-edit">
                    <h3>Experience</h3>
                    <spring:form  modelAttribute="experience" action="${pageContext.request.contextPath}/student/updateExperience.htm" method="POST">
                        <div><spring:input path ="title" name ="title" type="text" value="${user}" /></div>
                        <div><spring:input path ="summary" name ="summary" type="text" value="Summary"/></div>
                        <div><spring:input path ="startDate" name ="start_date" type="date" value="Start date" /></div>
                        <div><spring:input path ="endDate" name ="end_date" type="date" value="End date"/></div>
                        <div><spring:input path ="location" name ="location" type="text" value="Location"/></div>
                        <button type="submit" class="save" >Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

            <div class="overview-box" id="education-box">
                <div class="overview-edit">
                    <h3>Education</h3>
                    <spring:form  modelAttribute="education" action="${pageContext.request.contextPath}/student/updateEducation.htm" method="POST">
                        <spring:input path="university" type="text"  name="university" placeholder="University"/>
                        <div class="datepicky">
                            <div class="row">
                                <div class="col-lg-6 no-left-pd">
                                    <div class="datefm">
                                        <spring:input path="startDate" type="date" name="from" class="datepicker" placeholder="Start Date"/>	
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                                <div class="col-lg-6 no-righ-pd">
                                    <div class="datefm">
                                        <spring:input path="endDate" type="date" name="to" placeholder="End date" class="datepicker" />
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <spring:input path="degree" type="text" name="degree" placeholder="Degree"/>
                        <spring:textarea path="description" rows = "5" cols = "30" placeholder="Description"/>
                        <button type="submit" class="save">Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>

            <div class="overview-box" id="education-box2">
                <div class="overview-edit">
                    <h3>Education</h3>
                    <spring:form  modelAttribute="education" action="${pageContext.request.contextPath}/student/updateEducation.htm" method="POST">
                        <spring:input path="university" type="text"  name="university" placeholder="University"/>
                        <div class="datepicky">
                            <div class="row">
                                <div class="col-lg-6 no-left-pd">
                                    <div class="datefm">
                                        <spring:input path="startDate" type="date" name="from" class="datepicker" placeholder="Start Date"/>	
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                                <div class="col-lg-6 no-righ-pd">
                                    <div class="datefm">
                                        <spring:input path="endDate" type="date" name="to" placeholder="End date" class="datepicker" />
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <spring:input path="degree" type="text" name="degree" placeholder="Degree"/>
                        <spring:textarea path="description" rows = "5" cols = "30" placeholder="Description"/>
                        <button type="submit" class="save">Save</button>
                    </spring:form>
                    <a href="#" title="" class="close-box"><i class="la la-close"></i></a>
                </div>
            </div>            

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