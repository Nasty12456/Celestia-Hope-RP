const CURRENCY_SYMBOL = "$";

const resName = GetParentResourceName();
let hasDoorsCreator = null; // editing this is useless, don't do it

/* Forms stuff */
var forms = document.querySelectorAll('.needs-validation')

// Loop over them and prevent submission
Array.prototype.slice.call(forms)
.forEach(function (form) {
	form.addEventListener('submit', function (event) {

	event.preventDefault();

	form.classList.add('was-validated')
	}, false)
})

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#shops-creator-version").text(version);

	loadAdminShops();
	loadPlayersShops();
	loadSettings(fullConfig);

    $("#shops-creator").show()
}

function closeMenu() {
	// Resets current active tab
	$("#shops-creator").find(".nav-link, .tab-pane").each(function() {
		if($(this).data("isDefault") == "1") {
			$(this).addClass(["active", "show"])
		} else {
			$(this).removeClass(["active", "show"])
		}
	})
	
    $("#shops-creator").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

/* Progress bar */
let progressBarInterval = null;
function startTimedProgressBar(time, text) {
	let progressBarDiv = $("#progressbar-div");
	let progressBar = $("#progressbar")

    $("#progressbar-text").text(text);
    progressBar.css({width: `0%`});
    progressBarDiv.fadeIn();

    let minTime = time/100;

    let progress = 0;

	progressBar.css({"transition-duration": `${minTime}ms`})

    progressBarInterval = setInterval(() => {
        if(progress >= 99) {
            progressBarDiv.hide();
            clearInterval(progressBarInterval);

			progressBarInterval = null;
        } else {
            progress++;
            progressBar.css({width: `${progress}%`});
        }
    }, minTime);
}

function stopProgressBar() {
	if(progressBarInterval) {
		clearInterval(progressBarInterval);
		$("#progressbar-div").fadeOut();
	}
}
/* Progress bar END */

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {

		case "openMenu": {
			openMenu(data.version, data.fullConfig);

			break;
		}

		case "hasDoorsCreator": {
			hasDoorsCreator = data.hasDoorsCreator;

			break;
		}

		case "progressBar": {
			startTimedProgressBar(data.time, data.text);

			break;
		}

		case "stopProgressBar": {
			stopProgressBar();

			break;
		}
	}
})

/*
███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
██      ██         ██       ██    ██ ████   ██ ██       ██      
███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
     ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
███████ ███████    ██       ██    ██ ██   ████  ██████  ███████ 
*/

/* Discord logs */
function toggleDiscordLogsInSettings(enable) {
	$("#settings-mainDiscordWebhook").prop("disabled", !enable);
	$("#settings-mainDiscordWebhook").prop("required", enable);
	
	$("#settings-specific-webooks-div").find(`.form-control`).prop("disabled", !enable);
}

$("#settings-areDiscordLogsActive").change(function() {
	let enabled = $(this).prop("checked");

	toggleDiscordLogsInSettings(enabled);
})

function getSeparatedDiscordWebhooks() {
	let webhooks = {};

	$("#settings-specific-webooks-div").find(".form-control").each(function(index, element) {
		let logType = $(element).data("logType");
		let webhook = $(element).val();

		if(webhook) {
			webhooks[logType] = webhook;
		}
	});

	return webhooks;
}
/* Discord logs END */

$("#settings").find(`input:radio[name='settings-robbery-reward-type']`).change(function() {
	let type = $(this).val();

	if(type == "fixed") {
		$("#settings-robbery-max-value").attr("max", null);
	} else if(type == "percentage") {
		$("#settings-robbery-max-value").attr("max", 100);
	}
});

function loadSettings(fullConfig) {

	// Generic
	setTomSelectValue("#settings-locale", fullConfig.locale);
	$("#settings-ace-permission").val(fullConfig.acePermission);
	$("#settings-can-always-carry").prop("checked", fullConfig.canAlwaysCarryItem);
	setTomSelectValue("#settings-targeting-script", fullConfig.targetingScript)
	setTomSelectValue("#settings-help-notification-script", fullConfig.helpNotification)

	// Shop robbery
	$("#settings").find(`input:radio[name='settings-robbery-reward-type'][value='${fullConfig.shopRobberiesReward.type}']`).prop("checked", true).change();
	$("#settings-robbery-min-value").val(fullConfig.shopRobberiesReward.minValue);
	$("#settings-robbery-max-value").val(fullConfig.shopRobberiesReward.maxValue);
	$("#settings-robbery-account").val(fullConfig.shopRobberiesReward.account);
	$("#settings-robbery-cooldown").val(fullConfig.shopRobberiesHoursCooldown);

	// Discord logs
	$("#settings-areDiscordLogsActive").prop("checked", fullConfig.areDiscordLogsActive);
	$("#settings-mainDiscordWebhook").val(fullConfig.mainDiscordWebhook);
	
	toggleDiscordLogsInSettings(fullConfig.areDiscordLogsActive);	

	for(const[logType, webhook] of Object.entries(fullConfig.specificWebhooks)) {
		$("#settings-specific-webooks-div").find(`[data-log-type="${logType}"]`).val(webhook);
	}
	// Discord logs - END

}

