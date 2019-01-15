<%-- 
    Document   : registercompany
    Created on : Dec 8, 2018, 8:27:40 PM
    Author     : krocos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Company</title>
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

        <script>
            function checkPass()
            {
                var pass1 = document.getElementById('passwordsignup');
                var pass2 = document.getElementById('passwordsignup_confirm');
                var message = document.getElementById('confirmMessage');
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                if (pass1.value == pass2.value) {
                    pass2.style.backgroundColor = goodColor;
                    message.style.color = goodColor;
                    message.innerHTML = "Passwords Match!";
                    activateButton(terms);
                } else {
                    pass2.style.backgroundColor = badColor;
                    message.style.color = badColor;
                    message.innerHTML = "Passwords Do Not Match!";
                    disableSubmit();
                }

            }

            function disableSubmit() {
                document.getElementById("submit").disabled = true;
            }

            function activateButton(element) {
                if (element.checked) {
                    document.getElementById("submit").disabled = false;
                } else {
                    document.getElementById("submit").disabled = true;
                }
            }


        </script>

    </head>
    <body>
        <div class="wrapper">

            <header>
                <div>
                    <jsp:include page="adminnavbar.jsp" />       
                </div>
            </header>


            <section class="companies-info">
                <div class="container">
                    <div class="company-title">
                        <h3>Add Company</h3>
                    </div>
                    <div class="acc-setting">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <spring:form modelAttribute="company" action="${pageContext.request.contextPath}/admin/checkCompanyRegistration.htm" method="POST"> 

                                <div class="cp-field">
                                    <h5>								
                                        <spring:label path="name">Company name</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="name" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="e.g. Intrasoft" />
                                        <i class="fa fa-lock"></i>
                                        <div id="ajaxoutput"></div>
                                        <h6 style="color: red">
                                            <spring:errors path="name"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="email"> Company email</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="email" id="emailsignup" name="emailsignup" required="required" type="email" placeholder="e.g. info@intrasoft.com"/> 
                                        <i class="fa fa-lock"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="email"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="password">Company password</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">

                                        <spring:input path="password" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="e.g. X8df!90EO"/>
                                        <i class="fa fa-lock"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="password"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="passwordValidation">Please confirm your password </label></spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                            <i class="fa fa-lock"></i>
                                        <spring:input path="passwordValidation" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO" onkeyup="checkPass(); return false;"/>
                                        <i class="fa fa-lock"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="passwordValidation"/>
                                        </h6>
                                    </div>
                                </div>

                                <span id="confirmMessage" class="confirmMessage"></span>
                                <br>
                                <div class="checky-sec st2">
                                    <div class="fgt-sec">
                                        <input type="checkbox" name="cc" id="terms" onchange="activateButton(this)" /> 
                                        <label for="terms">
                                            <span></span>
                                        </label>
                                        <small>Yes, I understand and agree to the MNKN Terms & Conditions.</small>
                                    </div>
                                </div>
                                <div class="save-stngs pd2">
                                    <ul>
                                        <li><button type="submit" id="submit">Submit</button></li>
                                    </ul>
                                </div>
                            </spring:form>
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
