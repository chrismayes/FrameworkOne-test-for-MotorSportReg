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
		local.output = '';

		//Handle File Upload
		local.uploadFileMetadata = fileUpload(expandPath("../uploads"), 'xmlFile', '','makeUnique');
		local.xmlFileContent = fileRead(expandPath('../uploads/' & local.uploadFileMetadata.serverFile));
		local.importFileName = local.uploadFileMetadata.clientFile;

		//Basic Validation
		if(local.uploadFileMetadata.fileexisted && local.uploadFileMetadata.filesize > 0) {
			local.output = '<MotorSportRegImport><result>true</result><message>Successful Upload</message></MotorSportRegImport>';
			if(isXml(local.xmlFileContent)) {
				local.xmlData = xmlParse(local.xmlFileContent);
				if(!variables.apiService.importTrackLaps(local.trackId, local.xmlData, local.importFileName)) {
					local.output = '<MotorSportRegImport><result>false</result><message>Import failure</message></MotorSportRegImport>';
				}
			}
			else {
				local.output = '<MotorSportRegImport><result>false</result><message>Nothing updated</message></MotorSportRegImport>';
			}
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