$("#settings").submit(async function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let clientSettings = {
		// Targeting
		targetingScript: $("#settings-targeting-script").val(),

		// Help notification
		helpNotification: $("#settings-help-notification-script").val(),
	}

	let sharedSettings = {
		locale: $("#settings-locale").val(),
	}

	let serverSettings = {
		
		// Generic
		acePermission: $("#settings-ace-permission").val(),
		canAlwaysCarryItem: $("#settings-can-always-carry").prop("checked"),

		// Discord logs
		areDiscordLogsActive: $("#settings-areDiscordLogsActive").prop("checked"),
		mainDiscordWebhook: $("#settings-mainDiscordWebhook").val(),
		specificWebhooks: getSeparatedDiscordWebhooks(),

		// Shop robbery
		shopRobberiesReward: {
			type: $("#settings").find(`input:radio[name='settings-robbery-reward-type']:checked`).val(),
			minValue: parseInt( $("#settings-robbery-min-value").val() ),
			maxValue: parseInt( $("#settings-robbery-max-value").val() ),
			account: $("#settings-robbery-account").val(),
		},

		shopRobberiesHoursCooldown: parseInt( $("#settings-robbery-cooldown").val() ),
	}

	const response = await $.post(`https://${resName}/saveSettings`, JSON.stringify({
		clientSettings: clientSettings,
		serverSettings: serverSettings,
		sharedSettings: sharedSettings
	}));
	showServerResponse(response);

	refreshTranslations(sharedSettings.locale);
});

/*
 █████  ██████  ███    ███ ██ ███    ██     ███████ ██   ██  ██████  ██████  ███████ 
██   ██ ██   ██ ████  ████ ██ ████   ██     ██      ██   ██ ██    ██ ██   ██ ██      
███████ ██   ██ ██ ████ ██ ██ ██ ██  ██     ███████ ███████ ██    ██ ██████  ███████ 
██   ██ ██   ██ ██  ██  ██ ██ ██  ██ ██          ██ ██   ██ ██    ██ ██           ██ 
██   ██ ██████  ██      ██ ██ ██   ████     ███████ ██   ██  ██████  ██      ███████ 
*/
let adminShopsDatatable = $("#admin-shops-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editAdminShop(id);
		})
	},
});

let adminShops = {};

function loadAdminShops() {
	$.post(`https://${resName}/getAllAdminShops`, {}, async function(rawAdminShops) {

		// Manually create the table to avoid incompatibilities due table indexing
		adminShops = {};

		for(const[k, adminShopData] of Object.entries(rawAdminShops)) {
			adminShops[adminShopData.id] = adminShopData;
		}

		adminShopsDatatable.clear();

		for(const[id, adminShopData] of Object.entries(adminShops)) {
			adminShopsDatatable.row.add([
				id,
				adminShopData.label
			]);
		}

		adminShopsDatatable.draw();
	})
}

function setDefaultDataOfAdminShop() {
	let adminShopModal = $("#admin-shop-modal");

	// Generic
	$("#admin-shop-label").val("Default");
	adminShopModal.data("markerData", getDefaultMarkerCustomization());
	adminShopModal.data("blipData", getDefaultBlipCustomization());

 	// Coordinates
	$("#admin-shop-coords-list").empty();

	// Ped
	$("#admin-shop-ped-is-enabled").prop("checked", false).change();
	$("#admin-shop-ped-model").val("");
	$("#admin-shop-ped-heading").val("");

	// Restrictions
	adminShopModal.data("jobsData", null);
	setRequiredLicenseForAdminShop(null);
	adminShopModal.data("allowedPlayersShops", null);

	$("#admin-shop-always-open").prop("checked", true).change();
	$("#admin-shop-minutes-before-prices-update").val(0);

	$("input[name=adminShopType][value=buy]").prop("checked", true).change();

	$("#admin-shop-objects-on-sale").empty();
}

$("#new-admin-shop-btn").click(function() {
	let adminShopModal = $("#admin-shop-modal");

	// Converts from edit modal to create modal
	adminShopModal.data("action", "create");
	
	$("#delete-admin-shop-btn").hide();
	$("#save-admin-shop-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfAdminShop();

	adminShopModal.modal("show");
})

$("#admin-shop-customize-blip-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");

	let oldBlipData = adminShopModal.data("blipData");
	let blipData = await blipDialog(oldBlipData)

	adminShopModal.data("blipData", blipData);
});

$("#admin-shop-customize-marker-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");
	
	let oldMarkerData = adminShopModal.data("markerData");
	let markerData = await markerDialog(oldMarkerData)

	adminShopModal.data("markerData", markerData);
});

$("#admin-shop-choose-jobs-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");

	let oldJobs = adminShopModal.data("jobsData");
	let jobs = await jobsDialog(oldJobs);

	adminShopModal.data("jobsData", jobs);
})

function setRequiredLicenseForAdminShop(licenseType) {
	const btn = $("#admin-shop-choose-required-license-btn");
	if(licenseType) {
		btn.text(getLocalizedText("menu:license_required") + licenseType);
	} else {
		btn.text(getLocalizedText("menu:no_license_required"));
	}

	btn.data("licenseType", licenseType ? licenseType : null);
}

