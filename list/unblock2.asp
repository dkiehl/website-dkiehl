<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<%
	unblockip = request.form("unblockip")

	Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	DSNtest="DRIVER={SQL Server};SERVER=database.itadynamics.com;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"

	sql = "delete from [IPBan] where [IPAddr] = '" + unblockip + "'"
	CN.open DSNtest
	CN.execute sql

	sql = "delete from [PageLog] where [IPAddr] = '" + unblockip + "'"
	CN.execute sql
	CN.close

	Response.Redirect "http://www.itad365bc.com/list"
%>	
</head>
</html>
