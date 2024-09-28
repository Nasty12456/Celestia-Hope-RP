let SelectedItems = [];
let Amounts = [];
let AllItems = [];
let Koyulanlar = [];
let koyduklarim = [];
let ShopPrice = 0;
let currshop = "buy";

const GetSelectedItemByName = (name) => {
    let data = SelectedItems.filter((item) => item.name === name);
    return data[0] ? data[0] : false;
};

const GetAmountDataByName = (name) => {
    let data = Amounts.filter((amount) => amount.name === name);
    return data[0] ? data[0] : false;
};

const CalculateTotalPriceByName = (name) => {
    let selectedItem = GetSelectedItemByName(name);
    let totalPrice = 0;
    if (selectedItem) {
        totalPrice = Number(selectedItem.amount) * Number(selectedItem.price);
    }
    return totalPrice;
};

const CalculateTotalPrice = () => {
    let totalPrice = 0;
    SelectedItems.forEach((item) => {
        totalPrice += Number(CalculateTotalPriceByName(item.name));
    });
    return totalPrice;
};

const CalculateTotalAmounts = () => {
    let totalAmounts = 0;
    SelectedItems.forEach((item) => {
      totalAmounts += Number(item.amount);
    });
    return totalAmounts;
};

function FadeIn(Object, Timeout) {
    $(Object).fadeIn(Timeout).css('display', 'block');
}

function FadeOut(Object, Timeout) {
    $(Object).fadeOut(Timeout)
    setTimeout(function(){
        $(Object).css("display", "none");
    }, Timeout)
}

function SideBarFonksiyon(data, type, fields) {
    $(".itemsbar").html("");
    
    if (type == 'Wheat') {
        let i = 0;
        for (var k in data){
            if (fields[k] == false) {
                i++;
                let html = 
                `
                    <div class="kutucukbar" id="${i}">
                        <h1 id="titleone">${data[Number(k)].header}</h1>
                        <h2 id="titletwo">${data[Number(k)].description}</h2>
                        <img src="img/kutucukbuday.png" id="itempng">
                        <img src="img/gereksiz.png" id="gereksizpng">
                    </div>
                `
                $(".itemsbar").append(html);
            }
        }
    } else if (type == 'Cow') {
        let i = 0;
        for (var k in data){
            if (fields[k] == false) {
                i++;
                let html = 
                `
                    <div class="kutucukbar" id="${i}">
                        <h1 id="titleone">${data[Number(k)].header}</h1>
                        <h2 id="titletwo">${data[Number(k)].description}</h2>
                        <img src="img/kutucukcow.png" id="itempng">
                        <img src="img/gereksiz.png" id="gereksizpng">
                    </div>
                `
                $(".itemsbar").append(html);
            }
        }
    } else if (type == 'Cow') {
        let i = 0;
        for (var k in data){
            if (fields[k] == false) {
                i++;
                let html = 
                `
                    <div class="kutucukbar" id="${i}">
                        <h1 id="titleone">${data[Number(k)].header}</h1>
                        <h2 id="titletwo">${data[Number(k)].description}</h2>
                        <img src="img/kutucukcow.png" id="itempng">
                        <img src="img/gereksiz.png" id="gereksizpng">
                    </div>
                `
                $(".itemsbar").append(html);
            }
        }
    } else if (type == 'Melon') {
        let i = 0;
        for (var k in data){
            if (fields[k] == false) {
                i++;
                let html = 
                `
                    <div class="kutucukbar" id="${i}">
                        <h1 id="titleone">${data[Number(k)].header}</h1>
                        <h2 id="titletwo">${data[Number(k)].description}</h2>
                        <img src="img/kutucukkarpuz.png" id="itempng">
                        <img src="img/gereksiz.png" id="gereksizpng">
                    </div>
                `
                $(".itemsbar").append(html);
            }
        }
    }  else if (type == 'Pumpkin') {
        let i = 0;
        for (var k in data){
            if (fields[k] == false) {
                i++;
                let html = 
                `
                    <div class="kutucukbar" id="${i}">
                        <h1 id="titleone">${data[Number(k)].header}</h1>
                        <h2 id="titletwo">${data[Number(k)].description}</h2>
                        <img src="img/kutucukpump.png" id="itempng">
                        <img src="img/gereksiz.png" id="gereksizpng">
                    </div>
                `
                $(".itemsbar").append(html);
            }
        }
    } else if (type == 'Shop') {
        $(".buykonusulist").html("");
        let i = 0;
        for (var k in data){
            i++;
            let html = 
            `
                <div class="bukonusubar">
                    <span id="textone">${data[Number(k)].ItemName}</span>
                    <span id="texttwo">Buy</span>
                    <img src="./img/${data[Number(k)].ItemImage}.png">
                    <span id="moneytext">$${data[Number(k)].Price}</span>
                    <div class="sellbuton" data-img="${data[Number(k)].ItemImage}" data-name="${data[Number(k)].ItemName}" data-item="${data[Number(k)].ItemCode}" data-price="${data[Number(k)].Price}">${data[Number(k)].BuyLabel}</div>
                </div>
            `
            $(".buykonusulist").append(html);
        }
    } else if (type == 'Sell') {
        $(".middlebar").html("");
        let i = 0;
        for (var k in data){
            i++;
            let html = 
            `
            <div class="middlebar_bar">
                <span id="textone">${data[Number(k)].ItemName}</span>
                <span id="texttwo">Sell</span>
                <img src="./img/${data[Number(k)].ItemImage}.png">
                <span id="moneytext">$${data[Number(k)].Price}</span>
                <div class="sellbuton" data-item="${data[Number(k)].ItemCode}" data-price="${data[Number(k)].Price}">Sell</div>
            </div>
            `
            $(".middlebar").append(html);
        }
    }
}

