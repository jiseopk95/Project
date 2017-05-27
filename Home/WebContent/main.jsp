<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<meta charset="euc-kr">
<head>
<title>여성 안심귀가서비스</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<%String idx = (String)session.getAttribute("userid"); %>
<div id="session-area">
<h5>&nbsp&nbsp<%= idx%>님의 안전한 귀가를 책입집니다!<a href = "userInfo.jsp">회원정보 수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><a href = "logout.jsp">로그아웃&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></h5>
</div>
<center>
<%
	String uid = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	Statement st2 = conn.createStatement();
	Statement st3 = conn.createStatement();
	Statement st4 = conn.createStatement();
	Statement st5 = conn.createStatement();
	Statement st6 = conn.createStatement();
	Statement st7 = conn.createStatement();
	Statement st8 = conn.createStatement();
	Statement st9 = conn.createStatement();
	Statement st10 = conn.createStatement();
	Statement st11 = conn.createStatement();
	Statement st12 = conn.createStatement();
	Statement st13 = conn.createStatement();
	Statement st14 = conn.createStatement();
	Statement st15 = conn.createStatement();
	Statement st16 = conn.createStatement();
	Statement st17 = conn.createStatement();
	Statement st18 = conn.createStatement();
	Statement st19 = conn.createStatement();
	Statement st20 = conn.createStatement();
	Statement st21 = conn.createStatement();
	Statement st22 = conn.createStatement();
	Statement st23 = conn.createStatement();
	Statement st24 = conn.createStatement();
	Statement st25 = conn.createStatement();
	Statement st26 = conn.createStatement();
	ResultSet rs1 = st.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '강북'");
	ResultSet rs2 = st2.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '도봉'");
	ResultSet rs3 = st3.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '노원'");
	ResultSet rs4 = st4.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '은평'");
	ResultSet rs5 = st5.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '종로'");
	ResultSet rs6 = st6.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '성북'");
	ResultSet rs7 = st7.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '동대문'");
	ResultSet rs8 = st8.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '중랑'");
	ResultSet rs9 = st9.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '서대문'");
	ResultSet rs10 = st10.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '중'");
	ResultSet rs11 = st11.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '성동'");
	ResultSet rs12 = st12.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '광진'");
	ResultSet rs13 = st13.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '마포'");
	ResultSet rs14 = st14.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '용산'");
	ResultSet rs15 = st15.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '강서'");
	ResultSet rs16 = st16.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '양천'");
	ResultSet rs17 = st17.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '구로'");
	ResultSet rs18 = st18.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '영등포'");
	ResultSet rs19 = st19.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '금천'");
	ResultSet rs20 = st20.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '동작'");
	ResultSet rs21 = st21.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '관악'");
	ResultSet rs22 = st22.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '서초'");
	ResultSet rs23 = st23.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '강남'");
	ResultSet rs24 = st24.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '송파'");
	ResultSet rs25 = st25.executeQuery("SELECT count(mobilize) FROM scout where mobilize = 1 and assarea = '강동'");
	ResultSet rs26 = st26.executeQuery("SELECT area FROM area");
	
%>
<div id="header-area"><a href = "index.html"><img src ="images/logo.png"></a></div>
<div id="list-section" style= 'margin-top:5%'>
	<div class ="night">
	<a href ="reservation.jsp?assarea=1"><img src="images/gb/gangbook.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs1.next()){
		int gb = rs1.getInt(1);
		
	out.println(gb + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=2'><img src="images/gb/dobong.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs2.next()){
		int db = rs2.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=3'><img src="images/gb/nowon.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs3.next()){
		int db = rs3.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=4'><img src="images/gb/eunpyeong.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs4.next()){
		int db = rs4.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=5'><img src="images/gb/jongro.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs5.next()){
		int db = rs5.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=6'><img src="images/gb/seongbook.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs6.next()){
		int db = rs6.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=7'><img src="images/gb/dongdaemun.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs7.next()){
		int db = rs7.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=8'><img src="images/gb/joongrang.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs8.next()){
		int db = rs8.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=9'><img src="images/gb/seodaemun.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs9.next()){
		int db = rs9.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=10'><img src="images/gb/joongoo.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs10.next()){
		int db = rs10.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=11'><img src="images/gb/seongdong.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs11.next()){
		int db = rs11.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=12'><img src="images/gb/kwangjin.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs12.next()){
		int db = rs12.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=13'><img src="images/gb/mapo.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs13.next()){
		int db = rs13.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=14'><img src="images/gb/yongsan.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs14.next()){
		int db = rs14.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=15'><img src="images/gn/gangseo.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs15.next()){
		int db = rs15.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=16'><img src="images/gn/yangcheon.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs16.next()){
		int db = rs16.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=17'><img src="images/gn/gooro.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs17.next()){
		int db = rs17.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
     <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=18'><img src="images/gn/youngdeunpo.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs18.next()){
		int db = rs18.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=19'><img src="images/gn/geumcheon.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs19.next()){
		int db = rs19.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=20'><img src="images/gn/dongjak.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs20.next()){
		int db = rs20.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=21'><img src="images/gn/kwanak.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs21.next()){
		int db = rs21.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=22'><img src="images/gn/seocho.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs22.next()){
		int db = rs22.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=23'><img src="images/gn/gangnam.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs23.next()){
		int db = rs23.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=24'><img src="images/gn/songpa.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs24.next()){
		int db = rs24.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    <br>
    <div class ="night">
	<a href ='reservation.jsp?assarea=25'><img src="images/gn/gangdong.png"></a>
	<%
	out.println("<td>출동가능 팀수: ");
	
	if(rs25.next()){
		int db = rs25.getInt(1);
		
	out.println(db + "팀</td>");
	}
	%>
    </div>
    </div>
    <%
    st.close();
	st2.close();
	st3.close();
	st4.close();
	st5.close();
	st6.close();
	st7.close();
	st8.close();
	st9.close();
	st10.close();
	st11.close();
	st12.close();
	st13.close();
	st14.close();
	st15.close();
	st16.close();
	st17.close();
	st18.close();
	st19.close();
	st20.close();
	st21.close();
	st22.close();
	st23.close();
	st24.close();
	st25.close();
	rs1.close();
	rs2.close();
	rs3.close();
	rs4.close();
	rs5.close();
	rs6.close();
	rs7.close();
	rs8.close();
	rs9.close();
	rs10.close();
	rs11.close();
	rs12.close();
	rs13.close();
	rs14.close();
	rs15.close();
	rs16.close();
	rs17.close();
	rs18.close();
	rs19.close();
	rs20.close();
	rs21.close();
	rs22.close();
	rs23.close();
	rs24.close();
	rs25.close();
	conn.close();
    %>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>
</html>