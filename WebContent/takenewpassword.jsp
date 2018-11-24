<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>New Password</title>
      <meta name="viewport" content="width=device-widht, initial-scale=1">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
          <link rel="stylesheet" href="css/csshake.min.css" >
          <script src="js/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
          <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
function checksignup(){



	var fpass=document.getElementById("newpassword").value;
	var spass=document.getElementById("newpassword1").value;

	if(fpass!=spass){
		alert("both password should match");
		return false;
	}
	if(fpass.length<8 || fpass.length>12){
		alert("password length should between 8 to 12");
		return false;
	}
	return true;
}

</script>
<style>
.form-gap{
padding-top:70px;
}
</style>
</head>
<body>
<%
		if(session.getAttribute("changepassword")==null){
			response.sendRedirect("newhomepage.jsp");
		}else{
	if(session.getAttribute("changepassword").toString().equals("true")){
	%>
	<div class="form-gap"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="text-center">
              		<form onsubmit="return checksignup();" action="updatepassword" method="post">
              		<div class="form-group">
                    <div class="input-group">
              		     <input class="forn-group" placeholder="Enter New Password" type="password" name="newpassword" id="newpassword" /></br>
                    </div>
                    </div>
              		  <div class="form-group">
              		  <div class="input-group">
              	       <input class="form-group" placeholder="Re-Enter Password" type="password" name="newpassword1"  id="newpassword1"/></br>
                    </div>
                    </div>
                    <div class="form-group">
              	       <input class="btn btn-lg btn-primary btn-block" type="submit" value="Reset">
                    </div>
              	</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	<%}else{
		response.sendRedirect("newhomepage.jsp");
	}
		}
%>

</body>
</html>
