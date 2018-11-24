<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.io.*, com.mitul.*" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
Cookie cookie = null;
Cookie[] cookies = null;

// Get an array of Cookies associated with the this domain

cookies = request.getCookies();
int ckscount=0;
String city="";
if( cookies != null ) {
   
   for (int i = 0; i < cookies.length; i++) {
      cookie = cookies[i];
      
      if((cookie.getName( )).compareTo("city") == 0 ) {

    	  city=cookie.getValue();
    	 ckscount++;
      }
   }
	if(ckscount==0){
	
	response.sendRedirect("index.jsp");
}else{%>

<html lang="en-US">
    <head>
    	<title>Bazar4u - Explore city products</title>
    	<link rel="icon" type="image/gif" href="image/logo.png">
	<meta charset="utf-8">
	 <meta name="description" content="Buy & sell anything online and create your own customize shop or advertisement that boost your business">
   	 <meta name="keywords" content="bazar4u,bazar,bazaar,market,online shop,online market,product selling,digital bazar,online shop,digitalshop,<%=city+" bazar4u"%>,<%="bazar4u "+city%>">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
            <link rel="stylesheet" href="css/csshake.min.css" >
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
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
            <style type="text/css">
            


.btn{
	border-radius:0px;
}
.infoshort{
	
	text-overflow:ellipsis;
	white-space:nowrap;
	display:block;
	overflow:hidden;
	width:10em;
}
  .infoshort1{
	
	text-overflow:ellipsis;
	white-space:nowrap;
	display:block;
	overflow:hidden;
	width:7em;
}
.navbar-brand1
{
    position: absolute;
    width: 100%;
    left: 0;
    text-align: center;
    margin:0 auto;
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
.btn-nav{

border-radius: 5px;

}
            </style>
            
    <script type="text/javascript">

    var cat=false;
    
    $(document).ready(function () {
       
if(window.location.href.indexOf("suc") > -1) { // The return type will be in integer..
	
	if(window.location.href.indexOf("login") > -1){
						//alert("login");
		swal('Good job!', 'Login Successfully', 'success');
	}
	else if(window.location.href.indexOf("=order") > -1){
		//alert("okay");
		swal('Done !', 'Your oreder has been place !', 'success');
		deleteAllCookies();
	}
	else if(window.location.href.indexOf("=sign") > -1){
		swal('Done !', 'Your Account Created !', 'success');
	}
   
}else if (window.location.href.indexOf("err") > -1){  //this will be display when err is found in url
		
	if(window.location.href.indexOf("=login") > -1){
		swal({
		  title: "Try Again !",
		  text: "Error While Login..!",
		  imageUrl: 'warning.jpg'
		});
	}
	else if(window.location.href.indexOf("=order") > -1){
		swal({
		  title: "Order Cancled",
		  text: "Problem While Placing your order !",
		  imageUrl: 'cancel.jpg'
		});
	}
	else if(window.location.href.indexOf("=sign") > -1){
		swal({
		  title: "Try Again !",
		  text: "Error while creating your Account !",
		  imageUrl: 'erruser.jpg'
		});
	}
	else if(window.location.href.indexOf("=exsign") > -1){
		swal({
		  title: "Try Again !",
		  text: "User Already Exist !!!",
		  imageUrl: 'erruser.jpg'
		});
	}
}
});

    
    var imageurl="retriveimage.jsp?id=";
	var popid=0;
	var xid=0;
	var cookiecounter=0;
	var mob=true;

	function loading(){

		 document.getElementById("loader").style.display = "none";
	}
	function startloading(){
		document.getElementById('hola').style.display = "block";
		}
	startloading();
	function stoploading(){
        document.getElementById('hola').style.display = "none";
    }

	function clic(nam){
	//var name=val;
		document.location.href="buynow.jsp?id="+nam;
		
			
		}
	function nextpage(co,ls){
		
		co=co+1;
		if((ls/12)>=co){
		
		document.location.href="newhomepage.jsp?pagecount="+co;
		}else{
			document.location.href="newhomepage.jsp?pagecount=0";

			}
		}

    function toggle(id){
            var e = document.getElementById(id);
            if(e.style.display == 'block'){
                e.style.display = 'none';
            }else{
                e.style.display = 'block';
            }
        }

        function popvalu(id,price,name1,discount,discription,seller){
		//document.write(id+""+price+""+name1);
			popid=id;
			var fprice=price-(price*discount)/100;
			document.getElementById("peraprice").innerHTML=price;
			document.getElementById("peraimage1").src="retriveimage.jsp?id="+id+"&num=1";
			document.getElementById("peraimage2").src="retriveimage.jsp?id="+id+"&num=2";
			document.getElementById("peraimage3").src="retriveimage.jsp?id="+id+"&num=3";
			document.getElementById("peraimage4").src="retriveimage.jsp?id="+id+"&num=4";
			document.getElementById("peraname").innerHTML=name1;
			document.getElementById("peraofferprice").innerHTML=fprice+" ("+discount+"%)";
			document.getElementById("peradiscription").innerHTML=discription;

			var request=new XMLHttpRequest();
			request.open('GET','checkuser?id='+id);
			request.onload=function(){
				var Data=JSON.parse(request.responseText);
				
				if(Data[0].shop=="yes"){
					document.getElementById("linkname").innerHTML="Seller:- "+seller;
					document.getElementById("peralink").href="shopproducts.jsp?pagecount=0&id="+Data[0].id;
				}else{
					document.getElementById("peralink").href="#";
					document.getElementById("linkname").innerHTML="Seller:- "+seller;
				}

				};
			request.send();
			var request1=new XMLHttpRequest();
			request1.open('GET','hitcounter?id='+id+"&type=product");
			request1.send();
				
        }

    	function pagebuy(){

    		document.location.href="checkout.jsp?id="+popid+",";

        	}
    	function callsetiteam(){
    		setiteams(popid);

        	}

		      function buynow(id){

					window.location.href="checkout.jsp?id="+id+",";

			}
			  function checksession(){
			
					var session="";
					session='<%=session.getAttribute("login")%>';
					if(session.localeCompare('true')==0){
						document.location.href="userprofile.jsp";
					}else{
						//return;
						//alert("sec");
						//document.getElementById("sign-pop").style.display='block';
						$('#sign-pop').modal('show');
					}
				}	
			

			function setiteams(id){
				//alert("hello");
				//cookiecounter=cookiecounter+1;
				var now=new Date();
				var time=now.getTime();
				var exptime=time+24*3600*7*1000;
				now.setTime(exptime);
				document.cookie=id+"="+id+";expires="+now.toUTCString()+";";
				$( "#baskicon" ).effect( "shake" );
				var allcookie=document.cookie;
				var arrcookie=allcookie.split(';');
				var counter=0;
				for(var i=0;i<arrcookie.length;i++){
					
					var value=arrcookie[i].split('=')[1];
					
						if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
							
						}else{
							counter=counter+1;
						}
						
				}
				document.getElementById("cartcounter").innerHTML=counter;
				/*var allcookies=document.cookie;
				var arrcookie=allcookies.split(';');
				alert(arrcookie[0].split('=')[1]);*/
					
				}
			function checkbasket(){
					
				var allcookie=document.cookie;
				var arrcookie=allcookie.split(';');
				var url="checkout.jsp?id=";
				//alert(arrcookie.length);
				var counter=0;
				
				for(var j=0;j<arrcookie.length;j++){
					
					var temp1=arrcookie[j].split('=')[1];
					
						if(temp1.localeCompare("")==0 || isNaN(temp1) || temp1=='0'){
							
						}else{
							
							counter=counter+1;
						}
				}
				
				if(counter>=1){
						for(var i=0;i<arrcookie.length;i++){
							
							var value=arrcookie[i].split('=')[1];
								if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
									
								}else{
									url=url+value+",";
								}
								
						}
						var temp=url.split("checkout.jsp?id=")[1];
						
						if(temp.localeCompare("")==0 ){
							//alert("basket is empty nothing for checkout!!!!!!!!");	
							swal('sorry !','Your Basket is empty ','warning');
							}else{
								
								document.location.href=url;
								
						}
						
				   }else{
						//alert("basket is empty nothing for checkout!!!!!!!!");
						swal('sorry !','Your Basket is empty ','warning');
					 }


				}
			function setdropdown(item){

				
				var mySelect = document.getElementById('filter');
				
				for(var i, j = 0; i = mySelect.options[j]; j++) {
				    if(i.value == item) {
					   
				        mySelect.selectedIndex = j;
				        break;
				    }
				}
				}

			function shake(){

					document.getElementById("basket").focus();

				}

			function search(){

				document.location.href="https://bazar4u.in/newhomepage.jsp?pagecount=0&qry="+document.getElementById("search").value;

			}
			function seticon(){
				
				var allcookie=document.cookie;
				var arrcookie=allcookie.split(';');
				var counter=0;
				for(var i=0;i<arrcookie.length;i++){
					
					var value=arrcookie[i].split('=')[1];
					
						if(value.localeCompare("")==0 || isNaN(value) || value=='0'){
							
						}else{
							counter=counter+1;
						}
						
				}
				document.getElementById("cartcounter").innerHTML=counter;

	
			}
				function filter(val){
					document.location.href="newhomepage.jsp?pagecount=0&fil="+val;

				}
			

    	window.onkeydown = function( event ) {
    	    if ( event.keyCode == 27 ) {
    	      document.getElementById("popup_box").style.display='none';
    	    }
    	};
    	function usertype(val){
            var element = document.getElementById('shopopt');
            //alert(val);
            if(val=='shop'){
               
                cat=true;
              element.style.display='block';
            }else{
			
                cat=false;
                
              element.style.display='none';
            }
           }
        function checksignup(){

       
				var fpass=document.getElementById("password").value;
				var spass=document.getElementById("repassword").value;
				var phone=document.getElementById("phone").value;
				var pincode=document.getElementById("pincode").value;
				var shopname=document.getElementById("shopname").value;
				var PHONE_REGEXP = /^[789]\d{9}$/;
				var pincode_regexp= /^([3])([6-9])([0-9]){4}$/;
				/*if(phone.charAt(0)!='9' || phone.charAt(0)=='8' || phone.charAt(0)=='7' || phone.length!=10){
							alert("phone number is not valid");
							return false;
					}*/
				if(!PHONE_REGEXP.test(phone)){

					alert("phone number is not valid");
					return false;
				}
					
				if(!fpass==spass){
					alert("both password should match");
					return false;
				}
				if(!pincode_regexp.test(pincode)){

					alert("pincode invalid");
					return false;
				}
				if(cat){
					
						var catval=document.getElementById('category').value;
						if(catval=='select'){
								alert("plz select category");
								return false;
						}
						if(shopname=='' || shopname==' ' ){

								alert('plz provide shopname');
								return false;
						}

				}else{
					
						return true;

				}
				
			
				return true;

            }
        function detectmob() { 
        	 if( navigator.userAgent.match(/Android/i)
        	 || navigator.userAgent.match(/webOS/i)
        	 || navigator.userAgent.match(/iPhone/i)
        	 || navigator.userAgent.match(/iPad/i)
        	 || navigator.userAgent.match(/iPod/i)
        	 || navigator.userAgent.match(/BlackBerry/i)
        	 || navigator.userAgent.match(/Windows Phone/i)
        	 ){
            	 
            	 document.getElementById("primg1").setAttribute("style", "width:100%;  height:100%;overflow:hidden;");
            	 document.getElementById("primg2").setAttribute("style", "width:100%;  height:100%;overflow:hidden;");
            	 document.getElementById("primg3").setAttribute("style", "width:100%;  height:100%;overflow:hidden;");
            	 document.getElementById("primg4").setAttribute("style", "width:100%;  height:100%;overflow:hidden;");
        	  }
        	 else {
            	
        	    document.getElementById("primg1").setAttribute("style", "width:100%;  height:350px;overflow:hidden;");
        	    document.getElementById("primg2").setAttribute("style", "width:100%;  height:350px;overflow:hidden;");
        	    document.getElementById("primg3").setAttribute("style", "width:100%;  height:350px;overflow:hidden;");
        	    document.getElementById("primg4").setAttribute("style", "width:100%;  height:350px;overflow:hidden;");
        	  }
        	}

        $(document).ready(function(){
            $('#search').on("click",(function(e){
            $(".form-group").addClass("sb-search-open");
              e.stopPropagation()
            }));
             $(document).on("click", function(e) {
              if ($(e.target).is("#search") === false && $(".form-control").val().length == 0) {
                $(".form-group").removeClass("sb-search-open");
              }
            });
              $(".form-control-submit").click(function(e){
                $(".form-control").each(function(){
                  if($(".form-control").val().length == 0){
                    e.preventDefault();
                    $(this).css('border', '2px solid red');
                  }
              })
            })
            })
            
           function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}
        function setfilter(id){

        		if(id=='of'){
        			document.getElementById('filter').selectedIndex=2;

            	}else if(id=='plh'){
            		document.getElementById('filter').selectedIndex=3;
                }else if(id=='phl'){
                	document.getElementById('filter').selectedIndex=4;
                }else{
                	document.getElementById('filter').selectedIndex=1;
                }
			
           }
            function postadd(){
            	
            	var session="";
				session='<%=session.getAttribute("login")%>';
				if(session.localeCompare('true')==0){
					document.location.href="postadd.jsp";
				}else{
					//return;
					//alert("sec");
					//document.getElementById("sign-pop").style.display='block';
					$('#sign-pop').modal('show');
				}
            	
            	
            }
            
            $(function(){
            	$('#search').keyup(function(){	
            		var current_query = $('#search').val();
            		if (current_query !== "") {
            			$(".list-group li").hide();
            			$(".list-group li").each(function(){
            				var current_keyword = $(this).text();
            				if (current_keyword.indexOf(current_query) >=0) {
            					$(this).show();    	 	
            				};
            			});    	
            		} else {
            			$(".list-group li").show();
            		};
            	});
            });

