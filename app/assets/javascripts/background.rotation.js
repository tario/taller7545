
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

window.onload = function() {
	window.setInterval(
		function() {
			rotate_background();
		},
		5000
	)	

	$(".background div").css("height", "100%");
	$(".background div").css("width", "100%");
	$(".background div").css("position", "absolute");
	$(".background div").css("top", "0px");
	$(".background div").css("opacity", 0.0);
	$(".background div").css("background-size", "100% auto");

}