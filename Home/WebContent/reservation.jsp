<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "java.sql.*" %>



<html>
<meta charset="euc-kr">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>�����ȽɱͰ�����</title>

<link rel="stylesheet" type="text/css" href="index.css">
<body>
<%String idxx = (String)session.getAttribute("userid"); %>
<div id="session-area">
<h5>&nbsp&nbsp<%= idxx%>���� ������ �Ͱ��� å�����ϴ�!<a href = "userInfo.jsp">ȸ������ ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><a href = "logout.jsp">�α׾ƿ�&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></h5>
</div>
<center>
<div id="header-area"><a href = "main.jsp"><img src ="images/logo.png"></a></div>

	

<div id="mobile-section" style="margin-top: 3%">
<form name="form" method="post"  action="reservation2.jsp">
	
<center>
<table>
    <tr>
    <td>����ҿ�ð�</td>
        <td>
       <select name="selBox" id="select">
			<option value="60">60��</option>
			<option value="50">50��</option>
			<option value="40">40��</option>
			<option value="30">30��</option>
		  </select> 
		</td>
    </tr>
	
	<%
	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://localhost:3306/sfhomeserv";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
	String id = "root";
	String pass = "1324";
	String idx = (String)session.getAttribute("userid");
	
	String ass = request.getParameter("assarea");
	
	if (ass.equals("1")) {
		ass = "����"; }
	else if (ass.equals("2"))
		ass = "����";
	else if (ass.equals("3"))
		ass = "���";
	else if (ass.equals("4"))
		ass = "����";
	else if (ass.equals("5"))
		ass = "����";
	else if (ass.equals("6"))
		ass = "����";
	else if (ass.equals("7"))
		ass = "���빮";
	else if (ass.equals("8"))
		ass = "�߶�";
	else if (ass.equals("9"))
		ass = "���빮";
	else if (ass.equals("10"))
		ass = "��";
	else if (ass.equals("11"))
		ass = "����";
	else if (ass.equals("12"))
		ass = "����";
	else if (ass.equals("13"))
		ass = "����";
	else if (ass.equals("14"))
		ass = "���";
	else if (ass.equals("15"))
		ass = "����";
	else if (ass.equals("16"))
		ass = "��õ";
	else if (ass.equals("17"))
		ass = "����";
	else if (ass.equals("18"))
		ass = "������";
	else if (ass.equals("19"))
		ass = "��õ";
	else if (ass.equals("20"))
		ass = "����";
	else if (ass.equals("21"))
		ass = "����";
	else if (ass.equals("22"))
		ass = "����";
	else if (ass.equals("23"))
		ass = "����";
	else if (ass.equals("24"))
		ass = "����";
	else if (ass.equals("25"))
		ass = "����";
	
		
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
			out.println("<script> alert('���� ������ �ʰ������Դϴ�! �ñ��Ͻ� ���� �ٻ��ݼ��� 120�� ���� �������ּ���!'); history.back(); </script>");
		}
	
	else{
	    
	    out.println("<tr>");
	    out.println("<td>�������</td>");%>
	   <%
	 if(rs.next())
	 {
		 out.println("<td><input type = 'hidden' name='assarea' style = 'width:30%' value='" + ass + "'>" + ass + "��</td>");
		out.println("<td> <input type ='text' name ='appoint' placeholder = '����ö��/����������' style = 'width:100%' value='"+rs.getString(1)+"'></td>");
	    out.println("</tr>");
	    out.println("<tr>");
	    out.println("<td>���̵�</td>");
		out.println("<td> <input type ='text' name ='id' style = 'width:100%' value='"+rs.getString(4)+"'></td>");
    	out.println("</tr>");
	    out.println("<tr>");
		out.println("<td>�̸�</td>");
		out.println("<td><input type='text' name='name' style= 'width:100%' value='"+rs.getString(2)+"'></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>��ȭ��ȣ</td>");
		out.println("<td><input type='text' name='pnum' id = 'pnum' onkeyup='autoHypenPhone(str);' placeholder='- ���� �Է�' style= 'width:100%' maxlength='13' value='"+rs.getString(3)+"'></td>");
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
	
<td>�� ��ġ</td>
		<td><input type="text" name="prepoint" placeholder = "����ö��/����������"  style= "width:100%"></td>
	</tr>
	
	<tr>
		<td colspan=2 align="center">
		<input type="button" value="����" OnClick="javascript:writeCheck();">
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
 
 if( !form.name.value )   // form �� �ִ� name ���� ���� ��
 {
  alert( "�̸��� �����ּ���" ); // ���â ���
  form.name.focus();   // form �� �ִ� name ��ġ�� �̵�
  return;
 }
if( !form.pnum.value )
 {
  alert( "��ȭ��ȣ�� �����ּ���" );
  form.pnum.focus();
  return;
 }
 
if( !form.prepoint.value )
{
 alert( "������ġ�� �����ּ���" );
 form.prepoint.focus();
 return;
}

if( !form.assarea.value )
{
 alert( "��ī��Ʈ�� ���� ��Ҹ� �����ּ���" );
 form.assarea.focus();
 return;
}

form.submit();
}
 
 
 
</script>
</center>
</body>
</html>