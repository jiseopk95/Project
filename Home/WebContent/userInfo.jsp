<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<html>
<head>
<meta charset="euc-kr">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
 $(function(){
  $('#user_pass').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#chpass').keyup(function(){
   if($('#user_pass').val()!=$('#chpass').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("암호틀림");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("암호맞음");
   }
  }); //#chpass.keyup
 });
</script>
<title>여성안심귀가서비스</title>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>
<%
	String idx = (String)session.getAttribute("userid");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
	Statement st = conn.createStatement();
	String sql = "SELECT * FROM user where id ='";
	sql += session.getAttribute("userid") + "'";
	ResultSet rs = st.executeQuery(sql);
	
	if(rs.next()){
	String rname = rs.getString("name");
	String rid = rs.getString("id");
	String rpnum = rs.getString("pnum");
	String rappoint = rs.getString("appoint");
	
%>
<div id="mobileselect-section2" style= "margin:5%">
<center>
<h2>회원 정보 수정</h2>
<form method="post" name = "form" action="userInfo2.jsp">
<table>
<hr>
<br>
<tr>
<td>이름</td>
	<td><%=rname%></td>
</tr>
<tr>
<td>아이디</td>
	<td><%=rid%></td><td></td>
</tr>
<tr>
<td>새 패스워드</td>
   <td><input type="password" name="password" id="user_pass" style= "width:100%" required='required'></td>
   <td></td>
</tr>
<tr>
   <td>새 패스워드(확인)</td>
   <td><input type="password" name="ps2" id="chpass" style= "width:100%" required='required'></td>
   <td><font name="check" size="2" color="red"></font></td>
   
</tr>
<tr>
	<td>연락처</td>
	<td><input type="text" name="pnum" id="pnum" onkeyup="autoHypenPhone(str);" value=<%=rpnum%> style="width:100%" maxlength="13"></td>
</tr>
<tr>
	<td>만남장소</td>
	<td><input type="text" name="appoint" value=<%=rappoint%> style= "width:100%"></td>
</tr>

<tr>
	<td colspan=2 align="center">
	<br>
		<input type="submit" value="확인" OnClick="javascript:writeCheck();">
		<input type="reset" value="취소">
	</td>
</tr>
</table>
</form>
</div>
<%} 
	
	else
	{
		out.println("<script> alert('비회원은 정보 수정을 할 수 없습니다.'); history.back(); </script>");
	}
%>
</center>
</body>
<script>
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
</script>
</html>