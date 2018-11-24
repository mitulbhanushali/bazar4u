<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* , java.io.*,com.mitul.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	if(request.getParameter("id")==null){ 
		response.sendRedirect("newhomepage.jsp");
	}else{

%>
<html>
<head>
    <title>
        Adervetisment
    </title>
    <meta name="viewport" content="width=device-widht, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="css/csshake.min.css">
    <script src="js/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="hstyle1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>

    .product-img{
        height: 30%;
    }
    .main-cont{
        padding-top: 12px auto;
    }
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

    .fa-youtube-play {
        background: #dd4b39;
        color: white;
    }


    .fa-instagram {
        background: #125688;
        color: white;
    }
 .product-img{
	width:100%;
    height:100%;
    overflow:hidden;
}
.product-img img{
	flex-shrink:0;
    -webkit-flex-shrink: 0;
    max-width:100%;
    max-height:100%;
}
    #map {
        height: 300px;
        width: 100%;
     }

    </style>
    <script>
    function detectmob() { 
   	 if( navigator.userAgent.match(/Android/i)
   	 || navigator.userAgent.match(/webOS/i)
   	 || navigator.userAgent.match(/iPhone/i)
   	 || navigator.userAgent.match(/iPad/i)
   	 || navigator.userAgent.match(/iPod/i)
   	 || navigator.userAgent.match(/BlackBerry/i)
   	 || navigator.userAgent.match(/Windows Phone/i)
   	 ){
       	 
       	 document.getElementById("primg1").setAttribute("style", "width:100%;  height:50%;overflow:hidden;");
       	 document.getElementById("primg2").setAttribute("style", "width:100%;  height:50%;overflow:hidden;");
       	 document.getElementById("primg3").setAttribute("style", "width:100%;  height:50%;overflow:hidden;");
       	 document.getElementById("primg4").setAttribute("style", "width:100%;  height:50%;overflow:hidden;");
       	document.getElementById("primg5").setAttribute("style", "width:100%;  height:50%;overflow:hidden;");
   	  }
   	 else {
       	
   	    document.getElementById("primg1").setAttribute("style", "width:100%;  height:400px;overflow:hidden;");
   	    document.getElementById("primg2").setAttribute("style", "width:100%;  height:400px;overflow:hidden;");
   	    document.getElementById("primg3").setAttribute("style", "width:100%;  height:400px;overflow:hidden;");
   	    document.getElementById("primg4").setAttribute("style", "width:100%;  height:400px;overflow:hidden;");
   	 	document.getElementById("primg5").setAttribute("style", "width:100%;  height:400px;overflow:hidden;");
   	  }
   	}

    </script>
</head>
<body style="background-color:#f9f9f7;">
<%
		String resource="retriveadvimages.jsp?id=";
		int adv_id=Integer.parseInt(request.getParameter("id"));
		Connection con=connection.connect();
		PreparedStatement pst=con.prepareStatement("select * from advertise where adv_id=?");
		pst.setInt(1, adv_id);
		ResultSet rs=pst.executeQuery();
		if(!rs.next()){
			response.sendRedirect("newhomepage.jsp");
		}else{
			
		

%>
<div class="container">
<h2><%=rs.getString("advname") %></h2>
</div>
<div class="container" style="top : 70px;">
    <div id="myimg5" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myimg5" data-slide-to="0" class="active"></li>
            <li data-target="#myimg5" data-slide-to="1"></li>
            <li data-target="#myimg5" data-slide-to="2"></li>
            <li data-target="#myimg5" data-slide-to="3"></li>
            <li data-target="#myimg5" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active product-img">
                <img width="100%" id="primg1" src="<%=resource+adv_id %>" onerror="this.src='<%=resource+adv_id %>'">
            </div>

            <div class="item product-img">
                <img width="100%" id="primg2" src="<%=resource+adv_id+"&num=2" %>" onerror="this.src='<%=resource+adv_id %>'">
            </div>

            <div class="item product-img">
                <img width="100%"  id="primg3" src="<%=resource+adv_id+"&num=3" %>" onerror="this.src='<%=resource+adv_id %>'">
            </div>
            <div class="item product-img">
                <img width="100%"  id="primg4" src="<%=resource+adv_id+"&num=4" %>" onerror="this.src='<%=resource+adv_id %>'">
            </div>
            <div class="item product-img">
                <img width="100%" id="primg5" src="<%=resource+adv_id+"&num=5" %>" onerror="this.src='<%=resource+adv_id %>'">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myimg5" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myimg5" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
	<script type="text/javascript">detectmob();</script>
</div>
<div class="container" style="padding-top : 15px;">
 <b>info : </b><p style="display: inline;"> <%=rs.getString("info") %></p>
</div>
<div class="container" style="padding-top:10px;">
    <div class="row">
        
        <div class="col-md-6">
            <table class="table">
                <tr>
                    <th>Owner Name :</th>
                    <td> <%=rs.getString("name") %></td>
                </tr>
                <tr>
                    <th>Phone :</th>
                    <td> <%=rs.getString("phone") %></td>

                </tr>
                <tr>
                    <th>Address :</th>
                    <td><%=rs.getString("address") %></td>
                </tr>
                <tr>
                    <td colspan="2">
                        
           	 <%if(rs.getString("fblink")!=null && !(rs.getString("fblink").equals("null"))  && !(rs.getString("fblink").equals(""))){ %>
             <a href="<%=rs.getString("fblink") %>" class="fa fa-facebook" target="_blank"></a>
             <%}if(rs.getString("instalink")!=null && !(rs.getString("instalink").equals("null")) && !(rs.getString("instalink").equals(""))){  %>
             <a href="<%=rs.getString("instalink") %>" class="fa fa-instagram" target="_blank"></a>
             <%} if(rs.getString("youtubelink")!=null && !(rs.getString("youtubelink").equals("null")) && !(rs.getString("youtubelink").equals(""))){%>
             <a href="<%=rs.getString("youtubelink") %>" class="fa fa-youtube-play" target="_blank"></a>
             <%} %>
                        &nbsp;
                        
                    </td>
                </tr>
            </table>         
        </div>
        
        <div class="col-md-6">
            <div id="map">
            	<%if(rs.getBytes("video")!=null ){%>
				<video width="100%" height="300px" controls autoplay>
 				 <source src="<%="retrivevideo.jsp?id="+adv_id %>" type="video/mp4">
				
				</video>
				<%} %>
            
            </div>
           
        </div>
</div>
        
    </div>
    

</body>
</html>
<%}} %>