$("#admin-shop-choose-required-license-btn").click(async function() {
	const requiredLicenseType = await licensesDialog();
	setRequiredLicenseForAdminShop(requiredLicenseType);
});

$("#admin-shop-choose-players-shops-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");

	let oldPlayersShops = adminShopModal.data("allowedPlayersShops");
	let allowedPlayersShops = await playersShopsDialog(oldPlayersShops);

	adminShopModal.data("allowedPlayersShops", allowedPlayersShops);
});

$("#admin-shop-always-open").change(function() {
	let isChecked = $(this).prop("checked");

	$("#admin-shop-open-time").prop("disabled", isChecked);
	$("#admin-shop-close-time").prop("disabled", isChecked);

	if (isChecked) {
		$("#admin-shop-open-time").val("00:00");
		$("#admin-shop-close-time").val("23:59");
	}
});

$("input[name=adminShopType]").change(function() {
	let type = $(this).val();

	setSelectedPayingSociety(null);
	setSelectedSocietiesForAdminShop(null);
	setSelectedSocietyToGetMoneyFrom(null);

	$("#admin-shop-pay-with-society-money").prop("checked", false).change();
	$("#admin-shop-get-money-from-society").prop("checked", false).change();

	switch(type) {
		case "buy": {
			$("#admin-shop-objects-list-label").text( getLocalizedText("menu:objects_on_sale") );
			$("#admin-shop-paying-society-div").show();
			$("#admin-shop-societies-to-send-money-to-div").show();
			$("#admin-shop-pay-with-society-money-div").show();
			$("#admin-shop-get-money-from-society-div").hide();

			break;
		}

		case "sell": {
			$("#admin-shop-objects-list-label").text( getLocalizedText("menu:objects_that_can_be_sold") );
			$("#admin-shop-paying-society-div").hide();
			$("#admin-shop-societies-to-send-money-to-div").hide();
			$("#admin-shop-pay-with-society-money-div").hide();
			$("#admin-shop-get-money-from-society-div").show();

			break;
		}

		default: {
			console.error("Unknown admin shop type: " + type);
		}
	}
});

$("#admin-shop-societies-to-send-money-to-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");

	let oldSocieties = adminShopModal.data("societiesData");

	let societies = await societiesDialog(oldSocieties);

	setSelectedSocietiesForAdminShop(societies);
})

