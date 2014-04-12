<html>
	<head>
		<title>Login Page</title>
		<style type="text/css">
			.div2{
				text-align: center;
				line-height: 40px;
				height: 200px;
				width: 400px;
				box-shadow: 0px 0px 50px #A9A9A9;
				margin: 0 auto;
				border-style: outset;
				margin-top: 180px;
				background-color: #DEB887;
				border-radius: 25px;
			}
		</style>
		<script type="text/javascript">
			function foo() {
				// body...
				document.getElementById('user').focus();
			}
		</script>
	</head>
	<body onload="foo()" bgcolor="black"><cfoutput>
		<form method="post" >
				<div class="div2"><br>
					Username&nbsp;&nbsp;&nbsp;<input type="text" name="user" id="user"><br>
					Password&nbsp;&nbsp;&nbsp;<input type="password" name="pwd" id="pwd"><br>
					<input type="Submit" value="Login">&nbsp;&nbsp;&nbsp;&nbsp;<a href="insert.cfm">Sign Up</a>
				</div>
		</form>
	
<cfif isDefined("form.user")>
	<cfquery name="login_chk" datasource="DBCONNECT" result="re">
		select * from usertable where username=<cfqueryparam value="#form.user#" cfsqltype="cf_sql_varchar"> and 
				password=<cfqueryparam value="#form.pwd#" cfsqltype="cf_sql_varchar">
	</cfquery>
	<cfif (compare(#login_chk.Username#,form.user) eq 0) and (compare(#login_chk.password#,form.pwd) eq 0)>
		<cfset session.user = #login_chk.Username#>	
		<cfset session.pwd = #login_chk.password#>
		<cflocation url="index.cfm?id=#login_chk.username#" addtoken="false">
	<cfelse>
		<script type="text/javascript">
			alert("Incorrect UserName or Password") ;
		</script>
	</cfif> 
	
</cfif>
<cfparam name="url.s" default="0">
<cfif #url.s# gt 0>
	<cfset a =structClear(session) >
</cfif>
</cfoutput>
</body>
</html>