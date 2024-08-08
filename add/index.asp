<html>
<head>
<style>
table {
  width: 600px;
}
th {
  padding-top: 20px;
  padding-bottom: 7px;
  padding-left: 40px;
  padding-right: 40px;
}
td {
  padding-top: 20px;
  padding-bottom: 7px;
  padding-left: 40px;
  padding-right: 40px;
}
</style>
</head>
<body bgcolor="#a4d8fc">
<table><tr><th>
<h2>ITA Dynamics - Corporate Links</h2>
</th></tr></table>
<br>
<%
	IPUser=Request.Cookies("user")	
%>
<table>
<form method="post" action="index2.asp">
	<tr><td width="150">Current Username:</td><td width="200"><%=IPUser%></td><tr>
	<tr><td>Enter New Username:</td><td><input type="text" id="user" name="user"></td></tr>
	<tr><td>Enter VMAdmin Password:</td><td><input type="password" id="pwd" name="pwd"></td></tr>
	<tr><td colspan="2"><input type="submit" value="Submit"></td></tr>
</form>
</table>
</body></html>
