component
	accessors=true {

    public struct function init(beanFactory) {
		variables.beanFactory = beanFactory;
		return this;
    }

	public void function apiAllTrackLapRecords(trackId) {
	}

	public void function apiCurrentTrackRecords(trackId) {
	}

	public void function apiLapRecord(trackId, classId) {
	}

	public void function apiOverallFastestRecord(trackId) {
	}

	public void function apiTrackClassRecordHistory(trackId, classId) {
	}

	public query function getAllTracks() {
		var queryService = new Query();
		queryService.setDatasource('ds');
        queryService.addParam(name='id', value=1, cfsqltype='cf_sql_integer');
        queryService.setSQL("
        	SELECT track_id, track_name, track_abbreviation
        	FROM track
        	ORDER BY track_id
        ");
        return queryService.execute().getResult();
	}

	public void function importTrackLaps(trackId, xml) {
	}

}
