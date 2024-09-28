let settings
let isResizing = false;
let isDragging = false;
let enabled_types = null;

$(window).ready(function() {
	$.post(`https://${GetParentResourceName()}/ready`, JSON.stringify({}));
	
	window.addEventListener('message', function(event) {
		if (event.data.action == 'menu') {
			enabled_types = event.data.enabled_types;

			if (!enabled_types['custom']) {
				$('#custom-crosshair').hide();
			}

			if (!enabled_types['default']) {
				$('#default-crosshair').hide();
			}

			$('#wrap').show();
		}
		else if (event.data.action == 'crosshair') {
			event.data.show ? $('#type').show() : $('#type').hide();
		}
		else if (event.data.action == 'load_settings') {
			settings = event.data.settings;
			
			if (settings.type == 'custom') {
				$('#YesCustom').prop('checked', true);
				$('#NoCustom').prop('checked', false);
				$('#YesDefault').prop('checked', false);
				$('#NoDefault').prop('checked', true);
			}
			else if (settings.type == 'default') {
				$('#YesCustom').prop('checked', false);
				$('#NoCustom').prop('checked', true);
				$('#YesDefault').prop('checked', true);
				$('#NoDefault').prop('checked', false);
			}
			else if (settings.type == 'none') {
				$('#YesCustom').prop('checked', false);
				$('#NoCustom').prop('checked', true);
				$('#YesDefault').prop('checked', false);
				$('#NoDefault').prop('checked', true);
			}
			
			$('#YesOnlyAim').prop('checked', !settings.showalways);
			$('#NoOnlyAim').prop('checked', settings.showalways);
			
			$('#YesCrossFps').prop('checked', settings.showcrossfps);
			$('#NoCrossFps').prop('checked', !settings.showcrossfps);
			
			document.getElementById('type').src = event.data.path;
			
			let elem = document.querySelectorAll('.crosshair');
			let cross = event.data.path.match(/\d+/);
			
			for (let i = 0; i < elem.length; i++) {
				if (elem[i].classList.contains('active-crosshair') === true) {
					elem[i].classList.remove('active-crosshair');
				}
			}
			
			elem[cross - 1].classList.add('active-crosshair');
			
			$('#type').css('width', ''+ settings.size*0.64 +'px');
			$('#type').css('opacity', ''+ settings.alpha/100 +'');
			
			$('.crosshair-size').html(`Crosshair Size<br/><input type="range" class="range-size" min="5" max="100" value="`+ settings.size +`" required><output class="bubble-size"></output>`)
			$('.crosshair-opacity').html(`Crosshair Opacity<br/><input type="range" class="range-opacity" min="5" max="100" value="`+ settings.alpha +`" required><output class="bubble-opacity"></output>`)
			
			StrainStuff();
		}
	});
	
	$('input[type=radio][name=showCustom]').change(function() {
		if (!enabled_types['custom']) {
			$('#YesCustom').prop('checked', false);
			$('#NoCustom').prop('checked', true);

			alert("I am an alert box!");

			return;
		}

		if (this.value == 'YesCustom') {
			$('#YesDefault').prop('checked', false);
			$('#NoDefault').prop('checked', true);
		}
		
		let showCustom = $('#YesCustom').prop('checked');
		let showDefault = $('#YesDefault').prop('checked');
		
		if (showCustom) {
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'custom'}));
		}
		else if (showDefault) {
			$('#type').hide();
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'default'}));
		}
		else if (!showCustom && !showDefault) {
			$('#type').hide();
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'none'}));
		}
	});
	
	$('input[type=radio][name=showDefault]').change(function() {
		if (!enabled_types['default']) {
			$('#YesDefault').prop('checked', false);
			$('#NoDefault').prop('checked', true);

			alert("I am an alert box!");
			
			return;
		}
		
		if (this.value == 'YesDefault') {
			$('#YesCustom').prop('checked', false);
			$('#NoCustom').prop('checked', true);
		}
		
		let showCustom = $('#YesCustom').prop('checked');
		let showDefault = $('#YesDefault').prop('checked');
		
		if (showCustom) {
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'custom'}));
		}
		else if (showDefault) {
			$('#type').hide();
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'default'}));
		}
		else if (!showCustom && !showDefault) {
			$('#type').hide();
			$.post(`https://${GetParentResourceName()}/type`, JSON.stringify({type: 'none'}));
		}
	});
	
	$('input[type=radio][name=showOnlyAiming]').change(function() {
		if (this.value == 'YesOnlyAim') {
			$.post(`https://${GetParentResourceName()}/aiming`, JSON.stringify({type: false}));
		}
		else {
			$.post(`https://${GetParentResourceName()}/aiming`, JSON.stringify({type: true}));
		}
	});
	
	$('input[type=radio][name=showCrossFps]').change(function() {
		if (this.value == 'YesCrossFps') {
			$.post(`https://${GetParentResourceName()}/crossfps`, JSON.stringify({type: true}));
		}
		else {
			$.post(`https://${GetParentResourceName()}/crossfps`, JSON.stringify({type: false}));
		}
	});
	
	$('.crosshair').click(function() {
		let path = $('img', this).attr('src');
		document.getElementById('type').src = path;
		
		$.post(`https://${GetParentResourceName()}/crosshair`, JSON.stringify({path: path}));
    });
	
	$('.sidebar-crosshairs').click(function() {
        $('#crosshair-list').show();
        $('#crosshair-settings').hide();
    });
	
	$('.sidebar-settings').click(function() {
        $('#crosshair-settings').show();
        $('#crosshair-list').hide();
    });
	
	$('#btn-close').click(function() {
		$('#wrap').hide();
		$.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
    });
	
	$('#btn-reset').click(function() {
		$('#wrap').hide();
		$.post(`https://${GetParentResourceName()}/reset`, JSON.stringify({}));
    });
	
	$('#strain-content').draggable({
		stop: function() {
			//
		}
	});
	
	$('#strain-content').mousedown(function() {
		var relX = event.pageX - $(this).offset().left;
		var relY = event.pageY - $(this).offset().top;
		var relBoxCoords = "(" + relX + "," + relY + ")";
		
		if ($(this).width() - relX < 16 && $(this).height() - relY < 16){
			isResizing = true;
			isDragging = false;
			
			$('#strain-content').draggable('disable');
		}
		else {
			isResizing = false;
			isDragging = true;
			
			$('#strain-content').draggable('enable');
		}
    });
	
	$('#strain-content').mouseup(function() {
		isResizing = false;
		isDragging = false;
    });
	
	document.onkeyup = function(event) {
		if (event.key == 'Escape') {
			$('#wrap').hide();
			$.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
		}
	};
});

