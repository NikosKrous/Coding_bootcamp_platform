<%-- 
    Document   : teachernavbar
    Created on : 13 Δεκ 2018, 1:59:13 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Navbar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

    </head>
    <body>
        <header>
            <div class="container">
                <div class="header-data">
                    <div class="logo">
                        <a href="index.html" title=""><img src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" height="34" width="34"  alt=""></a>
                    </div><!--logo end-->
                    <div class="search-bar">
                        <form>
                            <input type="text" name="search" placeholder="Search...">
                            <button type="submit"><i class="la la-search"></i></button>
                        </form>
                    </div><!--search-bar end-->
                    <nav>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/teacher/home.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon1.png"/>" alt=""></span>
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/teacher/companies.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon2.png"/>" alt=""></span>
                                    Companies
                                </a>

                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/teacher/addEmptyProject.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon3.png"/>" alt=""></span>
                                    Projects
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/teacher/students.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon4.png"/>" alt=""></span>
                                    Students
                                </a>

                            </li>

                        </ul>
                    </nav><!--nav end-->
                    <div class="menu-btn">
                        <a href="#" title=""><i class="fa fa-bars"></i></a>
                    </div><!--menu-btn end-->
                    <div class="user-account">
                        <div class="user-info">
                            <img src="/images/${user.profilepic}" height="30" width="30" alt="">
                            <a href="#" title="">${user.username}</a>
                            <i class="la la-sort-down"></i>
                        </div>
                        <div class="user-account-settingss">
                            <h3>Online Status</h3>
                            <ul class="on-off-status">
                                <li>
                                    <div class="fgt-sec">
                                        <input type="radio" name="cc" id="c5">
                                        <label for="c5">
                                            <span></span>
                                        </label>
                                        <small>Online</small>
                                    </div>
                                </li>
                                <li>
                                    <div class="fgt-sec">
                                        <input type="radio" name="cc" id="c6">
                                        <label for="c6">
                                            <span></span>
                                        </label>
                                        <small>Offline</small>
                                    </div>
                                </li>
                            </ul>
                            <h3>Custom Status</h3>
                            <h3>Setting</h3>
                            <ul class="us-links">
                                <li><a href="${pageContext.request.contextPath}/teacher/set.htm" title="">Account Setting</a></li>
                                <li><a href="#" title="">Privacy</a></li>
                                <li><a href="#" title="">Faqs</a></li>
                                <li><a href="#" title="">Terms & Conditions</a></li>
                            </ul>
                            <h3 class="tc"><a href="${pageContext.request.contextPath}/user/logout.htm" title="">Logout</a></h3>
                        </div><!--user-account-settingss end-->
                    </div>
                </div><!--header-data end-->
            </div>
        </header>                               
    </body>
</html>