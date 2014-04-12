<cfparam name="url.id" default="0">
<cfquery name="vi" datasource="DBCONNECT">
	select * from usertable where id=#url.id#
</cfquery>

<cfoutput>
<html>
	<head>
		<style type="text/css">
			.as{
				float: right;
			}
		</style>
	</head>
	<body>
		<cfif url.id neq 0>
			<a href="login.cfm?s=1" class="as">Logout</a>
		</cfif><br>
	<form method="post" enctype="multipart/form-data">
						
			<table cellpadding=10 style="margin:0 auto;margin-top:100px">
				<tr>
					<td>Username</td>
					<td><input type="text" name="tx_Unam" id="tx_Unam" value=#vi.username#> </td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="tx_pwd" id="tx_pwd" value=#vi.password#></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="tx_nam" id="tx_nam" value=#vi.namesf#></td>
				</tr>
				<tr>
					<td>Image</td>
					<td><input type="file" name="f_img" id="f_img"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
	</form>
<!--- </cfif> --->

</body>
<cfif isDefined("form.tx_nam")>
	
<cfif url.id is 0>
	<cffile action = "upload" destination ="#expandpath('.')#/Thumb/"  result="res" filefield="form.f_img" 
				nameconflict="overwrite">
	<cfimage action="resize" source="#expandpath('.')#/Thumb/#res.SERVERFILE#" destination="#expandpath('.')#/Thumb/#res.SERVERFILE#" height="50" width="50" overwrite="true">
	</cfimage> 
	<cfquery name="insert" datasource="DBCONNECT">
		insert into usertable values (<cfqueryparam value="#form.tx_Unam#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#form.tx_pwd#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#form.tx_nam#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#res.SERVERFILE#" cfsqltype="cf_sql_varchar">)
	</cfquery>
	<cflocation url="index.cfm" addtoken="false">
<cfelse>
	<cfquery name="upt" datasource="DBCONNECT">
		update usertable set username=<cfqueryparam value="#tx_Unam#" cfsqltype="cf_sql_varchar">, 
			password=<cfqueryparam value="#tx_pwd#" cfsqltype="cf_sql_varchar">,
			namesf=<cfqueryparam value="#tx_nam#" cfsqltype="cf_sql_varchar"> where id=#url.id#
	</cfquery>	
	<cflocation url="index.cfm" addtoken="false">
</cfif>

</cfif>
</cfoutput>