window.onload = function(e) {
    window.addEventListener("message", function(event) {
        var data = event.data;
        switch (event.data.action) {
            case "open":
                if (data.type == 'Wheat') {
                    FadeIn(".budaykontaynir", 500)
                } else if (data.type == 'Cow') {
                    FadeIn(".inekkontaynir", 500)
                } else if (data.type == 'Melon') {
                    FadeIn(".karpuzkontaynir", 500)
                } else if (data.type == 'Pumpkin') {
                    FadeIn(".pumpkontaynir", 500)
                } else if (data.type == 'Shop') {
                    FadeIn(".shopingbarlist", 500)
                    FadeIn(".diskontaynir", 500)
                }
                SideBarFonksiyon(data.config, data.type, data.fields)
                break;
            case "close":
                $.post("https://qbcorestore-farming/ResetClothes");
                $(".shopingbarlist").html("");
                SelectedItems = [];
                Amounts = [];
                AllItems = [];
                Koyulanlar = [];
                ShopPrice = 0;
                FadeOut(".budaykontaynir", 350)
                FadeOut(".pumpkontaynir", 500)
                FadeOut(".inekkontaynir", 350)
                FadeOut(".karpuzkontaynir", 500)
                FadeOut(".diskontaynir", 500)
                break;
        }
    });
};

$(document).on("keydown", function() {
    if (event.repeat) {
        return;
    }
    switch (event.keyCode) {
        case 27:
            $.post("https://qbcorestore-farming/ResetClothes");
            $(".shopingbarlist").html("");
            SelectedItems = [];
            Amounts = [];
            AllItems = [];
            Koyulanlar = [];
            koyduklarim = [];
            ShopPrice = 0;
            FadeOut(".budaykontaynir", 350)
            FadeOut(".pumpkontaynir", 500)
            FadeOut(".inekkontaynir", 350)
            FadeOut(".karpuzkontaynir", 350)
            FadeOut(".diskontaynir", 500)
            $.post("https://qbcorestore-farming/close");
            break;
    }
});

