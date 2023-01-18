<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>A Secure Data Dynamics and Public Auditing Scheme for Cloud Storage</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

    <link rel="stylesheet" href="assets/css/templatemo-breezed.css">

    <link rel="stylesheet" href="assets/css/owl-carousel.css">

    <link rel="stylesheet" href="assets/css/lightbox.css">

    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->
    
    
    <jsp:include page="mainmenu.jsp"></jsp:include>

    <!-- ***** Main Banner Area Start ***** -->
   <section class="section" id="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="section-heading">
                        <h6>&nbsp;</h6>
                        <h2>Data Owner Login Form</h2>
                    </div>
                    <div class="subscribe-content">
                        <p>Select the data and encrypt it with symmetric key cryptography.</p>
                        <center>
                        <div class="subscribe-form">
                            <form action="./DOLoginCheck.jsp" method="POST" class="table-responsive" style="width:100%">
                                <table>
                                    
                                    <tr style="color: white;"><td></td>
                                        <td>Login ID</td>
                                        <td><input type="text" name="loginid" required="" pattern='[a-zA-Z]+'></td>
                                    </tr>
                                    <tr style="color: white;"><td></td>
                                        <td>Password</td>
                                        <td><input type="password" name="pswd" required="" pattern='(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}' title='Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters'></td>
                                    </tr>
                                    <tr>
                                        <td>
                                           
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td><td></td>
                                        <td><button type="submit" value="Register" class="main-button-icon">Login</button></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="form-group mt-3">
                                                <span>&nbsp;</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                         <%
                                String msg = request.getParameter("msg");
                                if (msg != null && msg.equalsIgnoreCase("success")) {
                                    out.println("<font color='WHITE'>Data owner Home </font>");
                                } else if (msg != null && msg.equalsIgnoreCase("failed")) {
                                    out.println("<font color='PINK'>Invalid LoginDetails</font>");
                                }

                            %>

                                    </tr>
                                </table>

                            </form
                                                        </p>

                        </div>
                            </center>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="left-text-content">
                        <p>Copyright &copy; 2020 Alex Co., Ltd. 
                        
                        - Design: <a rel="nofollow noopener" href="#">Alex Corporations</a></p>
                    </div>
                </div>
              
            </div>
        </div>
    </footer>
    

    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

  </body>
</html>