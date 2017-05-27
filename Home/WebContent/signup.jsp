<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>
<%

	String pass = request.getParameter("password");
	String pass2 = request.getParameter("ps2");
	String sql = "INSERT INTO user VALUES('";
	if(pass.equals(pass2))
	{	
	sql += request.getParameter("id") + "', '";
	sql += request.getParameter("password") + "', '";
	sql += request.getParameter("name") + "', '";
	sql += request.getParameter("pnum") + "', '";
	sql += request.getParameter("appoint") + "','";
	sql += (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()) + "')";
	}
	
	else
	{
		out.println("<script> alert('비밀번호가 일치하지 않습니다.'); history.back(); </script>");
	}
	
	boolean flag = false;

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	
	int count = st.executeUpdate(sql);
	
	if (count > 0)
	{
		flag = true;
	}
	
	else
	{
		out.println("<script> alert('요청하신 작업이 제대로 처리되지 않았습니다.'); history.back(); </script>");
	}
	
	st.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("index.html");
	}
%>
</body>
</html>