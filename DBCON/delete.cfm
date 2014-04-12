

<cfquery name="del" datasource="DBCONNECT">
	delete from usertable where id=#url.id#
</cfquery>
 <cflocation url="index.cfm" addtoken="false"> 