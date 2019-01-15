<%-- 
    Document   : teacherCompaniesList
    Created on : 14 Δεκ 2018, 7:56:53 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Companies List</title>
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
                    <jsp:include page="teachernavbar.jsp" />       
                </div>
            </header><!--header end-->


            <section class="companies-info">
                <div class="container">
                    <div class="company-title">
                        <h3>All Companies</h3>
                    </div><!--company-title end-->
                    <div class="companies-list">
                        <div class="row">
                            <c:forEach items="${companiesList}" var="company">
                                <div class="col-lg-3 col-md-4 col-sm-6">


                                    <div class="company_profile_info">
                                        <div class="company-up-info">
                                            <img src="/images/${company.profilepic}" height="90" width="90" alt="">
                                            <h3>${company.name}</h3>
                                            <h4>${company.established}</h4>

                                        </div>
                                        <a href="${pageContext.request.contextPath}/teacher/showCompany.htm?comid=${company.id}" title="" class="view-more-pro">View Profile</a>
                                    </div><!--company_profile_info end-->

                                </div>
                            </c:forEach>
                        </div>
                    </div><!--companies-list end-->
                    <div class="process-comm">
                        <div class="spinner">
                            <div class="bounce1"></div>
                            <div class="bounce2"></div>
                            <div class="bounce3"></div>
                        </div>
                    </div><!--process-comm end-->
                </div>
            </section><!--companies-info end-->


        </div><!--theme-layout end-->
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>
    </body>
</html>