<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/caresource";%>
<%!String user = "root";%>
<%!String psw = "";%>

<%
String name=request.getParameter("name");
String age=request.getParameter("age");
String email = request.getParameter("email");
String contact=request.getParameter("number");
String pass=request.getParameter("pass");
String sex=request.getParameter("gender");

if(email != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update patient_info set Email=?,Password=?,Phone_No=?,Sex=?,Name=?,Age=? where Email=?";
ps=con.prepareStatement(sql);
ps.setString(1,email);
ps.setString(2,pass);
ps.setString(5,sex);
ps.setString(6,age);
ps.setString(3,name);
ps.setString(4,contact);
ps.setString(7,email);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");%>
<jsp:forward page="index1.html" />  
<%}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}%>