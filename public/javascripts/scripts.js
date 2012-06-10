
	$(".submit").click(function() {
			// validate and process form here 
			//$('.error').hide();
			var name = $("input#login").val();
			console.log(name);
		//	if (name == "") {
		//		$("label#name_error").show();
		//		$("input#name").focus();
		//		return false;
			

		var topicData = new Firebase('http://demo.firebase.com/guest373610');
    		var topic = $('input#topic').val();
    		topicData.push({topic: topic});
   			$('#topic').val('');
    		}