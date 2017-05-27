<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>



<html>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>여성안심귀가서비스</title>

<link rel="stylesheet" type="text/css" href="index.css">
<body>
<%String idxx = (String)session.getAttribute("userid"); %>
<div id="session-area">
<h5>&nbsp&nbsp<%= idxx%>님의 안전한 귀가를 책입집니다!<a href = "userInfo.jsp">회원정보 수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><a href = "logout.jsp">로그아웃&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></h5>
</div>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>

	

<div id="mobile-section" style="margin-top: 3%">
<form name="form" method="post"  action="reservation2.jsp">
	
<center>
<table>
    <tr>
    <td>예상소요시간</td>
        <td>
       <select name="selBox" id="select">
			<option value="60">60분</option>
			<option value="50">50분</option>
			<option value="40">40분</option>
			<option value="30">30분</option>
		  </select> 
		</td>
    </tr>
	
	<%
	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://localhost:3306/sfhomeserv";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
	String id = "root";
	String pass = "1324";
	String idx = (String)session.getAttribute("userid");
	
	String ass = request.getParameter("assarea");
	
	if (ass.equals("1")) {
		ass = "강북"; }
	else if (ass.equals("2"))
		ass = "도봉";
	else if (ass.equals("3"))
		ass = "노원";
	else if (ass.equals("4"))
		ass = "은평";
	else if (ass.equals("5"))
		ass = "종로";
	else if (ass.equals("6"))
		ass = "성북";
	else if (ass.equals("7"))
		ass = "동대문";
	else if (ass.equals("8"))
		ass = "중랑";
	else if (ass.equals("9"))
		ass = "서대문";
	else if (ass.equals("10"))
		ass = "중";
	else if (ass.equals("11"))
		ass = "성동";
	else if (ass.equals("12"))
		ass = "광진";
	else if (ass.equals("13"))
		ass = "마포";
	else if (ass.equals("14"))
		ass = "용산";
	else if (ass.equals("15"))
		ass = "강서";
	else if (ass.equals("16"))
		ass = "양천";
	else if (ass.equals("17"))
		ass = "구로";
	else if (ass.equals("18"))
		ass = "영등포";
	else if (ass.equals("19"))
		ass = "금천";
	else if (ass.equals("20"))
		ass = "동작";
	else if (ass.equals("21"))
		ass = "관악";
	else if (ass.equals("22"))
		ass = "서초";
	else if (ass.equals("23"))
		ass = "강남";
	else if (ass.equals("24"))
		ass = "송파";
	else if (ass.equals("25"))
		ass = "강동";
	
		
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	Statement stmt3 = conn.createStatement();
		
	String sql = "SELECT appoint, name, pnum, id FROM user WHERE id='" + idx+"'";
	String sql2 = "select count(id) from reserv where assarea='";
	sql2 += ass + "'";
	String sql3 = "select count(id) from nuserreserv where assarea='";
	sql3 += ass + "'";

	ResultSet rs = stmt.executeQuery(sql);
	ResultSet rs2 = stmt2.executeQuery(sql2);
	ResultSet rs3 = stmt3.executeQuery(sql3);
	
	
	if(rs2.next() && rs3.next()){
		int nrea = rs3.getInt(1);
		int rea = rs2.getInt(1);
		if(nrea + rea == 3) {
			out.println("<script> alert('현재 예약이 초과상태입니다! 궁금하신 점은 다산콜센터 120을 통해 문의해주세요!'); history.back(); </script>");
		}
	
	else{
	    
	    out.println("<tr>");
	    out.println("<td>만날장소</td>");%>
	   <%
	 if(rs.next())
	 {
		 out.println("<td><input type = 'hidden' name='assarea' style = 'width:30%' value='" + ass + "'>" + ass + "구</td>");
		out.println("<td> <input type ='text' name ='appoint' placeholder = '지하철역/버스정류장' style = 'width:100%' value='"+rs.getString(1)+"'></td>");
	    out.println("</tr>");
	    out.println("<tr>");
	    out.println("<td>아이디</td>");
		out.println("<td> <input type ='text' name ='id' style = 'width:100%' value='"+rs.getString(4)+"'></td>");
    	out.println("</tr>");
	    out.println("<tr>");
		out.println("<td>이름</td>");
		out.println("<td><input type='text' name='name' style= 'width:100%' value='"+rs.getString(2)+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>전화번호</td>");
		out.println("<td><input type='text' name='pnum' id = 'pnum' onkeyup='autoHypenPhone(str);' placeholder='- 없이 입력' style= 'width:100%' maxlength='13' value='"+rs.getString(3)+"'></td>");
		out.println("</tr>");
	 }
	}
	}
	
	stmt.close();
	stmt2.close();
	stmt3.close();
	rs.close();
	rs2.close();
	rs3.close();
		%>
	<tr>
	
<td>내 위치</td>
		<td><input type="text" name="prepoint" placeholder = "지하철역/버스정류장"  style= "width:100%"></td>
	</tr>
	
	<tr>
		<td colspan=2 align="center">
		<input type="button" value="예약" OnClick="javascript:writeCheck();">
		</td>
	</tr>
	</center>
</table>
</form>
</div>


<div id="footer-area"><img src="images/copyright.png"></div>


<script>
/*
function view(){
	
	if(document.form.checkbutton.checked==true)
		{
		document.form.appoint.disabled = true;
		document.form.name.disabled = true;
		document.form.pnum.disabled = true;
		
		
		
		}
	else{
		if(document.form.checkbutton.checked == false)
			{
			document.form.appoint.disabled = false;
			document.form.name.disabled = false;
			document.form.pnum.disabled = false;
			}
	}

}*/

function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var pnum = document.getElementById('pnum');
pnum.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}
 
 
 
function writeCheck()
{
 var form = document.form;
 
 if( !form.name.value )   // form 에 있는 name 값이 없을 때
 {
  alert( "이름을 적어주세요" ); // 경고창 띄움
  form.name.focus();   // form 에 있는 name 위치로 이동
  return;
 }
if( !form.pnum.value )
 {
  alert( "전화번호를 적어주세요" );
  form.pnum.focus();
  return;
 }
 
if( !form.prepoint.value )
{
 alert( "현재위치를 적어주세요" );
 form.prepoint.focus();
 return;
}

if( !form.assarea.value )
{
 alert( "스카우트와 만날 장소를 적어주세요" );
 form.assarea.focus();
 return;
}

form.submit();
}
 
 
 
</script>
</center>
</body>
</html>