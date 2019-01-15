<%-- 
    Document   : adminindex
    Created on : Dec 8, 2018, 8:12:31 PM
    Author     : krocos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Navbar</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />
    </head>

    <body>

        <header>
            <div class="container">
                <div class="header-data">
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/admin/home.htm" title=""><img src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" height="30" width="30" alt=""></a>
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
                                <a href="${pageContext.request.contextPath}/admin/home.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon1.png"/>" alt=""></span>
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/companies.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon2.png"/>" alt=""></span>
                                    Companies
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/admin/companies.htm" title="">All Companies</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/addEmptyCompany.htm" title="">Add Company</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/students.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon4.png"/>" alt=""></span>
                                    Students
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/admin/students.htm" title="">All Students</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/teachers.htm" title="">
                                    <span><img src="<c:url value="/resources/webfiles/images/icon4.png"/>" alt=""></span>
                                    Teachers
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/admin/teachers.htm" title="">All Teachers</a></li>
                                    <li><a href="${pageContext.request.contextPath}/admin/addEmptyTeacher.htm" title="">Add Teacher</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <div class="menu-btn">
                        <a href="${pageContext.request.contextPath}/admin/home.htm" title=""><i class="fa fa-bars"></i></a>
                    </div>
                    <div class="user-account">
                        <div class="user-info">
                            <img src="/images/admin.jpg"  height="34" width="34" alt="">
                            <a href="" title="">${user.username}</a>
                            <i class="la la-sort-down"></i>
                        </div>
                        <div class="user-account-settingss">
                            <ul class="us-links">
                                <li><a href="#" title="">Privacy</a></li>
                                <li><a href="#" title="">Faqs</a></li>
                                <li><a href="#" title="">Terms & Conditions</a></li>
                            </ul>
                            <h3 class="tc"><a href="${pageContext.request.contextPath}/user/logout.htm" title="">Logout</a></h3>
                        </div>
                    </div>
                </div>
            </div>
        </header>

    </body>
</html>
