$(function () {
	$('#calculate').click( function() {
		  
		var array = document.getElementsByClassName("error");
		var numberOfErrors = 0;
		for(var ii = 0; ii < array.length; ii++) {
			if(array[ii].checked == true) {
				numberOfErrors++;	
			}
		}
		var result = 25 - (25/array.length)*numberOfErrors;
		document.getElementById('info').innerHTML =  ("Errors: <strong>" + numberOfErrors + "</strong>");
		document.getElementById('result').innerHTML =  ("Points: <strong>" + result + "</strong> (+ 0-5 points for code quality)");

	});
});
