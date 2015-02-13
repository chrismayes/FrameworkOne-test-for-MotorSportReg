component
	accessors=true {

    public struct function init(beanFactory) {
		variables.beanFactory = beanFactory;
		return this;
    }

	public void function apiAllTrackLapRecords(required numeric trackId) {
	}

	public void function apiCurrentTrackRecords(required numeric trackId) {
	}

	public void function apiLapRecord(required numeric trackId, required numeric classId) {
	}

	public void function apiOverallFastestRecord(required numeric trackId) {
	}

	public void function apiTrackClassRecordHistory(required numeric trackId, required numeric classId) {
	}

	public query function getAllTracks() {
		var local.local.queryService = new Query();
		local.local.queryService.setDatasource('ds');
        local.queryService.setSQL("
        	SELECT track_id, track_name, track_abbreviation
        	FROM track
        	ORDER BY track_id
        ");
        return local.queryService.execute().getResult();
	}

	public boolean function importTrackLaps(required numeric trackId, required string xml, required string importFileName) {
		local.rVar = true;
		local.nonDuplicateLaps = [];
		local.aLaps = xmlSearch(arguments.xml, '/TRACKRECORDS/RECORD/');

		//Extract new or updated records
		for(i=1; i <= arrayLen(local.aLaps); i++) {
			local.sLap = local.aLaps[i].xmlAttributes;
			if(!checkLapExists(arguments.trackId, local.sLap.class, local.sLap.comment, parseDateTime(local.sLap.laptime), local.sLap.date)) {
				arrayAppend(local.nonDuplicateLaps, local.sLap);
			}
		}

		//Insert new or changed records into DB
		if(arrayLen(local.nonDuplicateLaps)) {
			local.historyId = addHistory(arguments.trackId, arguments.importFileName);
			
			if(local.historyId) {
				for(i=1; i <= arrayLen(local.nonDuplicateLaps); i++) {
					local.lapId = addLap(arguments.trackId, local.nonDuplicateLaps[i].class, local.nonDuplicateLaps[i].comment, parseDateTime(local.nonDuplicateLaps[i].laptime), local.nonDuplicateLaps[i].date);
					if(local.lapId) {
						addLapHistory(local.lapId, local.historyId);
					} else {
						local.rVar = false;
					}
				}
			} else {
				local.rVar = false;
			}
		} else {
			local.rVar = false;
		}
		return local.rVar;
	}

	//Private Methods
	private numeric function addHistory(required numeric trackId, required string importFileName) {
		var local.queryService = new Query();
		local.queryService.setDatasource('ds');
        local.queryService.addParam(name='trackId', value=arguments.trackId, cfsqltype='cf_sql_integer');
        local.queryService.addParam(name='importFileName', value=arguments.importFileName, cfsqltype='cf_sql_varchar');
        local.queryService.setSQL("
        	INSERT INTO history (track_id, import_file_name, date_added)
        	VALUES (
        		( :trackId ),
        		( :importFileName ),
        		getDate()
        	)
        	SELECT @@identity AS history_id
        ");
        return val(local.queryService.execute().getResult().history_id);
	}

	private numeric function addLap(required numeric trackId, required string class, required string comment, required date lapTime, required numeric lapDate) {
		var local.queryService = new Query();
		local.queryService.setDatasource('ds');
        local.queryService.addParam(name='trackId', value=arguments.trackId, cfsqltype='cf_sql_integer');
        local.queryService.addParam(name='class', value=arguments.class, cfsqltype='cf_sql_varchar');
        local.queryService.addParam(name='comment', value=arguments.comment, cfsqltype='cf_sql_varchar');
        local.queryService.addParam(name='lapTime', value=arguments.lapTime, cfsqltype='cf_sql_time');
        local.queryService.addParam(name='lapDate', value=arguments.lapDate, cfsqltype='cf_sql_double');
        local.queryService.setSQL("
        	INSERT INTO lap (track_id, class, comment, lap_time, lap_date)
        	VALUES (
        		( :trackId ),
				( :class ),
				( :comment ),
				( :lapTime ),
				( :lapDate )
        	)
        	SELECT @@identity AS history_id
        ");
        return val(local.queryService.execute().getResult().history_id);
	}

	private void function addLapHistory(required numeric lapId, required numeric historyId) {
		var local.queryService = new Query();
		local.queryService.setDatasource('ds');
        local.queryService.addParam(name='lapId', value=arguments.lapId, cfsqltype='cf_sql_integer');
        local.queryService.addParam(name='historyId', value=arguments.historyId, cfsqltype='cf_sql_integer');
        local.queryService.setSQL("
        	INSERT INTO lap_history (lap_id, history_id)
        	VALUES (
        		( :lapId ),
        		( :historyId )
        	)
        ");
        local.queryService.execute();
	}

	private boolean function checkLapExists(required string trackId, required string class, required string comment, required date lapTime, required numeric lapDate) {
		var local.queryService = new Query();
		local.queryService.setDatasource('ds');
        local.queryService.addParam(name='trackId', value=arguments.trackId, cfsqltype='cf_sql_varchar');
        local.queryService.addParam(name='class', value=arguments.class, cfsqltype='cf_sql_varchar');
        local.queryService.addParam(name='comment', value=arguments.comment, cfsqltype='cf_sql_varchar');
        local.queryService.addParam(name='lapTime', value=arguments.lapTime, cfsqltype='cf_sql_time');
        local.queryService.addParam(name='lapDate', value=arguments.lapDate, cfsqltype='cf_sql_double');
        local.queryService.setSQL("
        	SELECT TOP 1 1
			FROM lap
			WHERE track_id = ( :trackId )
				AND class = ( :class )
				AND comment = ( :comment )
				AND lap_time = ( :lapTime )
				AND lap_date = ( :lapDate )
        ");
        return isBoolean(local.queryService.execute().getResult().recordCount) && local.queryService.execute().getResult().recordCount;
	}

	private query function getAllLaps() {
		var local.queryService = new Query();
		local.queryService.setDatasource('ds');
        local.queryService.setSQL("
        	SELECT lap_id, track_id, class, comment, lap_time, lap_date
        	FROM lap
        ");
        return local.queryService.execute().getResult();
	}
}