</script>

    </head>
    <body onload="seticon();" oncopy="return false" oncut="return false" >
  
    
   <div id="hola">
        <div id="preloader">
            <span></span>
            <span></span>
        </div>
    </div>
    
    <div id="wrapper">
<nav class="navbar navbar-default navbar-fix-top">
	<div class="container-fluid">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="">
    	<a class="navbar-brand" style="font-size:30px;cursor:pointer;padding-left:5px;" data-toggle="offcanvas" >&#9776;</a>
    	<a class="navbar-brand" href="https://bazar4u.in/newhomepage.jsp"><img style="top: 1px;" alt="Home btn" src="image/upsidelogo.png" height="35" width="100"></a>
    	<div class="nav navbar-nav pull-right sign-but-list">
    	<a data-toggle="tooltip" title="Change Location" href="changecity"><i class="glyphicon glyphicon-map-marker"></i></a> &nbsp;
    	
    		<button type="button" id="loginbtn" class="sign-but btn btn-info btn-lg" onclick="checksession();" ><i class="glyphicon glyphicon-user"></i></button>
  			
  		</div>
	</div>
  </div><!-- /.container-fluid -->
</nav>

<a class="but-nav-search" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="glyphicon glyphicon-search"></i></a>
    <div class="back-img" id="baskicon">
		<a onclick="return checkbasket();"><img src="shop-basket.ico" alt="user-img" height="65px" width="65px" class="img-responsive pull-right img-basket"/>
		<div class="item-num-cart" id="cartcounter">0</div></a>
	</div>
   	      
   	     <script> seticon(); </script>
 <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li>
                	<a class="closebtn pull-right" data-toggle="offcanvas" >&times;</a>
                </li>
                <li>
                  <a href="https://bazar4u.in/shopslist.jsp?pagecount=0"> <i class="glyphicon glyphicon-shopping-cart"></i>&nbsp; Shopes</a>
                </li>
                <li>
                    <a href="https://bazar4u.in/events.jsp"> <i class="glyphicon glyphicon-flag"></i> &nbsp; Events  </a>
                </li>
                
                <li>
                	<a  href="https://bazar4u.in/newhomepage.jsp?pagecount=0&offer=yes"><i class="glyphicon glyphicon-piggy-bank"></i> &nbsp; Offer Zone</a>
                </li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Category <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
			        <li><a  href="newhomepage.jsp?pagecount=0&catagory=electronic"> Electronic</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=mobile">Mobile</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=computer">Computer</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=beauty">Beauty & Cosmetics</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=stationery">Stationery</a></li>
				     <li><a  href="newhomepage.jsp?pagecount=0&catagory=sports">Sports</a></li>
				     <li><a  href="newhomepage.jsp?pagecount=0&catagory=grocery">Grocery</a></li>
				      <li><a  href="newhomepage.jsp?pagecount=0&catagory=furniture">Furniture</a></li>
				      <li><a  href="newhomepage.jsp?pagecount=0&catagory=gift">Gift</a></li>
				    <li><a  href="newhomepage.jsp?pagecount=0&catagory=housing">Housing  Property</a></li>
				    
				    
		          </ul>
                </li>
            </ul>
        </nav>
        <button class="btn btn-warning  " style="color:black;" onclick="postadd();" > <i class="fa fa-bullhorn" aria-hidden="true"></i> &nbsp;Submit a Free Ad</button> &nbsp;
 
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div id="custom-search-input">
                        <div class="input-group col-md-12">
                            <input id="search" onKeyDown="if(event.keyCode==13) search();" type="text" class="form-control input-lg" placeholder="Search" />
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-lg" type="button" onclick="search();" >
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

  
<div id="buymodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Product Details : </h4>
            </div>
            
            <div class="modal-body">
            <div class="row">
            
              
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                      </ol>

                      <!-- Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active ">
                          <img height="200px" width="100%" class="img-responsive" id="peraimage1" src=""  onerror="this.src='imagenotfound.png'" >
                        </div>

                        <div class="item ">
                          <img height="200px" width="100%" class="img-responsive" id="peraimage2" src=""  onerror="this.src='imagenotfound.png'">
                        </div>

                        <div class="item ">
                          <img height="200px" width="100%" class="img-responsive" id="peraimage3" src=""  onerror="this.src='imagenotfound.png'">
                        </div>
                      
                        <div class="item ">
                          <img height="200px" width="100%" class="img-responsive" id="peraimage4" src=""  onerror="this.src='imagenotfound.png'">
                        </div>
                        
                      </div>

                      <!-- Left and right controls -->
                      <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                    
                   </div>
                   
                  <table class="table">
                  <tr>
                  	<td colspan="4"><strong>Product Name : </strong> <div id="peraname"> </td>
                  	<td colspan="1"></td>
                  </tr>
                  <!--  
                  <tr>
                  <td colspan="3"><strong>Product Name : </strong> <div id="peraname"> </div></td>
                </tr>
