<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>



<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>�����ȽɱͰ�����</title>

<link rel="stylesheet" type="text/css" href="index.css">
<body>
<center>
<div id="header-area"><a href = "index.html"><img src ="images/logo.png"></a></div>

<%
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
%>
	
<div id="mobile-section" style="margin-top: 3%">
<form name="form" method="post"  action="nuserreserv2.jsp">
	
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
	
	<tr>
		<td>�̸�</td>
		<td><input type="text" name="name" style= "width:100%"></td>
	</tr>
	<tr>
		<td>�� ��ġ</td>
		<td><input type="text" name="prepoint"  style= "width:100%"></td>
	</tr>
	<tr>
	    <td>��ȭ��ȣ</td>
		<td><input type="text" name="pnum" id="pnum" placeholder="- ���� �Է�" onkeyup="autoHypenPhone(str);" maxlength='13' style= "width:100%"></td>
	</tr>
	<tr>
	    <td>�������</td>
	    
	   <%
	
	   out.println("<td><input type = 'hidden' name='assarea' style = 'width:30%' value='" + ass + "'>" + ass + "��</td>");
	%>
	<td><input type="text" name="appoint" style="width:100%"></td>
	<tr> 
		<td colspan=2 align="center">
		<input type="button" value="����" OnClick="javascript:writeCheck();">
		</td>
	</tr>
</table>
</form>
</div>
</center>


<div id="footer-area"><img src="images/copyright.png"></div>


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