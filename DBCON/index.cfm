<html>
	<cfquery name="qviews" datasource="DBCONNECT">
		select * from usertable 
	</cfquery>
	<cfquery name="imgse" datasource="DBCONNECT">
		select * from usertable where username=<cfqueryparam value="#session.user#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<head>
		<title>List Page</title>
		<script type="text/javascript">
			function chk(del) {
				// body...
				var conf=confirm("Do you want delete This");
				if (conf==true) 
					window.location.href="delete.cfm?id="+del;
				else
					window.location.href="index.cfm";
			}
		</script>
		<style type="text/css">
			div{
				margin: 0 auto;
				height: 800px;
				text-align: center;
				width: 500px;
				/*background-color: red;*/
			}
			.as{
				float: right;
			}
			table{
				border-collapse: collapse;
				text-align: center;
			}
			th{
				background-color: #FAEBD7;
			}
			tr:hover{
				background-color: #DCDCDC;
			}
			img{
				float:right;
			}
		</style>
	</head>
	
	<body>
			<a href="login.cfm?s=1" class="as">Logout</a>
		<center>
			<h1>List Page</h1></center><cfoutput>

		<form method="post" name="f1" id="f1">
			<div><center>
				<img src="Thumb/#imgse.images#" ><br><br><br>
				<table border="1px" cellpadding=10>
					<tr>
						<th>Name</th>
						<th>UserName</th>
						<th>Password</th>
						<th colspan="3">Operations</th>
					</tr>
					
					<cfloop query="qviews">
						<tr>
							<td>#qviews.Namesf#</td>
							<td>#qviews.username#</td>
							<td>#qviews.password#</td>
							<td><a href="insert.cfm?id=#qviews.id#">Edit</a>&nbsp;
							<a href="##" onclick="chk(#qviews.id#)">Delete</a></td>
							<td><a href="change_pwd.cfm?id=#qviews.id#">Change Password</a>
						</tr>
					</cfloop>
				</table><h3><a href="insert.cfm?img=#imgse.images#" class="as">AddUser</a></h3></center>
				<input type="hidden" name="hid" id="hid">
			</div>
		</form>
		</cfoutput>
	</body>
</html>
<cfif isDefined("form.hid")>
	<cflocation url="delete.cfm?id=#qviews.id#" addtoken="true">
</cfif>