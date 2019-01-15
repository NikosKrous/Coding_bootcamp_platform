<%-- 
    Document   : registertabactive
    Created on : 18 Δεκ 2018, 11:58:50 πμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>MNKN Official</title>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
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
    <body class="sign-in">


        <div class="wrapper">


            <div class="sign-in-page">
                <div class="signin-popup">
                    <div class="signin-pop">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="cmp-info">
                                    <div class="cm-logo">
                                        <img src="<c:url value="/resources/webfiles/images/code-fellows.png"/>" alt="">
                                        <p>MNKN, is a global freelancing platform and social networking where businesses and independent                                            professionals connect and collaborate remotely</p>
                                    </div>
                                    <img src="<c:url value="/resources/webfiles/images/cm-main-img.png"/>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="login-sec">
                                    <ul class="sign-control">
                                        <li data-tab="tab-1" ><a href="#" title="">Sign in</a></li>
                                        <li data-tab="tab-2" class="current"><a href="#" title="">Sign up</a></li>
                                    </ul>
                                    <div class="sign_in_sec " id="tab-1">
                                        <h3>Sign in</h3>
                                        <div class="signup-tab" id="signup-tab">
                                            <ul>
                                                <li data-tab="tab-3" class="current"><a href="#" title="">User</a></li>
                                                <li data-tab="tab-4"><a href="#" title="">Company</a></li>
                                            </ul>
                                        </div>
                                        <br>
                                        <div class="dff-tab current" id="tab-3">
                                            <form action="${pageContext.request.contextPath}/user/userSignIn.htm" method="POST">
                                                <div class="row">
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <input type="text" name="username" placeholder="Username" required="required">

                                                            <i class="la la-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <input type="password" name="password" placeholder="Password" required="required">
                                                            <i class="la la-lock"></i>
                                                        </div>
                                                    </div>
                                                    <div>${message}</div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="checky-sec">
                                                            <div class="fgt-sec">
                                                                <input type="checkbox" name="cc" id="c1" onchange="activateButton(this)" /> 
                                                                <label for="c1">
                                                                    <span></span>
                                                                </label>
                                                                <small>Remember me</small>
                                                            </div>
                                                            <a href="#" title="">Forgot Password?</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <button type="submit" value="submit">Sign in</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="dff-tab" id="tab-4">
                                            <form action="${pageContext.request.contextPath}/user/companySignIn.htm" method="POST">
                                                <div class="row">
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <input type="text" name="name" placeholder="Company Username" required="required">

                                                            <i class="la la-user"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="sn-field">
                                                            <input type="password" name="password" placeholder="Password" required="required">
                                                            <i class="la la-lock"></i>
                                                        </div>
                                                    </div>
                                                    <div>${message}</div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <div class="checky-sec">
                                                            <div class="fgt-sec">
                                                                <input type="checkbox" name="cc" id="c2" onchange="activateButton(this)">
                                                                <label for="c2">
                                                                    <span></span>
                                                                </label>
                                                                <small>Remember me</small>
                                                            </div>
                                                            <a href="#" title="">Forgot Password?</a>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 no-pdd">
                                                        <button type="submit" value="submit">Sign in</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                    <div class="sign_in_sec current" id="tab-2" >
                                        <spring:form modelAttribute="student" action="${pageContext.request.contextPath}/user/checkregistration.htm" method="POST"> 
                                            <div class="row">
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="username" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="takis7" />

                                                        <i class="la la-user"></i>

                                                    </div>
                                                    <div id="ajaxoutput"></div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="username"/>
                                                        <div>${msg}</div>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="firstname" id="firstnamesignup" name="firstnamesignup" required="required" type="text" placeholder="Firstname" />
                                                        <i class="la la-user"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="firstname"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="lastname" id="lastnamesignup" name="lastnamesignup" required="required" type="text" placeholder="Lastname" />

                                                        <i class="la la-user"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="lastname"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="email" id="emailsignup" name="emailsignup" required="required" type="email" placeholder="tsoukalas1925@gmail.com"/> 

                                                        <i class="la la-dropbox"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="email"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="dob" id="dob" name="dob" required="required" type="date" placeholder="2018-12-31"  max="2000-12-31" />

                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="dob"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="phone" id="phone" name="phone" required="required" type="tel" placeholder="6948083932" pattern="[6]{1}[9]{1}[0-9]{8}"
                                                                      oninvalid="this.setCustomValidity('Format: 6948274859')" oninput="this.setCustomValidity('')"/>

                                                        <i class="la la-phone"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="phone"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:select path="streamid" items="${streams}" itemLabel="stream" itemValue="id" />

                                                        <i class="la la-steam"></i>
                                                        <span><i class="fa fa-ellipsis-h"></i></span>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="streamid"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="password" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="Password: X8df!90EO"/>

                                                        <i class="la la-lock"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="password"/>
                                                    </h6>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="sn-field">
                                                        <spring:input path="passwordValidation" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="Repeat password: X8df!90EO" onkeyup="checkPass(); return false;"/>

                                                        <i class="la la-lock"></i>
                                                    </div>
                                                    <h6 style="color: red">
                                                        <spring:errors path="passwordValidation"/>
                                                    </h6>
                                                </div>
                                                <span id="confirmMessage" class="confirmMessage"></span>
                                                <br>
                                                <div class="col-lg-12 no-pdd">
                                                    <div class="checky-sec st2">
                                                        <div class="fgt-sec">
                                                            <input type="checkbox" name="cc" id="terms" onchange="activateButton(this)" /> 
                                                            <label for="terms">
                                                                <span></span>
                                                            </label>
                                                            <small>Yes, I understand and agree to the MNKN Terms & Conditions.</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 no-pdd">
                                                    <button id="submit" type="submit" value="submit">Get Started</button>
                                                </div>
                                            </div>
                                        </spring:form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="footy-sec">
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
                        <p><img src="images/copy-icon.png" alt="">Copyright 2018</p>
                    </div>
                </div>
            </div>


        </div>


        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/popper.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/bootstrap.min.js" />" ></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>


        <script type = "text/javascrfipt" src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
    </body>
</html>
