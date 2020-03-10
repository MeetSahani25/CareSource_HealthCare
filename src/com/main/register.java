package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String name=request.getParameter("name");
		String mob=request.getParameter("phone");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String gender=request.getParameter("gender");
		String age=request.getParameter("age");
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/caresource","root","");
		PreparedStatement ps=con.prepareStatement("insert into patient_info values(?,?,?,?,?,?)");
		
		ps.setString(3,name);
		ps.setString(1,email);
		ps.setString(2,pass);
		ps.setString(4,mob);
		ps.setString(5,gender);
		ps.setString(6,age);
		
		int i=ps.executeUpdate();
		if(i>0)
		{
			request.getRequestDispatcher("Login_Page.html").include(request,response);
		}
		request.getRequestDispatcher("Sign_Up.html").include(request,response);
		
		ps.close();
	}
	catch(Exception ex)
	{
	pw.println("Error="+ex);
	}
	pw.close();
	}

}
