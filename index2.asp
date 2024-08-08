<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<link rel="stylesheet" type="text/css" href="/css/style2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
</head>
<body>

<%
	getfilter=request.form("myfilter")
	if getfilter = "" then 
		getfilter = request.querystring("filter")
		if getfilter = "" then
			getfilter2 = "%"
		else
			getfilter2 = "%" & getfilter & "%"
		end if
	else
		getfilter2 = "%" & getfilter & "%"
	end if
%>
<table><tr><td>
<form method="post" action="/index.asp">
  <font color="Black">Filter:</font>
  <input type="text" id="myfilter" name="myfilter" autofocus>
  <input type="submit" value="Submit">
</form>
</td></tr></table>

<center>
<%
	CorrectPassword = "DarkPanda828$"
	CorrectPassword2 = "DarkPanda828$"

	inUser=Request.Cookies("user")
	inPass=Request.Cookies("pass")
			
	if inUser = "" then
		Response.Redirect "http://www.itad365bc.com/default.html"
	end if
	if inPASS <> CorrectPassword then
		if inPASS <> CorrectPassword2 then
			Response.Redirect "http://www.itad365bc.com/default.html"
		end if
	end if
	
	If GetFilter2 = "" then
		sql = "select * from [PageTable] where [user] in ('') order by [LineNo]"
	else
		sql = "select * from [PageTable] where [user] in ('') order by [LineNo]"
		sql = "select * from [PageTable] where [user] in ('') and [LineType] in ('A','B') union "
		sql = sql & "select * from [PageTable] where [user] in ('') and [LineText] like '" + GetFilter2 + "' order by [LineNo]"		
	end if

	If GetFilter = "DAK" then
		sql = "select * from [PageTable] order by [LineNo]"
        end if
		
	LineS = "<tr><td id=""spacer"">&nbsp;</td></tr>"
	Indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"

	Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	
	DSNtest="DRIVER={SQL Server};SERVER=184.168.47.13;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
	DSNtest="DRIVER={SQL Server};SERVER=timesheets.database.windows.net;UID=dkiehl;PWD=WNMhgb1701;DATABASE=timesheets"

	CN.open DSNtest
	RS.open sql,CN
	do while not RS.EOF
	  count = count + 1

	  linetype = rs.fields("LineType").value
	  
	  if rs.fields("user").value = "" then
	    ptr = ""
	  else
		ptr = "*"
		if linetype = "C" or linetype = "D" then
			linetype = "E"
		end if
	  end if

	  tmp = Split(rs.fields("LineText").value & "~","~")
	  leftstr = tmp(0)
	  rightstr = tmp(1)

	  select case LineType
		Case "A": 
			LineA = LineS & "</table><br><br><br><table id=""headerA"" width=""700px""><th><center>" & rs.fields("LineText").value & "</center></th>"
		Case "B":
			pm = rs.fields("ContainerName").value
			if pm <> "" then pm = "(PM: " & pm & ")"
		
			LineB = LineS & "<tr><td id=""headerB"">" & indent
			LineB = LineB & "<div style=""float: left; text-align: left; width=50%;"">" & leftstr & ptr & "</div>"
			LineB = LineB & "<div style=""float: right; text-align: right; width=50%;"">" & rightstr & pm & "</div>"
			LineB = LineB & "</button></center></td></tr>"

		Case "C":
			if LastType = "A" then response.write("<tr><td><b>")
			LineC = "<tr><td id=""headerC"">" & "<center><a href=""" & rs.fields("Link").value & """ target=""_blank""><button class=""button"" type=""button"">"
			LineC = LineC & "<div style=""float: left; text-align: left; width=50%;"">" & leftstr & ptr & "</div>"
			LineC = LineC & "<div style=""float: right; text-align: right; width=50%;"">" & rightstr & "</div>"
			LineC = LineC & "</button></center></td></tr>"

			response.write(LineA)
			LineA = ""
			response.write(LineB)
			LineB = ""
			response.write(LineC)
			
		Case "D":
			if LastType = "A" then response.write("<tr><td><b>")
			LineC = "<tr><td id=""headerC"">" & "<center><a href=""" & rs.fields("Link").value & """ target=""_blank""><button class=""button2"" type=""button"">"
			LineC = LineC & "<div style=""float: left; text-align: left; width=50%;"">" & leftstr & ptr & "</div>"
			LineC = LineC & "<div style=""float: right; text-align: right; width=50%;"">" & rightstr & " (Live Customer Data)</div>"
			LineC = LineC & "</button></center></td></tr>"

			response.write(LineA)
			LineA = ""
			response.write(LineB)
			LineB = ""
			response.write(LineC)
			
		Case "E":
			if LastType = "A" then response.write("<tr><td><b>")
			LineC = "<tr><td id=""headerC"">" & "<center><a href=""" & rs.fields("Link").value & """ target=""_blank""><button class=""button3"" type=""button"">"
			LineC = LineC & "<div style=""float: left; text-align: left; width=50%;"">" & leftstr & ptr & "</div>"
			LineC = LineC & "<div style=""float: right; text-align: right; width=50%;"">" & rightstr & "</div>"
			LineC = LineC & "</button></center></td></tr>"

			response.write(LineA)
			LineA = ""
			response.write(LineB)
			LineB = ""
			response.write(LineC)
	  end select
	  rs.movenext
	loop

	response.write("</table>")
	RS.close
	CN.close
%>


</center></body></html>
