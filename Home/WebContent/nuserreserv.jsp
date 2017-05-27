<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>



<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maxium-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>여성안심귀가서비스</title>

<link rel="stylesheet" type="text/css" href="index.css">
<body>
<center>
<div id="header-area"><a href = "index.html"><img src ="images/logo.png"></a></div>

<%
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
%>
	
<div id="mobile-section" style="margin-top: 3%">
<form name="form" method="post"  action="nuserreserv2.jsp">
	
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
	
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" style= "width:100%"></td>
	</tr>
	<tr>
		<td>내 위치</td>
		<td><input type="text" name="prepoint"  style= "width:100%"></td>
	</tr>
	<tr>
	    <td>전화번호</td>
		<td><input type="text" name="pnum" id="pnum" placeholder="- 없이 입력" onkeyup="autoHypenPhone(str);" maxlength='13' style= "width:100%"></td>
	</tr>
	<tr>
	    <td>만날장소</td>
	    
	   <%
	
	   out.println("<td><input type = 'hidden' name='assarea' style = 'width:30%' value='" + ass + "'>" + ass + "구</td>");
	%>
	<td><input type="text" name="appoint" style="width:100%"></td>
	<tr> 
		<td colspan=2 align="center">
		<input type="button" value="예약" OnClick="javascript:writeCheck();">
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