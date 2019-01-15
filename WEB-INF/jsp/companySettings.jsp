<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Settings</title>
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
                <div>
                    <jsp:include page="companyNavBar.jsp" />       
                </div>
            </header>

            <section class="profile-account-setting">
                <div class="container">
                    <div class="account-tabs-setting">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="acc-leftbar">
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <a class="nav-item nav-link active" id="nav-acc-tab" data-toggle="tab" href="#nav-acc" role="tab" aria-controls="nav-acc" aria-selected="true"><i class="la la-cogs"></i>Account Settings</a>
                                        <a class="nav-item nav-link" id="nav-password-tab" data-toggle="tab" href="#nav-password" role="tab" aria-controls="nav-password" aria-selected="false"><i class="fa fa-lock"></i>Change Password</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-acc" role="tabpanel" aria-labelledby="nav-acc-tab">
                                        <div class="acc-setting">
                                            <h3>Account Settings</h3>
                                            <form>
                                                <div class="notbar">
                                                    <h4>Notification Sound</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pretium nulla quis erat dapibus, varius hendrerit neque suscipit. Integer in ex euismod, posuere lectus id</p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="notbar">
                                                    <h4>Notification Email</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pretium nulla quis erat dapibus, varius hendrerit neque suscipit. Integer in ex euismod, posuere lectus id</p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="notbar">
                                                    <h4>Chat Message Sound</h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pretium nulla quis erat dapibus, varius hendrerit neque suscipit. Integer in ex euismod, posuere lectus id</p>
                                                    <div class="toggle-btn">
                                                        <a href="#" title=""><img src="<c:url value="/resources/webfiles/images/up-btn.png"/>" alt=""></a>
                                                    </div>
                                                </div>
                                                <div class="save-stngs">
                                                    <ul>
                                                        <li><button type="submit">Save Settings</button></li>
                                                        <li><button type="submit">Restore Settings</button></li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab">
                                        <div class="acc-setting">
                                            <h3>Profile Status</h3>
                                            <div class="profile-bx-details">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="profile-bx-info">
                                                            <div class="pro-bx">
                                                                <img src="<c:url value="/resources/webfiles/images/pro-icon1.png"/>" alt="">
                                                                <div class="bx-info">
                                                                    <h3>$5,145</h3>
                                                                    <h5>Total Income</h5>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="profile-bx-info">
                                                            <div class="pro-bx">
                                                                <img src="<c:url value="/resources/webfiles/images/pro-icon2.png"/>" alt="">
                                                                <div class="bx-info">
                                                                    <h3>$4,745</h3>
                                                                    <h5>Widthraw</h5>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="profile-bx-info">
                                                            <div class="pro-bx">
                                                                <img src="<c:url value="/resources/webfiles/images/pro-icon3.png"/>" alt="">
                                                                <div class="bx-info">
                                                                    <h3>$1,145</h3>
                                                                    <h5>Sent</h5>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="profile-bx-info">
                                                            <div class="pro-bx">
                                                                <img src="<c:url value="/resources/webfiles/images/pro-icon4.png"/>" alt="">
                                                                <div class="bx-info">
                                                                    <h3>130</h3>
                                                                    <h5>Total Projects</h5>
                                                                </div>
                                                            </div>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="pro-work-status">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-password" role="tabpanel" aria-labelledby="nav-password-tab">
                                        <div class="acc-setting">
                                            <h3>Account Settings</h3>
                                            <form>
                                                <div class="cp-field">
                                                    <h5>Old Password</h5>
                                                    <div class="cpp-fiel">
                                                        <input type="text" name="old-password" placeholder="Old Password">
                                                        <i class="fa fa-lock"></i>
                                                    </div>
                                                </div>
                                                <div class="cp-field">
                                                    <h5>New Password</h5>
                                                    <div class="cpp-fiel">
                                                        <input type="text" name="new-password" placeholder="New Password">
                                                        <i class="fa fa-lock"></i>
                                                    </div>
                                                </div>
                                                <div class="cp-field">
                                                    <h5>Repeat Password</h5>
                                                    <div class="cpp-fiel">
                                                        <input type="text" name="repeat-password" placeholder="Repeat Password">
                                                        <i class="fa fa-lock"></i>
                                                    </div>
                                                </div>
                                                <div class="cp-field">
                                                    <h5><a href="#" title="">Forgot Password?</a></h5>
                                                </div>
                                                <div class="save-stngs pd2">
                                                    <ul>
                                                        <li><button type="submit">Save Settings</button></li>
                                                        <li><button type="submit">Restore Settings</button></li>
                                                    </ul>
                                                </div><!--save-stngs end-->
                                            </form>
                                        </div><!--acc-setting end-->
                                    </div>
                                    <div class="tab-pane fade" id="nav-notification" role="tabpanel" aria-labelledby="nav-notification-tab">
                                        <div class="acc-setting">
                                            <h3>Notifications</h3>
                                            <div class="notifications-list">
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Poonam Verma</a> Bid on your Latest project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Tonney Dhman</a> Comment on your project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Poonam Verma </a> Bid on your Latest project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Tonney Dhman</a> Comment on your project</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                                <div class="notfication-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="notification-info">
                                                        <h3><a href="#" title="">Jassica William</a> Comment on your project.</h3>
                                                        <span>2 min ago</span>
                                                    </div><!--notification-info -->
                                                </div><!--notfication-details end-->
                                            </div><!--notifications-list end-->
                                        </div><!--acc-setting end-->
                                    </div>
                                    <div class="tab-pane fade" id="nav-requests" role="tabpanel" aria-labelledby="nav-requests-tab">
                                        <div class="acc-setting">
                                            <h3>Requests</h3>
                                            <div class="requests-list">
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>Jessica William</h3>
                                                        <span>Graphic Designer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>John Doe</h3>
                                                        <span>PHP Developer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>Poonam</h3>
                                                        <span>Wordpress Developer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>Bill Gates</h3>
                                                        <span>C & C++ Developer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>Jessica William</h3>
                                                        <span>Graphic Designer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                                <div class="request-details">
                                                    <div class="noty-user-img">
                                                        <img src="http://via.placeholder.com/35x35" alt="">
                                                    </div>
                                                    <div class="request-info">
                                                        <h3>John Doe</h3>
                                                        <span>PHP Developer</span>
                                                    </div>
                                                    <div class="accept-feat">
                                                        <ul>
                                                            <li><button type="submit" class="accept-req">Accept</button></li>
                                                            <li><button type="submit" class="close-req"><i class="la la-close"></i></button></li>
                                                        </ul>
                                                    </div><!--accept-feat end-->
                                                </div><!--request-detailse end-->
                                            </div><!--requests-list end-->
                                        </div><!--acc-setting end-->
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
                                                        <li><button type="submit">Save Settings</button></li>
                                                        <li><button type="submit">Restore Settings</button></li>
                                                    </ul>
                                                </div><!--save-stngs end-->
                                            </form>
                                        </div><!--acc-setting end-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--account-tabs-setting end-->
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
                        <p><img  src="<c:url value="/resources/webfiles/images/small-logo-cf.png"/>" height="30" width="30" alt="">Copyright 2018</p>
                        <img class="fl-rgt" src="images/logo2.png" alt="">
                    </div>
                </div>
            </footer><!--footer end-->

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