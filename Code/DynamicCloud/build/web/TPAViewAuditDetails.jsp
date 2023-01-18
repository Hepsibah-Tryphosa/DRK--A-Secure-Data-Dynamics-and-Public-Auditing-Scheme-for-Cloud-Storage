<%@page import="com.sddpa.db.DBConnections"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
    
    
    <jsp:include page="tpamenu.jsp"></jsp:include>

    <!-- ***** Main Banner Area Start ***** -->
   <section class="section" id="subscribe">
        <div class="container">
             <h2>View Audit Files informations</h2>
            <table border="2px" class="table table-hover table-dark">
                                <thead>
                                    <tr class="table-danger">
                                        <th scope="col">S.No</th>
                                        <th scope="col">Owner Name</th>
                                        <th scope="col">Email ID</th>
                                        <th scope="col">Public Key</th>
                                        <th scope="col">Filename</th>
                                        <th scope="col">MD5</th>
                                        <th scope="col">File ID</th>
                                        <th scope="col">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        PreparedStatement ps = null;
                                        ResultSet rs = null;
                                        int count = 0;
                                    try(Connection con = DBConnections.getDBConnection()){
                                        String sqlQuery = "select *from tpaaudit";
                                        ps = con.prepareStatement(sqlQuery);
                                        rs = ps.executeQuery();
                                        while(rs.next()){
                                        count++;
                                        int id = rs.getInt("id");
                                        
                                        %>
                                     <tr scope="row" style="color: BLUE; background-color:#FFFCBB">
                                        <td><%=count%></td>
                                        <td><%=rs.getString("ownername")%></td>
                                        <td><%=rs.getString("email")%></td>
                                        <td><%=rs.getString("publickey")%></td>
                                        <td><%=rs.getString("filename")%></td>
                                        <td><%=rs.getString("md5hash")%></td>
                                        <td><%=rs.getInt("fileid")%></td>
                                        <td><%=rs.getDate("auiditdate")%></td>
                                       
                                        
                                        

                                    </tr>

                                    <%
                                        
                                        }
                                        
                                        
                                    
                                    }catch(Exception ex){
                                    System.out.println("Error at Activating users "+ex.getMessage());
                                    }
                                    %>
                                    
                                                                      


                                </tbody>
                            </table>

            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="section-heading">
                        <h6>&nbsp;</h6>
                       
                    </div>
                    <div class="subscribe-content">
                        <p>
                           

                        </p>
                        <center>
                        <div class="subscribe-form">
                             
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