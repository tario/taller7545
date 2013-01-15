
var backgroundid = 1;
var frontbackground = 0;

function next_background_image() {
	
	backgroundid++;
	if (backgroundid>4) backgroundid = 1;
	return "/background/0"+backgroundid+".jpg";
}


function rotate_background() {
	var newimage = new Image();
	var newpath = next_background_image();

    newimage.onload = function() {
		var seconddiv = $(".background div");
		var firstdiv = $(".background");
		if (frontbackground == 1) {
		    firstdiv.css("background-image", "url('"+newpath+"')");
			seconddiv.animate({opacity: 0.0}, 1500);
		} else {
		    seconddiv.css("background-image", "url('"+newpath+"')");
			seconddiv.animate({opacity: 1.0}, 1500);
		}
		frontbackground = 1 - frontbackground;
	}
	newimage.src = newpath;
}

function add_second_div() {
	var firstdiv = $(".background");
	$.each(firstdiv, function(index, object) {
			object.innerHTML = "<div></div>";
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
	
	var newpath = next_background_image();
	firstdiv.css("background-image", "url('"+newpath+"')");
	
	window.setInterval(
		function() {
			rotate_background();
		},
		5000
	)
	add_second_div();
}