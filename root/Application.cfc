component
	extends='framework.one'
	output='true' {

	variables.framework = {
		reloadApplicationOnEveryRequest = true,
		generateSES = true,
		SESOmitIndex = false
	};

	function setupRequest() {
		//Request setup code
	}
}