function RefreshCart() {
    $(".shopingbarlist").html("");
    let i = 0;
    for (var k in SelectedItems) {
        let a = SelectedItems[k]
        ShopPrice += Number(a.price)
        i++;
        let html = `
            <div class="shopingbar">
                <i class='fas fa-trash-alt' id="copkutu"></i>
                <img src="./img/${a.img}.png">
                <span id="textone" name="${a.name}">${a.name}</span>
                <span id="texttwo">Buy</span>
                <span id="moneytext" orjfiyat="${a.price}">$${a.price*a.amount}</span>
                <div class="eksibtn">-</div>
                <div class="btnyazisi">x<span>${a.amount}</span></div>
                <div class="artıbtn">+</div>
            </div>
        `
        $(".shopingbarlist").append(html);
    }
    
    $(".totalmoneytext").html("$"+Number(CalculateTotalPrice()))
}

$(document).on('click', '.sellbuton', function(e) {
    e.preventDefault()
    if (currshop == 'buy') {
        let name = $(e.currentTarget).attr("data-name");
        for (var i in koyduklarim) {
            if (koyduklarim[i].name == name) { return }
        }
        koyduklarim.push({
            name: name
        })
        let img = $(e.currentTarget).attr("data-img");
        let price = $(e.currentTarget).attr("data-price");
        let itemCode = $(e.currentTarget).attr("data-item");
        let dataExist = GetSelectedItemByName(name);
        let amountData = GetAmountDataByName(name);
        if (amountData) {
            if (dataExist) {
                dataExist.amount += Number(amountData.amount);
            } else {
                SelectedItems.push({
                    name,
                    price,
                    itemCode,
                    img,
                    amount: amountData.amount,
                });
            }
        } else {
            SelectedItems.push({
                name,
                price,
                itemCode,
                img,
                amount: 1,
            });
            Amounts.push({
                name,
                amount: 1,
            });
        }

        RefreshCart(name)
    } else if (currshop == 'sell') {
        let price = $(e.currentTarget).attr("data-price");
        let itemCode = $(e.currentTarget).attr("data-item");
        
        $.post("https://qbcorestore-farming/SellItem", JSON.stringify({
            price: price,
            item: itemCode
        }));
    }
})

$(document).on('click', '#closeshop', function(e) {
    e.preventDefault()
    FadeOut(".diskontaynir", 500)
    $.post("https://qbcorestore-farming/close");
})

$(document).on('click', '.farmingsell', function(e) {
    e.preventDefault()
    if (currshop != 'sell') {
        $.post("https://qbcorestore-farming/GetSellConfig", function(data) {
            SideBarFonksiyon(data, "Sell")
            currshop = "sell";
            FadeOut(".buykonusulist", 200);
            FadeOut("#middletextbuy", 200);
            FadeOut(".shopingcart", 200);
            FadeOut("#shopingbasketlist", 200);
            setTimeout(function() {
                FadeIn("#middletext", 200);
                FadeIn(".middlebar", 200);
            }, 250);
        })
    }
})

$(document).on('click', '.farmingbuy', function(e) {
    e.preventDefault()
    if (currshop != 'buy') {
        currshop = "buy";
        $.post("https://qbcorestore-farming/GetShopConfig", function(data) {
            SideBarFonksiyon(data, "Shop");
            FadeOut(".middlebar", 200);
            FadeOut("#middletext", 200);
            setTimeout(function() {
                FadeIn(".buykonusulist", 200);
                FadeIn("#middletextbuy", 200);
                FadeIn(".shopingcart", 200);
                FadeIn("#shopingbasketlist", 200);
            }, 250);
        });
    }
})

