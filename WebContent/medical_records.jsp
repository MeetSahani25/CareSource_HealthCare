<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
	String sql="select * from diagnosis where Email=?";
	PreparedStatement stmt=con.prepareStatement(sql);
	stmt.setString(1,email);
	ResultSet rs=stmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Medical Records</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util1.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">Disease</th>
								<th class="column2">Doctor</th>
								<th class="column3">Medical Store</th>
								<th class="column4">Date</th>
							</tr>
							</thead>
			<%		
			while(rs.next())
			{
			%>
							<tbody>
								
								<tr>
									<td class="column1"><%=rs.getString(2)%></td>
									<td class="column2"><%=rs.getString(4)%></td>
									<td class="column3"><%=rs.getString(5)%></td>
									<td class="column4"><%=rs.getString(3)%></td>
								</tr>
						</tbody>
						<%} %>		
					</table>
				</div>
			</div>
		</div>
	</div>
	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<%
								
								con.close();
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
</body>
</html>

