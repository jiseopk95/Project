<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.script.Invocable"%>
<%@ page import="javax.script.ScriptEngine"%>
<%@ page import="javax.script.ScriptEngineManager"%>
<%@ page import="javax.script.ScriptException"%>


<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<title>여성 안심귀가서비스</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body onload="minute();">
<%String idx = (String)session.getAttribute("userid"); %>
<div id="session-area">
<h5><a href = "logout.jsp">로그아웃&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></h5>
</div>
<center>
<div id="header-area"><a href = "board.jsp"><img src ="images/logo.png"></a></div>
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	String sql2 = "SELECT assarea FROM scout where id ='";
	sql2 += session.getAttribute("userid") + "'";
	ResultSet rs2 = st2.executeQuery(sql2);//세션 아이디의 assarea 받아오는 거
%>
<%
	out.println("<center><br>");
	out.println("<div id='mobile-section' style= 'margin:5%'>");
	out.println("<img src ='images/reserv.png' style='margin-bottom:2%'>");
	out.println("<table><center>");
	out.println("<tr align=center style='color:white'><td>이름</td>");
	out.println("<td>연락처</td>");
	out.println("<td>약속장소</td>");
	out.println("<td>소요시간</td>");
	out.println("<td>경과시간</td>");
	out.println("<td>현재위치</td>");
	out.println("<td>출동여부</td></tr>");
	
	if(rs2.next()) {
		String sql = "(SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM reserv where assarea ='";
		sql += rs2.getString("assarea") + "') union (SELECT id, name, pnum, extime, prepoint, appoint, mobilize FROM nuserreserv where assarea ='";
		sql += rs2.getString("assarea") + "')";
		ResultSet rs = st.executeQuery(sql);
		
		ScriptEngine scriptEngine = new ScriptEngineManager().getEngineByName("JavaScript");
		
		SimpleDateFormat dfhm        = new SimpleDateFormat("yyyyMMddHHmm");
		Calendar cal = Calendar.getInstance();

		
	while(rs.next())
	{
		out.println("<tr align=center>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getString("pnum") + "</td>");
		out.println("<td>" + rs.getString("appoint") + "</td>");
		out.println("<td>" + rs.getString("extime") + "분</td>");
		//out.println("<script>minute();</script>");
			/*out.print("<SCRIPT LANGUAGE='JavaScript'>");
			out.print("var msecPerMinute = 1000 * 60;");
			out.print("var msecPerHour = msecPerMinute * 60;");
			out.print("var msecPerDay = msecPerHour * 24;");
			out.print("var date = new Date(rs.getString('date'));");
			out.print("var dateMsec = date.getTime();");
			out.print("date.setMonth(0);");
			out.print("date.setDate(1);");
			out.print("date.setHours(0, 0, 0, 0);");
			out.print("var interval = dateMsec - date.getTime();");
			out.print("var days = Math.floor(interval / msecPerDay );");
			out.print("interval = interval - (days * msecPerDay );");
			out.print("var hours = Math.floor(interval / msecPerHour );");
			out.print("interval = interval - (hours * msecPerHour );");
			out.print("var minutes = Math.floor(interval / msecPerMinute );");
			out.print("interval = interval - (minutes * msecPerMinute );");
			out.print("var seconds = Math.floor(interval / 1000 );");
			//out.print("minutes + ' minutes, ' + seconds + ' seconds.");
			out.print("</SCRIPT>");*/
			out.println("<td onload='minute();'>분</td>");
		out.println("<td>" + rs.getString("prepoint") + "</td>");
		if(rs.getInt("mobilize") == 0){
			out.println("<td>출동중</td>");
			out.println("<td><a href='boardmodechan.jsp?id=" + rs.getString("id") + "'>완료</a></td>");
		}
		else if(rs.getInt("mobilize") == 1){
			out.println("<td>출동가능</td>");
			out.println("<td><a href='boardmodechan.jsp?id=" + rs.getString("id") +"'>출동</a></td>");
		}
		//out.println("<td>" + rs.getString("date") + "</td>");
		out.println("</tr>");
	}
	rs.close();
	}
	out.println("<tr><td colspan=5 width=700 align=center>");
	out.println("</table>");
	out.println("</center>");
	
	session.getAttribute("userid");
	
	st.close();
	rs2.close();
	conn.close();
%>
</div>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>

<script type="text/javascript">
function minute(){
//Set the unit values in milliseconds.
var msecPerMinute = 1000 * 60;
var msecPerHour = msecPerMinute * 60;
var msecPerDay = msecPerHour * 24;

// Set a date and get the milliseconds
var date = new Date(rs.getString("date"));
var dateMsec = date.getTime();

// Set the date to January 1, at midnight, of the specified year.
date.setMonth(0);
date.setDate(1);
date.setHours(0, 0, 0, 0);

// Get the difference in milliseconds.
var interval = dateMsec - date.getTime();

// Calculate how many days the interval contains. Subtract that
// many days from the interval to determine the remainder.
var days = Math.floor(interval / msecPerDay );
interval = interval - (days * msecPerDay );

// Calculate the hours, minutes, and seconds.
var hours = Math.floor(interval / msecPerHour );
interval = interval - (hours * msecPerHour );

var minutes = Math.floor(interval / msecPerMinute );
interval = interval - (minutes * msecPerMinute );

var seconds = Math.floor(interval / 1000 );

// Display the result.
document.write(  minutes + " minutes, " + seconds + " seconds.");
}
</script>
