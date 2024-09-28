// variables
let display = false;
let option = 0;
let count = 0;

// Variables from client
let IMAGES_PATH = null;
let PRICES_SEPARATOR = ",";

// Employees Permissions
let selfPermissions = {};

// Filters
let currentFilterId = null;
let currentFilterLabel = null;
let ALL_FILTERS = [];

// Opened shop data
let currentShopId = null;
let currentShopType = null;
let selectedItemDiv = null;

// Current shop label
let shopTitle = null; 

// item list for later purposes
let ITEMS = [];

// display ui
function show(bool) {
    if (bool) {
        $(".main-container").show();
    } else {
        $(".main-container").hide();
        $.post(`https://${GetParentResourceName()}/close`);
    }
    display = bool;
}

async function refreshItemsInUI() {
    switch(currentShopType) {
        case "playersShop":
            ITEMS = await retrieveObjectsOnSaleFromShop(currentShopId);
            break;
        case "playerInventory":
            ITEMS = await retrievePlayerSellableObjects(currentShopId);
            break;
        case "playersShopObjectsOnSaleSettings":
            ITEMS = await retrieveObjectsOnSaleFromShop(currentShopId);
            break;
        case "playersShopObjectsFromStorage":
            ITEMS = await retrieveObjectsFromStorage(currentShopId);
            break;
    }

    showMainShop();
}

function togglePlayerInventoryOptions(state) {
    $("#deposit-storage").toggle(state);
    $("#add-sale").toggle(state);
    $("#add-buy-list").toggle(state);
}

function toggleOnSaleItemsOptions(state) {
    $("#remove-from-sale").toggle(state);
    $("#add-stocks").toggle(state);
    $("#update-price").toggle(state);
}

function toggleToBuyItemsOptions(state) {
    $("#remove-from-to-buy-list").toggle(state);
    $("#update-quantity").toggle(state);
    $("#update-price").toggle(state);
}

function toggleStorageOptions(state) {
    $("#withdraw-from-storage").toggle(state);
    $("#add-sale").toggle(state);
}

function toggleSellAllButton(state) {
    $("#sell-all-btn").toggle(state);
}

function hideAllExtraOptionsFromShopUI() {
    togglePlayerInventoryOptions(false);
    toggleOnSaleItemsOptions(false);
    toggleToBuyItemsOptions(false);
    toggleStorageOptions(false);
    toggleSellAllButton(false);
}