async function addObjectToAdminShop(objectData) {
	let objectDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 admin-shop-item justify-content-center">
			<button type="button" class="btn btn-danger delete-admin-shop-item-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

			<select class="form-select item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control item-min-price" placeholder="${getLocalizedText("menu:min_price")}" required>
				<label>${getLocalizedText("menu:min_price")}</label>
			</div>

			<div class="form-floating">
				<input type="number" min="1" class="form-control item-max-price" placeholder="${getLocalizedText("menu:max_price")}" required>
				<label>${getLocalizedText("menu:max_price")}</label>
			</div>

			<div class="form-floating col-2">
				<input type="text" min="1" class="form-control item-account" placeholder="${getLocalizedText("menu:account")}" required>
				<label>${getLocalizedText("menu:account")}</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-account-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	
		</div>
	`);
	
	let minPriceInput = objectDiv.find(".item-min-price");
	let maxPriceInput = objectDiv.find(".item-max-price");

	minPriceInput.on("change", function() {
		let price = minPriceInput.val();

		if( maxPriceInput.val() == "" ) {
			maxPriceInput.val(price);
		}
	});

	maxPriceInput.on("change", function() {
		let price = maxPriceInput.val();

		if( minPriceInput.val() == "" ) {
			minPriceInput.val(price);
		}
	});

	objectDiv.find(".delete-admin-shop-item-btn").click(function() {
		objectDiv.remove();
	});

	objectDiv.find(".choose-item-btn").click(async function() {
		let objectType = objectDiv.find(".item-type").val();

		let objectName = await objectDialog(objectType);

		objectDiv.find(".item-name").val(objectName);
	}).tooltip();

	objectDiv.find(".choose-account-btn").click(async function() {
		let accountName = await objectDialog("account");

		objectDiv.find(".item-account").val(accountName);
	}).tooltip();

	const isPayingWithSocietyMoneyEnabled = $("#admin-shop-pay-with-society-money").prop("checked");

	if(isPayingWithSocietyMoneyEnabled) {
		objectDiv.find(".item-account").prop("disabled", true).prop("required", false);
		objectDiv.find(".choose-account-btn").prop("disabled", true);
	}

	if(objectData) {
		objectDiv.find(".item-type").val(objectData.type);
		objectDiv.find(".item-name").val(objectData.name);
		objectDiv.find(".item-min-price").val(objectData.minPrice);
		objectDiv.find(".item-max-price").val(objectData.maxPrice);
		objectDiv.find(".item-account").val(objectData.account);
	}

	$("#admin-shop-objects-on-sale").append(objectDiv);
}

$("#admin-shop-add-object-btn").click(function() {
	addObjectToAdminShop();
});

async function setSelectedPayingSociety(jobName) {
	let adminShopModal = $("#admin-shop-modal");

	adminShopModal.data("payingSociety", jobName);

	if(jobName) {
		$("#admin-shop-paying-society").val(await getJobLabel(jobName));
	} else {
		$("#admin-shop-paying-society").val( getLocalizedText("menu:none") );	
	}
}

async function setSelectedSocietyToGetMoneyFrom(jobName) {
	let adminShopModal = $("#admin-shop-modal");

	adminShopModal.data("societyToGetMoneyFrom", jobName);

	if(jobName) {
		$("#admin-shop-society-to-get-money-from").val(await getJobLabel(jobName));
	} else {
		$("#admin-shop-society-to-get-money-from").val( getLocalizedText("menu:none") );	
	}
}

$("#admin-shop-get-money-from-society").change(function() {
	let enabled = $(this).prop("checked");

	$("#admin-shop-choose-society-to-get-money-from-btn").prop("disabled", !enabled);
	
	if(!enabled) {
		setSelectedSocietyToGetMoneyFrom(null);
	}
})

$("#admin-shop-pay-with-society-money").change(function() {
	let enabled = $(this).prop("checked");

	$("#admin-shop-choose-paying-society-btn").prop("disabled", !enabled);

	let objectsOnSaleDiv = $("#admin-shop-objects-on-sale");

	objectsOnSaleDiv.find(".item-account").prop("disabled", enabled).prop("required", !enabled);
	objectsOnSaleDiv.find(".choose-account-btn").prop("disabled", enabled);

	if(!enabled) {
		setSelectedPayingSociety(null);
	} else {
		objectsOnSaleDiv.find(".item-account").val("");
	}
})

$("#admin-shop-choose-paying-society-btn").click(async function() {
	let jobName = await singleJobDialog();

	setSelectedPayingSociety(jobName);
})

$("#admin-shop-choose-society-to-get-money-from-btn").click(async function() {
	let jobName = await singleJobDialog();

	setSelectedSocietyToGetMoneyFrom(jobName);
})

async function setSelectedSocietiesForAdminShop(societies) {
	let adminShopModal = $("#admin-shop-modal");

	adminShopModal.data("societiesData", societies);

	if(societies) {
		let jobNames = "";

		let isTheFirst = true;

		for(const [societyName, percentage] of Object.entries(societies)) {
			if(!isTheFirst) {
				jobNames += ", ";
			} else {
				isTheFirst = false;
			}

			jobNames += await getJobLabel(societyName) + " (" + percentage + "%)";
		}

		$("#admin-shop-societies-to-send-money-to").val(jobNames);
	} else {
		$("#admin-shop-societies-to-send-money-to").val( getLocalizedText("menu:none") );
	}
}

function addCoordsToAdminShop(pointData) {
	let div = $(`
		<div class="row g-2 row-cols-auto align-items-center justify-content-center my-1">
			<button type="button" class="btn btn-danger delete-admin-shop-coords-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control admin-shop-coords-x" placeholder="X" required>
				<label>${getLocalizedText("menu:x")}</label>
			</div>

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control admin-shop-coords-y" placeholder="Y" required>
				<label>${getLocalizedText("menu:y")}</label>
			</div>

			<div class="form-floating text-body col">
				<input type="number" step="0.01" class="form-control admin-shop-coords-z" placeholder="Z" required>
				<label>${getLocalizedText("menu:z")}</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto admin-shop-current-coords-btn" data-bs-toggle="tooltip" data-bs-placement="top" data-translation-id="menu:current_coords"><i class="bi bi-arrow-down-square"></i></button>	

			<div class="form-floating ms-4 admin-shop-ped-div" style="display:none">
				<input min="0" max="360" step="0.01" type="number" class="form-control ped-heading" placeholder="Heading">
				<label>${getLocalizedText("menu:heading")}</label>
			</div>

			<button type="button" style="display:none" class="btn btn-secondary col-auto admin-shop-ped-choose-heading-btn" data-bs-toggle="tooltip" data-bs-placement="top" data-translation-id="menu:choose_heading"><i class="bi bi-arrow-down-square"></i></button>	
		</div>
	`)

	div.find(".admin-shop-current-coords-btn").click(async function() {
		let data = await chooseCoords();

		if(data) {
			div.find(".admin-shop-coords-x").val(data.coords.x);
			div.find(".admin-shop-coords-y").val(data.coords.y);
			div.find(".admin-shop-coords-z").val(data.coords.z);
		}
	});

	div.find(".admin-shop-ped-choose-heading-btn").click(async function() {
		let data = await chooseCoords();
	
		if(data) {
			div.find(".ped-heading").val(data.heading);
		}
	});

	div.find(".delete-admin-shop-coords-btn").click(function() {
		div.remove();
	});

	if(pointData) {
		div.find(".admin-shop-coords-x").val(pointData.coords.x);
		div.find(".admin-shop-coords-y").val(pointData.coords.y);
		div.find(".admin-shop-coords-z").val(pointData.coords.z);
		div.find(".ped-heading").val(pointData.heading);
	}

	const isPedEnabled = $("#admin-shop-ped-is-enabled").prop("checked");
	div.find(".admin-shop-ped-div").toggle(isPedEnabled);
	div.find(".admin-shop-ped-choose-heading-btn").toggle(isPedEnabled);


	$("#admin-shop-coords-list").append(div);
}

function getCoordsFromAdminShop() {
	let coordsList = [];

	$("#admin-shop-coords-list").find(".row").each(function() {
		let coords = {
			x: parseFloat($(this).find(".admin-shop-coords-x").val()),
			y: parseFloat($(this).find(".admin-shop-coords-y").val()),
			z: parseFloat($(this).find(".admin-shop-coords-z").val()),
		}

		let heading = parseFloat($(this).find(".ped-heading").val());
		
		coordsList.push({
			coords: coords,
			heading: heading,
		});
	});

	return coordsList;
}

$("#admin-shop-add-coordinates-btn").click(function() {
	addCoordsToAdminShop();
});

$("#admin-shop-ped-is-enabled").change(function() {
	const enabled = $(this).prop("checked");

	$("#admin-shop-ped-model").prop("disabled", !enabled).prop("required", enabled);
	$("#admin-shop-ped-heading").prop("disabled", !enabled).prop("required", enabled);

	$("#admin-shop-coords-list .ped-heading").prop("required", enabled);
	$("#admin-shop-coords-list .admin-shop-ped-div").toggle(enabled);
	$("#admin-shop-coords-list .admin-shop-ped-choose-heading-btn").toggle(enabled);
});

function editAdminShop(id) {
	let adminShopData = adminShops[id];

	let adminShopModal = $("#admin-shop-modal");

	adminShopModal.data("adminShopId", id);
	adminShopModal.data("action", "edit");

	$("#delete-admin-shop-btn").show();
	$("#save-admin-shop-btn").text(getLocalizedText("menu:confirm"));

	$("#admin-shop-label").val(adminShopData.label);

	let data = adminShopData.data;

	$(`input[name=adminShopType][value=${data.type}]`).prop("checked", true).change();

	adminShopModal.data("blipData", data.blipData);
	adminShopModal.data("markerData", data.markerData);

	// Restrictions
	adminShopModal.data("jobsData", data.jobsData);
	setRequiredLicenseForAdminShop(data.requiredLicense);
	adminShopModal.data("allowedPlayersShops", data.allowedPlayersShops);

	setSelectedPayingSociety(data.payingSociety);
	setSelectedSocietiesForAdminShop(data.societiesToSendMoneyTo);
	setSelectedSocietyToGetMoneyFrom(data.societyToGetMoneyFrom);

	$("#admin-shop-pay-with-society-money").prop("checked", data.payWithSocietyMoney).change();
	$("#admin-shop-get-money-from-society").prop("checked", data.getMoneyFromSociety).change();

	if(data.coordinatesList) {
		$("#admin-shop-coords-list").empty();
		for(const pointData of data.coordinatesList) {
			addCoordsToAdminShop(pointData);
		}
	}
	
	// Ped
	if(data.pedData) {
		$("#admin-shop-ped-is-enabled").prop("checked", data.pedData.isEnabled).change();
		$("#admin-shop-ped-model").val(data.pedData.model);
		$("#admin-shop-ped-heading").val(data.pedData.heading);
	} else {
		$("#admin-shop-ped-is-enabled").prop("checked", false).change();
		$("#admin-shop-ped-model").val("");
		$("#admin-shop-ped-heading").val("");
	}

	$("#admin-shop-open-time").val(data.openTime);
	$("#admin-shop-close-time").val(data.closeTime);

	if(data.openTime === "00:00" && data.closeTime === "23:59") {
		$("#admin-shop-always-open").prop("checked", true).change();
	} else {
		$("#admin-shop-always-open").prop("checked", false).change();
	}

	$("#admin-shop-minutes-before-prices-update").val(data.minutesBeforePricesUpdate);

	$("#admin-shop-objects-on-sale").empty();
	for(const object of data.objectsOnSale) {
		addObjectToAdminShop(object);
	}

	adminShopModal.modal("show");
}

function getObjectsOnSaleFromAdminShop() {
	let objectsOnSale = [];

	$("#admin-shop-objects-on-sale").find(".admin-shop-item").each(function() {
		let objectDiv = $(this);
		
		let objectData = {
			type: objectDiv.find(".item-type").val(),
			name: objectDiv.find(".item-name").val(),
			minPrice: parseInt( objectDiv.find(".item-min-price").val() ),
			maxPrice: parseInt( objectDiv.find(".item-max-price").val() ),
			account: objectDiv.find(".item-account").val(),
			id: parseInt(objectsOnSale.length)
		}

		objectsOnSale.push(objectData);
	});

	return objectsOnSale;
}

$("#admin-shop-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let adminShopModal = $("#admin-shop-modal");
	let action = adminShopModal.data("action");

	let adminShopData = {
		label: $("#admin-shop-label").val(),
		data: {
			// Generic
			type: $("input[name=adminShopType]:checked").val(),
			blipData: adminShopModal.data("blipData"),
			markerData: adminShopModal.data("markerData"),

			// Restrictions
			jobsData: adminShopModal.data("jobsData"),
			requiredLicense: $("#admin-shop-choose-required-license-btn").data("licenseType"),
			allowedPlayersShops: adminShopModal.data("allowedPlayersShops"),

			// Coordinates
			coordinatesList: getCoordsFromAdminShop(),

			// Ped
			pedData: {
				isEnabled: $("#admin-shop-ped-is-enabled").prop("checked"),
				model: $("#admin-shop-ped-model").val(),
				heading: parseFloat($("#admin-shop-ped-heading").val())
			},

			// Options
			openTime: $("#admin-shop-open-time").val(),
			closeTime: $("#admin-shop-close-time").val(),
			minutesBeforePricesUpdate: parseInt($("#admin-shop-minutes-before-prices-update").val()),
			societiesToSendMoneyTo: adminShopModal.data("societiesData"),
			payWithSocietyMoney: $("#admin-shop-pay-with-society-money").prop("checked"),
			getMoneyFromSociety: $("#admin-shop-get-money-from-society").prop("checked"),
			payingSociety: adminShopModal.data("payingSociety"),
			societyToGetMoneyFrom: adminShopModal.data("societyToGetMoneyFrom"),

			// On sale objects
			objectsOnSale: getObjectsOnSaleFromAdminShop()	
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createAdminShop`, JSON.stringify(adminShopData), function(isSuccessful) {
				if(isSuccessful) {
					adminShopModal.modal("hide");
					loadAdminShops();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateAdminShop`, JSON.stringify({adminShopId: adminShopModal.data("adminShopId"), adminShopData: adminShopData}), function(isSuccessful) {
				if(isSuccessful) {
					adminShopModal.modal("hide");
					loadAdminShops();
				}
			});

			break;
		}
	}
})

$("#delete-admin-shop-btn").click(function() {
	let adminShopModal = $("#admin-shop-modal");
	let adminShopId = adminShopModal.data("adminShopId");

	$.post(`https://${resName}/deleteAdminShop`, JSON.stringify({adminShopId: adminShopId}), function(isSuccessful) {
		if(isSuccessful) {
			adminShopModal.modal("hide");
			loadAdminShops();
		}
	});
});

