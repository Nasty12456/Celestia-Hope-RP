$('body').hide();

window.addEventListener('message', function (event) {
    let e = event.data;
    switch (e.action) {     
        case "show":
            $('body').fadeIn(250);
            break;
        default: break;
    }
});


$(document).keyup(function (e) {
	let keyCode = e.keyCode || e.which;
	if (keyCode == 27) {
      close();
	}
});

function close()
{
  $('body').fadeOut(250)
  $.post('https://ngd-bahama/close');
}

function addPage(page, book) {
	var id, pages = book.turn('pages');
	var element = $('<div />', {});
	if (book.turn('addPage', element, page)) {
		element.html('<div class="gradient"></div><div class="loader"></div>');
		loadPage(page, element);
	}
}

function loadPage(page, pageElement) {
	var img = $('<img />');
	img.mousedown(function(e) {
		e.preventDefault();
	});
	img.load(function() {
		$(this).css({width: '100%', height: '100%'});
		$(this).appendTo(pageElement);
		pageElement.find('.loader').remove();
	});
	img.attr('src', 'pages/' +  page + '.jpg');

}


function loadLargePage(page, pageElement) {
	
	var img = $('<img />');

	img.load(function() {

		var prevImg = pageElement.find('img');
		$(this).css({width: '100%', height: '100%'});
		$(this).appendTo(pageElement);
		prevImg.remove();
		
	});

	img.attr('src', 'pages/' +  page + '-large.jpg');
}


function loadSmallPage(page, pageElement) {
	
	var img = pageElement.find('img');

	img.css({width: '100%', height: '100%'});

	img.unbind('load');

	img.attr('src', 'pages/' +  page + '.jpg');
}



function isChrome() {

	return navigator.userAgent.indexOf('Chrome')!=-1;

}