-->
                <tr>
                  <td colspan="2"><strong>Product Price : </strong><strike><div id="peraprice"> </div></strike> </td>
                  <td colspan="2"><strong>Offer price : </strong> <div id="peraofferprice"> </div></td>
                </tr>
                <tr>
                  <td rowspan="2" colspan="5"><strong>Discription : </strong> <div id="peradiscription"> </div></td>             
                </tr>
                <tr>
                	<td></td>
                </tr>
                <tr>
                  <td colspan="2"><button type="button" class="btn btn-warning btn-lg" data-toggle="modal" data-target="#buymodal" onclick="callsetiteam();"><i class="glyphicon glyphicon-shopping-cart"></i> Add to Cart</button></td>
                  <td colspan="2"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#buymodal" onclick="pagebuy();"><i class="glyphicon glyphicon-flash"></i> Buy Now</button></td>
                </tr>
              </table>
            </div>
            
            <div class="modal-footer">
            <a class="pull-left" href="#" id="peralink"><b id="linkname"></b></a>
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>

        </div>
      </div>


    <div class="modal fade" id="sign-pop" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">


            <div id="userform">
              <ul class="nav nav-tabs nav-justified" role="tablist">
                <li class="active"><a href="#login"  role="tab" data-toggle="tab">Log in</a></li>
                <li><a href="#signup"  role="tab" data-toggle="tab">Sign up</a></li>
              </ul>
              <div class="tab-content">

                <!--Login tab switching to login-->
                <div class="tab-pane fade active in" id="login">
                  <form   action="login" method="post">
                    <div class="form-group">
                      <label> Your Email<span class="req">*</span> </label>
                      <input type="email" class="form-control" name="email" id="email" required data-validation-required-message="Please enter your email address." autocomplete="on">
                      <p class="help-block text-danger"></p>
                    </div>
                    <div class="form-group">
                      <label> Password<span class="req">*</span> </label>
                      <input type="password" class="form-control" name="password" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                    <input type="hidden" name="pageinfo" value="newhomepage.jsp">
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-success"/>
                      Log in
                    </button>
                    <div class="pull-right"><a href="resetpassword.jsp" target="_blank">forgot password ?</a></div>
                  </div>
                </form>
              </div>
              <!--Compleation of Login-->

              <!--Sign up tab switching to Signup-->
              <div class="tab-pane fade in" id="signup">

                <form id="signup" onsubmit="return checksignup();" action="sendotp" method="post">
                  <div class="row">
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label>First Name<span class="req">*</span> </label>
                        <input type="text" class="form-control" name="fname" id="first_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label> Last Name<span class="req">*</span> </label>
                        <input type="text" class="form-control" name="lname" id="last_name" required data-validation-required-message="Please enter your name." autocomplete="off">
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-xs-12 col-sm-6">
                  <div class="form-group">
                    <label> Your Email<span class="req">*</span> </label>
                    <input type="email" class="form-control" name="email" id="email" required data-validation-required-message="Please enter your email address." autocomplete="off">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-xs-12 col-sm-6">
                  <div class="form-group">
                    <label> Your Phone<span class="req">*</span> </label>
                    <input type="tel" class="form-control" name="phone" id="phone" required data-validation-required-message="Please enter your phone number." autocomplete="off">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-6">
                  <div class="form-group">
                    <label> Password<span class="req">*</span> </label>
                      <input type="password" class="form-control" name="password" id="password" required data-validation-required-message="Please enter your password" autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                      <label>Re-Password <span id="confirmMessage" class="req confirmMessage">*</span> </label>
                        <input type="password" class="form-control" id="repassword" required data-validation-required-message="Please enter your password" autocomplete="off">
                        <p class="help-block text-danger"></p>
                      </div>
                  </div>
                </div>

                  <div class="form-group">
                    <label> Address <span class="req">*</span> </label>
                      <input type="text" class="form-control" name="address" id="address" required data-validation-required-message="Please enter your password" autocomplete="off">
                      <p class="help-block text-danger"></p>
                    </div>

                    <div class="row">
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label>City<span class="req">*</span> </label>
                          <input type="text" class="form-control" name="city" id="city" required data-validation-required-message="Please enter your password" autocomplete="off">
                          <p class="help-block text-danger"></p>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label>Pincode<span class="req">*</span> </label>
                          <input type="text" class="form-control" name="pincode" id="pincode" required data-validation-required-message="Please enter your password" autocomplete="off">
                          <p class="help-block text-danger"></p>
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>User Type<span class="req">*</span> </label>
                      <input type="radio" name="user-type" value="normal" id="user-type" checked="checked" onchange='usertype(this.value);'/> <b>Normal</b> &nbsp;
                      <input type="radio" name="user-type" value="shop" id="user-type" onchange='usertype(this.value);' /> <b>Shop Keeper</b>
                      <p class="help-block text-danger"></p>
                  </div>
                  <div class="row" id="shopopt" style="display:none;">
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label>Shop Name <span class="req">*</span> </label>
                        <input type="text" class="form-control" name="shopname" id="shopname"  data-validation-required-message="Please enter your name." autocomplete="off">
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                      <div class="form-group">
                        <label for="idnum">Category : </label>
                        <select class="form-control drop-down-cat" name="cat" id="category" onchange='CheckCat(this.value);'>
                          <option value="select">Select</option>
                          <option value="electronic">Electronic</option>
                          <option value="mobile">Mobile</option>
                          <option value="beauty">Beauty & Cosmetics</option>
                          <option value="stationery">Stationery</option>
                          <option value="computer">Computer</option>
                          <option value="sports">Sports</option>
                          <option value="grocery">Grocery</option>
                          <option value="furniture">Furniture</option>
                          <option value="gift">Gift</option>
                           <option value="housing">Housing  Property</option>
                          
                        </select>
                      </div>
                    </div>
                  </div>
                  <input type="hidden" name="pageinfo" value="newhomepage.jsp">
				<p>By clicking on the signup you are agree on all the <a href="terms.html" target="_blank">T&C</a>  of Bazar4u </p>
                    <div class="mrgn-30-top">
                      <button type="submit" class="btn btn-primary"  />
                      Sign up
                    </button>
                  </div>
                </form>
              </div>
			<!-- Ending of the sign up tab -->
            </div>
          </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>

        
        <div class="container-fluid">
     
            <div class="page-header"><h2 style="display: inline">General : </h2>
            
            
            <div class="pull-right" style="display: inline ;">
