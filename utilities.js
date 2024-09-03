var 	ELEMENT_NODE                   = 1;

function flip(targetID) {
	if (document.getElementById(targetID).style.visibility == 'visible') {
		document.getElementById(targetID).style.visibility='hidden';
	}
	else {
		document.getElementById(targetID).style.visibility='visible';
	}
}

function showAll(targetID) {
	var children = new Array(1);
	children[0] = document.getElementById(targetID).childNodes;
	
	for (var i=0; i < children.length; i++) {
		ary = children[i];
		for (var j=0; j < ary.length; j++) {
			if (ary[j].nodeType == ELEMENT_NODE) {
				children.push(ary[j].childNodes);
				ary[j].style.visibility='visible';
			}
		}
	}
}

function hideAll(targetID) {
	var children = new Array(1);
	children[0] = document.getElementById(targetID).childNodes;
	
	for (var i=0; i < children.length; i++) {
		ary = children[i];
		for (var j=0; j < ary.length; j++) {
			if (ary[j].nodeType == ELEMENT_NODE) {
				children.push(ary[j].childNodes);
				if (ary[j].className == 'hide') {
					ary[j].style.visibility='hidden';
				}
			}
		}
	}
}

function hideAll2(targetID) {
	var children = new Array(1);
	children[0] = document.getElementById(targetID).childNodes;
	
	for (var i=0; i < children.length; i++) {
		ary = children[i];
		for (var j=0; j < ary.length; j++) {
			if (ary[j].nodeType == ELEMENT_NODE) {
				children.push(ary[j].childNodes);
				if (ary[j].className == 'hidelater') {
					ary[j].style.visibility='hidden';
				}
			}
		}
	}
}