(function() {
	
	function initialize_background(background_object_id) {
		
		var background_data = {
			background_index: 0,
			frontbackground: 0
		};
		
		function next_background_image() {
			
			background_data.background_index++;
			if (background_data.background_index>=background_data.background_list.length) background_data.background_index = 0;
			return background_data.background_list[background_data.background_index];
		}
		
		
		function rotate_background() {
			var newimage = new Image();
			var newpath = next_background_image();
		
		    newimage.onload = function() {
				var seconddiv = $("#" + background_object_id + " div");
				var firstdiv = $("#" + background_object_id);
				if (background_data.frontbackground == 1) {
				    firstdiv[0].style.backgroundImage = "url('"+newpath+"')";
					seconddiv.animate({opacity: 0.0}, 1500);
				} else {
				    seconddiv[0].style.backgroundImage = "url('"+newpath+"')";
					seconddiv.animate({opacity: 1.0}, 1500);
				}
				background_data.frontbackground = 1 - background_data.frontbackground;
			}
			newimage.src = newpath;
		}
		
		function add_second_div() {
			var firstdiv = $("#" + background_object_id);
			firstdiv[0].innerHTML = "<div></div>";
			background_data.background_list = firstdiv[0].getAttribute('background-list').split(";");
				
			var seconddiv = $("#" + background_object_id + " div");
			seconddiv[0].style.height = "100%";
			seconddiv[0].style.width = "100%";
			seconddiv[0].style.position = "absolute";
			seconddiv[0].style.top = "0px";
			seconddiv[0].style.left = "0px";
			seconddiv[0].style.opacity = 0.0;
			seconddiv[0].style.backgroundSize = "100% auto";
		}
		
		add_second_div();
		var newpath = next_background_image();
		$("#" + background_object_id).css("background-image", "url('"+newpath+"')");

		window.setInterval(
			function() {
				rotate_background();
			},
			5000
		);
	}
	
	var current_background_id = 100;
	window.onload = function() {
		var background_objects = $(".background");
		
		$.each(background_objects, 
			function (index,object) {
				object_id = "background_rotation_js_" + current_background_id;
				current_background_id++;
				object.id = object_id;
				initialize_background(object_id);
			});

	}
})();
