<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>WorkWise Html Template</title>
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

        <script>
            $(document).ready(function () {
                $("#oldPass").blur(function () {
                    var text = $(this).val();
                    $.ajax({
                        url: "${pageContext.request.contextPath}/passCheckStudent.htm?oldPass=" + text + "&id=${user.id}",
                        contentType: "application/json",
                        success: function (result) {
                            $("#ajaxoutput").empty();
                            var jsonobj = $.parseJSON(result);

                            $.each(jsonobj, function (i, item) {
                                $tr = $('<tr>').append(
                                        $('<td>').text(item.message),
                                        );
                                $("#ajaxoutput").append($tr);
                                if ($("#ajaxoutput").text() === "passwords match!") {
                                    $("#ajaxoutput").css(({"color": "green"}));
                                } else {
                                    $("#ajaxoutput").css(({"color": "red"}));
                                }
                            });
                        }
                    });
                });
            });
        </script>

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

        </script>

    </head>

    <body>
        <div class="wrapper">

            <header>
                <div class="container">
                    <div class="header-data">
                        <jsp:include page="student_nav.jsp" />
                    </div>
                </div>
            </header>

            <section class="profile-account-setting">
                <div class="container">
                    <div class="account-tabs-setting">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="acc-leftbar">
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" role="tab" aria-controls="nav-acc" aria-selected="true"><i class="la la-cogs"></i>Account Setting</a>
                                        <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>Change Password</a>
                                        <a class="nav-item nav-link" id="security-login" data-toggle="tab" href="#security-login" role="tab" aria-controls="security-login" aria-selected="false"><i class="fa fa-user-secret"></i>Security and Login</a>
                                        <a class="nav-item nav-link" id="privacy" data-toggle="tab" href="#privacy" role="tab" aria-controls="privacy" aria-selected="false"><i class="fa fa-paw"></i>Privacy</a>
                                        <a class="nav-item nav-link" id="nav-deactivate-tab" data-toggle="tab" href="#nav-deactivate" role="tab" aria-controls="nav-deactivate" aria-selected="false"><i class="fa fa-random"></i>Deactivate Account</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
                                        <div class="acc-setting">
                                            <h3>Account Setting</h3>
                                            <form>
                                                <div class="notbar">
                                                    <h4>Notification Sound</h4>
                                                    <p>Turn or close sounds</p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="notbar">
                                                    <h4>Notification Email</h4>
                                                    <p>Turn email notifications </p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="notbar">
                                                    <h4>Chat Message Sound</h4>
                                                    <p>Chat message sounds enable/disable</p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="save-stngs">
                                                    <ul>
                                                        <li><button type="submit">Save Setting</button></li>
                                                        <li><button type="submit">Restore Setting</button></li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
                                        <div class="acc-setting">
                                            <h3>Change Pass</h3><div style="color: green">${msg}</div>
                                            <spring:form modelAttribute="updatepass" action="${pageContext.request.contextPath}/student/updatePassword.htm" method="POST"> 
                                                <div class="cp-field">
                                                    <h5> <spring:label path="oldPassword">Old password</spring:label></h5>
                                                        <div class="cpp-fiel">
                                                        <spring:input path="oldPassword" id="oldPass" name="oldPass" required="required" type="password" placeholder="Old Pass" />
                                                        <i class="fa fa-lock"></i>
                                                        <div id="ajaxoutput"></div>
                                                        <h6 style="color: red">

                                                        </h6>
                                                    </div>
                                                </div>
                                                <div class="cp-field">

                                                    <h5> <spring:label path="password">New password</spring:label></h5>
                                                        <div class="cpp-fiel">

                                                        <spring:input path="password" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="New Pass!"/>
                                                        <i class="fa fa-lock"></i>
                                                        <h6 style="color: red">
                                                            <spring:errors path="password"/>
                                                        </h6>
                                                    </div>
                                                </div>
                                                <div class="cp-field">

                                                    <h5> <spring:label path="passwordValidation">Repeat password</spring:label></h5>
                                                        <div class="cpp-fiel">
                                                        <spring:input path="passwordValidation" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO" onkeyup="checkPass(); return false;"/>
                                                        <i class="fa fa-lock"></i>
                                                        <h6 style="color: red">
                                                            <spring:errors path="passwordValidation"/>
                                                        </h6>
                                                    </div>
                                                </div>
                                                <div class="save-stngs pd2">
                                                    <ul>
                                                        <li><button type="submit" id="submit">Save Setting</button></li>
                                                    </ul>
                                                </div>
                                            </spring:form>
                                        </div>
                                    </div>


                                    <div class="tab-pane fade" id="nav-deactivate" role="tabpanel" aria-labelledby="nav-deactivate-tab">
                                        <div class="acc-setting">
                                            <h3>Deactivate Account</h3>
                                            <form>
                                                <div class="cp-field">
                                                    <h5>Email</h5>
                                                    <div class="cpp-fiel">
                                                        <input type="text" name="email" placeholder="Email">
                                                        <i class="fa fa-envelope"></i>
                                                    </div>
                                                </div>
                                                <div class="cp-field">
                                                    <h5>Password</h5>
                                                    <div class="cpp-fiel">
                                                        <input type="password" name="password" placeholder="Password">
                                                        <i class="fa fa-lock"></i>
                                                    </div>
                                                </div>
                                                <div class="cp-field">
                                                    <h5>Please Explain Further</h5>
                                                    <textarea></textarea>
                                                </div>
                                                <div class="cp-field">
                                                    <div class="fgt-sec">
                                                        <input type="checkbox" name="cc" id="c4">
                                                        <label for="c4">
                                                            <span></span>
                                                        </label>
                                                        <small>Email option out</small>
                                                    </div>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pretium nulla quis erat dapibus, varius hendrerit neque suscipit. Integer in ex euismod, posuere lectus id,</p>
                                                </div>
                                                <div class="save-stngs pd3">
                                                    <ul>
                                                        <li><button type="submit">Save Setting</button></li>
                                                        <li><button type="submit">Restore Setting</button></li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/jquery.mCustomScrollbar.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/lib/slick/slick.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/scrollbar.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/webfiles/js/script.js"/>"></script>


    </body>
</html>