<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Main Page</title>
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

       

    </head>

    <body>

        <div class="wrapper">

            <header>
                <div class="container">
                    <div class="header-data">
                        <jsp:include page="companyNavBar.jsp" />
                    </div>
                </div>
            </header>

            <section class="cover-sec">
                <img src="/images/${st.coverpic}" height="400" width="1600"  alt="">
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
                                                <img src="/images/${st.profilepic}" height="170" width="170"   alt="">
                                            </div>
                                            <table style="width:100%">
                                                <tr>
                                                    <td><a href="${st.getGithub()}"><i class="fa fa-github"></i>  ${st.getGithub()}</a></td>
                                                </tr>
                                                <tr>
                                                    <td ><a href="${st.getLinkedin()}" ><i class="fa fa-linkedin"></i>  ${st.getLinkedin()}</a></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="main-ws-sec">
                                        <div class="user-tab-sec">
                                            <h3>${st.firstname} ${st.lastname}</h3>
                                            <div class="star-descp">
                                                <span>${st.title}</span>
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
                                                <h3><a href="#" title="" class="overview-open">Overview</a> <a href="#" title="" class="overview-open"></a>
                                                    <p>${st.getOverview()}</p>
                                            </div>

                                            <div class="user-profile-ov st2">
                                                <h3><a href="#" title="" class="exp-bx-open">Experience </a><a href="#" title="" class="exp-bx-open"></a></h3>
                                                        <c:forEach items="${st.studentExperienceCollection}" var="experience">
                                                    <h4>${experience.exprerience.title}<a href="#" title=""></a></h4>
                                                    <p>${experience.exprerience.summary}</p>
                                                </c:forEach>
                                            </div>


                                            <div class="user-profile-ov">
                                                <h3><a href="#" title="" class="ed-box-open">Education</a> <a href="#" title="" class="ed-box-open"></a> <a href="#" title="" class="ed-box-open2"></a></h3>
                                                        <c:forEach items="${st.studentEducationCollection}" var="education">
                                                    <h3>${education.education.university}</h3>
                                                    <h2>${education.education.degree}</h2>
                                                    <span>${education.education.startDate} to ${education.education.endDate}</span>
                                                    <p>${education.education.description}</p>
                                                </c:forEach>
                                            </div>

                                            <div class="user-profile-ov">
                                                <h3><a href="#" title="" class="skills-open">Skills</a> <a href="#" title="" class="skills-open"></a> <a href="#"></a></h3>
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