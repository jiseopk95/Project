<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>
<%
	String uid = request.getParameter("id").substring(request.getParameter("id").length()-4,request.getParameter("id").length());
	String sql = "SELECT * FROM nuserreserv where id = '" +uid+ "'";
	session.setAttribute("userid",uid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	String sql2 ="Select id from nuserreserv where id = '";
	sql2 += request.getParameter("id") + "'";
	ResultSet rs2 = st2.executeQuery(sql2);
	ResultSet rs = st.executeQuery(sql);
	boolean flag = false;
	boolean reserv = false;
	
	
	if (rs.next())
				flag = true;

	else 
	{
		out.println("<script> alert('����� �� �����ϴ�.'); history.back(); </script>");
		//history.back�� �ڱⰡ �Դ� ������ ���ư��� ��. �Է��ߴ� �Ķ���Ͱ� �״�� ��������
	}
	
	st.close();
	rs.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("board2.jsp");
	}

%>
</body>
</html>