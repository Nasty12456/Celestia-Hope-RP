var zone = zone

window.addEventListener('message', function(event){
    var item = event.data;
    if (item.action == "show") {
        zone = item.zone
        $(".layout").fadeIn(400)
        $(".weapon_name").html(item.weaponName)
        $(".weapon_price").html(`${item.weaponPrice}$`)

        $(".left-arrow").css("background-color", `#ef233c`)
        $(".right-arrow").css("background-color", `#ef233c`)
        $(".scaleBar").css("background", `#ef233c`)
        $(".categoriesBar").css("background", `#ef233c`)

        if (item.categories) {
            for (const [key, value] of Object.entries(item.categories)) {
                $("#categories_list").append(`
                    <div onclick="openCategorie(${key}, '${value}')" style="width: 80%; margin-left:auto; margin-right:auto;padding-left: 5px;border-radius: 8px;">
                        <p class="categorieVal">${value}</p>
                    </div>
                `)
            }
        }
    }
    if (item.action == "updateMoney") {
        $("#cash").html(`CASH: ${item.cash}$`)
        $("#bank").html(`BANK: ${item.bank}$`)
    }
    if (item.action == "hide") {
        $(".layout").fadeOut(200)
        $("#categories_list").empty()
        $(".item_image").empty()
    }
    if (item.action == "load") {
        $(".item_image").empty()
        $(".weapon_name").html(item.weaponName)
        $(".weapon_price").html(`${item.weaponPrice}$`)
        if (item.weaponDamage) {
            $(".weapon_stats").fadeIn(300)
            $("#damage_scale").css(`width`, `${item.weaponDamage}%`)
        }
        if (item.weaponRange) {
            $("#range_scale").css(`width`, `${item.weaponRange}%`)
        }
        if (item.weaponSpeed) {
            $("#speed_scale").css(`width`, `${item.weaponSpeed}%`)
        }
        if ((item.weaponSpeed == undefined) && (item.weaponRange == undefined) && (item.weaponDamage == undefined)) {
            $(".weapon_stats").fadeOut(300)
        }
        if (item.image) {
            $(".weapon_stats").fadeOut(300)
            $(".item_image").html(`
                <img id="img" src="images/${item.image}" width="230" height="230">
            `)
        }
    }
});

window.addEventListener("keyup", function(event) {
    if (event.keyCode === 27) {
        $.post('https://qb-weaponshop/action', JSON.stringify({action: 'hide', zone: zone,}));
    }
    if (event.keyCode === 37) {
        previous()
    }
    if (event.keyCode === 39) {
        next()
    }
    if (event.keyCode === 13) {
        buy()
    }
}, false);

$(".categories").mouseover(function() {
    $(".categories").css("transform", "translateX(0px)")
})

$(".categories").mouseout(function() {
    $(".categories").css("transform", "translateX(-180px)")
})

$("#hide").click(function() {
    $.post('https://qb-weaponshop/hide', JSON.stringify({}));
})

$("#buy").click(function() {
    $.post('https://qb-weaponshop/buy', JSON.stringify({currentItem: currentItem}));
})

$("#previous").click(function() {
    previous()
})

$("#next").click(function() {
    next()
})

function openCategorie(newCatNumber, newCatString) {
    $.post('https://qb-weaponshop/action', JSON.stringify({
        action: "change",
        categorie: newCatNumber,
        categorieName: newCatString,
        zone: zone,
    }));
}

function buy() {
    $.post('https://qb-weaponshop/action', JSON.stringify({
        action: "buy",
        zone: zone,
    }));
}

function previous() {
    $.post('https://qb-weaponshop/action', JSON.stringify({
        action: "change",
        type: "previous",
        zone: zone
    }));
}

function next() {
    $.post('https://qb-weaponshop/action', JSON.stringify({
        action: "change",
        type: "next",
        zone: zone
    }));
}