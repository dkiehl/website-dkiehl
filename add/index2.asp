<html><body>
<%
	CorrectPassword = "DarkPanda828$"
	CorrectPassword2 = "DarkPanda828$"
	
	inUSER = request.form("user")
	inPWD = request.form("pwd")
	ip = Request.ServerVariables("REMOTE_ADDR")
	
	if inPWD = CorrectPassword or inPWD = CorrectPassword2 then

		Response.Cookies("user") = UCase(inUSER)
		Response.Cookies("user").Expires=#Dec 31,2030#
		Response.Cookies("pass") = CorrectPassword2
		Response.Cookies("pass").Expires=#Dec 31,2030#
				
	else
	
		Response.Cookies("user") = ""
		Response.Cookies("user").Expires=#Dec 31,2030#
		Response.Cookies("pass") = ""
		Response.Cookies("pass").Expires=#Dec 31,2030#
			
	end if

	Response.Redirect "http://www.itad365bc.com"
	
%></body></html>
