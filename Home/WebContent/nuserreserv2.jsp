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
Statement st = conn.createStatement();
Statement st2 = conn.createStatement();
 
String pnumx = request.getParameter("pnum");

String sql1 ="SELECT pnum FROM nuserreserv WHERE pnum='" + pnumx+"'";

ResultSet rs = st2.executeQuery(sql1);

if(rs.next()){
	
	if(pnumx.equals(rs.getString(1)))
	{
		st.close();
		st2.close();
		rs.close();
		conn.close();
		
		out.println("<script>alert('예약은 한 번만 가능합니다.'); history.back();</script>");
		
		response.sendRedirect("main2.jsp");
	}
}
else{
	boolean flag = true;
	
	String sql = "INSERT INTO nuserreserv(name, id, assarea, prepoint, pnum, appoint, mobilize, date, extime) VALUES('";
	sql += request.getParameter("name") + "', '";
	sql += request.getParameter("pnum").substring(request.getParameter("pnum").length()-4,request.getParameter("pnum").length()) + "', '";
	sql += request.getParameter("assarea") + "', '";
	sql += request.getParameter("prepoint") + "', '";
	sql += request.getParameter("pnum") + "', '";
	sql += request.getParameter("appoint") + "', '";
	sql += 1 + "','";
	sql += (new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()) + "','";
	sql += request.getParameter("selBox") + "')";
	
	int count = st.executeUpdate(sql);
	session.setAttribute("userid",request.getParameter("pnum").substring(request.getParameter("pnum").length()-4,request.getParameter("pnum").length()));
	
	
	if (flag)
	{
		st.close();
		st2.close();
		rs.close();
		conn.close();
	}
		response.sendRedirect("board2.jsp");
}
%>
</body>
</html>