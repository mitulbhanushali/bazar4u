<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String url="";
		if(request.getParameter("pageinfo")==null){
		url="ordersummary.jsp?";
		if(request.getParameter("id")!=null){
			url=url+"id="+request.getParameter("id");
		}
		if(request.getParameter("sid")!=null){
			url=url+"&sid="+request.getParameter("sid");
		}
		}else{
			url=request.getParameter("pageinfo");
		}
%>
<html>
<head>
  <title>
    Login here
  </title>
  <link rel="icon" type="image/gif" href="image/logo.png">
  <meta name="viewport" content="width=device-widht, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
      <link rel="stylesheet" href="css/csshake.min.css" >
      <script src="js/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<style>
  .form-gap{
    padding-top: 70px;
  }
</style>
<body>
  <div class="container">
    <div class="form-gap"></div>

    <div class="row">
  		<div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-user fa-4x"></i></h3>
                  <div class="panel-body">

                    <!--Edit the form here to call and login add action java file-->
                    <form action="login"  method="post" >
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input class="form-control" type="email" name="email" id="email" placeholder="Enter e-mail Address" required data-validation-required-message="Please Enter e-mail" />
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                          <input class="form-control" type="password" name="password" id="password" placeholder="Enter Password" required />
                        </div>
                      </div>
                      <input type="hidden" name="pageinfo" value="<%=url%>">
                      <div class="form-group">
                        <input type="submit" class="btn btn-success" name="Login"  value="Login"/>
                      </div>
                      <div class="pull-left"><a href="signup.html" target="_blank">Sign Up</a></div>
                      <div class="pull-right"><a href="resetpassword.jsp" target="_blank">forgot password ?</a></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</body>
</html>
