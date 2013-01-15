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
		var seconddiv = $(".background div");
		var firstdiv = $(".background");
		if (background_data.frontbackground == 1) {
		    firstdiv.css("background-image", "url('"+newpath+"')");
			seconddiv.animate({opacity: 0.0}, 1500);
		} else {
		    seconddiv.css("background-image", "url('"+newpath+"')");
			seconddiv.animate({opacity: 1.0}, 1500);
		}
		background_data.frontbackground = 1 - background_data.frontbackground;
	}
	newimage.src = newpath;
}

function add_second_div() {
	var firstdiv = $(".background");
	$.each(firstdiv, function(index, object) {
			object.innerHTML = "<div></div>";
			background_data.background_list = object.getAttribute('background-list').split(";");
		}
	)
		
	var seconddiv = $(".background div");
	seconddiv.css("height", "100%");
	seconddiv.css("width", "100%");
	seconddiv.css("position", "absolute");
	seconddiv.css("top", "0px");
	seconddiv.css("left", "0px");
	seconddiv.css("opacity", 0.0);
	seconddiv.css("background-size", "100% auto");
}

window.onload = function() {
	var firstdiv = $(".background");
	
	add_second_div();
		
	var newpath = next_background_image();
	firstdiv.css("background-image", "url('"+newpath+"')");

	window.setInterval(
		function() {
			rotate_background();
		},
		5000
	)

}