/*
██████  ██       █████  ██    ██ ███████ ██████  ███████     ███████ ██   ██  ██████  ██████  ███████ 
██   ██ ██      ██   ██  ██  ██  ██      ██   ██ ██          ██      ██   ██ ██    ██ ██   ██ ██      
██████  ██      ███████   ████   █████   ██████  ███████     ███████ ███████ ██    ██ ██████  ███████ 
██      ██      ██   ██    ██    ██      ██   ██      ██          ██ ██   ██ ██    ██ ██           ██ 
██      ███████ ██   ██    ██    ███████ ██   ██ ███████     ███████ ██   ██  ██████  ██      ███████ 
*/
let playersShopsDatatable = $("#players-shops-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editPlayersShop(id);
		})
	},
});

let playersShops = {};

function loadPlayersShops() {
	$.post(`https://${resName}/getAllPlayersShops`, {}, async function(rawPlayersShops) {

		// Manually create the table to avoid incompatibilities due table indexing
		playersShops = {};

		for(const[k, playersShopData] of Object.entries(rawPlayersShops)) {
			playersShops[playersShopData.id] = playersShopData;
		}

		playersShopsDatatable.clear();

		for(const[id, playersShopData] of Object.entries(playersShops)) {
			playersShopsDatatable.row.add([
				id,
				playersShopData.label,
				playersShopData.storedMoney,
			]);
		}

		playersShopsDatatable.draw();
	})
}

