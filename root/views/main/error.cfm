<cfscript>
	//Error page override
	request.layout = false;
	writeDump(request.exception);	
</cfscript>
