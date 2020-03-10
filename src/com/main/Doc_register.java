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

/**
 * Servlet implementation class Doc_register
 */
@WebServlet("/Doc_register")
public class Doc_register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Doc_register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		// TODO Auto-generated method stub
				response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				String name=request.getParameter("name");
				String mob=request.getParameter("phone");
				String job=request.getParameter("job");
				String email=request.getParameter("email");
				try
				{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/caresource","root","");
				PreparedStatement ps=con.prepareStatement("insert into docter_info values(?,?,?,?)");
				
				ps.setString(1,name);
				ps.setString(2,email);
				ps.setString(3,mob);
				ps.setString(4,job);
				
				int i=ps.executeUpdate();
				if(i>0)
				{
					request.getRequestDispatcher("index.html").include(request,response);
				}
				request.getRequestDispatcher("Signup_doctor.html").include(request,response);
				
				ps.close();
			}
			catch(Exception ex)
			{
			pw.println("Error="+ex);
			}
			pw.close();
			}

	}