<select class="form-control drop-down-cat" name="filter" id="filter" onchange='filter(this.value);'>

<option value="nf">Newest First</option>
<option value="of">Oldest First</option>
<option value="plh">price -- Low to High</option>
<option value="phl">price -- high to low</option>

</select></div></div>


     
            <div class="container-fluid">
              <div class="row"> <!--Here we will start to add the product using table-->
              
<%! private static int pagecounter=0; %>
<%
	



	int price=0;
	String name="";
	int id=0;
	String imageurl="retriveimage.jsp?id=";
	String sql;
	String catagory=null;
	int count;
	if(request.getParameter("pagecount")==null){
		count=0;
	}else{
	 count=Integer.parseInt(request.getParameter("pagecount"));
	}
	
	boolean direction=false;
	if(request.getParameter("catagory")!=null){
		
		sql="select * from finaliteams where category='"+request.getParameter("catagory")+"' and city='"+city+"'";
		//direction=true;
	}else if(request.getParameter("offer")!=null){
		sql="select * from finaliteams where discount > 0 and city='"+city+"'";
		//direction=true;
	}else if(request.getParameter("qry")!=null){
		sql="select * from finaliteams where name like '%"+request.getParameter("qry")+"%' OR category like '%"+request.getParameter("qry")+"%' and city='"+city+"'";	
		//direction=true;
	}else if(request.getParameter("fil")!=null){
		String myfil=request.getParameter("fil");
		if(myfil.equals("of")){
			direction=true;
			sql="select * from finaliteams where city='"+city+"'";
			out.println("<script> setdropdown('of'); </script>");
			
		}else if(myfil.equals("plh")){
			sql="select * from finaliteams where city='"+city+"'" + " ORDER BY `price` DESC ";
			out.println("<script> setdropdown('plh'); </script>");
			
		}else if(myfil.equals("phl")){
			sql="select * from finaliteams where city='"+city+"'" +" ORDER BY `price` ASC ";
			out.println("<script> setdropdown('phl'); </script>");
		}else{
			sql="select * from finaliteams where city='"+city+"'";
			out.println("<script> setdropdown('nf'); </script>");
		}
	
	}
	else{
		sql="select * from finaliteams where city='"+city+"'";
	}
	int j=0;
	String imgs="retriveimage.jsp?id=";
	//String buy="buynow.jsp?id=";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=connection.connect();
	Statement st=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs=st.executeQuery(sql);
	if(rs.next()){
		
	rs.beforeFirst();
	rs.last();
	int last=rs.getRow();
	//rs.beforeFirst();
	//out.print(last);
	if(!direction){
		rs.afterLast();
	while(j<12 && rs.previous()){
	 int loopcount=last-(count*12)-j;
	 
		if(loopcount>=1){
			
		rs.absolute(loopcount);
		String ssm=imageurl+rs.getInt("id")+"&num=1";
		j++;
	%>

             <div class="col-xs-6 col-sm-10 col-md-4 col-lg-3" style="padding-bottom:25px; padding-right:2px;">
        <div class="card">
            <div class="card-header1">
              <a href="javascript:void(0)" onclick=" popvalu(<%=rs.getInt("id")%>,<%=rs.getInt("price")%>,'<%=rs.getString("name")%>',<%=rs.getInt("discount") %>,'<%=rs.getString("discription") %>','<%=rs.getString("seller") %>');" data-toggle="modal" data-target="#buymodal" >  <img alt="not found" height="200px" width="100%" src="<%=ssm %>"/></a>
            </div>
            <div class="card-content">

                <h5 class="title infoshort"><%=rs.getString("name") %></h5>
                <p class="category"> <strong>Price :</strong> <strike>&#8377; <%= rs.getInt("price")%> </strike> </p>
                <p class="category">  <b> &#8377;<%= rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100) %></b> &nbsp; (<%= rs.getInt("discount")%> %)</p>
            </div>
            <div class="card-footer">
                <center>
                <div class="row" style="padding-bottom: 2px;">
                     <button type="submit" class="buy_but btn btn-primary" name=<%=rs.getInt("id") %> onclick="buynow(this.name);"><i class="glyphicon glyphicon-flash"></i> Buy Now </button></br>
                     </div>
                     <div class="row">
                     <button type="submit" id="bask" name=<%=rs.getInt("id") %> class="btn btn-warning add_cart_but"  onclick="setiteams(this.name);" ><i class="glyphicon glyphicon-shopping-cart"></i> Add Cart</button>
                	</div>
                </center>
            </div>
        </div>
    </div>
		
		
	<% 
		
	}else{
	out.println("<script> document.location.href='newhomepage.jsp?pagecount=0'; </script>");
		
	//	RequestDispatcher rd=request.getRequestDispatcher("/newhomepage.jsp");
		//rd.forward(request, response);
		//return;
	//response.sendRedirect("temp.jsp?pagecount=0");
	 }}}else{  
		j=1;
		 rs.beforeFirst();
		while(j<=12 && rs.next()){
			int loopcount=(count*12)+j;
			if(loopcount<=last){
			rs.absolute(loopcount);
			String ssm=imageurl+rs.getInt("id")+"&num=1";
			j++;
	 %>
	 
	  <div class="col-xs-6 col-sm-10 col-md-4 col-lg-3" style="padding-bottom:25px;padding-right:2px;">
        <div class="card">
            <div class="card-header1">
                <a href="javascript:void(0)" onclick=" popvalu(<%=rs.getInt("id")%>,<%=rs.getInt("price")%>,'<%=rs.getString("name")%>',<%=rs.getInt("discount") %>,'<%=rs.getString("discription") %>','<%=rs.getString("seller") %>');" data-toggle="modal" data-target="#buymodal" ><img alt="not found" height="200px" width="100%" src="<%=ssm %>"/></a>
            </div>
            <div class="card-content">

                <h5 class="title infoshort"><%=rs.getString("name") %></h5>
                <p class="category"> <strong>Price :</strong> <strike>&#8377; <%= rs.getInt("price")%> </strike> </p>
                <p class="category">  <b> &#8377;<%= rs.getInt("price")-((rs.getInt("price")*rs.getInt("discount"))/100) %></b> &nbsp; (<%= rs.getInt("discount")%> % )</p>
              
                
            </div>
            <div class="card-footer">
                <center>
                	<div class="row" style="padding-bottom:2px;">
                     <button type="submit" class="buy_but btn btn-primary" name=<%=rs.getInt("id") %> onclick="buynow(this.name);"><i class="glyphicon glyphicon-flash"></i> Buy Now </button>
                     </div>
                     <div class="row">
                     <button type="submit" id="bask" name=<%=rs.getInt("id") %> class="btn btn-warning add_cart_but"  onclick="setiteams(this.name);" ><i class="glyphicon glyphicon-shopping-cart"></i> Add Cart</button>
                	</div>
                </center>
            </div>
        </div>
    </div>
		
	 
	 
	 <%}else{out.println("<script> document.location.href='newhomepage.jsp?pagecount=0'; </script>");}} }%>

<%
if (rs != null) {
    try { rs.close(); } catch (SQLException e) {  }
    rs = null;
  }
if (st != null) {
    try { st.close(); } catch (SQLException e) { ; }
    st = null;
  }
if (con != null) {
    try { con.close(); } catch (SQLException e) { ; }
    con= null;
  }


	
%>


</div>
<ul class="pager">
<li>
<a class="next_but" onclick="nextpage(<%=count %>,<%=last%>);">Next &#10095;&#10095;</a>
</li>
</ul>
</center>
<%}else{%>
	
	<div class="text-center">
	<center>
                  <img class="img-responsive" src="/image/homepagenot.png" width="90%" height="75%">
                  </center>
                  <a href="newhomepage.jsp" > Goto Home </a>
                </div>
	
	<%if (rs != null) {
	    try { rs.close(); } catch (SQLException e) {  }
	    rs = null;
	  }
	if (st != null) {
	    try { st.close(); } catch (SQLException e) { ; }
	    st = null;
	  }
	if (con != null) {
	    try { con.close(); } catch (SQLException e) { ; }
	    con= null;
	  }} %>