function HideCross() {
	$('#type').hide();
}

function StrainStuff() {
	toggleCrosshair(document.querySelectorAll('.crosshair'));
	toggleSidebar(document.querySelectorAll('.btn-sidebar'));

	const rangeSize = document.querySelectorAll('.crosshair-size');
	
	rangeSize.forEach(wrap => {
		const range = wrap.querySelector('.range-size');
		const bubble = wrap.querySelector('.bubble-size');
		
		range.addEventListener('input', () => {
			setBubbleSize(range, bubble);
		});
		
		setBubbleSize(range, bubble);
	});
	
	const rangeOpacity = document.querySelectorAll('.crosshair-opacity');
	
	rangeOpacity.forEach(wrap => {
		const range = wrap.querySelector('.range-opacity');
		const bubble = wrap.querySelector('.bubble-opacity');
		
		range.addEventListener('input', () => {
			setBubbleOpacity(range, bubble);
		});
		
		setBubbleOpacity(range, bubble);
	});
}

function cSearch() {
	// Declare variables
	var input, filter, ul, li, a, i, txtValue;
	input = document.getElementById('search');
	filter = input.value.toUpperCase();
	ul = document.getElementById('crosshair-scrollable');
	li = ul.getElementsByTagName('button');
	
	// Loop through all list items, and hide those who don't match the search query
	for (i = 0; i < li.length; i++) {
		a = li[i].getElementsByTagName('span')[0];
		txtValue = a.textContent || a.innerText;
		
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			li[i].style.display = '';
		}
		else {
			li[i].style.display = 'none';
		}
	}
}

function toggleCrosshair(elem) {
	for (var i = 0; i < elem.length; i++) {
		elem[i].addEventListener('click', function(e) {
			var current = this;
			
			for (var i = 0; i < elem.length; i++) {
				if (current != elem[i]) {
					elem[i].classList.remove('active-crosshair');
				}
				else if (current.classList.contains('active-crosshair') === true) {
					current.classList.remove('active-crosshair');
				}
				else {
					current.classList.add('active-crosshair')
				}
			}
			e.preventDefault();
		});
	};
}

function toggleSidebar(elem) {
	for (var i = 0; i < elem.length; i++) {
		elem[i].addEventListener('click', function(e) {
			var current = this;
			
			for (var i = 0; i < elem.length; i++) {
				if (current != elem[i]) {
					elem[i].classList.remove('active-sidebar');
				}
				else {
					current.classList.add('active-sidebar')
				}
			}
			e.preventDefault();
		});
	};
}

function setBubbleSize(range, bubble) {
	const val = range.value;
	const min = range.min ? range.min : 0;
	const max = range.max ? range.max : 100;
	const newVal = Number(((val - min) * 100) / (max - min));
	bubble.innerHTML = '' + val + ' %';
	bubble.style.left = `calc(${newVal}% + (${8 - newVal * 0.15}px))`;
	
	if (settings) {
		$('#type').css('width', ''+ val*0.64 +'px');
		$.post(`https://${GetParentResourceName()}/size`, JSON.stringify({val: val}));
	}
}

function setBubbleOpacity(range, bubble) {
	const val = range.value;
	const min = range.min ? range.min : 0;
	const max = range.max ? range.max : 100;
	const newVal = Number(((val - min) * 100) / (max - min));
	bubble.innerHTML = '' + val + ' %';
	bubble.style.left = `calc(${newVal}% + (${8 - newVal * 0.15}px))`;
	
	if (settings) {
		$('#type').css('opacity', ''+ val/100 +'');
		$.post(`https://${GetParentResourceName()}/alpha`, JSON.stringify({val: val}));
	}
}