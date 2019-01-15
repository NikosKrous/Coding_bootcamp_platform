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
        <title>Add Teacher</title>
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
        <script>
            $(document).ready(function () {
                $("#usernamesignup").blur(function () {
                    var text = $(this).val();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/ajax.htm?userInput=" + text,
                        contentType: "application/json",
                        success: function (result) {
                            $("#ajaxoutput").empty();
                            var jsonobj = $.parseJSON(result);
                            $.each(jsonobj, function (i, item) {
                                $tr = $('<tr>').append(
                                        $('<td>').text(item.message),
                                        );
                                $("#ajaxoutput").append($tr);
                                if ($("#ajaxoutput").text() === "username already exists!") {
                                    $("#ajaxoutput").css(({"color": "red"}));
                                } else {
                                    $("#ajaxoutput").empty();
                                }
                            });
                        }
                    });
                });
            });
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
                        <h3>Add Teacher</h3>
                    </div>

                    <div class="acc-setting">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <spring:form modelAttribute="teacher" action="${pageContext.request.contextPath}/admin/checkTeacherRegistration.htm" method="POST"> 

                                <div class="cp-field">
                                    <h5>								
                                        <spring:label path="username">Username</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="username" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="e.g. paspa19" />
                                        <i class="la la-user"></i>
                                        <div id="ajaxoutput"></div>
                                        <h6 style="color: red">
                                            <spring:errors path="username"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="firstname">Firstname</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="firstname" id="firstnamesignup" name="firstnamesignup" required="required" type="text" placeholder="e.g. Nikos"/> 
                                        <i class="la la-user"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="firstname"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="lastname">Lastname</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="lastname" id="lastnamesignup" name="lastnamesignup" required="required" type="text" placeholder="Delavegkas"/>
                                        <i class="la la-user"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="lastname"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="email">Email</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="email" id="emailsignup" name="emailsignup" required="required" type="email" placeholder="paspa@hotmail.com"/>
                                        <i class="la la-dropbox"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="email"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="phone">Phone</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="phone" id="phone" name="phone" required="required" type="tel" placeholder="6948083932" pattern="[6]{1}[9]{1}[0-9]{8}"
                                                      oninvalid="this.setCustomValidity('Format: 6948274859')" oninput="this.setCustomValidity('')"/> 
                                        <i class="la la-phone"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="phone"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="dob">Date of Birth</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">
                                        <spring:input path="dob" id="dob" name="dob" required="required" type="date" placeholder="2018-12-31" max="2000-12-31" />
                                        <i class="fa fa-calendar"></i>
                                        <h6 style="color: red">
                                            <spring:errors path="dob"/>
                                        </h6>
                                    </div>
                                </div>

                                <div class="col-lg-12 no-pdd">
                                    <div class="cp-field">
                                        <h5>
                                            <spring:label path="streamId">Stream</spring:label>
                                            </h5>
                                            <div class="cpp-fiel">
                                            <spring:select path="streamId" items="${streams}" itemLabel="stream" itemValue="id" />
                                            <h6 style="color: red">
                                                <spring:errors path="streamId"/>
                                            </h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="cp-field">
                                    <h5>
                                        <spring:label path="password">Password</spring:label>
                                        </h5>
                                        <div class="cpp-fiel">

                                        <spring:input path="password" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="paspa123!"/>
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
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>
    </body>
</html>