</br></br> 


 
 <!--  <span class="hit_counter"></span>-->
                
            
               
            
        </div>
            
            
        </div>

</div> 


<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-4 col-sm-6 footerleft ">
        <div class="logofooter"><img alt="Logo" src="image/bottomlogo.png" height="100" width="100"></div>
        <p>Here Something for everyone.</p>
        <p><i class="fa fa-map-pin"></i> Visnagar </p>
        <p><i class="fa fa-envelope"></i> E-mail : developer@bazar4u.in</p>

      </div>
      <div class="col-md-2 col-sm-6 paddingtop-bottom">
        <h6 class="heading7">GENERAL LINKS</h6>
        <ul class="footer-ul">
          <li><a href="Aboutuspage.html" target="_blank">About Us</a> </li>
          <li><a href="terms.html" target="_blank"> Terms & Conditions</a></li>
          <li><a href="jointeam.html" target="_blank"> Join Our Team</a></li>
           <li><a href="bugreport.html" target="_blank"> Bug Report</a></li>
        </ul>
      </div>
   
      <div class="col-md-3 col-sm-6 paddingtop-bottom pull-right">
        <div class="fb-page" data-href="https://www.facebook.com/facebook" data-tabs="timeline" data-height="300" data-small-header="false" style="margin-bottom:15px;" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
          <div class="fb-xfbml-parse-ignore">
            <blockquote cite="https://www.facebook.com/facebook">
              <a href="https://www.facebook.com/facebook"><i class="fa fa-facebook-square" style="font-size:38px;color:blue"></i> &nbsp;Facebook</a>
            </blockquote>
            <blockquote><a href="#" title="website counter"><img src="https://counter2.freecounter.ovh/private/freecounterstat.php?c=jlfmlynjm5flsbycxxb33w1mmzlwpgf5" border="0" title="website counter" alt="website counter"></a></blockquote>
            <blockquote>
              <header style="color: white;">SMS Partner :</header>
               <a href="https://msg91.com/startups/?utm_source=startup-banner" target="_blank"><img src="https://msg91.com/images/startups/msg91Badge.png" width="100" height="70" title="MSG91 - SMS for Startups" alt="Bulk SMS - MSG91"></a>
</blockquote>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<div class="copyright">
  <div class="container">
    <div class="col-md-6">
      <p>Copyright © 2017 - Bazar4u.in  All rights reserved</p>
    </div>
    </div>
    </div>
    <!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/59a2c01fb6e907673de09e09/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>


<!--End of Tawk.to Script-->
<script>
	stoploading();
</script>

<%}}
%>
    </body>

</html>

