<cfscript>
	//Runner script for the test suite
	testSuite = new mxunit.framework.TestSuite();
	testSuite.addAll('motorSportRegTestSuite');
	results = testSuite.run();
	writeOutput(results.getHtmlResults());
</cfscript>
