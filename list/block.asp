<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<%
	banip = request.querystring("ip")
	if banip <> "" then

		sql = "select top 1 * from [IPBan]"
		
		Set CN = Server.CreateObject("ADODB.Connection")
		Set RS = Server.CreateObject("ADODB.Recordset")
		DSNtest="DRIVER={SQL Server};SERVER=database.itadynamics.com;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
		CN.open DSNtest
		RS.open sql,CN,3,3
		RS.addnew
		RS.fields("IPAddr") = banip
		RS.update
		RS.close
		CN.close
	end if
	Response.Redirect "http://www.itad365bc.com/list"
%>
</head>
</html>