function setDefaultDataOfPlayersShop() {
	$("#players-shop-label").val("Default");
	$("#players-shop-price").val("");
	
	$("#players-shop-coords-x").val("");
	$("#players-shop-coords-y").val("");
	$("#players-shop-coords-z").val("");
	
	$("#players-shop-management-coords-x").val("");
	$("#players-shop-management-coords-y").val("");
	$("#players-shop-management-coords-z").val("");

	$("#players-shop-can-shop-owner-rename-the-shop").prop("checked", true);
	$("#players-shop-can-be-robbed").prop("checked", true);

	setSelectedSocietiesForPlayersShop(null);

	$("input[name=playersShopType][value=both]").prop("checked", true).change();
	$("input[name=playersShopsLimitObjectsType][value=blacklist]").prop("checked", true).change();

	// Ped
	$("#players-shop-ped-is-enabled").prop("checked", false).change();
	$("#players-shop-ped-model").val("");
	$("#players-shop-ped-heading").val("");

	// Allowed objects to be managed
	$("#allowed-objects-items").prop("checked", true);
	$("#allowed-objects-weapons").prop("checked", true);

	$("#players-shop-resell-percentage").val(50);

	let playersShopModal = $("#players-shop-modal");
	
	playersShopModal.data("limitedObjects", {});
	playersShopModal.data("markerData", getDefaultMarkerCustomization());
	playersShopModal.data("blipData", getDefaultBlipCustomization());
}

