<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("login")==null){
	response.sendRedirect("login.jsp?pageinfo=advertise.jsp");
}else{
		String name=session.getAttribute("shopname").toString();
		String phone=session.getAttribute("phone").toString();
		String address=session.getAttribute("address").toString();
		String city=session.getAttribute("city").toString();
		String email=session.getAttribute("email").toString();
	
%>
<html>
<head>
  <title>
    Add Advertisement
  </title>
  <link rel="icon" type="image/gif" href="image/logo.png">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="js/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.choose_file{
  position:relative;
  display:inline-block;
  border-radius:8px;
  border:dashed 2px green;
  width:70px;
  height:70px;
  color: #7f7f7f;
  margin-top: 2px;

}
.choose_file input[type="file"]{
  -webkit-appearance:none;
  position:absolute;
  width:70px;
  height:70px;
  top:0;
  left:0;
  opacity:0;
  background-image: url();
  background-size: cover;
}
.glyphicon-plus{
color: green;
padding: 25px;
}

  article, aside, figure, footer, header, hgroup,
  menu, nav, section { display: block; }
</style>
</head>

<body>

  <div class="container" style="padding-top:10px;">
    <img src="logo.png" height="200px" width="500px" style="position : relative;" />
    <p style="padding-left:350px;position : absolute;top:165px;font-size : 15px;">Host your Advertisement here..</p>
      <form action="addadvertise" method="post" enctype="multipart/form-data">
        <div class="panel panel-default">
           <div class="panel-body">
             <div class="row">
               <div class="col-sm-5">
                  <label for="eventname"> Advertisement Name (OR Shop Name)<span class="req">*</span> </label>
                  <input type="text" class="form-control" name="advname" id="eventname" required data-validation-required-message="Please enter your Advertisement Name (OR Shop Name)."   autocomplete="off" />
                  <p class="help-block text-danger"></p>
                </div>
                <div class="col-sm-5 col-sm-offset-1">
                   <label for="eventname"> Owner Name <span class="req">*</span> </label>
                   <input type="text" class="form-control" name="ownname" id="ownname" required data-validation-required-message="Please enter your name."  value="<%=name %>" autocomplete="off" />
                   <p class="help-block text-danger"></p>
                 </div>
              </div>
              <div class="row">
                <div class="col-sm-5">
                   <label for="eventname"> Phone <span class="req">*</span> </label>
                   <input type="phone" class="form-control" name="phone" id="phone" required data-validation-required-message="Please enter your Phone number."  value="<%=phone %>"  autocomplete="off" />
                   <p class="help-block text-danger"></p>
                 </div>
                 <div class="col-sm-5 col-sm-offset-1">
                    <label for="eventname"> E-mail<span class="req">*</span> </label>
                    <input type="email" class="form-control" name="email" id="email" required data-validation-required-message="Please enter your email address." value="<%=email %>"  autocomplete="off" />
                    <p class="help-block text-danger"></p>
                  </div>
               </div>
               <div class="row">
                 <div class="col-sm-5 ">
                    <label for="eventname">info<span class="req">*</span> </label>
                    <textarea rows="5" class="form-control" name="advinfo" id="advinfo" required data-validation-required-message="Please enter your Information."   autocomplete="off" onpaste="return false" ></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                 <div class="col-sm-5 col-sm-offset-1">
                   <div class="row">
                     <div class="col-sm-12">
                    <label for="eventname"> Address <span class="req">*</span> </label>
                    <input type="text" class="form-control" name="address" id="address" required data-validation-required-message="Please enter your  address."  value="<%=address %>"autocomplete="off" />
                    <p class="help-block text-danger"></p>
                  </div>
                  </div>
                   <div class="row">
                     <div class="col-sm-12">
                    <label for="eventname"> City <span class="req">*</span> </label>
                    <input type="text" class="form-control" name="city" id="city" required data-validation-required-message="Please enter your city."  value="<%=city %>" name="place" autocomplete="off" />
                    <p class="help-block text-danger"></p>
                  </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-12">
                    <label>Add Social Links</label>
                    <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa-facebook-square" style="font-size:20px;color:blue;"></i></span>
                    <input type = "text" class = "form-control" name="fblink" placeholder = "Facebook Link">
                   </div>
                  </div>
                  </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-5">
                  <div class="form-group">
                  <div class = "input-group">
                   <span class = "input-group-addon"><i class="fa fa-instagram" style="font-size:20px;color:red;"></i></span>
                   <input type = "text" class = "form-control" name="instalink" placeholder = "Instagram Link">
                  </div>
                  </div>
                </div>

                <div class="col-sm-5 col-sm-offset-1">
                <div class="form-group">
                  <div class = "input-group">
                    <span class = "input-group-addon"><i class="fa fa fa-youtube-play" style="font-size:20px;color:red;"></i></span>
                    <input type = "text" class = "form-control" name="youtubelink" placeholder = "YouTube Link">
                   </div>
                   </div>
                </div>
                </div>
                <hr>
                <div class="row" style="padding-top:20px;" >
                  <div class="col-sm-10">
                    <label style="padding:10px;">Select Image For Advertisement </label>
                    <div class="choose_file">
                      <span id="file1" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f1" type="file" onchange="loadFile(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file2" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f2" type="file" onchange="loadFile1(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file3" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f3" type="file" onchange="loadFile2(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file4" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f4" type="file" onchange="loadFile3(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file5" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f5" type="file" onchange="loadFile4(event)"/>
                    </div>
                  </div>
                </div>
                
                <hr>
                <div class="row" style="padding-top:20px;" >
                  <div class="col-sm-10">
                    <label style="padding:10px;">Select Video For Advertisement </label>
                    <div class="choose_file">
                      <span id="video1" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="video" type="file" />
                    </div>
                    </div>
                    </div>
                <hr>
                
                <div class="row pull-right" style="padding-right:100px;">
                  <input type="submit" class="btn btn-primary " value="submit" ></input>
                </div>

           </div>
         </div>
      </form>
  </div>
</body>
<script>
function loadFile(event) {
      var out = URL.createObjectURL(event.target.files[0]);
      var d = document.getElementById('file1');
      d.style.backgroundImage = "url('"+out+"')";
      d.style.backgroundSize = "cover";
      d.style.borderRadius = "8px";
      };
      function loadFile1(event) {
        var out = URL.createObjectURL(event.target.files[0]);
        var d = document.getElementById('file2');
        d.style.backgroundImage = "url('"+out+"')";
        d.style.backgroundSize = "cover";
        d.style.borderRadius = "8px";
        };
        function loadFile2(event) {
          var out = URL.createObjectURL(event.target.files[0]);
          var d = document.getElementById('file3');
          d.style.backgroundImage = "url('"+out+"')";
          d.style.backgroundSize = "cover";
          d.style.borderRadius = "8px";
          };
          function loadFile3(event) {
            var out = URL.createObjectURL(event.target.files[0]);
            var d = document.getElementById('file4');
            d.style.backgroundImage = "url('"+out+"')";
            d.style.backgroundSize = "cover";
            d.style.borderRadius = "8px";
            };
            function loadFile4(event) {
                var out = URL.createObjectURL(event.target.files[0]);
                var d = document.getElementById('file5');
                d.style.backgroundImage = "url('"+out+"')";
                d.style.backgroundSize = "cover";
                d.style.borderRadius = "8px";
                };
</script>
</html>
<%}%>