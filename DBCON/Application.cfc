<cfcomponent>
	<cfset this.sessionmanagement = true>
	<cfset this.sessiontimeout =createTimeSpan(0,10,10,10)>
	<cffunction name="onRequestStart">
		<cfif ((not isDefined("session.user")) and (not isDefined("session.pwd")))and 
			((listLast(CGI.SCRIPT_NAME, "/") eq "index.cfm")or
			 (listLast(CGI.SCRIPT_NAME, "/") eq "change_pwd.cfm")or 
			 (listLast(CGI.SCRIPT_NAME, "/") eq "delete.cfm"))>
					
					<cflocation url="login.cfm" addtoken="false">
		</cfif>
		<cffunction name="onSessionStart">
			<cfset a =structClear(session) >
			<cflocation url="login.cfm" addtoken="false" >
		</cffunction>
	</cffunction>
</cfcomponent>