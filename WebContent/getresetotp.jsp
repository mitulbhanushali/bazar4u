<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>verification</title>
  <meta name="viewport" content="width=device-widht, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
      <link rel="stylesheet" href="css/csshake.min.css" >
      <script src="js/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" href="hstyle.css" >
</head>
<body>
<%
	if(session.getAttribute("otptry")==null || Integer.parseInt(session.getAttribute("otptry").toString())<3 ){


%>
<div class="outer-body container-fluid">
      <div class="header-text"><b>Validate OTP (One Time Password) </b></div>
      <hr>
        <p>
          A One Time passcode has been sent to <b> Customer Email </b>
        </p>
        <p>
          Please enter the OTP below to verify your Email Address. If you
          cannot see the email from <code><b> bazar4uonly@gmail.com </b></code> in your
          inbox, make sure to check your SPAM folder
        </p>
        <form action="checkresetotp" method="post">
          <div class="form-group">
            <input class="form-group" type="text" name="otp" required data-validation-required-message="Please enter your OTP" autocomplete="off">
          </div>
          <div class="pull-left margin-but">
            <input class="btn btn-primary" type="submit" value="next">
          </div>

<% }else{
	response.sendRedirect("newhomepage.jsp");
}
%>
</form>
</div>
</body>
</html>
