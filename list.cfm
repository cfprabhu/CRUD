<html>
<head>
	<title></title>
</head>
<body>
    <cfoutput>
      <cfquery name="list" datasource="employe">
      	 select * from test
      </cfquery>
     <center> <table border=1 cellpadding=10>
        <tr>
          <th >User Name</th>
          <th>Password</th>
          <th>Name</th>
          <th>Action</th>
          
        </tr>
      <cfloop query="list" >
      	<tr>
           <td>#list.username#</td>
           <td>#list.pwd#</td>
           <td>#list.name#</td>
           <td><a href="update.cfm?id=#list.id#">Edit</a> :<a href="delete.cfm?id=#list.id#">Delete</a> </td>
            	
        </tr>

      	 
      </cfloop >

      </table></center>
       <center><h4><a href="add.cfm">ADD DATA</a></h4></center>
    </cfoutput>
</body>
</html>