// display main player shop
function showMainShop() {
    $(".main-container").html(`
    <div class="shop-page">
        <div class="head">
            <div class="left-side">
                <h2 class="shop-title">${shopTitle}</h2>
                <div class="user-info">

                    <!-- 
                        <div class="shopPrice">
                            <div class="head-icon owner-icon"><img src="./assets/svg/crown.svg"></div>
                            <p class="shopPriceValue"><span>Owner</span><br>OWNER NAME</p>
                        </div>
                        <div class="shopStorage">
                            <div class="head-icon owner-icon"><img src="./assets/svg/crown.svg"></div>
                            <p class="shopStorageValue"><span>Worth</span><br>SHOP PRICE</p>
                        </div>
                        <div class="shopEmployees">
                            <div class="head-icon owner-icon"><img src="./assets/svg/crown.svg"></div>
                            <p class="shopEmployeesValue"><span>Employees</span><br>EMPLOYEES COUNT</p>
                        </div>
                    -->
                </div>
            </div>
            <div class="right-side">
                <a class="filter-btn clickable"><img src="./assets/svg/filter.svg"><p>${getLocalizedText("menu:filter")}</p></a>
                <a class="exit-btn clickable"><img src="./assets/svg/exit.svg"><p>${getLocalizedText("menu:exit")}</p></a>
            </div>
        </div>
        <ul class="items-list"></ul>
    </div>
    <div class="options-menu">

        ${hasPermission("depositStoredObjects") ? `<a id="deposit-storage" class="clickable"><p>${getLocalizedText("menu:deposit_in_storage")}</p></a>` : ""}
        ${hasPermission("addObjectToSale") ? `<a id="add-sale" class="clickable"><p>${getLocalizedText("menu:add_on_sale")}</p></a>` : ""}
        ${hasPermission("addObjectToBuyList") ? `<a id="add-buy-list" class="clickable"><p>${getLocalizedText("menu:add_on_to_buy_list")}</p></a>` : ""}

        ${hasPermission("updateObjectPrice") ? `<a id="update-price" class="clickable"><p>${getLocalizedText("menu:update_price")}</p></a>` : ""}
        ${hasPermission("removeObjectFromSale") ? `<a id="remove-from-sale" class="clickable"><p>${getLocalizedText("menu:remove_from_sale")}</p></a>` : ""}
        ${hasPermission("addObjectStocks") ? `<a id="add-stocks" class="clickable"><p>${getLocalizedText("menu:add_stocks")}</p></a>` : ""}
        ${hasPermission("removeObjectFromToBuyList") ? `<a id="remove-from-to-buy-list" class="clickable"><p>${getLocalizedText("menu:remove_from_to_buy_list")}</p></a>` : ""}
        ${hasPermission("updateObjectQuantity") ? `<a id="update-quantity" class="clickable"><p>${getLocalizedText("menu:update_wanted_quantity")}</p></a>` : ""}

        ${hasPermission("withdrawStoredObjects") ? `<a id="withdraw-from-storage" class="clickable"><p>${getLocalizedText("menu:withdraw_from_storage")}</p></a>` : ""}

        <input type="number" id="amount-input" placeholder="${getLocalizedText("menu:amount")}" required>
        <div class="submit-btn clickable" id="main-action-btn"><p>${getLocalizedText("menu:purchase")}</p></div>
        <div class="submit-btn clickable" id="sell-all-btn" style="display:none"><p>${getLocalizedText("menu:sell_all")}</p></div>
    </div>
    <div class="filter-page" style="display:none"></div>
    `);

    // filter button click
    $(".filter-btn").click(function () {
        showFilter(true);
        $(".filter-element").click(function () {
            $(".filter-element").css('background', '');
            $(this).css('background', 'radial-gradient(50% 50% at 50% 50%, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.2) 100%)')
            currentFilterId = $(this).data('filterId');
            currentFilterLabel = $(this).data('filterLabel');
        });
    });

    if(currentFilterId != null) {
        $(".filter-btn").css({border: "1px solid red"}).find("p").text(currentFilterLabel);
    }

    // shop exit button
    $(".exit-btn").click(function () {
        if(currentShopType == "playersShop" || currentShopType == "adminShop-sell" || currentShopType == "adminShop-buy") {
            show(false);
        } else {
            showShopSettings();
        }
    });

    // option clicked
    $(".options-menu a").click(function () {
        option = $(this).attr("id");
        $(".options-menu a").removeClass("selected-btn");
        $(this).addClass("selected-btn");
        
        const showAmountInput = option != "update-price" && option != "remove-from-to-buy-list";

        switch(currentShopType) {
            case "playersShopObjectsOnSaleSettings": {
                $("#amount-input").toggle(showAmountInput).prop("required", showAmountInput);
                break;
            }

            default: {
                $("#amount-input").show().prop("required", showAmountInput);
                break;
            }
        }

    });

    switch(currentShopType) {
        case "adminShop-buy": {
            $("#main-action-btn p").text(getLocalizedText("menu:purchase"));
            hideAllExtraOptionsFromShopUI();
            break;
        }

        case "adminShop-sell": {
            $("#main-action-btn p").text(getLocalizedText("menu:sell"));

            hideAllExtraOptionsFromShopUI();
            toggleSellAllButton(true);

            break;
        }

        case "playersShop": {
            hideAllExtraOptionsFromShopUI();
            break;
        }
        case "playerInventory": {
            $("#main-action-btn p").text(getLocalizedText("menu:confirm"));

            hideAllExtraOptionsFromShopUI();
            togglePlayerInventoryOptions(true);

            break;
        }

        case "playersShopObjectsOnSaleSettings": {
            $("#main-action-btn p").text(getLocalizedText("menu:confirm"));

            hideAllExtraOptionsFromShopUI();
            toggleOnSaleItemsOptions(true);

            break;
        }

        case "playersShopObjectsFromStorage": {
            $("#main-action-btn p").text(getLocalizedText("menu:confirm"));

            hideAllExtraOptionsFromShopUI();
            toggleStorageOptions(true);

            break;
        }
    }

    $("#sell-all-btn").click(async function () {
        if(!selectedItemDiv) return;

        const itemId = selectedItemDiv.data("itemId");

        switch(currentShopType) {
            case "adminShop-sell": {
                $.post(`https://${resName}/sellItemsInBulkToAdminShop`, JSON.stringify({shopId: currentShopId, itemId: itemId}), null);
                resetSelectedItem();
                break;
            }

            case "playersShop": {
                $.post(`https://${resName}/sellItemsInBulkToPlayerShop`, JSON.stringify({shopId: currentShopId, itemId: itemId}), async function(success) {
                    if (success)
                        refreshItemsInUI()
                });

                resetSelectedItem();
                break;
            }
        }
    });

    // shop submit button
    $("#main-action-btn").click(async function () {
        if(!selectedItemDiv) return;
        
        if( $("#amount-input").prop("required") ) {
            count = parseInt( $("#amount-input").val() );
            if(isNaN(count)) return;
        } else {
            count = 0;
        }

        // Used in most shop types
        const itemId = selectedItemDiv.data("itemId");

        switch(currentShopType) {
            case "adminShop-buy": {
                $.post(`https://${resName}/buyItemFromAdminShop`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), null);
                resetSelectedItem();
                break;
            }

            case "adminShop-sell": {
                $.post(`https://${resName}/sellItemToAdminShop`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), null);
                resetSelectedItem();
                break;
            }

            case "playersShop": {
                const method = selectedItemDiv.data("method");

                if(method == "buy") {
                    $.post(`https://${resName}/buyItemFromPlayersShop`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), async function(success) {
                        if (success)
                            refreshItemsInUI()
                    });
                } else if(method == "sell") {
                    $.post(`https://${resName}/sellItemToPlayersShop`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), function(success) {
                        if (success)
                            refreshItemsInUI()
                    });
                }

                break;
            }

            case "playerInventory": {
                const itemName = selectedItemDiv.data("itemName");
                const itemType = selectedItemDiv.data("itemType");

                switch(option) {
                    case "deposit-storage": {
				        $.post(`https://${resName}/depositObjectInStorage`, JSON.stringify({shopId: currentShopId, name: itemName, type: itemType, quantity: count}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }

                    case "add-sale": {
                        const price = await showInput(getLocalizedText("menu:choose_price"), getLocalizedText("menu:price_for_each_object"), true)
                        if(price == null) return;

                        $.post(`https://${resName}/addItemToSale`, JSON.stringify({shopId: currentShopId, name: itemName, type: itemType, quantity: count, price: price}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }

                    case "add-buy-list": {
                        const price = await showInput(getLocalizedText("menu:choose_price"), getLocalizedText("menu:price_to_buy_each_object"), true)
                        if(price == null) return;

                        $.post(`https://${resName}/addItemToBuyList`, JSON.stringify({shopId: currentShopId, name: itemName, type: itemType, quantity: count, price: price}), function(successful) {
                            if(successful) 
                                refreshItemsInUI();
                        });

                        break;
                    }
                }

                break;
            }

            case "playersShopObjectsOnSaleSettings": {
                switch(option) {
                    case "remove-from-sale": {
                        $.post(`https://${resName}/removeItemFromSale`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }

                    case "add-stocks": {
                        $.post(`https://${resName}/addObjectStocks`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });
                        
                        break;
                    }

                    case "update-price": {
                        const price = await showInput(getLocalizedText("menu:choose_price"), getLocalizedText("menu:price_for_each_object"), true)
                        if(price == null) return;

                        $.post(`https://${resName}/updateObjectPrice`, JSON.stringify({shopId: currentShopId, itemId: itemId, price: price}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }

                    case "remove-from-to-buy-list": {
                        $.post(`https://${resName}/removeItemFromToBuyList`, JSON.stringify({shopId: currentShopId, itemId: itemId}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }

                    case "update-quantity": {
                        $.post(`https://${resName}/updateObjectQuantity`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });

                        break;
                    }
                }

                break;
            }

            case "playersShopObjectsFromStorage": {
                switch(option) {
                    case "withdraw-from-storage": {
                        $.post(`https://${resName}/withdrawObjectFromStorage`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });
                        break;
                    }

                    case "add-sale": {
                        const price = await showInput(getLocalizedText("menu:choose_price"), getLocalizedText("menu:price_for_each_object"), true)
                        if(price == null) return;

                        $.post(`https://${resName}/storageToSale`, JSON.stringify({shopId: currentShopId, itemId: itemId, quantity: count, price: price}), function(successful) {
                            if(successful)
                                refreshItemsInUI();
                        });
                    }
                }
                        
                break;
            }
        }

        selectedItemDiv = null;
    });

    // append all items
    loadItems(ITEMS);
    show(true);
}

function isItemNameInFilterId(itemName) {
    if(currentFilterId == null) return true; // no filter selected

    itemName = itemName.toLowerCase();

    let filterData = ALL_FILTERS[currentFilterId];
    if(!filterData) return false;

    let filterItems = filterData.items;
    if(!filterItems) return false;

    return filterItems[itemName];
}

// display filter page (player shop)
function showFilter(bool) {
    if (bool) {
        currentFilterId = null;
        $(".filter.btn").find("p").text(getLocalizedText("menu:filter"));

        let filtersDivs = "";

        ALL_FILTERS.forEach((filterData, index) => {
            filtersDivs += `<li class="filter-element" data-filter-id="${index}" data-filter-label="${filterData.label}"><p>${filterData.label}</p></li>`
        });

        // show filter page
        $(".filter-page").show();
        $(".filter-page").html(`
        <p class="filter-description">${getLocalizedText("menu:choose_your_filter")}</p>
        <ul class='filter-options'>
            ${filtersDivs}
        </ul>

        <div class="filter-buttons">
            <a class="cancel-btn"><p>${getLocalizedText("menu:cancel")}</p></a>
            <a class="submit-btn"><p>${getLocalizedText("menu:submit")}</p></a>
        </div>
        `);

        // reduce opacity of background
        $(".shop-page").css('opacity', '0.1');
        $(".options-menu").css('opacity', '0.1');

        // filter submit button
        $('.filter-page .filter-buttons .submit-btn').click(function () {
            // Filter applied
            showFilter(false);
            refreshItemsInUI();
        });

        // filter cancel button
        $('.filter-page .filter-buttons .cancel-btn').click(function () {
            currentFilterId = null;
            showFilter(false);
            refreshItemsInUI();
        });

    } else {
        // reset pages
        $(".filter-page").hide();
        $(".shop-page").css('opacity', '1');
        $(".options-menu").css('opacity', '1');
    }

}

// display shop setting page
function showShopSettings() {
    $(".main-container").html(`
    <div class="shop-settings">
        <div class="titlebox">
            <h2>${getLocalizedText("menu:shop_settings")}</h2>
        </div>
        <ul class="left-settings"></ul>
        <ul class="right-options">
            <li class="option-element stored-money"><p class="stored-money-title">${getLocalizedText("menu:stored_money")}</p><h2 class="stored-money-amount" id="storedMoney">${CURRENCY_SYMBOL}<span>???</span></h2><div class="money-icon"><img src="./assets/svg/dollar.svg"></div></li>
            <li class="option-element clickable" id="withdraw-btn"><p>${getLocalizedText("menu:permissions:withdraw_money")}</p></li>
            <li class="option-element clickable" id="deposit-btn"><p>${getLocalizedText("menu:permissions:deposit_money")}</p></li>
            <img src="./assets/svg/separator.svg" class="seperator">
            <a class="cancel-btn clickable" id="cancelBtn"><p>${getLocalizedText("menu:cancel")}</p></a>
        </ul>
    </div>
    `);

    $.post(`https://${resName}/getShopMoney`, JSON.stringify({shopId: currentShopId}), function(shopMoney) {
        $(".stored-money-amount span").text(formatNum(shopMoney));
    });

    let settings = [
        {
            elementId: "playerInventory",
            elementTitle: getLocalizedText("menu:your_inventory")
        },
        {
            elementId: "itemSale",
            elementTitle: getLocalizedText("menu:objects_on_sale")
        },
        {
            elementId: "shopStorage",
            elementTitle: getLocalizedText("menu:shop_storage")
        }
    ];

    if(hasPermission("canToggleShopStatus"))
        settings.push({
            elementId: "toggleStatus",
            elementTitle: getLocalizedText("menu:toggle_shop_status")
        });

    if(hasPermission("manager")) {
        settings.push({
            elementId: "updateLabel",
            elementTitle: getLocalizedText("menu:update_shop_label")
        });

        settings.push({
            elementId: "employees",
            elementTitle: getLocalizedText("menu:employees_management")
        });
    }

    if(hasPermission("sellShop")) {
        settings.push({
            elementId: "sellShop",
            elementTitle: getLocalizedText("menu:sell_shop")
        });
    }

    if( !hasPermission("depositMoney") ) {
        $("#deposit-btn").hide();
    }

    if(!hasPermission("withdrawMoney") ) {
        $("#withdraw-btn").hide();
    }

    updateSettingList(settings, "settings");
    show(true);
}

async function showEmployeesManagement() {
    $(".main-container").html(`
    <div class="shop-settings">
        <div class="titlebox">
            <h2>${getLocalizedText("menu:employees_management")}</h2>
        </div>
        <ul class="left-settings"></ul>
        <ul class="right-options">
            <li class="option-element stored-money"><p class="stored-money-title">${getLocalizedText("menu:employees")}</p><h2 class="stored-money-amount" id="storedMoney"><span>${getLocalizedText("menu:members")}</span></h2><div class="money-icon"><img src="./assets/svg/job.svg"></div></li>
            <li class="option-element clickable" id="fireBtn"><p>${getLocalizedText("menu:fire")}</p></li>
            <li class="option-element clickable" id="managePermissionsBtn"><p>${getLocalizedText("menu:manage_permissions")}</p></li>
            <img src="./assets/svg/separator.svg" class="seperator">
            <a class="cancel-btn clickable" id="cancelBtn"><p>${getLocalizedText("menu:cancel")}</p></a>
        </ul>
    </div>
    `);

    const rawEmployees = await $.post(`https://${resName}/getEmployees`, JSON.stringify({shopId: currentShopId}));
    
    const elaboratedEmployees = Object.values(rawEmployees).map(employeData => {
        return {
            elementId: employeData.identifier,
            elementTitle: employeData.name,
            data: employeData.permissions
        }
    })

    $("#storedMoney span").text(elaboratedEmployees.length + " " + getLocalizedText("menu:members"));

    updateSettingList(elaboratedEmployees, "manageEmployees");
    show(true);
}

async function showEmployeesOptions() {
    $(".main-container").html(`
    <div class="shop-settings">
        <div class="titlebox">
            <h2>${getLocalizedText("menu:employees_management")}</h2>
        </div>
        
        <ul class="left-settings"></ul>
        <ul class="right-options">
            <img src="./assets/svg/separator.svg" class="seperator">
            <a class="cancel-btn clickable" id="cancelBtn"><p>Cancel</p></a>
        </ul>

    </div>
    `);

    updateSettingList([
        {
            elementId: "hireEmployee",
            elementTitle: getLocalizedText("menu:hire_employee")
        },
        {
            elementId: "manageEmployees",
            elementTitle: getLocalizedText("menu:manage_employees")
        },
    ], "employeesOptions");
    
    show(true);
}

async function showClosePlayersToHire() {
    const closePlayers = await $.post(`https://${resName}/getClosePlayers`, JSON.stringify({}));

    $(".main-container").html(`
    <div class="shop-settings">
        <div class="titlebox">
            <h2>${getLocalizedText("menu:hire_employee")}</h2>
        </div>
        
        <ul class="left-settings"></ul>
        <ul class="right-options">
            <img src="./assets/svg/separator.svg" class="seperator">
            <a class="cancel-btn clickable" id="cancelBtn"><p>Cancel</p></a>
        </ul>

    </div>
    `);

    let settingsList = [];

    if(closePlayers && closePlayers.length > 0) {
        closePlayers.forEach(playerData => {
            settingsList.push({
                elementId: "player-id-" + playerData.id,
                elementTitle: `${getLocalizedText("menu:hire")} ${playerData.name}`,
            });
        });
    } else {
        settingsList.push({
            elementId: "no-players",
            elementTitle: getLocalizedText("menu:no_players_nearby"),
        });
    }

    updateSettingList(settingsList, "hireEmployee");
    show(true);
}

// display input menu
async function showInput(inputTitle, inputDescription, closeAfterSubmit) {
    return new Promise((resolve, reject) => {
        $(".main-container").html(`
            <div class="inputMenu">
                <div class="titlebox">
                    <h2 class="inputMenuTitle">${inputTitle}</h2>
                    <p class="inputMenuDesc">${inputDescription}</p>
                </div>
                <div class="buttons">
                    <input type="text" class="inputField" placeholder="${getLocalizedText("menu:value")}">
                    <a class="cancel-btn" id="cancel"><p>${getLocalizedText("menu:cancel")}</p></a>
                    <a class="submit-btn" id="submit"><p>${getLocalizedText("menu:submit")}</p></a>
                </div>
            </div>
        `);

        $(".inputMenu .buttons a").click(function () {
            switch ($(this).attr('id')) {
                case 'cancel': {
                    resolve();
                    break;
                }
                case 'submit': {
                    let val = $(`.inputMenu .buttons input`).val();
                    resolve(val)
                    break;
                }
            }

            if (closeAfterSubmit) {
                $(".main-container").hide();
                showShopSettings();
            }
        });
    });
}

// display confirm/cancel
async function showConfirm(inputTitle, inputDescription, closeAfterSubmit) {
    return new Promise((resolve, reject) => {
        $(".main-container").html(`
            <div class="inputMenu">
                <div class="titlebox">
                    <h2 class="inputMenuTitle">${inputTitle}</h2>
                    <p class="inputMenuDesc">${inputDescription}</p>
                </div>
                <div class="buttons">
                    <a class="cancel-btn" id="cancel"><p>${getLocalizedText("menu:cancel")}</p></a>
                    <a class="submit-btn" id="submit"><p>${getLocalizedText("menu:submit")}</p></a>
                </div>
            </div>
        `);

        $(".inputMenu .buttons a").click(function () {
            switch ($(this).attr('id')) {
                case 'cancel': {
                    resolve(false);
                    break;
                }
                case 'submit': {
                    resolve(true)
                    break;
                }
            }

            if (closeAfterSubmit) {
                show(false);
            }
        });
    });
}

// display buy shop
function showDialogToBuyShop(shopPrice, shopId, shopLabel, shopDesc, shopResell) {
    $(".main-container").html(`
    <div class="buy-shop">
        <div class="head">
            <div class="left-side">
                <h2 class="shop-title">${getLocalizedText("menu:buy_shop")}</h2>
                <div class="user-info">
                    <div class="shopPrice">
                        <div class="head-icon owner-icon"><img src="./assets/svg/crown.svg"></div>
                        <p class="shopPriceValue"><span>${getLocalizedText("menu:price")}</span><br>${CURRENCY_SYMBOL}${shopPrice}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="preview-image">
            <img src="./assets/png/shop-preview.png" class="shop-image"> 
            <div class="adress-text">
                <p class="shop-id">${shopId}</p>
                <h2>${shopLabel}</h2>
            </div>
        </div>
        <div class="right-side">
            <div class="info-box">
                <div class="info-box-desc">
                    <p><span>${getLocalizedText("menu:description")}</span><br>${shopDesc}</p>
                </div>
                <div class="info-box-id">
                    <p><span>${getLocalizedText("menu:id")}</span><br>${shopId}</p>
                </div>
                <div class="info-box-resell">
                    <p><span>${getLocalizedText("menu:resell")}</span><br>${shopResell}</p>
                </div>
            </div>
            <img src="./assets/svg/separator.svg">
            <div class="buttons">
            <a class="purchase-btn"><p>${getLocalizedText("menu:purchase")}</p></a>
            <a class="cancel-btn"><p>${getLocalizedText("menu:cancel")}</p></a>
            </div>
        </div>
    </div>
    </div>
    `);
    $(".buy-shop .buttons .purchase-btn").click(function () {
        $.post(`https://${resName}/buyPlayersShop`, JSON.stringify({shopId: shopId}));

        show(false);
    });
    $(".buy-shop .buttons .cancel-btn").click(function () {
        
        show(false);
    });
    show(true);
}

function resetSelectedItem() {
    $(".item-element").css('background', '');
    selectedItemDiv = null;
}

// append item function
function loadItems(items) {
    $.each(items, function (k, v) {
        if(!v) return; // skip if item is null
        if(!isItemNameInFilterId(v.name)) return; // skip if item is not in filter (if filter is active)

        let quantity = v.quantity || v.count || "∞";

        if(quantity == -1) {
            quantity = getLocalizedText("menu:out_of_stock")
        }

        let itemDiv = $(`
        <li class="item-element clickable" data-item-id="${v.id}" data-price="${v.price}" data-method="${v.method}" data-item-name="${v.name}" data-item-type="${v.type}">
            <div class="inner-item">
                <p class="item-count">${quantity}</p><img src="${IMAGES_PATH}/${v.name}.png" class="item-img" onerror="this.onerror=null;this.src='./images/undefined.png';" >
                <p class="item-info"><span class="item-name">${v.label}</span><br><span class="item-price">${CURRENCY_SYMBOL}${formatNum(v.price)}</span></p>
            </div>
        </li>
        `)

        if(v.method == "sell") {
            itemDiv.find(".inner-item").css("border", "1px dashed rgba(241, 196, 15,0.4)");
        } else if(v.method == "buy") {
            itemDiv.find(".inner-item").css("border", "1px dashed rgba(46, 204, 113,0.4)");
        }

        $(".items-list").append(itemDiv);
    });

    // item clicked
    $(".items-list .item-element").click(function () {
        resetSelectedItem();
        selectedItemDiv = $(this);
        
        switch(currentShopType) {
            case "playersShop": {
                const method = $(this).data('method');

                if(method == "buy") {
                    $("#main-action-btn p").text(getLocalizedText("menu:purchase"));
                    toggleSellAllButton(false);
                } else if(method == "sell") {
                    $("#main-action-btn p").text(getLocalizedText("menu:sell"));
                    toggleSellAllButton(true);
                }

                break;
            }

            case "playersShopObjectsOnSaleSettings": {
                const method = $(this).data('method');

                if(method == "sell") { // player has to sell to shop
                    toggleToBuyItemsOptions(true);
                    toggleOnSaleItemsOptions(false);
                } else if(method == "buy") { // player has to buy from shop
                    toggleToBuyItemsOptions(false);
                    toggleOnSaleItemsOptions(true);
                }

                break;
            }
        }

        $(this).css('background', 'radial-gradient(50% 50% at 50% 50%, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.2) 100%)');
    });

    const hasToShowPrice = currentShopType != "playerInventory" && currentShopType != "playersShopObjectsFromStorage";

    $(".items-list").find(".item-price").toggle(hasToShowPrice);
}

function setupSettingsClickEvents() {
    $(".shop-settings ul *").click(async function () {
        switch ($(this).attr('id')) {
            case 'toggleStatus': {
                $.post(`https://${resName}/toggleShopStatus`, JSON.stringify({shopId: currentShopId}));
                break;
            }
            case 'playerInventory': {
                currentShopType = "playerInventory";
                            
                shopTitle = getLocalizedText("menu:your_inventory")

                refreshItemsInUI();

                break;
            }
            case 'itemSale': {
                currentShopType = "playersShopObjectsOnSaleSettings";

                shopTitle = getLocalizedText("menu:objects_on_sale")

                refreshItemsInUI();

                break;
            }
            case 'shopStorage': {
                currentShopType = "playersShopObjectsFromStorage";

                shopTitle = getLocalizedText("menu:shop_storage")

                refreshItemsInUI();

                break;
            }
            case 'updateLabel': {
                const newShopLabel = await showInput(getLocalizedText("menu:update_shop_label"), getLocalizedText("menu:enter_new_shop_label"), true);

                if(newShopLabel) {
                    $.post(`https://${resName}/updateShopLabel`, JSON.stringify({shopId: currentShopId, label: newShopLabel}));
                }

                break;
            }

            case 'employees': {
                showEmployeesOptions();
                break;
            }
            
            case 'sellShop': {

                const confirm = await showConfirm(getLocalizedText("confirm"), getLocalizedText("menu:are_you_sure_to_sell_the_shop"), true)

                if(confirm) {
                    $.post(`https://${resName}/sellShop`, JSON.stringify({shopId: currentShopId}));
                    show(false);
                }

                break;
            }

            case 'cancelBtn': {
                show(false);
                break;
            }

            case 'withdraw-btn': {
                const amount = await showInput(getLocalizedText("menu:amount"), getLocalizedText("menu:enter_amount_to_withdraw"), true);
                if(amount != null) {
                    await $.post(`https://${resName}/withdrawMoney`, JSON.stringify({shopId: currentShopId, amount: amount}));
                }

                showShopSettings();

                break;
            }
            case 'deposit-btn': {
                const amount = await showInput(getLocalizedText("menu:amount"), getLocalizedText("menu:enter_amount_to_deposit"), true);

                if(amount != null) {
                    await $.post(`https://${resName}/depositMoney`, JSON.stringify({shopId: currentShopId, amount: amount}));
                };
                
                showShopSettings();

                break;
            }
        }
    });
}

function setupEmployeesOptionsClickEvents() {
    $(".shop-settings ul *").click(async function () {
        switch ($(this).attr('id')) {
            case 'hireEmployee': {
                showClosePlayersToHire();
                break;
            }

            case "manageEmployees": {
                showEmployeesManagement();
                break;
            }
            
            case 'cancelBtn': {
                showShopSettings();
                break;
            }
        }
    });
}

function setupClosePlayersToHireClickEvents() {
    $(".shop-settings ul *").click(async function () {
        switch ($(this).attr('id')) {
            case 'cancelBtn': {
                showEmployeesOptions();
                break;
            }

            default: {
                const elementId = $(this).attr('id');
                const playerId = parseInt( elementId.replace("player-id-", "") );

                if(playerId) {
                    $.post(`https://${resName}/hirePlayerId`, JSON.stringify({shopId: currentShopId, playerId: playerId}), function(successful) {
                        if(successful) {
                            showEmployeesOptions();
                        }
                    });
                }

                break;
            }
        }
    });
}

function setupEmployeesManagementClickEvents() {
    $(".shop-settings ul .clickable").click(async function () {
        switch ($(this).attr('id')) {
            case 'cancelBtn': {
                showEmployeesOptions();
                break;
            }

            case "fireBtn": {
                // Get the selected employee
                const selectedEmployeeDiv = $(".left-settings .setting-element.border");
                const identifier = selectedEmployeeDiv.attr('id');

                if(identifier) {
                    const successful = await $.post(`https://${resName}/fireEmployee`, JSON.stringify({shopId: currentShopId, identifier: identifier}));

					if(successful)
						showEmployeesManagement();
                }

                break;
            }

            case "managePermissionsBtn": {
                // Get the selected employee
                const selectedEmployeeDiv = $(".left-settings .setting-element.border");
                const playerName = selectedEmployeeDiv.find("p").text();
                const identifier = selectedEmployeeDiv.attr('id');
                const permissions = selectedEmployeeDiv.data("data");

                if(identifier) {
                    showPermissionPage(identifier, playerName, permissions);
                }

                break;
            }
        }
    });

    $(".shop-settings ul .setting-element").click(function () {
        $(".shop-settings ul .setting-element").removeClass("border");
        $(this).addClass("border");
    }); 
}

// update shop settings / employee list
function updateSettingList(settings, method) {
    $(".main-container .shop-settings .left-settings").empty();
    $.each(settings, function (k, v) {
        let div = $(`<li class="setting-element clickable" id="${v.elementId}"><p>${v.elementTitle}</p></li>`);
        div.data("data", v.data);
        $(".main-container .shop-settings .left-settings").append(div);

    });

    switch(method) {
        case "settings": {
            setupSettingsClickEvents();
            break;
        }

        case "employeesOptions": {
            setupEmployeesOptionsClickEvents();
            break;
        }

        case "hireEmployee": {
            setupClosePlayersToHireClickEvents();
            break;
        }

        case "manageEmployees": {
            setupEmployeesManagementClickEvents();
            break;
        }
    }
};

/*
███████ ███    ███ ██████  ██       ██████  ██    ██ ███████ ███████ ███████     ██████  ███████ ██████  ███    ███ ███████
██      ████  ████ ██   ██ ██      ██    ██  ██  ██  ██      ██      ██          ██   ██ ██      ██   ██ ████  ████ ██     
█████   ██ ████ ██ ██████  ██      ██    ██   ████   █████   █████   ███████     ██████  █████   ██████  ██ ████ ██ ███████
██      ██  ██  ██ ██      ██      ██    ██    ██    ██      ██           ██     ██      ██      ██   ██ ██  ██  ██      ██
███████ ██      ██ ██      ███████  ██████     ██    ███████ ███████ ███████     ██      ███████ ██   ██ ██      ██ ███████
*/

function showPermissionPage(identifier, userName, permissionList) {
    $('.main-container').html(`
    <div class='shop-permissions'>
        <div class='titlebox'>
            <h2>${userName}</h2>
        </div>
        <ul class='permissions-list'></ul>
        <div class='submit-btn'><p>Submit</p></div>
    </div>
    `);

    const ALL_PERMISSIONS = [
        {
            permissionId: "manager",
            permissionText: getLocalizedText("menu:permissions:manager"),
        },
    
        {
            permissionId: "addObjectToSale",
            permissionText: getLocalizedText("menu:permissions:add_object_to_sale"),
        },
        
        {
            permissionId: "removeObjectFromSale",
            permissionText: getLocalizedText("menu:permissions:remove_object_from_sale"),
        },
        
        {
            permissionId: "updateObjectPrice",
            permissionText: getLocalizedText("menu:permissions:update_object_price"),
        },
        
        {
            permissionId: "addObjectStocks",
            permissionText: getLocalizedText("menu:permissions:add_object_stocks"),
        },
        
        {
            permissionId: "addObjectToBuyList",
            permissionText: getLocalizedText("menu:permissions:add_object_to_buy_list"),
        },
        
        {
            permissionId: "updateObjectQuantity",
            permissionText: getLocalizedText("menu:permissions:update_object_quantity"),
        },
        
        {
            permissionId: "removeObjectFromToBuyList",
            permissionText: getLocalizedText("menu:permissions:remove_object_from_to_buy_list"),
        },
        
        {
            permissionId: "depositMoney",
            permissionText: getLocalizedText("menu:permissions:deposit_money"),
        },
        
        {
            permissionId: "withdrawMoney",
            permissionText: getLocalizedText("menu:permissions:withdraw_money"),
        },
        
        {
            permissionId: "withdrawStoredObjects",
            permissionText: getLocalizedText("menu:permissions:withdraw_stored_objects"),
        },
        
        {
            permissionId: "depositStoredObjects",
            permissionText: getLocalizedText("menu:permissions:deposit_stored_objects"),
        },
        
        {
            permissionId: "canToggleShopStatus",
            permissionText: getLocalizedText("menu:permissions:can_toggle_shop_status"),
        },
        
        {
            permissionId: "toggleDoors",
            permissionText: getLocalizedText("menu:permissions:toggle_doors"),
        },
    ];

    $.each(ALL_PERMISSIONS, function (k, v) {
        const hasPermission = permissionList[v.permissionId] || false;

        $('.permissions-list').append(`
        <li class='permission-element' id='${v.permissionId}'>
            <p class='permission-text'>${v.permissionText}</p>
            <div class='switch' id='${hasPermission}'>
                <a class='switch-off'></a>
                <div class='seperator'></div>
                <a class='switch-on'></a>
            </div>
        </li>
        `);
        $(`#${v.permissionId} .switch`).click(function () {
            let currentState = $(this).attr('id');
            if (currentState === 'false') {
                currentState = true;
            } else if (currentState === 'true') {
                currentState = false;
            }
            $(this).attr('id', currentState);
        });
    });
    $(".main-container .shop-permissions .submit-btn").click(function () {
        let permissions = {};

        $.each(ALL_PERMISSIONS, function (k, v) {
            let currentState = $(`#${v.permissionId} .switch`).attr('id');
            if (currentState === 'false') {
                currentState = false;
            } else if (currentState === 'true') {
                currentState = true;
            }
            permissions[v.permissionId] = currentState;
        });

        $.post(`https://${resName}/updateIdentifierPermissions`, JSON.stringify({shopId: currentShopId, identifier: identifier, permissions: permissions}), function(successful) {
            if(successful)
                showEmployeesManagement();
        });
    });
}

function hasPermission(permissionName) {
	let permissions = selfPermissions;

	if(!permissions) return;

	return permissions["manager"] || permissions[permissionName] || false;
}

// format numbers (1000 -> 1,000)
function formatNum(num) {
    if(typeof num !== 'number') return num;
    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, PRICES_SEPARATOR);
}

window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {
		case "showDialogToBuyShop": {
			showDialogToBuyShop(
                data.shopPrice,
                data.shopId,
                data.shopLabel,
                getLocalizedText("menu:become_the_owner_of_this_shop"),
                `${data.resellPercentage}% ( ${CURRENCY_SYMBOL}${Math.floor( data.shopPrice * data.resellPercentage / 100 )} )`)
			break;
		}

        case "openAdminShop": {
            ITEMS = data.itemsData;
            currentShopType = `adminShop-${data.type}`
            currentShopId = data.shopId
            
            shopTitle = data.shopLabel

			showMainShop();

			break;
		}

        case "openPlayersShop": {
            ITEMS = data.objectsInShop;
            currentShopType = `playersShop`
            currentShopId = data.shopId

            shopTitle = data.label

            refreshItemsInUI();
            
            break;
        }

        case "openPlayersShopManagement": {
            currentShopId = data.shopId

            selfPermissions = data.permissions;

            showShopSettings();

			break;
		}

        case "loadFilters": {
            ALL_FILTERS = data.filters;
            break;
        }

        case "loadImagesPath": {
            IMAGES_PATH = data.imagesPath;
            break;
        }

        case "loadPricesSeparator": {
            PRICES_SEPARATOR = data.symbol;
            break;
        }
    }
});

// Closes menu when clicking ESC
$(document).on('keyup', function(e) {
	if (e.key == "Escape") {
		if( $(".main-container").is(":visible") ) {
			show(false);
		}
	}
});