component
	extends="mxunit.framework.TestCase" {

	public void function setUp() {
	}

	public void function beforeTests() {}

	//START TESTS
	public void function testAlwaysPass() {
		assertTrue(true);
	}
	//END TESTS
	
	public void function afterTests() {
	}
	
	public void function tearDown() {}
}
