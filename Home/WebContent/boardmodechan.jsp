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
	String sql4 = "SELECT * FROM scout where id='";
	sql4 += session.getAttribute("userid") + "'";
	String sql9 = "SELECT * FROM nuserreserv where id='";
	sql9 += request.getParameter("id") + "'";

	ResultSet rs = st.executeQuery(sql);//예약
	ResultSet rs4 = st4.executeQuery(sql4);//스카우트
	ResultSet rs9 = st9.executeQuery(sql9);
	
	if(rs.next() && rs4.next()){
		if (rs.getInt("mobilize")==1) {
		if (rs4.getInt("mobilize")==1 && rs.getString("reass")== null){
				String sql2 = "UPDATE reserv SET mobilize=0 where id='";
				sql2 += request.getParameter("id") + "'";
				String sql44 = "UPDATE scout SET mobilize=0 where id='";
				sql44 += session.getAttribute("userid") + "'";
				String sql444 = "UPDATE reserv SET reass='";
				sql444 += session.getAttribute("userid") + "' where id='";
				sql444 += request.getParameter("id") + "'";
				
				st2.executeUpdate(sql2);
				st4.executeUpdate(sql44);
				st44.executeUpdate(sql444);
				flag = true;
			}
			
		else if(rs4.getInt("mobilize")==0)
		{
			out.println("<script> alert('출동중에는 새로운 예약 수락이 불가능합니다!'); history.back(); </script>");
		}
	}
	
		else if (rs.getInt("mobilize")==0){ //rs->reserv rs4->scout
			if(rs4.getInt("mobilize")== 0 && rs.getString("reass").equals(session.getAttribute("userid"))){
				/*
			String sql3 = "UPDATE reserv SET mobilize=1 where id='";
			sql3 += request.getParameter("id") + "'";
			String sql44 = "UPDATE scout SET mobilize=1 where id='";
			sql44 += session.getAttribute("userid") + "'";
			String sql444 = "UPDATE reserv SET reass= 'NULL' where id='";
			sql444 += request.getParameter("id") + "'";
			st3.executeUpdate(sql3);
			st4.executeUpdate(sql44);
			st44.executeUpdate(sql444);*/
			String sql3 = "delete from reserv where id='";
			sql3 += request.getParameter("id") + "'";
			String sql44 = "UPDATE scout SET mobilize=1 where id='";
			sql44 += session.getAttribute("userid") + "'";
			
			st3.executeUpdate(sql3);
			st4.executeUpdate(sql44);
			flag = true;
		}
		
		else if (rs4.getInt("mobilize")== 1)
		{
			out.println("<script> alert('출동 수락을 하지 않은  채 완료할 수 없습니다!'); history.back(); </script>");
		}
		
		if (rs.getString("reass")!= session.getAttribute("userid"))
			{
				out.println("<script> alert('해당 건의 출동 담당이 아닙니다!'); history.back(); </script>");
			}
		}
		
	}
	
	//nuserreserv
	
	else if(rs9.next() && rs4.next()){
		if (rs9.getInt("mobilize")==1) {
		if (rs4.getInt("mobilize")==1 && rs9.getString("reass")== null){
				String sql2 = "UPDATE nuserreserv SET mobilize=0 where id='";
				sql2 += request.getParameter("id") + "'";
				String sql44 = "UPDATE scout SET mobilize=0 where id='";
				sql44 += session.getAttribute("userid") + "'";
				String sql444 = "UPDATE nuserreserv SET reass='";
				sql444 += session.getAttribute("userid") + "' where id='";
				sql444 += request.getParameter("id") + "'";
				
				st2.executeUpdate(sql2);
				st4.executeUpdate(sql44);
				st44.executeUpdate(sql444);
				flag = true;
			}
			
		else if(rs4.getInt("mobilize")==0)
		{
			out.println("<script> alert('출동중에는 새로운 예약 수락이 불가능합니다!'); history.back(); </script>");
		}
	}
	
		else if (rs9.getInt("mobilize")==0){ //rs->reserv rs4->scout
			if(rs4.getInt("mobilize")== 0 && rs9.getString("reass").equals(session.getAttribute("userid"))){
				/*
			String sql3 = "UPDATE reserv SET mobilize=1 where id='";
			sql3 += request.getParameter("id") + "'";
			String sql44 = "UPDATE scout SET mobilize=1 where id='";
			sql44 += session.getAttribute("userid") + "'";
			String sql444 = "UPDATE reserv SET reass= 'NULL' where id='";
			sql444 += request.getParameter("id") + "'";
			st3.executeUpdate(sql3);
			st4.executeUpdate(sql44);
			st44.executeUpdate(sql444);*/
			String sql3 = "delete from nuserreserv where id='";
			sql3 += request.getParameter("id") + "'";
			String sql44 = "UPDATE scout SET mobilize=1 where id='";
			sql44 += session.getAttribute("userid") + "'";
			
			st3.executeUpdate(sql3);
			st4.executeUpdate(sql44);
			flag = true;
		}
		
		else if (rs4.getInt("mobilize")== 1)
		{
			out.println("<script> alert('출동 수락을 하지 않은  채 완료할 수 없습니다!'); history.back(); </script>");
		}
		
		if (rs9.getString("reass")!= session.getAttribute("userid"))
			{
				out.println("<script> alert('해당 건의 출동 담당이 아닙니다!'); history.back(); </script>");
			}
		}
		
	}
	
	st.close();
	st2.close();
	st3.close();
	st4.close();
	st9.close();
	st44.close();
	rs.close();
	conn.close();
	
	if (flag)
	{
		response.sendRedirect("board.jsp");
	}
%>
</div>
<div id="footer-area"><img src="images/copyright.png"></div>
</center>
</body>