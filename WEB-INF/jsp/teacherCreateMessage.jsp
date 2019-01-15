<%-- 
    Document   : createMessage
    Created on : Dec 19, 2018, 11:35:56 AM
    Author     : krocos
--%>

<%@page import="entities.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>New Message</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/animate.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/line-awesome-font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/webfiles/css/jquery.mCustomScrollbar.min.css"/> ">
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

            <section class="messages-page">
                <div class="container">
                    <div class="messages-sec">
                        <div class="row">
                            <div class="col-lg-4 col-md-12 no-pdd">
                                <div class="msgs-list">
                                    <div class="msg-title">
                                        <h3>Messages</h3>
                                        <ul>
                                            <li><a href="#" title=""><i class="fa fa-cog"></i></a></li>
                                            <li><a href="#" title=""><i class="fa fa-ellipsis-v"></i></a></li>
                                        </ul>
                                    </div><!--msg-title end-->
                                    <div class="messages-list">
                                        <ul>
                                            <li class="active">
                                                <div class="usr-msg-details">
                                                    <div class="usr-ms-img">
                                                        <img src="/images/${student.profilepic}" height="50" width="50" alt="">
                                                        <span class="msg-status"></span>
                                                    </div>
                                                    <div class="usr-mg-info">
                                                        <h3>${student.username}</h3>
                                                        <p>${student.title}</p>
                                                    </div><!--usr-mg-info end-->
                                                    <!--                                                    <span class="posted_time">1:55 PM</span>-->
                                                    <span class="msg-notifc">1</span>
                                                </div><!--usr-msg-details end-->
                                            </li>
                                        </ul>
                                    </div><!--messages-list end-->
                                </div><!--msgs-list end-->
                            </div>
                            <div class="col-lg-8 col-md-12 pd-right-none pd-left-none">
                                <div class="main-conversation-box">
                                    <div class="message-bar-head">
                                        <div class="usr-msg-details">
                                            <div class="usr-ms-img">
                                                <img src="/images/${user.profilepic}" height="50" width="50"  alt="">
                                            </div>
                                            <div class="usr-mg-info">
                                                <h3>${user.username}</h3>
                                                <p>Online</p>
                                            </div><!--usr-mg-info end-->
                                        </div>
                                        <a href="#" title=""><i class="fa fa-ellipsis-v"></i></a>
                                    </div><!--message-bar-head end-->
                                    <div class="messages-line">
                                        <c:set var = "teacherId" scope = "session" value = "${user.id}"/>
                                        <c:forEach items="${messages}" var="sendMsg">

                                            <c:if test= "${teacherId == sendMsg.senderId}">
                                                <div class="main-message-box ta-right">
                                                    <div class="message-dt">
                                                        <div class="message-inner-dt">
                                                            <p>${sendMsg.message.message}</p>
                                                        </div><!--message-inner-dt end-->
                                                        <span>${sendMsg.message.date}</span>
                                                    </div><!--message-dt end-->
                                                    <div class="messg-usr-img">                                                 
                                                        <img src="/images/${user.profilepic}" height="50" width="50" alt="">
                                                    </div><!--messg-usr-img end-->
                                                </div><!--main-message-box end-->
                                            </c:if>

                                            <c:if test= "${teacherId != sendMsg.senderId}">
                                                <div class="main-message-box st3">
                                                    <div class="message-dt st3">
                                                        <div class="message-inner-dt">
                                                            <p>${sendMsg.message.message}</p>
                                                        </div><!--message-inner-dt end-->
                                                        <span>${sendMsg.message.date}</span>
                                                    </div><!--message-dt end-->
                                                    <div class="messg-usr-img">
                                                        <img src="/images/${student.profilepic}" height="50" width="50" alt="">
                                                    </div><!--messg-usr-img end-->
                                                </div>
                                            </c:if>

                                        </c:forEach>

                                    </div><!--messages-line end-->
                                    <div class="message-send-area">
                                        <spring:form modelAttribute="message" action="${pageContext.request.contextPath}/teacher/sendMessage.htm" method="POST"> 
                                            <div class="mf-field">
                                                <spring:input path="message" type="text" placeholder="Type a message here"/>
                                                <spring:hidden path="toId" />
                                                <button type="submit">Send</button>
                                            </div>
                                            <ul>
                                                <li><a href="#" title=""><i class="fa fa-smile-o"></i></a></li>
                                                <li><a href="#" title=""><i class="fa fa-camera"></i></a></li>
                                                <li><a href="#" title=""><i class="fa fa-paperclip"></i></a></li>
                                            </ul>
                                        </spring:form>
                                    </div><!--message-send-area end-->
                                </div><!--main-conversation-box end-->
                            </div>

                        </div>
                    </div><!--messages-sec end-->
            </section>

        </div><!--messages-page end-->

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
                    <p><img src="images/copy-icon2.png" alt="">Copyright 2018</p>
                    <img class="fl-rgt" src="images/logo2.png" alt="">
                </div>
            </div>
        </footer>

    </div><!--theme-layout end-->

    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.mCustomScrollbar.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/scrollbar.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>

</body>
</html>