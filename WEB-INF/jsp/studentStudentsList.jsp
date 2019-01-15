<%-- 
    Document   : adminCompaniesList
    Created on : Dec 9, 2018, 12:51:29 AM
    Author     : krocos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Students List</title>
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
    </head>

    <body>

        <div class="wrapper">

            <header>
                <div>
                    <jsp:include page="student_nav.jsp" />       
                </div>
            </header>

            <section class="companies-info">
                <div class="container">
                    <div class="company-title">
                        <h3>All Teachers</h3>
                    </div><br>
                    <div style="color: red">${infos}</div>
                    <div class="companies-list">
                        <div class="row">
                            <c:forEach items="${studentsList}" var="student">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="company_profile_info">
                                        <div class="company-up-info">
                                            <img src="/images/${student.profilepic}" height="90" width="90" lt="">
                                            <h3>${student.username}</h3>
                                            <h4>${student.title}</h4>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/student/createEmptyMessageForStudent.htm?studid=${student.id}" title="" class="follow"><i class="fa fa-envelope"></i></a></li>
                                            </ul>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/student/viewProfile.htm?studid=${student.id}" title="" class="view-more-pro">View Profile</a>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="process-comm">
                        <div class="spinner">
                            <div class="bounce1"></div>
                            <div class="bounce2"></div>
                            <div class="bounce3"></div>
                        </div>
                    </div>
                </div>
            </section>

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
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>

    </body>
</html>