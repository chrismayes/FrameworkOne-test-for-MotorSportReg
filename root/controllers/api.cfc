component accessors="true" {
    property beanFactory;
	
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}
	
	public void function default(rc) {
		rc.title = 'MotorSportReg - API Overview';
	}

	public void function allTrackLapRecords(rc) {
		local.trackId = rc.track;
		rc.body = '';
	}

	public void function currentTrackRecords(rc) {
		local.trackId = rc.track;
		rc.body = '';
	}

	public void function importTrackLaps(rc) {
		local.trackId = rc.track;
		local.xml = rc.xml;
		rc.body = '';
	}

	public void function lapRecord(rc) {
		local.trackId = rc.track;
		local.classId = rc.class;

		//test data
		rc.body = '<TRACKRECORDS><RECORD class="AS" comment="Andy McDermid - Ford Mustang - MILW - 08/30/2009" laptime="0:02:27.729" date="1251623817000000"/></TRACKRECORDS>';
	}

	public void function overallFastestRecord(rc) {
		local.trackId = rc.track;
		rc.body = '';
	}

	public void function trackClassRecordHistory(rc) {
		local.trackId = rc.track;
		local.classId = rc.class;
		rc.body = '';
	}

}
