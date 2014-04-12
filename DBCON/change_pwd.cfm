
<cfquery name="qPWD" datasource="DBCONNECT">
	select * from usertable where id=#url.id#
</cfquery>
<cfoutput>
<html>
	<head>
		<script type="text/javascript">
			function chk(){
				// body...
				var New_pwd=document.getElementById('N_pwd').value;
				var C_pwd=document.getElementById('C_pwd').value;
				var reg=/^[0]+$/;
				if((reg.test(New_pwd)==true)||(reg.test(C_pwd)==true)||(!New_pwd))
					return false;
				else
					return true;
			}
		</script>
		<style type="text/css">
			.as{
				float: right;
			}
			div{
				border: groove;
				width: 260px;
			}
		</style>
	</head>
	<body>
		<cfset capt ="A,B,C,D,E,F,G,H,I,J,K,L,M,N,!,@,$,%,*,1,2,3,4,5,6,7,8" >
		<cfset RandChr ="" >
		<cfloop index="i" to="4" from="1">
			<cfset RanNum = randRange(1,listLen(capt))>
			<cfset RandChr = RandChr & listGetat(capt,RanNum)>
		</cfloop>
		<a href="login.cfm?s=1" class="as">Logout</a><br>
		<form method="post" onsubmit="return chk();">
			<input type="hidden" name="hid" id="hid" value=#qPWD.password#>
			<table cellpadding="10" style="margin:0 auto;margin-top:100px">
				<tr>
					<td>Old Password</td>
					<td><input type="text" name="O_pwd" id="O_pwd"></td>
				</tr>
				<tr>
					<td>New Password</td>
					<td><input type="text" name="N_pwd" id="N_pwd"></td>
				</tr>
				<tr>
					<td>Confirm Password</td>
					<td><input type="text" name="C_pwd" id="C_pwd"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<div><cfoutput>
							<cfimage action="captcha" text="#RandChr#" difficulty="medium" height="37" width="260">
								
							</cfimage><br><input type="hidden" name="Chid" id="Chid" value="#RandChr#">
							<input type="text" name="cap" id="cap" style="width:260px"><br></cfoutput>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"></td>
				</tr>
			</table>
		</form>
	</body>
</html>
<cfif isDefined("form.N_pwd")>
	<cfif compare(form.O_pwd,form.hid) eq 0>
		<cfif compare(form.N_pwd,form.C_pwd) eq 0>
			<cfif compare(form.Chid,form.cap) eq 0>
				<cfquery name="ch_pwd" datasource="DBCONNECT">
					update usertable set password=<cfqueryparam value="#form.N_pwd#" cfsqltype="cf_sql_varchar">
						 where id=#url.id#
				</cfquery>
				<cflocation url="index.cfm" addtoken="false">
			<cfelse>
				<script type="text/javascript">
					alert("Enter valid Captcha");
				</script>
			</cfif>
		<cfelse>
			<script type="text/javascript">
				alert("Miss Match");
			</script>	
		</cfif>
	<cfelse>
		<script type="text/javascript">
			alert("Wrong Password");
		</script>
	</cfif>
</cfif>
</cfoutput>