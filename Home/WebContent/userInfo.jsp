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
    $('font[name=check]').html("��ȣƲ��");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("��ȣ����");
   }
  }); //#chpass.keyup
 });
</script>
<title>�����ȽɱͰ�����</title>
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
<h2>ȸ�� ���� ����</h2>
<form method="post" name = "form" action="userInfo2.jsp">
<table>
<hr>
<br>
<tr>
<td>�̸�</td>
	<td><%=rname%></td>
</tr>
<tr>
<td>���̵�</td>
	<td><%=rid%></td><td></td>
</tr>
<tr>
<td>�� �н�����</td>
   <td><input type="password" name="password" id="user_pass" style= "width:100%" required='required'></td>
   <td></td>
</tr>
<tr>
   <td>�� �н�����(Ȯ��)</td>
   <td><input type="password" name="ps2" id="chpass" style= "width:100%" required='required'></td>
   <td><font name="check" size="2" color="red"></font></td>
   
</tr>
<tr>
	<td>����ó</td>
	<td><input type="text" name="pnum" id="pnum" onkeyup="autoHypenPhone(str);" value=<%=rpnum%> style="width:100%" maxlength="13"></td>
</tr>
<tr>
	<td>�������</td>
	<td><input type="text" name="appoint" value=<%=rappoint%> style= "width:100%"></td>
</tr>

<tr>
	<td colspan=2 align="center">
	<br>
		<input type="submit" value="Ȯ��" OnClick="javascript:writeCheck();">
		<input type="reset" value="���">
	</td>
</tr>
</table>
</form>
</div>
<%} 
	
	else
	{
		out.println("<script> alert('��ȸ���� ���� ������ �� �� �����ϴ�.'); history.back(); </script>");
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