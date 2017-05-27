<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<title>여성 안심귀가서비스</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<%String idx = (String)session.getAttribute("userid"); %>
<div id="session-area">
<h5>&nbsp;&nbsp;<%= idx%>님의 안전한 귀가를 책입집니다!<a href = "userInfo.jsp">회원정보 수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><a href = "logout.jsp">로그아웃&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h5> 
</div>
<center>
<div id="header-area"><a href = "board2.jsp"><img src ="images/logo.png"></a></div>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	Statement st3 = conn.createStatement();
	Statement st4 = conn.createStatement();
	Statement st5 = conn.createStatement();
	Statement st33 = conn.createStatement();
	Statement st6 = conn.createStatement();
	Statement st7 = conn.createStatement();
	Statement st8 = conn.createStatement();
	Statement st9 = conn.createStatement();
	Statement st10 = conn.createStatement();
	Statement st11 = conn.createStatement();
	Statement st12 = conn.createStatement();
	Statement st15 = conn.createStatement();
	Statement st66 = conn.createStatement();
	
	String sql15 = "SELECT reass from reserv where id='";
	sql15 += session.getAttribute("userid") + "'";
	ResultSet rs15 = st15.executeQuery(sql15);



	//String sql2 = "SELECT assarea FROM scout where id ='";
	//sql2 += session.getAttribute("userid") + "'";
	String sql3 = "(SELECT assarea FROM reserv where id ='";
	sql3 += session.getAttribute("userid") + "') union (SELECT assarea FROM nuserreserv where id ='";
	sql3 += session.getAttribute("userid") + "')";
	//ResultSet rs2 = st2.executeQuery(sql2);
	ResultSet rs3 = st33.executeQuery(sql3);
%>
<%
	out.println("<center><br>");
	out.println("<div id='mobile-section' style= 'margin:5%'>");
	out.println("<img src ='images/reserv.png' style='margin-bottom:2%'>");
	out.println("<table>");
	out.println("<tr align=center style='color:white'><td>이름</td>");
	out.println("<td>연락처</td>");
	out.println("<td>약속장소</td>");
	out.println("<td>소요시간</td>");
	out.println("<td>예약경과시간</td>");
	out.println("<td>현재위치</td>");
	out.println("<td>출동여부</td></tr>");
	
	if(rs3.next()) {
		String sql = "(SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM reserv where assarea ='";
		sql += rs3.getString("assarea") + "' and ";
		sql += "id ='";
		sql += session.getAttribute("userid") + "') union (SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM nuserreserv where assarea ='";
		sql += rs3.getString("assarea") + "' and ";
		sql += "id ='";
		sql += session.getAttribute("userid") + "')";
		String sql2 = "(SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM reserv where assarea ='";
		sql2 += rs3.getString("assarea") + "' and not ";
		sql2 += "id ='";
		sql2 += session.getAttribute("userid") + "') union (SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM nuserreserv where assarea ='";
		sql2 += rs3.getString("assarea") + "' and not ";
		sql2 += "id ='";
		sql2 += session.getAttribute("userid") + "')";
		//String sql5 = "SELECT count(id) FROM reserv where assarea ='";
		//sql5 += rs3.getString("assarea") + "'";
		ResultSet rs = st.executeQuery(sql);
		ResultSet rs22 = st2.executeQuery(sql2);
		//ResultSet rs5 = st5.executeQuery(sql5);
		
	while(rs.next())
	{
		
		
		while(rs22.next()) {
			
			out.println("<br><tr align=center><td>***</td>");
			out.println("<td>****</td>");
			out.println("<td>****</td>");
			out.println("<td>****</td>");
			out.println("<td>****</td>");
			out.println("<td>****</td>");
			if(rs22.getInt("mobilize") == 1){
				out.println("<td>미출동</td>");
			}
			if(rs22.getInt("mobilize") == 0){
				out.println("<td>출동중</td>");
			}
		
		}
		out.println("<tr align=center>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getString("pnum") + "</td>");
		out.println("<td>" + rs.getString("appoint") + "</td>");
		out.println("<td>" + rs.getString("extime") + "분</td>");
		
		String sql8 = "SELECT id FROM reserv WHERE id='" + idx+"'";
		ResultSet rs8 = st8.executeQuery(sql8);
		
		String sql9 = "select id from nuserreserv where id='" +idx+"'";
		

		/*String sql12 = "select substr('"+rs.getString("pnum")+"'10,13) from nuserreserv  where id='" +idx+"'";
		ResultSet rs12 = st12.executeQuery(sql12);*/
		
		/*String sql9 = "select pnum from nuserreserv where pnum'" +rs.getString("pnum")+"'";*/
		ResultSet rs9 = st9.executeQuery(sql9);
		
		if(rs8.next()){
			String sql11 = "select date from reserv where id ='" +idx+"'";
			ResultSet rs11 = st10.executeQuery(sql11);
			if(rs11.next())
			{
				String sql7 = "select timestampdiff(minute, '"+rs11.getString(1)+"', now())-720";
				ResultSet rs7 = st7.executeQuery(sql7);
				if(rs7.next())
				{
					out.println("<td>" +rs7.getString(1)+ "분</td>");
				}
	
			}
		}
		else if(rs9.next()){
			
			String sql13 = "select date from nuserreserv where id='" +idx+"'";
			ResultSet rs13 = st9.executeQuery(sql13);
				if(rs13.next()){
			 
					String sql10 = "select timestampdiff(minute, '"+rs13.getString(1)+"', now())-720";
					ResultSet rs10 = st10.executeQuery(sql10);
						if(rs10.next())
						{
							out.println("<td>" +rs10.getString(1)+ "분</td>");
						}
				}
		}
		
		out.println("<td>" + rs.getString("prepoint") + "</td>");
		if(rs.getInt("mobilize") == 1){
			out.println("<td>미출동</td>");
			out.println("<td><a href='boardmodechan2.jsp?id=" + rs.getString("id") +"'>취소</a></td></tr>");
		}
		if(rs.getInt("mobilize") == 0){
			out.println("<td>출동중</td>");
		}
		
		//out.println("<td>" + rs.getString("date") + "</td>");
		out.println("</tr>");
	}
	rs.close();
	}
	out.println("<tr><td colspan=5 width=700 align=center></td></tr>");
	out.println("</table></div>");
	if(rs15.next()){
		if(rs15.getString("reass") != null){
			out.println("<div id='mobile-section2' style= 'color: white'><table><center>");
			String sql66 = "SELECT * from scout where id ='";
			sql66 += rs15.getString("reass") + "'";
			ResultSet rs66 = st66.executeQuery(sql66);
			if(rs66.next())
				out.println("<tr><td align=center><center>★현재 약속장소를 향해 스카우트팀이 출동중입니다! " + rs66.getString("name") + " 스카우트의 연락처 《<div class = 'coloring'>" + rs66.getString("pnum") + "</div>》 으로 스카우트와 연락을 취해주세요!★</td></tr></table>");	
			rs66.close();
		}
		}
	out.println("</center>");
	
	session.getAttribute("userid");
	
	st.close();
	rs3.close();
	conn.close();
%>
</div>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>