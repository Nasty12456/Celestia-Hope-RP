var money = Intl.NumberFormat('en-US', {minimumFractionDigits: 0});

var vehicles = null
var selectedVehicle = null
var selectedCategory = null
var categories = null

var testDrive = null
var testDrivePrice = null

const search = document.getElementById('search-bar')
search?.addEventListener('input', function(e) {
    if (selectedCategory) {
        $(`.vehicleshop-categories > .${selectedCategory}`).removeClass("selected-category");
    }
	let input = e.target.value.toUpperCase();
	const panels = document.getElementsByClassName('vehicle');
	for (let i = 0; i < panels.length; i++) {
		let text = panels[i].getElementsByClassName('vehicle-name')[0].firstChild
		let text2 = panels[i].getElementsByClassName('vehicle-brand')[0].firstChild
		let val = text != null && (text.textContent || text.innerText);
		let val2 = text2 != null && (text2.textContent || text2.innerText);
		if (val && val.toUpperCase().indexOf(input) === 0 || val2 && val2.toUpperCase().indexOf(input) === 0) {
			panels[i].style.display = "";
		} else {
			panels[i].style.display = "none";
		}
	}
})

function selectCategory(category) {
    document.getElementById('search-bar').value = ""
    const allClass = document.getElementsByClassName('vehicle');
    if (selectedCategory != category) {
        $(`.vehicleshop-categories > .${selectedCategory}`).removeClass("selected-category");
    }
    selectedCategory = category
    $(`.vehicleshop-categories > .${category}`).addClass("selected-category");
    $.post('https://qb-vehicleshop/action', JSON.stringify({action: 'select-category'}));
    if (!category) {
		for (let i = 0; i < allClass.length; i++) {
			allClass[i].style.display = '';
		}
	} else {
		const showClass = document.getElementsByClassName(category);
		for (let i = 0; i < allClass.length; i++) {
			allClass[i].style.display = 'none';
		}
		for (let i = 0; i < showClass.length; i++) {
			showClass[i].style.display = '';
		}
	}
}

$(document).on('click', '.vehicle', function(e) {
    var price = $(this).data('price')
    var model = $(this).data('model')
    if (!selectedVehicle) {
        $('.right-bar').fadeIn(100)
    }
    if (model && price) {
        if (selectedVehicle != $(this)) {
            $(selectedVehicle).removeClass("selected-vehicle");
        }
        selectedVehicle = $(this);
        $(this).addClass("selected-vehicle");
        $('#price').html(money.format(price))
        $.post('https://qb-vehicleshop/action', JSON.stringify({
            action: 'select',
            model: model
        }));
    }
});

openVehicleShop = function() {
    $("body").fadeIn(500);
    $(".vehicle-list").empty()
    $('.vehicleshop-categories').empty()
    if (testDrive) {
        $('.test-button').show()
        if (testDrivePrice) {
            $('.test-button > div').html(`${translate.test} $${testDrivePrice}`)
        } else {
            $('.test-button > div').html(`${translate.test}`)
        }
    } else {
        $('.test-button').hide()
    }
    for (const [key, value] of Object.entries(categories)) {
        $('.vehicleshop-categories').append(`
            <div class="category ${value}" onclick="selectCategory('${value}')">
                <img src="icons/${value}.svg">
                <span class="tooltiptext">${translate.categories[value]}</span>
            </div>
        `)
    }
    for (const [key, value] of Object.entries(vehicles)) {
        $('.vehicle-list').append(`
            <div class="vehicle ${value.category}" data-model="${value.model}" data-price="${value.price}">
                <div>
                    <div class="vehicle-info">
                        <p class="vehicle-brand">${value.brand}</p>
                        <p class="vehicle-name">${value.name}</p>
                    </div>
                    <div class="vehicle-price">
                        <p>${money.format(value.price)}<span class="dollar-icon">${translate.currency}</span></p>
                    </div>
                </div>
            </div>
        `)
    }
};

changeColor = function(r, g , b, index) {
    if (selectedVehicle) {
        $.post('https://qb-vehicleshop/action', JSON.stringify({
            action: 'select-color',
            color: {
                r: r, 
                g: g , 
                b: b,
                index: index
            }
        }));
    }
}
    
window.onload = function(e) {
    document.getElementById("search-bar").placeholder = translate.searchbar_placeholder
    $('.prices-infos > .price > .dollar-icon').html(translate.currency)
    $('.prices-infos > .buy-button').html(translate.buy)
    $('.prices-infos > .price-text').html(translate.price)
    $('.test-button > div').html(translate.test)
    $('.color-text > div').html(translate.color)
}
    
window.addEventListener('message', function(event) {
    switch(event.data.action) {
        case 'open':
            search.value = ''
            $(".vehicleshop-logo > .vehicleshop-icon").empty()
            $(".vehicleshop-name").html(event.data.name)
            $(".vehicleshop-logo > .vehicleshop-icon").append(`<i class="${event.data.icon}"></i>`)
            vehicles = event.data.vehicles
            categories = event.data.categories
            testDrive = event.data.testDrive
            testDrivePrice = event.data.testDrivePrice == 0 && null || event.data.testDrivePrice
            openVehicleShop()
            break;
        case 'close':
            $.post('https://qb-vehicleshop/action', JSON.stringify({action: 'close'}));
            $("body").fadeOut(5)
            $('.right-bar').fadeOut(5)
            selectedVehicle = null
            selectedCategory = null
            break
        case 'startTest':
            $("body").fadeOut(5)
            break
        case 'stopTest':
            $("body").fadeIn(5)
            break
        case 'bought':
            $("body").fadeOut(5)
            $('.right-bar').fadeOut(5)
            selectedVehicle = null
            selectedCategory = null
            break
    }
})

window.addEventListener('keydown', function(event) {
    if (event.keyCode === 27) {
        $.post('https://qb-vehicleshop/action', JSON.stringify({action: 'close'}));
        $("body").fadeOut(5)
        $('.right-bar').fadeOut(5)
        selectedVehicle = null
        selectedCategory = null
    }
    if (event.keyCode === 37) {
        $.post('https://qb-vehicleshop/action', JSON.stringify({action: 'rotate-left'}));
    }
    if (event.keyCode === 39) {
        $.post('https://qb-vehicleshop/action', JSON.stringify({action: 'rotate-right'}));
    }
}, false);

$(document).on('click', '.buy-button', function(e){
    $.post("https://qb-vehicleshop/action", JSON.stringify({action: 'buy'}));
});

$(document).on('click', '.test-button', function(e){
    $.post("https://qb-vehicleshop/action", JSON.stringify({action: 'test'}));
});