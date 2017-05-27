<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<title>여성 안심귀가서비스</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>
<%
	boolean flag = false;

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	Statement st3 = conn.createStatement();
	Statement st4 = conn.createStatement();
	Statement st44 = conn.createStatement();
	Statement st9 = conn.createStatement();
	String sql = "SELECT * FROM reserv where id='";
	sql += request.getParameter("id") + "'";
	String sql9 = "SELECT * FROM nuserreserv where id='";
	sql9 += request.getParameter("id") + "'";
	String sql4 = "SELECT * FROM scout where id='";
	sql4 += session.getAttribute("userid") + "'";
	
	ResultSet rs = st.executeQuery(sql);
	ResultSet rs4 = st4.executeQuery(sql4);
	ResultSet rs9 = st9.executeQuery(sql9);
	
	String uid = (String)session.getAttribute("userid");
	
	
	if(rs.next()){
		if (rs.getInt("mobilize")==1) {
				String sql2 = "delete from reserv where id='";
				sql2 += request.getParameter("id") + "'";
				
				st2.executeUpdate(sql2);
				flag = true;
		}
		
	}
	
	else if(rs9.next()){
		if (rs9.getInt("mobilize")==1) {
				String sql2 = "delete from nuserreserv where id='";
				sql2 += request.getParameter("id") + "'";
				
				st2.executeUpdate(sql2);
				flag = true;
		}
		
	}
	
	st.close();
	st2.close();
	st3.close();
	st4.close();
	st9.close();
	st44.close();
	rs.close();
	rs9.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("main.jsp");
	}
%>
</div>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>