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
		<form action="#buildUrl('api.lapRecord')#" method="GET">
			<li>
				<b>Single Lap Record</b> ---
				Select a Track:
				<select name="track">
					<cfloop query="rc.qTracks">
						<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
					</cfloop>
				</select>
				-- Class:
				<input type="text" name="class">
				<input type="submit" value="Upload">
			</li>
		</form>
		<form action="#buildUrl('api.overallFastestRecord')#" method="GET">
			<li>
				<b>Overall Fastest Record</b>
				<select name="track">
					<cfloop query="rc.qTracks">
						<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
					</cfloop>
				</select>
				<input type="submit" value="Upload">
			</li>
		</form>
		<li>Track/Class Record History</li>
	</ul>
</cfoutput>
