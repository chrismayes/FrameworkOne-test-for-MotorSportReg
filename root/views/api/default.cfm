<cfoutput>
	<h1>#rc.title#</h1>
	
	<ul>
		<form action="#buildUrl('api.allTrackLapRecords')#" method="GET">
			<li>
				<b>All Track/Lap Records</b>
				<select name="track">
					<cfloop query="rc.qTracks">
						<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
					</cfloop>
				</select>
				<input type="submit" value="Go">
			</li>
		</form>
		<form action="#buildUrl('api.currentTrackRecords')#" method="GET">
			<li>
				<b>Current Track Records (export)</b>
				<select name="track">
					<cfloop query="rc.qTracks">
						<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
					</cfloop>
				</select>
				<input type="submit" value="Go">
			</li>
		</form>
		<form action="#buildUrl('api.importTrackLaps')#" method="POST" enctype="multipart/form-data">
			<li>
				<b>Import Track Records from xml</b> ---
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
				<input type="submit" value="Go">
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
				<input type="submit" value="Go">
			</li>
		</form>
		<form action="#buildUrl('api.trackClassRecordHistory')#" method="GET">
			<li>
				<b>Track/Class Record History</b>
				<select name="track">
					<cfloop query="rc.qTracks">
						<option value="#rc.qTracks.track_id#">#rc.qTracks.track_name# (#rc.qTracks.track_abbreviation#)</option>
					</cfloop>
				</select>
				-- Class:
				<input type="text" name="class">
				<input type="submit" value="Go">
			</li>
		</form>
	</ul>
</cfoutput>
