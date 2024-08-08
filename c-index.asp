<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body><center>

<%
	IPUser=Request.Cookies("user")
	If IPUser = "" then Response.Redirect "http://www.itad365bc.com/fail.html"
	
	sql = "select * from [PageTable] where [user] in ('','" + IPUser + "') order by [LineNo]"
	if IPUser = "ALL" then
		sql = "select * from [PageTable] order by [LineNo]"
	end if
	indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	indent2 = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	LastType = "A"

	Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	DSNtest="DRIVER={SQL Server};SERVER=184.168.47.13;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
	CN.open DSNtest
	RS.open sql,CN
	do while not RS.EOF
	  count = count + 1

	  ptr = "  ***  "
	  if rs.fields("user").value = "" then
	    ptr = ""
	  end if

	  select case rs.fields("LineType").value
		Case "A": 
			response.write("<br></td></tr></table><br><br><table id=""customers"" width=""500px""><th><center>" & rs.fields("LineText").value & "</center></th>")
			count = 0
		Case "B":
			pm = rs.fields("ContainerName").value
			if pm <> "" then pm = "&nbsp;&nbsp;&nbsp;(PM: " & pm & ")"
			if LastType = "A" then response.write("<tr><td><b>")
			if (LastType = "C") or (LastType = "D") then response.write("<br></td></tr><tr><td><b>")
			response.write("<br><font color=""navy"" size=""+2"">" & indent2 & rs.fields("LineText").value & pm & "</font>" & ptr & "<br>")
			count = 0
		Case "C": 
			if LastType = "A" then response.write("<tr><td><b>")
			response.write("<br></b>" & indent & "<button class=""button"" onclick=""location.href='" & rs.fields("Link").value & "'"" type=""button"">" & rs.fields("LineText").value & ptr & "</button><br>")

		Case "D": 
			if LastType = "A" then response.write("<tr><td><b>")
			response.write("<br></b>" & indent & "<button class=""button2"" onclick=""location.href='" & rs.fields("Link").value & "'"" type=""button"">" & rs.fields("LineText").value & ptr & " (Live Customer Data)</button><br>")
	  end select

	  LastType = rs.fields("LineType").value

	  rs.movenext
	loop

	response.write("<br></td></tr>")
	RS.close
	CN.close
%>


</center></body></html>
