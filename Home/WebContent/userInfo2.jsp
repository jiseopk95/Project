<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<meta charset="euc-kr">
<title>���� �ȽɱͰ�����</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>
<%

	String pass = request.getParameter("password");
	String pass2 = request.getParameter("ps2");
	String sql = "UPDATE user SET password='";
	
	if(pass.equals(pass2))
	{	
	sql += request.getParameter("password") + "', pnum='";
	sql += request.getParameter("pnum") + "', appoint='";
	sql += request.getParameter("appoint") + "' where id='";
	sql += session.getAttribute("userid") + "'";
	}
	
	else
	{
		out.println("<script> alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.'); history.back(); </script>");
	}
	
	boolean flag = false;

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	Statement st3 = conn.createStatement();
	
	int count = st.executeUpdate(sql);
	
	if (count > 0)
	{
		flag = true;
	}
	
	else
	{
		out.println("<script> alert('��û�Ͻ� �۾��� ����� ó������ �ʾҽ��ϴ�.'); history.back(); </script>");
	}
	
	st.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("index.html");
	}
	
	else
	{
		out.println("<script> alert('��û�Ͻ� �۾��� ����� ó������ �ʾҽ��ϴ�.'); history.back(); </script>");
	}
%>
</body>
</html>