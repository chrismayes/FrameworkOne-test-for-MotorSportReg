component accessors="true" {
    property beanFactory;
	
	public any function init(fw) {
		variables.fw = fw;
		return this;
	}
	
	public void function default(rc) {
		rc.title = 'MotorSportReg - Main';
	}
}
