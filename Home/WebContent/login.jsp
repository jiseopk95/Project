<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>
<%
	String uid = request.getParameter("id");
	String sql = "(SELECT id, password FROM user where id = '"+uid+"') union (SELECT id, password FROM scout where id = '"+uid+"')";
	session.setAttribute("userid",uid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	String sql2 ="Select id from reserv where id = '";
	sql2 += request.getParameter("id") + "'";
	ResultSet rs2 = st2.executeQuery(sql2);
	ResultSet rs = st.executeQuery(sql);
	boolean flag = false;
	boolean admin = false;
	boolean reserv = false;
	
	
	if (rs.next())
	{
		String pass = request.getParameter("ps");
		if(pass.equals(rs.getString("password")))
		{
			if(uid.indexOf("admin")!= -1)
			{
				admin = true;
			}
			else
			{
				if(rs2.next())
				{
					reserv = true;
				}
				
				else
				flag = true;
			}
		}
		else
		{
			out.println("<script> alert('�н����尡 ��ġ���� �ʽ��ϴ�.'); window.location='index.html'; </script>");
			//window.location�� ������ ������ ���ư������� ��. �Է��ߴ� �Ķ���ʹ� �翬�� �� ����. ��Ű�� �̿��ؼ� �̸� �����ؾ� ��.
		}
	}
	else 
	{
		out.println("<script> alert('����ڰ� �������� �ʽ��ϴ�.'); history.back(); </script>");
		//history.back�� �ڱⰡ �Դ� ������ ���ư��� ��. �Է��ߴ� �Ķ���Ͱ� �״�� ��������
	}
	
	st.close();
	rs.close();
	conn.close();
	
	if (admin)
	{
		response.sendRedirect("board.jsp");
	}
	
	if (flag)
	{
		response.sendRedirect("main.jsp");
	}
	
	if (reserv)
	{
		response.sendRedirect("board2.jsp");
	}
%>
</body>
</html>