<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Profiles</title>
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
                    <jsp:include page="companyNavBar.jsp" />       
                </div>
            </header><!--header end-->

            <section class="companies-info">
                <div class="container">
                    <div class="company-title">
                        <h3>All Students</h3>
                    </div><!--company-title end-->
                    <div class="companies-list">
                        <div class="row">
                            <c:forEach items="${studentList}" var="student">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="company_profile_info">
                                        <div class="company-up-info">
                                            <img src="/images/${student.profilepic}" alt="">
                                            <h3>${student.username}</h3>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/company/showStudent.htm?studentid=${student.id}" title="" class="view-more-pro">View Profile</a>                                    </div><!--company_profile_info end-->
                                </div>
                            </c:forEach>
                        </div>
                    </div><!--companies-list end-->

                </div>
            </section><!--companies-info end-->

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
            </footer><!--footer end-->
        </div><!--theme-layout end-->

        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>
    </body>
</html>