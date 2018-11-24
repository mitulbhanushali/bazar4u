<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
					if(session.getAttribute("login")==null){
						//out.println("<script> document.location.href='newhomepage.jsp?pagecount=0'</script>");
						response.sendRedirect("newhomepage.jsp?pagecount=0");
					}else{
			
			%>
<head>
  <title>Post Free Add</title>
  <link rel="icon" type="image/gif" href="image/logo.png">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/postadd.css">
  <script>
	function checkedits(){

		var cat=document.getElementById("catagory1").value;
		if(cat.localeCompare("select")==0){
				alert("select category");
				return false;
		}
		
		
	var myfile1=document.getElementById("productimage1");
	var myfile2=document.getElementById("productimage2");
	var myfile3=document.getElementById("productimage3");
	var myfile4=document.getElementById("productimage4");

	if(myfile1.value=="" ){
		alert("plz upload  first image");
		return false;

    }
	var val=document.getElementById("proprice").value;
	var val1=document.getElementById("prodiscount").value;
	if(isNaN(val) || isNaN(val1)){
		alert("plz enter number for price or discount field");
				return false;
       }
	if(val1>=100){
		alert("plz provide value of discount between 0 to 99");
		return false;

        }
    

			return true;

    	}
  
  
  </script>
</head>
<body>
  <div class="jumbotron">
    <div class="container">
      <h3>Bazar4u.in</h3>
      
    </div>
  </div>
  <div class="container">
    <div class="panel panel-default">
      <div class="panel-heading">Submit a Free Classified Ad</div>
      <div class="panel-body">
        <form  onsubmit="return checkedits();" method="post" action="tempupload"  enctype="multipart/form-data" accept-charset="UTF-8">
                                          <div class="row">
                                            <div class="col-xs-16 col-sm-4">
                                              <div class="form-group">
                                                <label for="idnum">Category : </label>
                                                    <select class="form-control drop-down-cat" name="catagory1" id="catagory1" onchange='CheckCat(this.value);'>
                                                      <option value="select">select</option>
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
                                                      <option value="others">Other...</option>
                                                    </select>
                                                  </div>
                                                </div>

                                                  <div class="col-xs-16 col-sm-6" >
                                                    <div class="form-group" id="cat" style='display:none;'>
                                                      <label for="idnum">Enter Category : </label>
                                                      <input type="text" class="form-control drop-down-cat" name="catagory2"/>
                                                    </div>
                                                  </div>
                                              </div>

                                            <div class="form-group">
                                                <label for="proname">Product Name</label>
                                                <input type="text" name="name" class="form-control" id="proname" placeholder="Product Name" required/>
                                            </div>

                                            <div class="row">
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="proprice">Product Price</label>
                                                  <input type="text" name="price" class="form-control " id="proprice" placeholder="Product Price" required />
                                                </div>
                                              </div>
                                              <div class="col-xs-12 col-sm-6">
                                                <div class="form-group">
                                                  <label for="prodis"> Product Discount </label>
                                                  <input type="text" name="discount" class="form-control" id="prodis" placeholder="Product Discount" value="0" />
                                                </div>
                                              </div>
                                            </div>


                                            <div class="form-group">
                                                <label for="prodecp">Product Decptrion</label>
                                                <textarea rows="5" cols="20" name="discription" id="prodecp" required></textarea>
                                            </div>

                                              <hr>
                <div class="row" style="padding-top:20px;" >
                  <div class="col-sm-10">
                    <div class="col-sm-5">
                    <label style="padding:10px;">Select Images </label>
                  </div>
                  <div class="col-sm-6">
                    <div class="col-sm-3">
                    <div class="choose_file">
                      <span id="file1" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f1" id="productimage1" type="file" onchange="loadFile(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file2" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f2" id="productimage2" type="file" onchange="loadFile1(event)"/>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="choose_file">
                      <span id="file3" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f3" id="productimage3" type="file" onchange="loadFile2(event)"/>
                    </div>
                    <div class="choose_file">
                      <span id="file4" class="glyphicon glyphicon-plus" >
                      </span>
                      <input name="Select File" name="f4"  id="productimage4"type="file" onchange="loadFile3(event)"/>
                    </div>
                  </div>
                  </div>
                  </div>
                </div>
                                            <br><br>
                                            <input type="submit" class="btn btn-primary" id="addproduct" value="Add"/>


                                        </form>

      </div>
    </div>
  </div>
  <script>
var bdiscount=0;
function loadFile(event) {
      var out = URL.createObjectURL(event.target.files[0]);
      var d = document.getElementById('file1');
      d.style.backgroundImage = "url('"+out+"')";
      var myfile1=document.getElementById("productimage1");
      var fname=myfile1.value;
      var temp=fname.split(".");
		var extern=temp[temp.length-1].toLowerCase();
	
		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
					alert("file type should be jpeg or png or gif or jpg");
					document.getElementById("addproduct").disabled = true;
					bdiscount++;

		}else{
			bdiscount--;
			if(bdiscount<=0){
			document.getElementById("addproduct").disabled = false;
			}
		}
      d.style.backgroundSize = "cover";
      d.style.borderRadius = "8px";
      };
      function loadFile1(event) {
        var out = URL.createObjectURL(event.target.files[0]);
        var d = document.getElementById('file2');
        d.style.backgroundImage = "url('"+out+"')";
        var myfile1=document.getElementById("productimage2");
        var fname=myfile1.value;
        var temp=fname.split(".");
 
  		var extern=temp[temp.length-1].toLowerCase();
  	
  		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
  					alert("file type should be jpeg or png or gif or jpg"+temp);
  					document.getElementById("addproduct").disabled = true;
  					bdiscount++;

  		}else{
  			bdiscount--;
			if(bdiscount<=0){
			document.getElementById("addproduct").disabled = false;
			}
  		}
        d.style.backgroundSize = "cover";
        d.style.borderRadius = "8px";
        };
        function loadFile2(event) {
          var out = URL.createObjectURL(event.target.files[0]);
          var d = document.getElementById('file3');
          d.style.backgroundImage = "url('"+out+"')";
          var myfile1=document.getElementById("productimage3");
          var fname=myfile1.value;
          var temp=fname.split(".");
         
    		var extern=temp[temp.length-1].toLowerCase();
    	
    		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
    					alert("file type should be jpeg or png or gif or jpg");
    					bdiscount++;
    					document.getElementById("addproduct").disabled = true;

    		}else{
    			bdiscount--;
    			if(bdiscount<=0){
    			document.getElementById("addproduct").disabled = false;
    			}
    		}
          d.style.backgroundSize = "cover";
          d.style.borderRadius = "8px";
          };
          function loadFile3(event) {
            var out = URL.createObjectURL(event.target.files[0]);
            var d = document.getElementById('file4');
            d.style.backgroundImage = "url('"+out+"')";
            var myfile1=document.getElementById("productimage4");
            var fname=myfile1.value;
            var temp=fname.split(".");
           
      		var extern=temp[temp.length-1].toLowerCase();
      	
      		if(extern.localeCompare("jpeg")!=0 && extern.localeCompare("png")!=0 && extern.localeCompare("gif")!=0 && extern.localeCompare("jpg")!=0){
      					alert("file type should be jpeg or png or gif or jpg");
      					bdiscount++;
      					document.getElementById("addproduct").disabled = true;

      		}else{
      			bdiscount--;
    			if(bdiscount<=0){
    			document.getElementById("addproduct").disabled = false;
    			}
      		}
            d.style.backgroundSize = "cover";
            d.style.borderRadius = "8px";
            };
  </script>
</body>
 <%} %>
</html>
