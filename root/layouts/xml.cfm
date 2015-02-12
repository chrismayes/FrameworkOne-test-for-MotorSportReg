<cfscript>
	request.layout = false;
	setting enablecfoutputonly="true" showdebugoutput="false";
	pc = getpagecontext().getresponse();
	pc.getresponse().setcontenttype('text/xml');
	writeOutput(rc.body);abort;
</cfscript>
