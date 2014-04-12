<html>
<head>
	<title></title>
</head>
<body>
   <form name="form1" action="" method="post">
   	UserName:  <input type="text" name="Uname" ><br><br>
   	Password:  <input type="text" name="password"><br><br>
   	Name: <input type="text" name="Name"><br><br>
   	 <input type="submit" name="submit" value="ADD">
   </form>
   
        <cfif isDefined("form.submit")>
        	<cfquery name="adding" datasource="employe">
        	  insert into test (username,pwd,name)
        	  values ('#form.Uname#','#form.password#','#form.name#')	
        	</cfquery>
          <cflocation url="list.cfm" addtoken="false">	  	
        </cfif>
      
    
</body>
</html>