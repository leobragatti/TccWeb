function openCloseBox(box)
{
	if (box.className.indexOf('closed') != -1)
	{
		box.removeClassName('closed');
		//box.className = box.className.replace(new RegExp(' closed\\b'), '');
	}
	else
		box.className += ' closed';
}

function choices(value) {

	var options = document.getElementsByName("option");
	var count = 0;
	for (i=0; i < options.length; i++) {		
		if (options[i].checked) {
		    count++;
		}		
	}
	
	if (count > 11) {
		for (i=0; i < options.length; i++) {		
			if (options[i].value == value) {
			    options[i].checked = false;
			}		
		}
	}
	
	
}