$("#new-players-shop-btn").click(function() {
	let playersShopModal = $("#players-shop-modal");

	// Converts from edit modal to create modal
	playersShopModal.data("action", "create");
	
	$("#delete-players-shop-btn").hide();
	$("#save-players-shop-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfPlayersShop();

	playersShopModal.modal("show");
});

$("#players-shop-ped-is-enabled").change(function() {
	const enabled = $(this).prop("checked");

	$("#players-shop-ped-model").prop("disabled", !enabled).prop("required", enabled);
	$("#players-shop-ped-heading").prop("disabled", !enabled).prop("required", enabled);
	$("#players-shop-ped-choose-heading-btn").prop("disabled", !enabled);
});

$("#players-shop-ped-choose-heading-btn").click(async function() {
	let data = await chooseCoords();

	if(data) {
		$("#players-shop-ped-heading").val(data.heading);
	}
});

function editPlayersShop(id) {
	let playersShopData = playersShops[id];

	let playersShopModal = $("#players-shop-modal");

	playersShopModal.data("playersShopId", id);
	playersShopModal.data("action", "edit");

	$("#delete-players-shop-btn").show();
	$("#save-players-shop-btn").text(getLocalizedText("menu:confirm"));

	$("#players-shop-label").val(playersShopData.label);
	$("#players-shop-price").val(playersShopData.price);

	let data = playersShopData.data;

	$(`input[name=playersShopType][value=${data.type}]`).prop("checked", true).change();

	setSelectedSocietiesForPlayersShop(data.societiesToSendMoneyTo);

	$("#players-shop-coords-x").val(data.coords.x);
	$("#players-shop-coords-y").val(data.coords.y);
	$("#players-shop-coords-z").val(data.coords.z);

	$("#players-shop-management-coords-x").val(data.managementCoords.x);
	$("#players-shop-management-coords-y").val(data.managementCoords.y);
	$("#players-shop-management-coords-z").val(data.managementCoords.z);

	$("#players-shop-can-shop-owner-rename-the-shop").prop("checked", data.canShopOwnerRenameTheShop);
	$("#players-shop-can-be-robbed").prop("checked", data.canBeRobbed);

	$(`input[name=playersShopsLimitObjectsType][value=${data.limitedObjectsType}]`).prop("checked", true).change();

	// Peds
	if(data.pedData?.isEnabled) {
		$("#players-shop-ped-is-enabled").prop("checked", true).change();
		$("#players-shop-ped-model").val(data.pedData.model);
		$("#players-shop-ped-heading").val(data.pedData.heading);
	} else {
		$("#players-shop-ped-is-enabled").prop("checked", false).change();
		$("#players-shop-ped-model").val("");
		$("#players-shop-ped-heading").val("");
	}

	// Allowed objects to be managed
	$("#allowed-objects-items").prop("checked", data.allowedToManage.items);
	$("#allowed-objects-weapons").prop("checked", data.allowedToManage.weapons);

	$("#players-shop-resell-percentage").val(data.resellPercentage);

	playersShopModal.data("limitedObjects", data.limitedObjects);
	playersShopModal.data("markerData", data.markerData);
	playersShopModal.data("blipData", data.blipData);
	playersShopModal.data("doors", data.doors);

	playersShopModal.modal("show");
}

$("#players-shop-customize-blip-btn").click(async function() {
	let playersShopModal = $("#players-shop-modal");

	let oldBlipData = playersShopModal.data("blipData");
	let blipData = await blipDialog(oldBlipData)

	playersShopModal.data("blipData", blipData);
});

$("#players-shop-customize-marker-btn").click(async function() {
	let playersShopModal = $("#players-shop-modal");
	
	let oldMarkerData = playersShopModal.data("markerData");
	let markerData = await markerDialog(oldMarkerData)

	playersShopModal.data("markerData", markerData);
});

$("#players-shop-choose-doors-btn").click(async function() {
	const oldDoors = $("#players-shop-modal").data("doors");
	const doors = await doorsDialog(oldDoors);

	$("#players-shop-modal").data("doors", doors);
})

$("#players-shop-current-coords-btn").click(async function() {
	let data = await chooseCoords();

	if(data) {
		$("#players-shop-coords-x").val(data.coords.x);
		$("#players-shop-coords-y").val(data.coords.y);
		$("#players-shop-coords-z").val(data.coords.z);
	}
});

$("#players-shop-current-management-coords-btn").click(async function() {
	let data = await chooseCoords();

	if(data) {
		$("#players-shop-management-coords-x").val(data.coords.x);
		$("#players-shop-management-coords-y").val(data.coords.y);
		$("#players-shop-management-coords-z").val(data.coords.z);	
	}
});

$("#players-shop-choose-limited-objects-btn").click(async function() {
	let playersShopModal = $("#players-shop-modal");

	let oldLimitedObjects = playersShopModal.data("limitedObjects");
	let limitedObjects = await limitedObjectsDialog(oldLimitedObjects)

	playersShopModal.data("limitedObjects", limitedObjects);
});

async function setSelectedSocietiesForPlayersShop(societies) {
	let playersShopModal = $("#players-shop-modal");

	playersShopModal.data("societiesData", societies);

	if(societies) {
		let jobNames = "";

		let isTheFirst = true;

		for(const [societyName, percentage] of Object.entries(societies)) {
			if(!isTheFirst) {
				jobNames += ", ";
			} else {
				isTheFirst = false;
			}

			jobNames += await getJobLabel(societyName) + " (" + percentage + "%)";
		}

		$("#players-shop-societies-to-send-money-to").val(jobNames);
	} else {
		$("#players-shop-societies-to-send-money-to").val( getLocalizedText("menu:none") );
	}
}

$("#players-shop-societies-to-send-money-to-btn").click(async function() {
	let adminShopModal = $("#admin-shop-modal");

	let oldSocieties = adminShopModal.data("societiesData");

	let societies = await societiesDialog(oldSocieties);

	setSelectedSocietiesForPlayersShop(societies);
})

$("#players-shop-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let playersShopModal = $("#players-shop-modal");
	let action = playersShopModal.data("action");

	let playersShopData = {
		label: $("#players-shop-label").val(),
		price: parseInt( $("#players-shop-price").val() ),
		data: {
			canShopOwnerRenameTheShop: $("#players-shop-can-shop-owner-rename-the-shop").prop("checked"),
			canBeRobbed: $("#players-shop-can-be-robbed").prop("checked"),
			societiesToSendMoneyTo: playersShopModal.data("societiesData"),

			blipData: playersShopModal.data("blipData"),
			markerData: playersShopModal.data("markerData"),
			type: $("input[name=playersShopType]:checked").val(),
			coords: {
				x: parseFloat($("#players-shop-coords-x").val()),
				y: parseFloat($("#players-shop-coords-y").val()),
				z: parseFloat($("#players-shop-coords-z").val())
			},
			managementCoords: {
				x: parseFloat($("#players-shop-management-coords-x").val()),
				y: parseFloat($("#players-shop-management-coords-y").val()),
				z: parseFloat($("#players-shop-management-coords-z").val())
			},
			pedData: {
				isEnabled: $("#players-shop-ped-is-enabled").prop("checked"),
				model: $("#players-shop-ped-model").val(),
				heading: parseFloat($("#players-shop-ped-heading").val()),
			},
			allowedToManage: {
				items: $("#allowed-objects-items").prop("checked"),
				weapons: $("#allowed-objects-weapons").prop("checked"),
			},
			limitedObjectsType: $("input[name=playersShopsLimitObjectsType]:checked").val(),
			limitedObjects: playersShopModal.data("limitedObjects"),
			resellPercentage: parseInt( $("#players-shop-resell-percentage").val() ),
			doors: playersShopModal.data("doors")
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createPlayersShop`, JSON.stringify(playersShopData), function(isSuccessful) {
				if(isSuccessful) {
					playersShopModal.modal("hide");
					loadPlayersShops();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updatePlayersShop`, JSON.stringify({playersShopId: playersShopModal.data("playersShopId"), playersShopData: playersShopData}), function(isSuccessful) {
				if(isSuccessful) {
					playersShopModal.modal("hide");
					loadPlayersShops();
				}
			});

			break;
		}
	}
})

