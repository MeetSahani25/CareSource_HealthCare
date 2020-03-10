<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
Cookie ck[]=request.getCookies();
int size=ck.length;
String email="";
if((ck[0].getValue()).contains("@"))
{
email=ck[0].getValue();
}
else
{
	email=ck[size-1].getValue();
}	
try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/caresource","root","");
	PreparedStatement stmt=con.prepareStatement("select * from patient_info where Email=?");
	stmt.setString(1,email);
	ResultSet rs=stmt.executeQuery();
 if(rs.next());
      {%>
<!DOCTYPE html>
<html>
<head>
<title>My Account</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Student Registration Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
	<!-- /fonts -->
	<!-- css -->
	<link href="css/bootstrap.css" rel="stylesheet" type='text/css' media="all" />
	<link href="css/style1.css" rel="stylesheet" type='text/css' media="all" />
	<!-- /css -->

</head>
<body>
<div class="content-agileits">
		<h1 class="title">Profile preferences</h1>
		<div class="left">
			<form action="View_Info1.jsp" method="post" data-toggle="validator">
				<div class="form-group">
					<label for="firstname" class="control-label">Name:</label>
					<input type="text" class="form-control" name="name" value="<%=rs.getString(3)%>" readonly>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
					<label for="age" class="control-label">Age:</label>
					<input type="text" min="8" max="110" class="form-control" name="age" value="<%=rs.getString(6)%>" readonly>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="control-label">Email:</label>
					<input type="email" class="form-control" name="email" value="<%=rs.getString(1)%>"readonly>
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="control-label">Password:</label>
					<div class="form-inline row">
						<div class="form-group col-sm-6 agileits-w3layouts">
							<input type="password" data-minlength="6" class="form-control" name="pass" value="<%=rs.getString(2)%> "readonly>
						</div>
						</div>
						<div class="form-group">
						<label for="Gender" class="control-label">Gender:</label>
							<input type="text" class="form-control" name="gender" value="<%=rs.getString(5)%>" readonly>
							<div class="help-block with-errors"></div>
				</div>
							</div>
							
							
				<div class="form-group">
					<label for="Phone" class="control-label">Phone:</label>
					<input type="text" min="6000000000" max="9999999999" class="form-control" name="number" value="<%=rs.getString(4)%>" readonly>
					<div class="help-block with-errors"></div>
				</div>
				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-lg" style="background-color:#202020; width:30% margin-left:20px;">Edit Information</button>
				</div>
					<form></div>
			
		<div class="right"></div>
		<div class="clear"></div>
		
	<p class="copyright-w3ls">© 2019 CareSource HealthCare Limited. All Rights Reserved | Design by
		<a href="https://w3layouts.com/" target="_blank">W3layouts</a>
	</p>
	<!-- js -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- //js -->

	<script src="js/bootstrap.min1.js"></script>
	<script src="js/validator.min1.js"></script>
	<!-- /js files -->
<%
      }
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</body>
</html>