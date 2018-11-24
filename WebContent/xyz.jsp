<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"> 
    <link rel="stylesheet" href="aboutus.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <link rel="stylesheet" href="css/csshake.min.css" >
            <script src="js/jquery.min.js"></script>
             <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="loader.css">
            <link rel="stylesheet" href="hstyle.css" >
            <link rel="stylesheet" href="card.css" >
            
            
             <!-- <link rel="stylesheet" href="sear.css"> -->
             <link rel="stylesheet" href="sweetalert.css">
             <script src="sweetalert.js"></script>
             <link rel="stylesheet" href="side-nav.css" >
              <link rel="stylesheet" href="footer.css" >
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
              <script src="side-nav.js"></script>
    
<style>
.fa {
  padding: 10px;
  font-size: 20px;
  width: 40px;
  text-align: center;
  text-decoration: none;
  margin: 5px 2px;
  border-radius: 50%;
}

.fa:hover {
    opacity: 0.7;
}

.fa-facebook {
  background: #3B5998;
  color: white;
}

.fa-google {
  background: #dd4b39;
  color: white;
}

.fa-linkedin {
  background: #007bb5;
  color: white;
}

.fa-instagram {
  background: #125688;
  color: white;
}
</style>
    
    <script> function loading(){
			alert("working");

        }</script>
</head>
<body onload="loading();">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="http://bazar4u.in">Bazar4u</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="http://bazar4u.in">About Us !
                        <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="jointeam.html">Join Team</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<% 
Cookie cookie = null;
Cookie[] cookies = null;

// Get an array of Cookies associated with the this domain

cookies = request.getCookies();
int ckscount=0;
String city="";
if( cookies != null ) {
   out.println("cookies");
   
	
}else{out.println("not cookies");}%>
<div class="container fpad">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="my-4">Our Team</h2>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
            <img class="rounded-circle img-fluid d-block mx-auto" src="yashpic1.jpg" alt="">
            <h3>Yash Patel
                <small>Developer</small>
            </h3>
            <p>Brain behind the client browser!!!!</p>
            <a href="https://www.facebook.com/patel.yash.87" class="fa fa-facebook" target="_blank"></a>
<a href="https://plus.google.com/+yashPatel12" class="fa fa-google" target="_blank"></a>
<a href="www.linkedin.com/in/yash-12" class="fa fa-linkedin" target="_blank"></a>
<a href="https://www.instagram.com/yash_12/" class="fa fa-instagram" target="_blank"></a>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
            <img class="rounded-circle img-fluid d-block mx-auto" src="mypic.jpg" alt="">
            <h3>Mitul Bhanushali
                <small>Developer</small>
            </h3>
            <p>Brain behind the server!!!!</p>
            <a href="https://www.facebook.com/mitul.bhanushali.9" class="fa fa-facebook" target="_blank"></a>
<a href="https://plus.google.com/+MitulBhanushali88" class="fa fa-google" target="_blank"></a>
<a href="https://www.linkedin.com/in/mitul-bhanushali-11ab06b4/" class="fa fa-linkedin" target="_blank"></a>
<a href="https://www.instagram.com/mitzz_bhanushali/" class="fa fa-instagram" target="_blank"></a>
<a href="https://www.quora.com/profile/Mitul-Bhanushali-1" class="fa fa-quora" target="_blank"></a>
        </div>
    </div>
</div>

<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Bazar4u.in 2017</p>
    </div>
    <!-- /.container -->
</footer>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>
