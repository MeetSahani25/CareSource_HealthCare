package com.main;
  
import java.sql.*;

public class Diagnosis_input 
{  
public static int inputdetails(String email,String disease,String doctor,String area){  
int status=0;
String store="";
if(area.equals("Adajan"))
{
	store="Jay Ambe Medical Store, Takshila Complex";
}
else if(area.equals("CityLight"))
{
	store="Apollo Pharmacy, Shubhlaxmi Complex";
}
else if(area.equals("Rander"))
{
	store="Siddhi Vinayak, Shanti Sadan Apartment";
}
else if(area.equals("Vesu"))
{
	store="Ashok Medical Store, Sukum Platinum";
}
else if(area.equals("Parlepoint"))
{
	store="Jayesh Medical Store, Kailash Bhavan";
}
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/caresource","root","");
PreparedStatement ps=con.prepareStatement("insert into diagnosis values(?,?,?,?,?)");
ps.setString(1,email);
ps.setString(2,disease);
ps.setString(3,java.time.LocalDate.now().toString());
ps.setString(4,doctor);
ps.setString(5,store);

status=ps.executeUpdate(); 
}
catch(Exception ex)
{
System.out.println("Error="+ex);
}
return status;
}
}