<cfoutput>
	<h1>#rc.title#</h1>
	
	<ul>
		<li>All Track/Lap Records</li>
		<li>Current Track Records</li>
		<form action="#buildUrl('api.importTrackLaps')#" method="POST" enctype="multipart/form-data">
			<li>
				<b>Import Track Laps</b> ---
					Select a Track:
					<select name="track">
						<cfloop query="rc.qTracks">
							<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
						</cfloop>
					</select>
					-- XML File To Upload:
					<input type="file" name="xmlFile">
					<input type="submit" value="Upload">
			</li>
		</form>
		<li>Single Lap Record (<a href="#buildUrl(action='api.lapRecord', queryString='track/1/class/1')#">Hardcoded Demo</a>)</li>
		<li>Overall Fastest Record</li>
		<li>Track/Class Record History</li>
	</ul>
</cfoutput>
