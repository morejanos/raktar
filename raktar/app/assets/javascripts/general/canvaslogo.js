$( document ).on('ready page:load', function () {
	drawPath();
});

function drawPath() {
	var canvas=document.getElementById("logocanvas");
	if (canvas.getContext) {
		context = canvas.getContext("2d");
		context.fillStyle = "rgba(255,255,255,0.8)";
		context.beginPath();
		context.moveTo(0,0);
		context.lineTo(90,0);
		context.lineTo(90,100);
		context.fill();
		context.beginPath();
		context.moveTo(50,0);
		context.lineTo(70,150);
		context.lineTo(90,0);
		context.fill();

		context.fillStyle="#fff";
		context.font = "small-caps bold 37pt 'Georgia'";
		context.textAlign = "left";
		context.fillText("Time",100,50);
		context.fillText("Tracker",100,100);
	}
}