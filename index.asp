<!DOCTYPE html> <html> <head> <title>ITA Dynamics Links</title>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link rel="stylesheet" type="text/css" href="/css/style2.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
    </head>

    Set CN = Server.CreateObject("ADODB.Connection")
	Set RS = Server.CreateObject("ADODB.Recordset")
	
	DSNtest="DRIVER={SQL Server};SERVER=184.168.47.13;UID=sqluser;PWD=Za7n8!9k;DATABASE=itadynamic_ipaddr"
	DSNtest="DRIVER={SQL Server};SERVER=timesheets.database.windows.net;UID=dkiehl;PWD=WNMhgb1701;DATABASE=timesheets"
	
    sql = 'Select count as Count from [PgeTable]'
	CN.open DSNtest
	RS.open sql,CN

    RS.close
	CN.close
%>
<body>Hello</body>   
</html>