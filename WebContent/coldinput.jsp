<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.main.Diagnosis_input" %>
<%
Cookie ck[]=request.getCookies();  
int size=ck.length;
String email=ck[size-1].getValue();
%>
<%
if(email!=null)
{
String area=request.getParameter("area");
String disease="flu";
String doctor="BAPS Pramukh Swami Hospital";
int inputstatus=Diagnosis_input.inputdetails(email,disease,doctor,area);
if(inputstatus==1)
{
%>	
<jsp:forward page="index1.html"></jsp:forward>
<%}
else if(inputstatus==0)
{
out.print("Please try again");
%>
<jsp:include page="index1.html"></jsp:include>	
<%}
}	
%>