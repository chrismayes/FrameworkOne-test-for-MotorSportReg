component accessors="true" {
    property beanFactory;
	property apiService;
	
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}
	
	public void function default(rc) {
		rc.qTracks = variables.apiService.getAllTracks();
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
		local.xml = rc.xmlFile;
		local.output = '';

		//Handle File Upload
		uploadFileMetadata = fileUpload(expandPath("../uploads"), 'xmlFile', '','makeUnique');
		xmlFileContent = fileRead(expandPath('../uploads/' & uploadFileMetadata.serverFile));
		local.importFileName = uploadFileMetadata.clientFile;

		//Basic Validation
		if(uploadFileMetadata.fileexisted && uploadFileMetadata.filesize > 0) {
			//Do the import
			
			local.output = '<MotorSportRegImport><result>true</result><message>Successful Upload</message></MotorSportRegImport>';
		} else {
			local.output = '<MotorSportRegImport><result>false</result><message>Invalid File</message></MotorSportRegImport>';
		}

		rc.body = local.output;
	}

	public void function lapRecord(rc) {
		local.trackId = rc.track;
		local.classId = rc.class;

		//hardcoded test data
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
