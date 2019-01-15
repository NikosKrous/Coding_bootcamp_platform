<%-- 
    Document   : teacherprojectstest
    Created on : 18 Δεκ 2018, 7:04:06 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Project</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link  rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/animate.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome-font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/font-awesome.min.css"/>"
              <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/lib/slick/slick-theme.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/style.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/responsive.css"/> ">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" language="javascript">
            function checkfile(sender) {
                var validExts = ".pdf";
                var fileExt = sender.value;
                fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
                if (validExts !== fileExt) {
                    alert("Invalid file selected, valid files are of " +
                            validExts + " types.");
                    sender.value = "";
                    return false;
                } else
                    return true;
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
            <main>
                <div class="main-section">
                    <div class="container">
                        <div class="main-section-data">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 pd-left-none no-pd">
                                    <div class="main-left-sidebar no-margin">
                                        <div class="user-data full-width">
                                            <div class="user-profile">
                                                <div class="username-dt">
                                                    <div class="usr-pic">
                                                        <img src="/images/${user.profilepic}" alt="">
                                                    </div>
                                                </div>
                                                <div class="user-specs">
                                                    <h3>${user.firstname} ${user.lastname}</h3>
                                                    <span>${user.streamId.stream}</span>
                                                </div>
                                            </div>
                                            <ul class="user-fw-status">
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/teacher/teacherProfileEdit.htm" title="">View Profile</a>
                                                </li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-8 no-pd">
                                    <div class="main-ws-sec">
                                        <div class="post-topbar">
                                            <div class="user-picy">
                                                <img src="/images/${user.profilepic}" alt="">
                                            </div>
                                            <div class="post-st">
                                                <ul>  
                                                    <li><a class="post-jb active" href="#" title="">Post</a></li>
                                                </ul>
                                            </div><!--post-st end-->
                                        </div><!--post-topbar end-->
                                        <div class="posts-section">
                                            <c:forEach items="${projectsList}" var="project">
                                                <div class="post-bar">
                                                    <div class="post_topbar">                                                    
                                                        <div class="usy-dt">
                                                            <img src="/images/${project.teacherId.profilepic}" height="50" width="50" alt="">
                                                            <div class="usy-name">
                                                                <h3>${project.teacherId.username}</h3>
                                                            </div>
                                                        </div>
                                                        <div class="ed-opts">
                                                            <a href="#" title="" class="ed-opts-open"><i class="la la-ellipsis-v"></i></a>
                                                            <ul class="ed-options">
                                                                <li><a href="${pageContext.request.contextPath}/teacher/deleteProject.htm?projectId=${project.id}" title="">Delete</a></li>

                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="epi-sec">
                                                        <ul class="descp">
                                                            <li>${user.streamId.stream}</li>

                                                        </ul>
                                                        <ul class="bk-links">                                                        
                                                            <li><a href="" title="" class="bid_now">Download</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="job_descp">
                                                        <h3>${project.title}</h3>

                                                        <p>${project.description}</p>

                                                    </div>

                                                </div>
                                            </c:forEach>



                                            <div class="process-comm">
                                                <div class="spinner">
                                                    <div class="bounce1"></div>
                                                    <div class="bounce2"></div>
                                                    <div class="bounce3"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div> 
                </div>
            </main>

            <div class="post-popup job_post">
                <div class="post-project">
                    <h3>Post Project</h3>
                    <div class="post-project-fields">
                        <form  action="${pageContext.request.contextPath}/teacher/projectUpload.htm" method="POST" enctype="multipart/form-data"> 
                            <div class="row">
                                <div class="col-lg-12">
                                    <input  type="text" name="title" placeholder="Title" />
                                </div>
                                <div class="col-lg-12">
                                    <input  type="file"  name="file"  id="file" onchange="checkfile(this);" />
                                </div>

                                <div class="col-lg-12">
                                    <textarea  name="description" placeholder="Description"></textarea>
                                </div>

                                <div class="col-lg-12">
                                    <ul>
                                        <li><button class="active" type="submit" value="post">Post</button></li>
                                    </ul>
                                </div>
                            </div>
                        </form>
                    </div>
                    <a href="#" title=""><i class="la la-times-circle-o"></i></a>
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

                        <p><img src="<c:url value="/resources/webfiles/images/cp.png"/>" alt="">Copyright 2018</p>
                        <img class="fl-rgt" src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" alt="">
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
