<html>
<head>
	<title></title>
</head>
<body>
    <cfquery name="delete" datasource="employe">
    	delete from test
        where id=#url.id#		
    </cfquery>

    <cflocation url="list.cfm" addtoken="false">
</body>
</html>