$(document).on('click', ".kutucukbar", function(e) {
    e.preventDefault()
    let id = $(this).attr("id")
    $.post("https://qbcorestore-farming/StartJob", JSON.stringify({
        id: id
    }), function(cb) {
        if (cb) {
            FadeOut(".budaykontaynir", 350)
            FadeOut(".pumpkontaynir", 500)
            FadeOut(".inekkontaynir", 350)
            FadeOut(".karpuzkontaynir", 500)
        }
    });
});

$(document).on('click', ".artıbtn", function(e) {
    e.preventDefault()
    let newsayi = Number($(this).parent().children('.btnyazisi').children('span').html()) + 1 
    $(this).parent().children('.btnyazisi').children('span').html(newsayi)
    $(this).parent().children('#moneytext').html("$" + newsayi * Number($(this).parent().children('#moneytext').attr('orjfiyat')))

    for (var i in SelectedItems) {
        SelectedItems[i]
        if (SelectedItems[i].name == $(this).parent().children('#textone').attr("name")) {
            SelectedItems[i].amount += 1
        }
    }
    $(".totalmoneytext").html("$"+Number(CalculateTotalPrice()))
});

$(document).on('click', ".eksibtn", function(e) {
    e.preventDefault()
    let newsayi = Number($(this).parent().children('.btnyazisi').children('span').html()) - 1 
    if (newsayi == 0) {
        return
    }
    $(this).parent().children('#moneytext').html("$" + newsayi * Number($(this).parent().children('#moneytext').attr('orjfiyat')))
    ShopPrice -= Number($(this).parent().children('#moneytext').attr('orjfiyat'))
    $(this).parent().children('.btnyazisi').children('span').html(newsayi)
    
    for (var i in SelectedItems) {
        SelectedItems[i]
        if (SelectedItems[i].name == $(this).parent().children('#textone').attr("name")) {
            SelectedItems[i].amount -= 1
        }
    }
    $(".totalmoneytext").html("$"+Number(CalculateTotalPrice()))
});

$(document).on('click', "#copkutu", function(e) {
    e.preventDefault()
    $(this).parent().remove();
    let filteredTable = SelectedItems.filter(SelectedItems => SelectedItems.name !== $(this).parent().children('#textone').attr("name"));
    SelectedItems = filteredTable;
    let filteredTable2 = koyduklarim.filter(koyduklarim => koyduklarim.name !== $(this).parent().children('#textone').attr("name"));
    koyduklarim = filteredTable2;
    $(".totalmoneytext").html("$"+Number(CalculateTotalPrice()))
});

$(document).on('click', ".clotinghbir", function(e) {
    e.preventDefault()
    $.post("https://qbcorestore-farming/WearClothes");
});

$(document).on('click', '.cashdiv', function(e) {
    e.preventDefault()
    $.post("https://qbcorestore-farming/buy", JSON.stringify({
        money: Number(CalculateTotalPrice()),
        itemTable: SelectedItems,
        type: "cash"
    }), function(bool) {
        if (bool) {
            SelectedItems = [];
            Amounts = [];
            AllItems = [];
            Koyulanlar = [];
            koyduklarim = [];
            ShopPrice = 0;
            FadeOut(".shopingbarlist", 300)
            setTimeout(function() {
                FadeIn(".shopingbarlist", 500)
                $(".shopingbarlist").html("");
            }, 350)
        }
    });
})

$(document).on('click', '.bankdiv', function(e) {
    e.preventDefault()
    $.post("https://qbcorestore-farming/buy", JSON.stringify({
        money: Number(CalculateTotalPrice()),
        itemTable: SelectedItems,
        type: "bank"
    }), function(bool) {
        if (bool) {
            SelectedItems = [];
            Amounts = [];
            AllItems = [];
            Koyulanlar = [];
            koyduklarim = [];
            ShopPrice = 0;
            FadeOut(".shopingbarlist", 300)
            setTimeout(function() {
                FadeIn(".shopingbarlist", 500)
                $(".shopingbarlist").html("");
            }, 350)
        }
    });
})