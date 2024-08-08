<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 550px;
}

#customers td, #customers th {
  border: 1px solid #000000;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #333; color:#fff}
#customers tr:nth-child(odd){background-color: #555; color:#fff}

#customers tr:hover {background-color: #444; color:#fff}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #3333ff;
  color: white;
}
a:link, a:visited, a:hover, a:active {
  color: white;
  text-decoration: none;
}
</style>
<%
	ip = Request.ServerVariables("REMOTE_ADDR")	
	sql = "select * from [IPBan] where [IPAddr] = '" + ip + "'"
	Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	DSNtest="DRIVER={SQL Server};SERVER=database.itadynamics.com;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
	CN.open DSNtest
	RS.open sql,CN,3,3
	if not RS.EOF then Response.Redirect "http://www.itad365bc.com/default.html"
	RS.close
	CN.close
%>
</head>
<body bgcolor="#000000" text="#bbbbff">

<%
	getfilter=request.form("myfilter")
	if getfilter = "" then 
		getfilter2 = "%"
	else
		getfilter2 = "%" & getfilter & "%"
	end if
%>

<h1>ITAD365BC - Page Usage Log</h1>
<h2>Now: <%=now%></h2>
<h4><a href="http://www.itad365bc.com/list/index-blank.asp">(Show all blanks)</a></h4>
<h4><a href="http://www.itad365bc.com/list/unblock.asp">(Unblock IP Address)</a></h4>

<form method="post" action="/list/index.asp">
  <label for="myfilter">User ID Filter:</label>
  <input type="text" id="myfilter" name="myfilter" value=<%=getfilter%>>
  <input type="submit" value="Submit">
</form> 
<br>
<table id="customers">
<tr>
<th width="250">Time Stamp</th>
<th width="150">User ID</th>
<th width="150">IP Address</th>
</tr>

<%
	ip = Request.ServerVariables("REMOTE_ADDR")
	IPUser=Request.Cookies("user")
	If IPUser = "" then Response.Redirect "http://www.itad365bc.com/fail.html"
	
	sql = "select top 100 * from [PageLog] "
	sql = sql + "where [UserID] not like '%DAK%' "
	sql = sql + "and [IPAddr] not in (select distinct [IPAddr] from IPBan) "
	sql = sql + "and [UserID] like '" + getfilter2 + "' "
	sql = sql + "order by [ID] desc"

	Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	DSNtest="DRIVER={SQL Server};SERVER=database.itadynamics.com;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
	CN.open DSNtest
	RS.open sql,CN,3,3

	Do while not rs.EOF
		response.write("<tr>")
		response.write("<td>" & rs("tstamp") & "&nbsp;</td>")
		response.write("<td>" & rs("UserID") & "&nbsp;</td>")
		response.write("<td>")
		response.write("<a href=""http://www.itad365bc.com/list/block.asp?ip=" & rs("IPAddr") & """>")
		response.write(rs("IPAddr") & "&nbsp;</a></td>")
		response.write("</tr>")
		rs.movenext
	loop

	RS.close
	CN.close
%>
</table>
</body></html>
