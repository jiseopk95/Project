<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<body>

<%

Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
Statement st1 = conn.createStatement();
Statement st2 = conn.createStatement();



String idx = (String)session.getAttribute("userid");

String sql1 ="SELECT id FROM reserv WHERE id='" + idx+"'";

ResultSet rs = st1.executeQuery(sql1);



if(rs.next()){
	

	if(idx.equals(rs.getString(1)))
	{
		st1.close();
		st2.close();
		rs.close();
		conn.close();
		
		out.println("<script>alert('예약은 한 번만 가능합니다.'); history.back(); </script>");
		
		response.sendRedirect("board2.jsp");
	}

	
}
else{
	
	boolean flag =true;

	String sql = "INSERT INTO reserv(name, assarea, id, prepoint, pnum, appoint, mobilize, date, extime) VALUES('";
	sql += request.getParameter("name") + "', '";
	sql += request.getParameter("assarea") + "', '";
	sql += request.getParameter("id") + "', '";
	sql += request.getParameter("prepoint") + "', '";
	sql += request.getParameter("pnum") + "', '";
	sql += request.getParameter("appoint") + "', '";
	sql += 1 + "','";
	sql += (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()) + "','";
	sql += request.getParameter("selBox") + "')";
	
	
	int count = st2.executeUpdate(sql);
	
	
	if (flag)
	{
		st1.close();
		st2.close();
		rs.close();
		conn.close();
		response.sendRedirect("board2.jsp");
	}
	
	
}




%>
</body>
</html>