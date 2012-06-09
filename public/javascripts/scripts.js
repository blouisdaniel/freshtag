
	$(".submit_btn").click(function() {
			// validate and process form here 
			$('.error').hide();
			var name = $("input#name").val();
			if (name == "") {
				$("label#name_error").show();
				$("input#name").focus();
				return false;
			}