$("#delete-players-shop-btn").click(function() {
	let playersShopModal = $("#players-shop-modal");
	let playersShopId = playersShopModal.data("playersShopId");

	$.post(`https://${resName}/deletePlayersShop`, JSON.stringify({playersShopId: playersShopId}), function(isSuccessful) {
		if(isSuccessful) {
			playersShopModal.modal("hide");
			loadPlayersShops();
		}
	});
});

/*
███████ ██   ██  ██████  ██████      ██    ██ ██ 
██      ██   ██ ██    ██ ██   ██     ██    ██ ██ 
███████ ███████ ██    ██ ██████      ██    ██ ██ 
     ██ ██   ██ ██    ██ ██          ██    ██ ██ 
███████ ██   ██  ██████  ██           ██████  ██ 
*/


/* 
 ██████  ███████ ████████     ██ ███    ██ ██    ██ ███████ ███    ██ ████████  ██████  ██████  ██ ███████ ███████ 
██       ██         ██        ██ ████   ██ ██    ██ ██      ████   ██    ██    ██    ██ ██   ██ ██ ██      ██      
██   ███ █████      ██        ██ ██ ██  ██ ██    ██ █████   ██ ██  ██    ██    ██    ██ ██████  ██ █████   ███████ 
██    ██ ██         ██        ██ ██  ██ ██  ██  ██  ██      ██  ██ ██    ██    ██    ██ ██   ██ ██ ██           ██ 
 ██████  ███████    ██        ██ ██   ████   ████   ███████ ██   ████    ██     ██████  ██   ██ ██ ███████ ███████                                                                                                                    
*/ 

// Items which can be used with the shop
async function retrievePlayerSellableObjects(shopId) {
	return new Promise((resolve, reject) => {
		$.post(`https://${resName}/retrievePlayerSellableObjects`, JSON.stringify({shopId: shopId}), function(itemsData) {
			resolve(itemsData);
		});
	});
}

// Shop items on sale/to buy list
async function retrieveObjectsOnSaleFromShop(shopId) {
	return new Promise(function(resolve, reject) {
		$.post(`https://${resName}/retrieveObjectsOnSaleFromShop`, JSON.stringify({shopId: shopId}), function(objects) {
			resolve(objects);
		});
	});
}

// Shop storage (NOT on sale items)
async function retrieveObjectsFromStorage(shopId) {
	return new Promise(function(resolve, reject) {
		$.post(`https://${resName}/retrieveObjectsFromStorage`, JSON.stringify({shopId: shopId}), function(objects) {
			resolve(objects);
		});
	});
}