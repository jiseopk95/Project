<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.sql.*,java.sql.*,javax.naming.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>���̵� �ߺ�üũ</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String f_id = (String)request.getParameter("id");
int check = -1;


Connection conn = null;
Statement st = null;
ResultSet rs = null;

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sfhomeserv", "root", "1234");
		
		String q1 = "select id from user where id = '"+f_id+"'";
		st = conn.createStatement();
		st.executeQuery(q1);
		rs=st.executeQuery(q1);
		if(rs.next())
		{
			check = 1;
		}
		else
		{
			check = 0;
		}
	}finally{
		if(rs != null)try {rs.close();} catch(SQLException err){}
		if(st != null)try {st.close();} catch(SQLException err){}
		if(conn != null)try {conn.close();} catch(SQLException err){}
	}
	
	
	
if(check==1)
{
	
%>
<b><font color='red'><%=f_id %></font>�� �̹� ������� ���̵��Դϴ�.</b>
<form name="checkFrom" method="post" action="idCheck.jsp">
<b>�ٸ� ���̵� �����ϼ���</b> <br/><br/>
<input type="text" name="id"/>
<input type="submit" value="ID�ߺ�Ȯ��"/>
</form>
<%
}
else
{
%>
<center>
<b>�Է��Ͻ�<front color="red"><%=f_id %></front>��<br/>
����Ͻ� �� �ִ� ID�Դϴ�.</b>
<input type="button" value="�ݱ�" onclick="setid()">
</center>


<%
}
%>

<script>
function setid()
{
	opener.form.id.value='<%=f_id%>';
	window.self.close();
}
</script>
</body>
</html>
