<cfoutput>
	<h1>#rc.title#</h1>
	
	<ul>
		<li>All Track/Lap Records</li>
		<li>Current Track Records</li>
		<li>Import Track Laps</li>
		<li>Single Lap Record (<a href="#buildUrl(action='api.lapRecord', queryString='track/1/class/1')#">Hardcoded Demo</a>)</li>
		<li>Overall Fastest Record</li>
		<li>Track/Class Record History</li>
	</ul>
</cfoutput>
