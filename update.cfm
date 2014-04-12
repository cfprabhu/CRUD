<html>
<head>
	<title></title>
</head>
<body>
    
        <cfquery name="view" datasource="employe">
   	    	SELECT * FROM test
   	    	WHERE id=#url.id#
   	    </cfquery>
   	    <cfoutput>
   	     <form method="post">	
          UserName: <input type="text" name="user" value=#view.username#><br><br>
          Password: <input type="text" name="pass" value=#view.pwd#><br><br>
          Name: <input type="text" name="name" value=#view.name#><br><br>
          <input type="submit" name="update" value="UPDATE">
          </form>

         <cfif isDefined("form.update")>
          	 <cfquery name="update" datasource="employe">
          	 	UPDATE test
          	 	SET username='#form.user#',pwd='#form.pass#',name='#form.name#'
          	 	WHERE id=#url.id#
          	 </cfquery>
          	 <cflocation url="list.cfm" addtoken="false">
          </cfif>
   	    </cfoutput>
   </body>
</html>