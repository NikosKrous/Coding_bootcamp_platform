
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Company Navbar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    </head>
    <body>
        <header>
            <div class="container">
                <div class="header-data">
                    <div class="logo">

                        <a href="${pageContext.request.contextPath}/company/companyHome.htm" title="">
                            <img  src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" height="30" width="30" alt=""></a> 
                    </div>
                    <div class="search-bar">
                        <form>
                            <input type="text" name="search" placeholder="Search...">
                            <button type="submit"><i class="la la-search"></i></button>
                        </form>
                    </div>
                    <nav>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/company/companyHome.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon1.png"/>" alt=""></span>
                                    Home
                                </a>
                            </li>
                            <li>

                                <a href="${pageContext.request.contextPath}/company/students.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon4.png"/>" alt=""></span>
                                    Students
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="menu-btn">
                        <a href="#" title=""><i class="fa fa-bars"></i></a>
                    </div>
                    <div class="user-account">
                        <div class="user-info">
                            <img src="/images/${company.profilepic}" height="30" width="30" alt="">
                            <a href="#" title="">${company.name}</a>
                            <i class="la la-sort-down"></i>
                        </div>
                        <div class="user-account-settingss">
                            <h3>Settings</h3>
                            <ul class="us-links">
                                <li><a href="${pageContext.request.contextPath}/company/companySettings.htm" title="">Account Settings</a></li>
                            </ul>
                            <h3 class="tc"><a href="${pageContext.request.contextPath}/user/logout.htm" title="">Logout</a></h3>
                        </div>
                    </div>
                </div>
            </div>
        </header>

    </body>
</html>
