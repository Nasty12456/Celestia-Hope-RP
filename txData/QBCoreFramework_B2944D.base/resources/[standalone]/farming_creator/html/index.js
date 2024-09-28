const resName = GetParentResourceName();
let hasDoorsCreator = null; // editing this is useless, don't do it

// Open/Close menu
function openMenu(version, fullConfig) {
	$("#farming-creator-version").text(version);

	loadSeeds();
	loadFields();
	loadFarms();
	loadWorkbenches();
	loadFoundries();
	loadFormulas();
	loadSettings(fullConfig);

    $("#farming-creator").show()
}

function closeMenu() {
	// Resets current active tab
	$("#farming-creator").find(".nav-link, .tab-pane").each(function() {
		if($(this).data("isDefault") == "1") {
			$(this).addClass(["active", "show"])
		} else {
			$(this).removeClass(["active", "show"])
		}
	})
	
    $("#farming-creator").hide();

    $.post(`https://${resName}/close`, {})
}
$("#close-main-btn").click(closeMenu);

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {
		case "openMenu": {
			openMenu(data.version, data.fullConfig);

			break;
		}
	}
});

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

$("#settings-item-to-burn-plants-choose-item").click(async function() {
	const itemName = await itemsDialog();

	$("#settings-item-to-burn-plants-item-name").val(itemName);
})

$("#settings-burn-plants-animations-btn").click(async function() {
	const oldAnimations = $("#settings-burn-plants-animations-btn").data("animationsData");
	const newAnimations = await animationsDialog(oldAnimations || []);

	$("#settings-burn-plants-animations-btn").data("animationsData", newAnimations);
})

function loadSettings(fullConfig) {

	// Language
	setTomSelectValue("#settings-locale", fullConfig.locale)
	setTomSelectValue("#settings-targeting-script", fullConfig.targetingScript)
	setTomSelectValue("#settings-help-notification-script", fullConfig.helpNotification)

	// Generic
	$("#settings-ace-permission").val(fullConfig.acePermission);
	$("#settings-can-always-carry").prop("checked", fullConfig.canAlwaysCarryItem);
	$("#settings-can-receive-multiple-same-item").prop("checked", fullConfig.canReceiveMultipleTimesTheSameItem);
	$("#settings-menu-position").val(fullConfig.menuPosition);
	$("#settings-targeting-script").val(fullConfig.targetingScript);

	// Seeds
	$("#settings-time-to-burn-plants").val(fullConfig.timeToBurnPlants);
	$("#settings-minimum-distance-between-plants").val(fullConfig.minimumDistanceBetweenPlants);
	$("#settings-burn-plants-animations-btn").data("animationsData", fullConfig.burnPlantsAnimations || []);
	$("#settings-item-to-burn-plants-is-required").prop("checked", fullConfig.itemToBurnPlants.isRequired);
	$("#settings-item-to-burn-plants-item-name").val(fullConfig.itemToBurnPlants.name);
	$("#settings-item-to-burn-plants-minimum-quantity").val(fullConfig.itemToBurnPlants.minQuantity);
	$("#settings-item-to-burn-plants-lose-on-use").prop("checked", fullConfig.itemToBurnPlants.loseOnUse);

	// Farms
	$("#settings-allow-afk-farming").prop("checked", fullConfig.allowAfkFarming);

	// Foundries
	$("#settings-allow-to-save-formulas").prop("checked", fullConfig.allowToSaveFormulas);

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
		// Generic
		menuPosition: $("#settings-menu-position").val(),
		targetingScript: $("#settings-targeting-script").val(),
		helpNotification: $("#settings-help-notification-script").val(),

		// Seeds
		minimumDistanceBetweenPlants: parseFloat( $("#settings-minimum-distance-between-plants").val() ),
		burnPlantsAnimations: $("#settings-burn-plants-animations-btn").data("animationsData"),

		// Farms
		allowAfkFarming: $("#settings-allow-afk-farming").prop("checked"),
	}

	let sharedSettings = {
		locale: $("#settings-locale").val(),
		timeToBurnPlants: parseInt( $("#settings-time-to-burn-plants").val() ),
		allowToSaveFormulas: $("#settings-allow-to-save-formulas").prop("checked")
	}

	let serverSettings = {
		// Generic
		acePermission: $("#settings-ace-permission").val(),
		canAlwaysCarryItem: $("#settings-can-always-carry").prop("checked"),
		canReceiveMultipleTimesTheSameItem: $("#settings-can-receive-multiple-same-item").prop("checked"),

		// Seeds
		itemToBurnPlants: {
			isRequired: $("#settings-item-to-burn-plants-is-required").prop("checked"),
			name: $("#settings-item-to-burn-plants-item-name").val(),
			minQuantity: parseInt( $("#settings-item-to-burn-plants-minimum-quantity").val() ),
			loseOnUse: $("#settings-item-to-burn-plants-lose-on-use").prop("checked"),
		},

		// Discord logs
		areDiscordLogsActive: $("#settings-areDiscordLogsActive").prop("checked"),
		mainDiscordWebhook: $("#settings-mainDiscordWebhook").val(),
		specificWebhooks: getSeparatedDiscordWebhooks(),
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
███████ ███████ ███████ ██████  ███████ 
██      ██      ██      ██   ██ ██      
███████ █████   █████   ██   ██ ███████ 
     ██ ██      ██      ██   ██      ██ 
███████ ███████ ███████ ██████  ███████ 
*/
let seedsDatatable = $("#seeds-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editSeed(id);
		})
	},
});

let seeds = {};

function loadSeeds() {
	$.post(`https://${resName}/getAllSeeds`, {}, async function(rawSeeds) {

		// Manually create the table to avoid incompatibilities due table indexing
		seeds = {};

		for(const[k, seedData] of Object.entries(rawSeeds)) {
			seeds[seedData.id] = seedData;
		}

		seedsDatatable.clear();

		for(const[id, seedData] of Object.entries(seeds)) {
			seedsDatatable.row.add([
				id,
				seedData.label,
				seedData.data.stages.length
			]);
		}

		seedsDatatable.draw();
	})
}

function setDefaultDataOfSeed() {
	$("#seed-label").val("Default");
	$("#seed-maximum-steepness").val(55);
	$("#seed-minimum-free-space-above").val(3.0);
	$("#seed-item-name").val("");
	$("#seed-item-minimum-quantity").val(1);
	$("#seed-item-lose-on-use-checkbox").prop("checked", true);
	$("#seed-minimum-police").val(0);

	let seedModal = $("#seed-modal");
	seedModal.data("materialsOptions", getDefaultMaterialsOptions());
	seedModal.data("plantingAnimations", [defaultPlantingAnimData]);
	seedModal.data("markerData", getDefaultMarkerCustomization());

	$("#seed-stages").empty();
}

$("#new-seed-btn").click(function() {
	let seedModal = $("#seed-modal");

	// Converts from edit modal to create modal
	seedModal.data("action", "create");
	
	$("#delete-seed-btn").hide();
	$("#save-seed-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfSeed();

	seedModal.modal("show");
})

$("#materials-options-btn").click(async function() {
	let seedModal = $("#seed-modal");

	const oldMaterials = seedModal.data("materialsOptions");
	const newMaterials = await groundMaterialsDialog(oldMaterials);
	
	seedModal.data("materialsOptions", newMaterials);
})

$("#seed-planting-animation-btn").click(async function() {
	let seedModal = $("#seed-modal");

	const oldAnimations = seedModal.data("plantingAnimations");
	const newAnimations = await animationsDialog(oldAnimations);
	
	seedModal.data("plantingAnimations", newAnimations);
});

$("#seed-customize-marker-btn").click(async function() {
	let seedModal = $("#seed-modal");

	const oldMarkerData = seedModal.data("markerData");
	const newMarkerData = await markerDialog(oldMarkerData);

	seedModal.data("markerData", newMarkerData);
});

$("#choose-seed-item-name-btn").click(async function() {
	const itemName = await itemsDialog();

	$("#seed-item-name").val(itemName);
})

function renameAllStagesByTheirOrder() {
	$("#seed-stages").find(".stage-title").each(function(index, element) {
		let stageNumber = index + 1;

		$(this).prop("innerHTML", `${ getLocalizedText("menu:stage") }  ${stageNumber}`)
	});
}

async function addRequiredItemToStage(stageDiv, requiredItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 required-item justify-content-center">
			<button type="button" class="btn-close delete-required-item-btn me-3" ></button>	

			<select class="form-select required-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control required-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control required-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-check my-auto fs-4 ms-1">
				<input class="form-check-input required-item-lose-on-use-checkbox" type="checkbox" value="">
				<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
			</div>

		</div>
	`);
	
	itemDiv.find(".delete-required-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".required-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".required-item-name").val(objectName);
	}).tooltip();

	
	if(requiredItem) {
		itemDiv.find(".required-item-type").val(requiredItem.type);
		itemDiv.find(".required-item-name").val(requiredItem.name);
		itemDiv.find(".required-item-min-quantity").val(requiredItem.minQuantity);
		itemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", requiredItem.loseOnUse);
	}

	stageDiv.find(".stage-required-items-list").append(itemDiv);
}
 
async function addRewardItemToStage(stageDiv, rewardItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 reward-item justify-content-center">
			<button type="button" class="btn-close delete-reward-item-btn me-3" ></button>	

			<select class="form-select reward-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control reward-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>
			
			<div class="form-floating col-2">
				<input type="number"  class="form-control reward-item-chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);
	
	itemDiv.find(".delete-reward-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".reward-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".reward-item-name").val(objectName);
	}).tooltip();

	
	if(rewardItem) {
		itemDiv.find(".reward-item-type").val(rewardItem.type);
		itemDiv.find(".reward-item-name").val(rewardItem.name);
		itemDiv.find(".reward-item-min-quantity").val(rewardItem.minQuantity);
		itemDiv.find(".reward-item-max-quantity").val(rewardItem.maxQuantity);
		itemDiv.find(".reward-item-chances").val(rewardItem.chances);
	}

	stageDiv.find(".stage-reward-items-list").append(itemDiv);
}

function addSeedStage(stageData) {
	const stageIndex = $("#seed-stages").children(".stage").length + 1;

	let stageDiv = $(`
		<div class="stage">
			<h3 class="text-center stage-title">${getLocalizedText("menu:stage")} ${stageIndex}</h3>

			<div class="d-flex gap-2 align-items-center justify-content-center mt-3">
				<div class="form-floating text-body col-3">
					<input type="text" class="form-control plant-model" placeholder="Plant model" required>
					<label>${getLocalizedText("menu:plant_model")}</label>
				</div>

				<a class="btn btn-secondary clickable open-models-btn" target="_blank" onclick='window.invokeNative("openUrl", "https://forge.plebmasters.de/objects/")' data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:open_models_list") }"><i class="bi bi-images"></i></a>
			
				<div class="form-floating text-body col-2 ms-3">
					<input type="text" class="form-control stage-label" placeholder="Label" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:player_can_see_this") }" required>
					<label>${getLocalizedText("menu:label")}</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" class="form-control stage-duration" placeholder="Duration" min="1" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:stage_duration_description") }" required>
					<label>${getLocalizedText("menu:duration_minutes")}</label>
				</div>

				<div class="form-floating text-body col-2">
					<input type="number" class="form-control stage-minutes-before-death" placeholder="Duration" min="1" value="60" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:minutes_before_death_description") }" required>
					<label>${getLocalizedText("menu:minutes_before_death")}</label>
				</div>

				<button type="button" class="btn btn-secondary mx-3 seed-stage-end-animation-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:stage_end_animation_description") }">${getLocalizedText("menu:stage_end_animation")}</button>
			</div>

			<h3 class="text-center mt-5">${getLocalizedText("menu:on_stage_end")}</h3>

			<div>
				<p class="text-center fs-4">${getLocalizedText("menu:required_items")}</p>

				<div class="stage-required-items-list">

				</div>

				<button type="button" class="btn btn-secondary stage-add-required-item-btn">${getLocalizedText("menu:add_item")}</button>
			</div>

			<div>
				<p class="text-center fs-4">${getLocalizedText("menu:items_to_give")}</p>

				<div class="my-4 row g-2 row-cols-auto align-items-center justify-content-center">
					<p class="text-center fs-4 my-auto me-3">${ getLocalizedText("menu:amount_of_objects_as_reward") }</p>

					<div class="form-floating text-body col-3">
						<input type="number" class="form-control min-objects-amount" placeholder="Minimum" required>
						<label>${ getLocalizedText("menu:min_quantity") }</label>
					</div>

					<div class="form-floating text-body col-3">
						<input type="number" class="form-control max-objects-amount" placeholder="Maximum" required>
						<label>${ getLocalizedText("menu:max_quantity") }</label>
					</div>
				</div>
					
				<div class="stage-reward-items-list">

				</div>

				<button type="button" class="btn btn-secondary stage-add-reward-item-btn">${getLocalizedText("menu:add_item")}</button>
			</div>

			<div class="d-inline-block col-12 mt-1">
				<button type="button" class="btn btn-warning btn-sm float-end delete-stage-btn">${getLocalizedText("menu:delete_stage")}</button>
			</div>

			<hr class="thick-hr">
		</div>
	`);

	stageDiv.find("[data-bs-toggle='tooltip']").tooltip();

	stageDiv.find(".delete-stage-btn").click(function() {
		stageDiv.remove();
		renameAllStagesByTheirOrder();
	});

	stageDiv.find(".stage-add-required-item-btn").click(function() {
		addRequiredItemToStage(stageDiv);
	});

	stageDiv.find(".stage-add-reward-item-btn").click(function() {
		addRewardItemToStage(stageDiv);
	});

	// Default interaction animation in case there isn't any
	stageDiv.data("stageEndAnimations", [defaultPlantInteractionAnimData]);

	stageDiv.find(".seed-stage-end-animation-btn").click(async function() {
		const oldAnimations = stageDiv.data("stageEndAnimations");
		const newAnimations = await animationsDialog(oldAnimations);
		
		stageDiv.data("stageEndAnimations", newAnimations);
	});

	if(stageData) {
		stageDiv.find(".plant-model").val(stageData.plantModel);
		stageDiv.find(".stage-label").val(stageData.label);
		stageDiv.find(".stage-duration").val(stageData.duration);
		stageDiv.find(".stage-minutes-before-death").val(stageData.minutesBeforeDeath);
		
		stageDiv.find(".min-objects-amount").val(stageData.minObjectsAmount);
		stageDiv.find(".max-objects-amount").val(stageData.maxObjectsAmount);

		stageDiv.data("stageEndAnimations", stageData.stageEndAnimations);

		for(let requiredItem of stageData.requiredItems) {
			addRequiredItemToStage(stageDiv, requiredItem);
		}

		for(let rewardItem of stageData.rewardItems) {
			addRewardItemToStage(stageDiv, rewardItem);
		}
	} else {
		addRequiredItemToStage(stageDiv);
		addRewardItemToStage(stageDiv);

		// If it's not the first stage, the model will be copied from the stage before
		if(stageIndex > 1) {
			const model = $("#seed-stages").children(".stage").last().find(".plant-model").val();

			stageDiv.find(".plant-model").val(model);
		}
	}

	$("#seed-stages").append(stageDiv);
}

$("#add-seed-stage-btn").click(function() {
	addSeedStage();
})

function editSeed(id) {
	let seedModal = $("#seed-modal");

	// Converts from create modal to edit modal
	seedModal.data("action", "edit");
	seedModal.data("seedId", id);

	$("#delete-seed-btn").show();
	$("#save-seed-btn").text( getLocalizedText("menu:save") );

	const seedInfo = seeds[id];
	const seedData = seedInfo.data;

	$("#seed-label").val(seedInfo.label);
	$("#seed-maximum-steepness").val(seedData.maximumSteepness);
	$("#seed-minimum-free-space-above").val(seedData.minimumFreeSpaceAbove);
	$("#seed-item-name").val(seedData.seedItemName);
	$("#seed-item-minimum-quantity").val(seedData.seedItemMinimumQuantity);
	$("#seed-item-lose-on-use-checkbox").prop("checked", seedData.seedItemLoseOnUse);
	$("#seed-minimum-police").val(seedData.minimumPolice);

	seedModal.data("materialsOptions", seedData.materialsOptions);
	seedModal.data("plantingAnimations", seedData.plantingAnimations || [defaultPlantingAnimData]);
	seedModal.data("markerData", seedData.markerData || getDefaultMarkerCustomization());

	$("#seed-stages").empty();

	if(seedData.stages) {
		for(const[stage, stageData] of Object.entries(seedData.stages)) {
			addSeedStage(stageData);
		}
	}

	seedModal.modal("show");
}

function getRequiredItemFromStageDiv(stageDiv) {
	let requiredItems = [];

	stageDiv.find(".stage-required-items-list").find(".required-item").each(function() {
		const itemData = {
			type: $(this).find(".required-item-type").val(),
			name: $(this).find(".required-item-name").val(),
			minQuantity: parseInt( $(this).find(".required-item-min-quantity").val() ),
			loseOnUse: $(this).find(".required-item-lose-on-use-checkbox").prop("checked")
		}

		requiredItems.push(itemData);
	});

	return requiredItems;
}

function getRewardItemFromStageDiv(stageDiv) {
	let rewardItems = [];

	stageDiv.find(".stage-reward-items-list").find(".reward-item").each(function() {
		const itemData = {
			type: $(this).find(".reward-item-type").val(),
			name: $(this).find(".reward-item-name").val(),
			minQuantity: parseInt( $(this).find(".reward-item-min-quantity").val() ),
			maxQuantity: parseInt( $(this).find(".reward-item-max-quantity").val() ),
			chances: parseInt( $(this).find(".reward-item-chances").val() ),
		}

		rewardItems.push(itemData);
	});

	return rewardItems;
}

function getSeedStages() {
	let stages = [];

	$("#seed-stages").find(".stage").each(function() {
		let stage = {
			plantModel: $(this).find(".plant-model").val(),
			label: $(this).find(".stage-label").val(),
			duration: parseInt( $(this).find(".stage-duration").val() ),
			minutesBeforeDeath: parseInt( $(this).find(".stage-minutes-before-death").val() ),
			stageEndAnimations: $(this).data("stageEndAnimations"),
			requiredItems: getRequiredItemFromStageDiv( $(this) ),
			minObjectsAmount: parseInt( $(this).find(".min-objects-amount").val() ),
			maxObjectsAmount: parseInt( $(this).find(".max-objects-amount").val() ),
			rewardItems: getRewardItemFromStageDiv( $(this) ),
		};

		stages.push(stage);
	});

	return stages;
}

$("#seed-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let seedModal = $("#seed-modal");
	let action = seedModal.data("action");

	let seedData = {
		label: $("#seed-label").val(),
		data: {
			maximumSteepness: parseInt( $("#seed-maximum-steepness").val() ),
			minimumFreeSpaceAbove: parseFloat( $("#seed-minimum-free-space-above").val() ), 
			materialsOptions: seedModal.data("materialsOptions"),
			plantingAnimations: seedModal.data("plantingAnimations") || [defaultPlantingAnimData],
			markerData: seedModal.data("markerData"),
			seedItemName: $("#seed-item-name").val(),
			seedItemMinimumQuantity: parseInt( $("#seed-item-minimum-quantity").val() ),
			seedItemLoseOnUse: $("#seed-item-lose-on-use-checkbox").prop("checked"),
			minimumPolice: parseInt( $("#seed-minimum-police").val() ),
			stages: getSeedStages()
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createSeed`, JSON.stringify(seedData), function(isSuccessful) {
				if(isSuccessful) {
					seedModal.modal("hide");
					loadSeeds();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateSeed`, JSON.stringify({seedId: seedModal.data("seedId"), seedData: seedData}), function(isSuccessful) {
				if(isSuccessful) {
					seedModal.modal("hide");
					loadSeeds();
				}
			});

			break;
		}
	}
})

$("#delete-seed-btn").click(function() {
	let seedModal = $("#seed-modal");
	let seedId = seedModal.data("seedId");

	$.post(`https://${resName}/deleteSeed`, JSON.stringify({seedId: seedId}), function(isSuccessful) {
		if(isSuccessful) {
			seedModal.modal("hide");
			loadSeeds();
		}
	});
});

/*
███████ ██ ███████ ██      ██████  ███████
██      ██ ██      ██      ██   ██ ██     
█████   ██ █████   ██      ██   ██ ███████
██      ██ ██      ██      ██   ██      ██
██      ██ ███████ ███████ ██████  ███████
*/
let fieldsDatatable = $("#fields-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editField(id);
		})
	},
});

let fields = {};

async function getCountOfObjectsForFieldId(id) {
	return new Promise(function(resolve) {
		$.post(`https://${resName}/getCountOfObjectsForFieldId`, JSON.stringify({fieldId: parseInt(id)}), function(count) {
			resolve(count);
		});
	});
}

function loadFields() {
	$.post(`https://${resName}/getAllFields`, {}, async function(rawFields) {

		// Manually create the table to avoid incompatibilities due table indexing
		fields = {};

		for(const[k, fieldData] of Object.entries(rawFields)) {
			fields[fieldData.id] = fieldData;
		}

		fieldsDatatable.clear();

		for(const[id, fieldData] of Object.entries(fields)) {
			fieldsDatatable.row.add([
				id,
				fieldData.label,
				fieldData.data.radius,
				await getCountOfObjectsForFieldId(id),
			]);
		}

		fieldsDatatable.draw();
	})
}

function setDefaultDataOfField() {
	$("#field-label").val("Default");
	$("#field-object-model").val("");
	$("#field-radius").val(30.0);
	$("#field-minimum-police").val(0);
	$("#field-max-objects").val(30);
	$("#field-respawn-timer").val(15);
	
	$("#field-coords-x").val("");
	$("#field-coords-y").val("");
	$("#field-coords-z").val("");

	$("#field-reward-min-objects-amount").val(1);
	$("#field-reward-max-objects-amount").val(1);

	$("#field-required-items-list").empty();
	$("#field-reward-items-list").empty();

	$("#field-modal").find("input:radio[name='field-spawn-coords-type'][value='automatic']").prop("checked", true).change();

	let fieldModal = $("#field-modal");
	fieldModal.data("animations", [defaultPlantInteractionAnimData]);
	fieldModal.data("blipData", getDefaultBlipCustomization());
	fieldModal.data("allowedJobs", null);
	fieldModal.data("availableSpawnPoints", null);
}

$("#new-field-btn").click(function() {
	let fieldModal = $("#field-modal");

	// Converts from edit modal to create modal
	fieldModal.data("action", "create");
	
	$("#delete-field-btn").hide();
	$("#save-field-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfField();

	fieldModal.modal("show");
})

$("#field-animations-btn").click(async function() {
	let fieldModal = $("#field-modal");

	let oldAnimations = fieldModal.data("animations");
	let newAnimations = await animationsDialog(oldAnimations);

	fieldModal.data("animations", newAnimations);
})

$("#field-customize-blip-btn").click(async function() {
	let fieldModal = $("#field-modal");

	let oldBlipData = fieldModal.data("blipData");
	let newBlipData = await blipDialog(oldBlipData);

	fieldModal.data("blipData", newBlipData);
})

$("#field-allowed-jobs-btn").click(async function() {
	let fieldModal = $("#field-modal");

	let oldAllowedJobs = fieldModal.data("allowedJobs");
	let newAllowedJobs = await jobsDialog(oldAllowedJobs);

	fieldModal.data("allowedJobs", newAllowedJobs);
})

$("#field-current-coords-btn").click(async function() {
	const coords = await getCurrentCoords();
	
	$("#field-coords-x").val(coords.x);
	$("#field-coords-y").val(coords.y);
	$("#field-coords-z").val(coords.z);
})

$("input:radio[name='field-spawn-coords-type']").change(function() {
	const spawnType = $(this).val();

	$("#field-modal").data("availableSpawnPoints", null);

	$("#field-choose-allowed-spawn-coordinates-btn").toggle(spawnType == "manual");
})

$("#field-choose-allowed-spawn-coordinates-btn").click(async function() {
	let fieldModal = $("#field-modal");

	fieldModal.modal("hide");
	$("#farming-creator").hide();

	$.post(`https://${resName}/chooseAvailableSpawnpoints`, JSON.stringify({
		coords: {
			x: parseFloat( $("#field-coords-x").val() ),
			y: parseFloat( $("#field-coords-y").val() ),
			z: parseFloat( $("#field-coords-z").val() ),
		},
		radius: parseFloat( $("#field-radius").val() ),
	}), async function(availableSpawnPoints) {
		if(availableSpawnPoints) {
			$("#field-modal").data("availableSpawnPoints", availableSpawnPoints);
		}

		$("#farming-creator").show();
		fieldModal.modal("show");
	});
});

async function addRequiredItemToField(requiredItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 required-item justify-content-center">
			<button type="button" class="btn-close delete-required-item-btn me-3" ></button>	

			<select class="form-select required-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control required-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control required-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-check my-auto fs-4 ms-1">
				<input class="form-check-input required-item-lose-on-use-checkbox" type="checkbox" value="">
				<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
			</div>

		</div>
	`);
	
	itemDiv.find(".delete-required-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".required-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".required-item-name").val(objectName);
	}).tooltip();

	
	if(requiredItem) {
		itemDiv.find(".required-item-type").val(requiredItem.type);
		itemDiv.find(".required-item-name").val(requiredItem.name);
		itemDiv.find(".required-item-min-quantity").val(requiredItem.minQuantity);
		itemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", requiredItem.loseOnUse);
	}

	$("#field-required-items-list").append(itemDiv);
}
$("#field-add-required-item-btn").click(function() {
	addRequiredItemToField();
});

async function addRewardItemToField(rewardItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 reward-item justify-content-center">
			<button type="button" class="btn-close delete-reward-item-btn me-3" ></button>	

			<select class="form-select reward-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control reward-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>
			
			<div class="form-floating col-2">
				<input type="number"  class="form-control reward-item-chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);
	
	itemDiv.find(".delete-reward-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".reward-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".reward-item-name").val(objectName);
	}).tooltip();

	
	if(rewardItem) {
		itemDiv.find(".reward-item-type").val(rewardItem.type);
		itemDiv.find(".reward-item-name").val(rewardItem.name);
		itemDiv.find(".reward-item-min-quantity").val(rewardItem.minQuantity);
		itemDiv.find(".reward-item-max-quantity").val(rewardItem.maxQuantity);
		itemDiv.find(".reward-item-chances").val(rewardItem.chances);
	}

	$("#field-reward-items-list").append(itemDiv);
}
$("#field-add-reward-item-btn").click(function() {
	addRewardItemToField();
})

function editField(id) {
	let fieldModal = $("#field-modal");

	// Converts from create modal to edit modal
	fieldModal.data("action", "edit");
	fieldModal.data("fieldId", id);

	$("#delete-field-btn").show();
	$("#save-field-btn").text( getLocalizedText("menu:save") );

	let fieldData = fields[id];

	$("#field-label").val(fieldData.label);
	$("#field-object-model").val(fieldData.data.objectModel);
	$("#field-radius").val(fieldData.data.radius);
	$("#field-max-objects").val(fieldData.data.maxObjects);
	$("#field-respawn-timer").val(fieldData.data.respawnTimer);
	$("#field-minimum-police").val(fieldData.data.minimumPolice);

	$("#field-modal").find("input:radio[name='field-spawn-coords-type'][value='" + fieldData.data.spawnType + "']").prop("checked", true).change();

	$("#field-coords-x").val(fieldData.data.coords.x);
	$("#field-coords-y").val(fieldData.data.coords.y);
	$("#field-coords-z").val(fieldData.data.coords.z);

	$("#field-reward-min-objects-amount").val(fieldData.data.minObjectsAmount);
	$("#field-reward-max-objects-amount").val(fieldData.data.maxObjectsAmount);

	$("#field-required-items-list").empty();
	if(fieldData.data.requiredItems) {
		for(let requiredItem of fieldData.data.requiredItems) {
			addRequiredItemToField(requiredItem);
		}
	}

	$("#field-reward-items-list").empty();
	if(fieldData.data.rewardItems) {
		for(let rewardItem of fieldData.data.rewardItems) {
			addRewardItemToField(rewardItem);
		}
	}

	fieldModal.data("animations", fieldData.data.animations);
	fieldModal.data("blipData", fieldData.data.blipData);
	fieldModal.data("allowedJobs", fieldData.data.allowedJobs || null);
	fieldModal.data("availableSpawnPoints", fieldData.data.availableSpawnPoints);

	fieldModal.modal("show");
}

function getRewardItemsFromField() {
	let rewardItems = [];

	$("#field-reward-items-list").find(".reward-item").each(function() {
		let rewardItem = {
			type: $(this).find(".reward-item-type").val(),
			name: $(this).find(".reward-item-name").val(),
			minQuantity: parseInt( $(this).find(".reward-item-min-quantity").val() ),
			maxQuantity: parseInt( $(this).find(".reward-item-max-quantity").val() ),
			chances: parseInt( $(this).find(".reward-item-chances").val() )
		}

		rewardItems.push(rewardItem);
	});

	return rewardItems;
}

function getRequiredItemsFromField() {
	let requiredItems = [];

	$("#field-required-items-list").find(".required-item").each(function() {
		let requiredItem = {
			type: $(this).find(".required-item-type").val(),
			name: $(this).find(".required-item-name").val(),
			minQuantity: parseInt( $(this).find(".required-item-min-quantity").val() ),
			loseOnUse: $(this).find(".required-item-lose-on-use-checkbox").prop("checked")
		}

		requiredItems.push(requiredItem);
	});

	return requiredItems;
}

$("#field-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let fieldModal = $("#field-modal");
	let action = fieldModal.data("action");

	let fieldData = {
		label: $("#field-label").val(),
		data: {
			objectModel: $("#field-object-model").val(),
			radius: parseFloat( $("#field-radius").val() ), 
			maxObjects: parseInt( $("#field-max-objects").val() ), // Prop objects that can be spawned
			respawnTimer: parseInt( $("#field-respawn-timer").val() ),
			minimumPolice: parseInt( $("#field-minimum-police").val() ),
			animations: fieldModal.data("animations"),
			blipData: fieldModal.data("blipData") || [getDefaultBlipCustomization()],
			allowedJobs: fieldModal.data("allowedJobs" || null),
			coords: {
				x: parseFloat( $("#field-coords-x").val() ),
				y: parseFloat( $("#field-coords-y").val() ),
				z: parseFloat( $("#field-coords-z").val() ),
			},
			spawnType: $("input:radio[name='field-spawn-coords-type']:checked").val(),
			availableSpawnPoints: fieldModal.data("availableSpawnPoints"),
			minObjectsAmount: parseInt( $("#field-reward-min-objects-amount").val() ),
			maxObjectsAmount: parseInt( $("#field-reward-max-objects-amount").val() ),
			rewardItems: getRewardItemsFromField(),
			requiredItems: getRequiredItemsFromField(),
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createField`, JSON.stringify(fieldData), function(isSuccessful) {
				if(isSuccessful) {
					fieldModal.modal("hide");
					loadFields();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateField`, JSON.stringify({fieldId: fieldModal.data("fieldId"), fieldData: fieldData}), function(isSuccessful) {
				if(isSuccessful) {
					fieldModal.modal("hide");
					loadFields();
				}
			});

			break;
		}
	}
})

$("#delete-field-btn").click(function() {
	let fieldModal = $("#field-modal");
	let fieldId = fieldModal.data("fieldId");

	$.post(`https://${resName}/deleteField`, JSON.stringify({fieldId: fieldId}), function(isSuccessful) {
		if(isSuccessful) {
			fieldModal.modal("hide");
			loadFields();
		}
	});
});

/*
███████  █████  ██████  ███    ███ ███████
██      ██   ██ ██   ██ ████  ████ ██     
█████   ███████ ██████  ██ ████ ██ ███████
██      ██   ██ ██   ██ ██  ██  ██      ██
██      ██   ██ ██   ██ ██      ██ ███████
*/
let farmsDatatable = $("#farms-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editFarm(id);
		})
	},
});

let farms = {};

function loadFarms() {
	$.post(`https://${resName}/getAllFarms`, {}, async function(rawFarms) {

		// Manually create the table to avoid incompatibilities due table indexing
		farms = {};

		for(const[k, farmData] of Object.entries(rawFarms)) {
			farms[farmData.id] = farmData;
		}

		farmsDatatable.clear();

		for(const[id, farmData] of Object.entries(farms)) {
			farmsDatatable.row.add([
				id,
				farmData.label,
			]);
		}

		farmsDatatable.draw();
	})
}

function setDefaultDataOfFarm() {
	// Generic
	$("#farm-label").val("Default");
	$("#farm-minimum-police").val(0);
	$("#farm-radius").val(5);
	
	// Options
	$("#farm-always-active").prop("checked", true).change();
	$("#farm-requires-to-be-in-vehicle").prop("checked", false).change();
	$("#farm-allowed-vehicles-list").empty();

	// Coordinates
	$("#farm-coords-x").val("");
	$("#farm-coords-y").val("");
	$("#farm-coords-z").val("");

	// Items
	$("#farm-reward-min-objects-amount").val(1);
	$("#farm-reward-max-objects-amount").val(1);

	$("#farm-required-items-list").empty();
	$("#farm-reward-items-list").empty();

	// Other
	let farmModal = $("#farm-modal");
	farmModal.data("animations", [defaultPlantInteractionAnimData]);
	farmModal.data("blipData", getDefaultBlipCustomizationForFarms());
	farmModal.data("markerData", getDefaultMarkerCustomization());
	farmModal.data("objectData", getDefaultObjectCustomization());
	farmModal.data("allowedJobs", null);
}

$("#new-farm-btn").click(function() {
	let farmModal = $("#farm-modal");

	// Converts from edit modal to create modal
	farmModal.data("action", "create");
	
	$("#delete-farm-btn").hide();
	$("#save-farm-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfFarm();

	farmModal.modal("show");
});

$("#farm-animations-btn").click(async function() {
	let farmModal = $("#farm-modal");

	let oldAnimations = farmModal.data("animations");
	let newAnimations = await animationsDialog(oldAnimations);

	farmModal.data("animations", newAnimations);
})

$("#farm-customize-blip-btn").click(async function() {
	let farmModal = $("#farm-modal");

	let oldBlipData = farmModal.data("blipData");
	let newBlipData = await blipDialog(oldBlipData);

	farmModal.data("blipData", newBlipData);
})

$("#farm-customize-marker-btn").click(async function() {
	let farmModal = $("#farm-modal");

	let oldMarkerData = farmModal.data("markerData");
	let newMarkerData = await markerDialog(oldMarkerData);

	farmModal.data("markerData", newMarkerData);
})

$("#farm-customize-object-btn").click(async function() {
	let farmModal = $("#farm-modal");

	let oldObjectData = farmModal.data("objectData");
	let newObjectData = await objectCustomizationDialog(oldObjectData);

	farmModal.data("objectData", newObjectData);
});

$("#farm-allowed-jobs-btn").click(async function() {
	let farmModal = $("#farm-modal");

	let oldAllowedJobs = farmModal.data("allowedJobs");
	let newAllowedJobs = await jobsDialog(oldAllowedJobs);

	farmModal.data("allowedJobs", newAllowedJobs);
})

$("#farm-current-coords-btn").click(async function() {
	const coords = await getCurrentCoords();
	
	$("#farm-coords-x").val(coords.x);
	$("#farm-coords-y").val(coords.y);
	$("#farm-coords-z").val(coords.z);
})

$("#farm-always-active").change(function() {
	let isChecked = $(this).prop("checked");

	$("#farm-active-start-time").prop("disabled", isChecked);
	$("#farm-active-end-time").prop("disabled", isChecked);

	if (isChecked) {
		$("#farm-active-start-time").val("00:00");
		$("#farm-active-end-time").val("23:59");
	}
});

$("#farm-requires-to-be-in-vehicle").change(function() {
	const isChecked = $(this).prop("checked");

	$("#farm-requires-specific-vehicle").prop("disabled", !isChecked);

	if (!isChecked) {
		$("#farm-requires-specific-vehicle").prop("checked", false).change();
	}
})

$("#farm-requires-specific-vehicle").change(function() {
	const isChecked = $(this).prop("checked");

	$("#farm-allowed-vehicles-div").toggle(isChecked);
})

async function addRequiredItemToFarm(requiredItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 required-item justify-content-center">
			<button type="button" class="btn-close delete-required-item-btn me-3" ></button>	

			<select class="form-select required-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control required-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control required-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-check my-auto fs-4 ms-1">
				<input class="form-check-input required-item-lose-on-use-checkbox" type="checkbox" value="">
				<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
			</div>

		</div>
	`);
	
	itemDiv.find(".delete-required-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".required-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".required-item-name").val(objectName);
	}).tooltip();

	
	if(requiredItem) {
		itemDiv.find(".required-item-type").val(requiredItem.type);
		itemDiv.find(".required-item-name").val(requiredItem.name);
		itemDiv.find(".required-item-min-quantity").val(requiredItem.minQuantity);
		itemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", requiredItem.loseOnUse);
	}

	$("#farm-required-items-list").append(itemDiv);
}
$("#farm-add-required-item-btn").click(function() {
	addRequiredItemToFarm();
});

async function addRewardItemToFarm(rewardItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 reward-item justify-content-center">
			<button type="button" class="btn-close delete-reward-item-btn me-3" ></button>	

			<select class="form-select reward-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control reward-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>
			
			<div class="form-floating col-2">
				<input type="number"  class="form-control reward-item-chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);
	
	itemDiv.find(".delete-reward-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".reward-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".reward-item-name").val(objectName);
	}).tooltip();

	
	if(rewardItem) {
		itemDiv.find(".reward-item-type").val(rewardItem.type);
		itemDiv.find(".reward-item-name").val(rewardItem.name);
		itemDiv.find(".reward-item-min-quantity").val(rewardItem.minQuantity);
		itemDiv.find(".reward-item-max-quantity").val(rewardItem.maxQuantity);
		itemDiv.find(".reward-item-chances").val(rewardItem.chances);
	}

	$("#farm-reward-items-list").append(itemDiv);
}
$("#farm-add-reward-item-btn").click(function() {
	addRewardItemToFarm();
});

function addAllowedVehicleToFarm(vehicleName) {
	let allowedVehicleDiv = $(`
		<ul class="row g-2 row-cols-auto align-items-center justify-content-center allowed-vehicle mb-2">
			<button type="button" class="btn-close delete-allowed-vehicle-btn" ></button>	

			<div class="form-floating">
				<input type="text" class="form-control vehicle-spawn-name" placeholder="Vehicle name" required>
				<label>${ getLocalizedText("menu:vehicle_name") }</label>
			</div>
		</ul>
	`);

	allowedVehicleDiv.find(".delete-allowed-vehicle-btn").click(function() {
		allowedVehicleDiv.remove();
	});

	if(vehicleName) {
		allowedVehicleDiv.find(".vehicle-spawn-name").val(vehicleName);
	}

	$("#farm-allowed-vehicles-list").append(allowedVehicleDiv);
}
$("#farm-add-farm-allowed-vehicle-btn").click(function() {
	addAllowedVehicleToFarm();
});

function editFarm(id) {
	let farmModal = $("#farm-modal");

	// Converts from create modal to edit modal
	farmModal.data("action", "edit");
	farmModal.data("farmId", id);

	$("#delete-farm-btn").show();
	$("#save-farm-btn").text( getLocalizedText("menu:save") );

	let farmData = farms[id];

	// Generic
	$("#farm-label").val(farmData.label);
	$("#farm-minimum-police").val(farmData.data.minimumPolice);
	$("#farm-radius").val(farmData.data.radius);

	// Coordinates
	$("#farm-coords-x").val(farmData.data.coords.x);
	$("#farm-coords-y").val(farmData.data.coords.y);
	$("#farm-coords-z").val(farmData.data.coords.z);
	
	// Options
	$("#farm-active-start-time").val(farmData.data.activeTimeStart);
	$("#farm-active-end-time").val(farmData.data.activeTimeEnd);
	$("#farm-requires-to-be-in-vehicle").prop("checked", farmData.data.requiresToBeInVehicle).change();
	$("#farm-requires-specific-vehicle").prop("checked", farmData.data.requiresSpecificVehicle).change();

	$("#farm-allowed-vehicles-list").empty();
	if(farmData.data.allowedVehicles) {
		for(const vehicleName of Object.keys(farmData.data.allowedVehicles)) {
			addAllowedVehicleToFarm(vehicleName);
		}
	}

	if(farmData.data.activeTimeStart === "00:00" && farmData.data.activeTimeEnd === "23:59") {
		$("#farm-always-active").prop("checked", true).change();
	} else {
		$("#farm-always-active").prop("checked", false).change();
	}

	// Items
	$("#farm-reward-min-objects-amount").val(farmData.data.minObjectsAmount);
	$("#farm-reward-max-objects-amount").val(farmData.data.maxObjectsAmount);

	$("#farm-required-items-list").empty();
	if(farmData.data.requiredItems) {
		for(let requiredItem of farmData.data.requiredItems) {
			addRequiredItemToFarm(requiredItem);
		}
	}

	$("#farm-reward-items-list").empty();
	if(farmData.data.rewardItems) {
		for(let rewardItem of farmData.data.rewardItems) {
			addRewardItemToFarm(rewardItem);
		}
	}

	farmModal.data("animations", farmData.data.animations);
	farmModal.data("blipData", farmData.data.blipData);
	farmModal.data("markerData", farmData.data.markerData);
	farmModal.data("objectData", farmData.data.objectData);
	farmModal.data("allowedJobs", farmData.data.allowedJobs || null);

	farmModal.modal("show");
}

function getRewardItemsFromFarm() {
	let rewardItems = [];

	$("#farm-reward-items-list").find(".reward-item").each(function() {
		let rewardItem = {
			type: $(this).find(".reward-item-type").val(),
			name: $(this).find(".reward-item-name").val(),
			minQuantity: parseInt(  $(this).find(".reward-item-min-quantity").val() ),
			maxQuantity: parseInt(  $(this).find(".reward-item-max-quantity").val() ),
			chances: parseInt( $(this).find(".reward-item-chances").val() )
		}

		rewardItems.push(rewardItem);
	});

	return rewardItems;
}

function getRequiredItemsFromFarm() {
	let requiredItems = [];

	$("#farm-required-items-list").find(".required-item").each(function() {
		let requiredItem = {
			type: $(this).find(".required-item-type").val(),
			name: $(this).find(".required-item-name").val(),
			minQuantity: parseInt( $(this).find(".required-item-min-quantity").val() ),
			loseOnUse: $(this).find(".required-item-lose-on-use-checkbox").prop("checked")
		}

		requiredItems.push(requiredItem);
	});

	return requiredItems;
}

function getFarmAllowedVehicles() {
	let allowedVehicles = {};

	$("#farm-allowed-vehicles-list").find(".allowed-vehicle").each(function() {
		let vehicleName = $(this).find(".vehicle-spawn-name").val();
		allowedVehicles[vehicleName] = true;
	});

	return allowedVehicles;
}

$("#farm-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let farmModal = $("#farm-modal");
	let action = farmModal.data("action");

	let farmData = {
		label: $("#farm-label").val(),
		data: {
			minimumPolice: parseInt( $("#farm-minimum-police").val() ),
			radius: parseFloat( $("#farm-radius").val() ),
			animations: farmModal.data("animations"),
			blipData: farmModal.data("blipData") || [getDefaultBlipCustomization()],
			markerData: farmModal.data("markerData") || [getDefaultMarkerCustomization()],
			objectData: farmModal.data("objectData") || [getDefaultObjectCustomization()],
			allowedJobs: farmModal.data("allowedJobs" || null),
			coords: {
				x: parseFloat( $("#farm-coords-x").val() ),
				y: parseFloat( $("#farm-coords-y").val() ),
				z: parseFloat( $("#farm-coords-z").val() ),
			},
			minObjectsAmount: parseInt( $("#farm-reward-min-objects-amount").val() ),
			maxObjectsAmount: parseInt( $("#farm-reward-max-objects-amount").val() ),
			rewardItems: getRewardItemsFromFarm(),
			requiredItems: getRequiredItemsFromFarm(),
			activeTimeStart: $("#farm-active-start-time").val(),
			activeTimeEnd: $("#farm-active-end-time").val(),
			requiresToBeInVehicle: $("#farm-requires-to-be-in-vehicle").prop("checked"),
			requiresSpecificVehicle: $("#farm-requires-specific-vehicle").prop("checked"),
			allowedVehicles: getFarmAllowedVehicles()
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createFarm`, JSON.stringify(farmData), function(isSuccessful) {
				if(isSuccessful) {
					farmModal.modal("hide");
					loadFarms();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateFarm`, JSON.stringify({farmId: farmModal.data("farmId"), farmData: farmData}), function(isSuccessful) {
				if(isSuccessful) {
					farmModal.modal("hide");
					loadFarms();
				}
			});

			break;
		}
	}
})

$("#delete-farm-btn").click(function() {
	let farmModal = $("#farm-modal");
	let farmId = farmModal.data("farmId");

	$.post(`https://${resName}/deleteFarm`, JSON.stringify({farmId: farmId}), function(isSuccessful) {
		if(isSuccessful) {
			farmModal.modal("hide");
			loadFarms();
		}
	});
});


/*
██     ██  ██████  ██████  ██   ██ ██████  ███████ ███    ██  ██████ ██   ██ ███████ ███████
██     ██ ██    ██ ██   ██ ██  ██  ██   ██ ██      ████   ██ ██      ██   ██ ██      ██     
██  █  ██ ██    ██ ██████  █████   ██████  █████   ██ ██  ██ ██      ███████ █████   ███████
██ ███ ██ ██    ██ ██   ██ ██  ██  ██   ██ ██      ██  ██ ██ ██      ██   ██ ██           ██
 ███ ███   ██████  ██   ██ ██   ██ ██████  ███████ ██   ████  ██████ ██   ██ ███████ ███████
*/
let workbenchesDatatable = $("#workbenches-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editWorkbench(id);
		})
	},
});

let workbenches = {};

function loadWorkbenches() {
	$.post(`https://${resName}/getAllWorkbenches`, {}, async function(rawWorkbenches) {
		// Manually create the table to avoid incompatibilities due table indexing
		workbenches = {};

		for(const[k, workbenchData] of Object.entries(rawWorkbenches)) {
			workbenches[workbenchData.id] = workbenchData;
		}

		workbenchesDatatable.clear();

		for(const[id, workbenchData] of Object.entries(workbenches)) {
			workbenchesDatatable.row.add([
				id,
				workbenchData.label,
			]);
		}

		workbenchesDatatable.draw();
	})
}

function setDefaultDataOfWorkbench() {
	// Generic
	$("#workbench-label").val("Default");
	$("#workbench-minimum-police").val(0);
	$("#workbench-radius").val(5);

	// Coordinates
	$("#workbench-coords-x").val("");
	$("#workbench-coords-y").val("");
	$("#workbench-coords-z").val("");

	// Other
	let workbenchModal = $("#workbench-modal");
	workbenchModal.data("animations", [defaultWorkbenchAnimData]);
	workbenchModal.data("blipData", getDefaultBlipCustomizationForWorkbenches());
	workbenchModal.data("markerData", getDefaultMarkerCustomization());
	workbenchModal.data("allowedJobs", null);
	workbenchModal.data("objectData", getDefaultObjectCustomizationForWorkbenches());

	// Empty craftings
	$("#workbench-craftings-list").empty();
}

$("#new-workbench-btn").click(function() {
	let workbenchModal = $("#workbench-modal");

	// Converts from edit modal to create modal
	workbenchModal.data("action", "create");
	
	$("#delete-workbench-btn").hide();
	$("#save-workbench-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfWorkbench();

	workbenchModal.modal("show");
})

$("#workbench-animations-btn").click(async function() {
	let workbenchModal = $("#workbench-modal");

	let oldAnimations = workbenchModal.data("animations");
	let newAnimations = await animationsDialog(oldAnimations);

	workbenchModal.data("animations", newAnimations);
})

$("#workbench-customize-blip-btn").click(async function() {
	let workbenchModal = $("#workbench-modal");

	let oldBlipData = workbenchModal.data("blipData");
	let newBlipData = await blipDialog(oldBlipData);

	workbenchModal.data("blipData", newBlipData);
})

$("#workbench-customize-marker-btn").click(async function() {
	let workbenchModal = $("#workbench-modal");

	let oldMarkerData = workbenchModal.data("markerData");
	let newMarkerData = await markerDialog(oldMarkerData);

	workbenchModal.data("markerData", newMarkerData);
})

$("#workbench-allowed-jobs-btn").click(async function() {
	let workbenchModal = $("#workbench-modal");

	let oldAllowedJobs = workbenchModal.data("allowedJobs");
	let newAllowedJobs = await jobsDialog(oldAllowedJobs);

	workbenchModal.data("allowedJobs", newAllowedJobs);
})

$("#workbench-current-coords-btn").click(async function() {
	const coords = await getCurrentCoords();
	
	$("#workbench-coords-x").val(coords.x);
	$("#workbench-coords-y").val(coords.y);
	$("#workbench-coords-z").val(coords.z);
})

$("#workbench-customize-object-btn").click(async function() {
	let workbenchModal = $("#workbench-modal");

	let oldObjectData = workbenchModal.data("objectData");
	let newObjectData = await objectCustomizationDialog(oldObjectData);

	workbenchModal.data("objectData", newObjectData);
});

async function addRequiredItemToCrafting(craftingDiv, requiredItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 required-item justify-content-center">
			<button type="button" class="btn-close delete-required-item-btn me-3" ></button>	

			<select class="form-select required-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control required-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control required-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-check my-auto fs-4 ms-1">
				<input class="form-check-input required-item-lose-on-use-checkbox" type="checkbox" value="">
				<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
			</div>

		</div>
	`);
	
	itemDiv.find(".delete-required-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".required-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".required-item-name").val(objectName);
	}).tooltip();

	
	if(requiredItem) {
		itemDiv.find(".required-item-type").val(requiredItem.type);
		itemDiv.find(".required-item-name").val(requiredItem.name);
		itemDiv.find(".required-item-min-quantity").val(requiredItem.minQuantity);
		itemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", requiredItem.loseOnUse);
	}

	craftingDiv.find(".required-items-list").append(itemDiv);
}
 
async function addRewardItemToCrafting(craftingDiv, rewardItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 reward-item justify-content-center">
			<button type="button" class="btn-close delete-reward-item-btn me-3" ></button>	

			<select class="form-select reward-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control reward-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" min="1" class="form-control reward-item-quantity" placeholder="${getLocalizedText("menu:quantity")}" required>
				<label>${getLocalizedText("menu:quantity")}</label>
			</div>
		</div>
	`);
	
	itemDiv.find(".delete-reward-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".reward-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".reward-item-name").val(objectName);
	}).tooltip();

	
	if(rewardItem) {
		itemDiv.find(".reward-item-type").val(rewardItem.type);
		itemDiv.find(".reward-item-name").val(rewardItem.name);
		itemDiv.find(".reward-item-quantity").val(rewardItem.quantity);
	}

	craftingDiv.find(".reward-items-list").append(itemDiv);
}

function addCraftingToWorkbench(craftingData) {
	let craftingDiv = $(`
		<div class="mb-4 crafting">
			<div class="col-12 d-inline-block">
				<button type="button" class="btn btn-danger float-end col-auto delete-crafting-btn"><i class="bi bi-trash-fill"></i></button>	
			</div>

			<div class="form-floating crafting-label-div col-3 mx-auto my-3" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:crafting_label_description") }">
				<input type="text" class="form-control crafting-label" placeholder="Label">
				<label>${ getLocalizedText("menu:crafting_label") }</label>
			</div>

			<p class="text-center fs-4">${getLocalizedText("menu:required_items_list")}</p>

			<div class="required-items-list">

			</div>

			<button class="btn btn-secondary add-required-item-btn" type="button">${getLocalizedText("menu:add_required_item")}</button>

			<p class="text-center fs-4">${getLocalizedText("menu:reward_items_list")}</p>

			<div class="reward-items-list">

			</div>

			<button class="btn btn-secondary add-reward-item-btn" type="button">${getLocalizedText("menu:add_reward_item")}</button>

			<hr>
		</div>
	`);

	craftingDiv.find(".crafting-label-div").tooltip();

	craftingDiv.find(".add-required-item-btn").click(function() {
		addRequiredItemToCrafting(craftingDiv);
	});

	craftingDiv.find(".add-reward-item-btn").click(function() {
		addRewardItemToCrafting(craftingDiv);
	});

	craftingDiv.find(".delete-crafting-btn").click(function() {
		craftingDiv.remove();
	});

	if(craftingData) {
		for(let requiredItem of craftingData.requiredItems) {
			addRequiredItemToCrafting(craftingDiv, requiredItem);
		}

		for(let rewardItem of craftingData.rewardItems) {
			addRewardItemToCrafting(craftingDiv, rewardItem);
		}

		craftingDiv.find(".crafting-label").val(craftingData.label);
	} else {
		addRequiredItemToCrafting(craftingDiv);
		addRewardItemToCrafting(craftingDiv);
	}

	$("#workbench-craftings-list").append(craftingDiv);
}
$("#workbench-add-crafting-btn").click(async function() {
	addCraftingToWorkbench();
});

function getAllCraftingsFromWorkbench() {
	let craftings = [];

	$("#workbench-craftings-list").find(".crafting").each(function() {
		let crafting = {
			label: $(this).find(".crafting-label").val(),
			requiredItems: [],
			rewardItems: []
		};

		$(this).find(".required-item").each(function() {
			let requiredItem = {
				type: $(this).find(".required-item-type").val(),
				name: $(this).find(".required-item-name").val(),
				minQuantity: parseInt( $(this).find(".required-item-min-quantity").val() ),
				loseOnUse: $(this).find(".required-item-lose-on-use-checkbox").prop("checked")
			};

			crafting.requiredItems.push(requiredItem);
		});

		$(this).find(".reward-item").each(function() {
			let rewardItem = {
				type: $(this).find(".reward-item-type").val(),
				name: $(this).find(".reward-item-name").val(),
				quantity: parseInt( $(this).find(".reward-item-quantity").val() )
			};

			crafting.rewardItems.push(rewardItem);
		});

		craftings.push(crafting);
	});

	return craftings;
}

function editWorkbench(id) {
	let workbenchModal = $("#workbench-modal");

	// Converts from create modal to edit modal
	workbenchModal.data("action", "edit");
	workbenchModal.data("workbenchId", id);

	$("#delete-workbench-btn").show();
	$("#save-workbench-btn").text( getLocalizedText("menu:save") );

	let workbenchData = workbenches[id];

	// Generic
	$("#workbench-label").val(workbenchData.label);
	$("#workbench-minimum-police").val(workbenchData.data.minimumPolice);
	$("#workbench-radius").val(workbenchData.data.radius);

	// Coordinates
	$("#workbench-coords-x").val(workbenchData.data.coords.x);
	$("#workbench-coords-y").val(workbenchData.data.coords.y);
	$("#workbench-coords-z").val(workbenchData.data.coords.z);

	// Craftings
	$("#workbench-craftings-list").empty();
	for(let craftingData of workbenchData.data.craftings) {
		addCraftingToWorkbench(craftingData);
	}

	workbenchModal.data("animations", workbenchData.data.animations);
	workbenchModal.data("blipData", workbenchData.data.blipData);
	workbenchModal.data("markerData", workbenchData.data.markerData);
	workbenchModal.data("allowedJobs", workbenchData.data.allowedJobs || null);
	workbenchModal.data("objectData", workbenchData.data.objectData);

	workbenchModal.modal("show");
}

$("#workbench-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let workbenchModal = $("#workbench-modal");
	let action = workbenchModal.data("action");

	let workbenchData = {
		label: $("#workbench-label").val(),
		data: {
			minimumPolice: parseInt( $("#workbench-minimum-police").val() ),
			radius: parseFloat( $("#workbench-radius").val() ),
			animations: workbenchModal.data("animations"),
			blipData: workbenchModal.data("blipData") || [getDefaultBlipCustomization()],
			markerData: workbenchModal.data("markerData") || [getDefaultMarkerCustomization()],
			objectData: workbenchModal.data("objectData") || [getDefaultObjectCustomization()],
			allowedJobs: workbenchModal.data("allowedJobs" || null),
			coords: {
				x: parseFloat( $("#workbench-coords-x").val() ),
				y: parseFloat( $("#workbench-coords-y").val() ),
				z: parseFloat( $("#workbench-coords-z").val() ),
			},
			craftings: getAllCraftingsFromWorkbench()
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createWorkbench`, JSON.stringify(workbenchData), function(isSuccessful) {
				if(isSuccessful) {
					workbenchModal.modal("hide");
					loadWorkbenches();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateWorkbench`, JSON.stringify({workbenchId: workbenchModal.data("workbenchId"), workbenchData: workbenchData}), function(isSuccessful) {
				if(isSuccessful) {
					workbenchModal.modal("hide");
					loadWorkbenches();
				}
			});

			break;
		}
	}
})

$("#delete-workbench-btn").click(function() {
	let workbenchModal = $("#workbench-modal");
	let workbenchId = workbenchModal.data("workbenchId");

	$.post(`https://${resName}/deleteWorkbench`, JSON.stringify({workbenchId: workbenchId}), function(isSuccessful) {
		if(isSuccessful) {
			workbenchModal.modal("hide");
			loadWorkbenches();
		}
	});
});

/*
███████  ██████  ██    ██ ███    ██ ██████  ██████  ██ ███████ ███████
██      ██    ██ ██    ██ ████   ██ ██   ██ ██   ██ ██ ██      ██     
█████   ██    ██ ██    ██ ██ ██  ██ ██   ██ ██████  ██ █████   ███████
██      ██    ██ ██    ██ ██  ██ ██ ██   ██ ██   ██ ██ ██           ██
██       ██████   ██████  ██   ████ ██████  ██   ██ ██ ███████ ███████
*/
let foundriesDatatable = $("#foundries-container").DataTable( {
	"lengthMenu": [10, 15, 20],
	"createdRow": function ( row, data, index ) {
		$(row).addClass("clickable");

		$(row).click(function() {
			let id = parseInt( data[0] );

			editFoundry(id);
		})
	},
});

let foundries = {};

function loadFoundries() {
	$.post(`https://${resName}/getAllFoundries`, {}, async function(rawFoundries) {
		// Manually create the table to avoid incompatibilities due table indexing
		foundries = {};

		for(const[k, foundryData] of Object.entries(rawFoundries)) {
			foundries[foundryData.id] = foundryData;
		}

		foundriesDatatable.clear();

		for(const[id, foundryData] of Object.entries(foundries)) {
			foundriesDatatable.row.add([
				id,
				foundryData.label,
			]);
		}

		foundriesDatatable.draw();
	})
}
function setDefaultDataOfFoundry() {
	// Generic
	$("#foundry-label").val("Default");
	$("#foundry-minimum-police").val(0);
	$("#foundry-radius").val(5);
	$("#foundry-explode-on-failure-checkbox").prop("checked", false).change();
	$("#foundry-alert-police-on-failure-checkbox").prop("checked", false).change();

	// Coordinates
	$("#foundry-coords-x").val("");
	$("#foundry-coords-y").val("");
	$("#foundry-coords-z").val("");

	// Other
	let foundryModal = $("#foundry-modal");
	foundryModal.data("blipData", getDefaultBlipCustomizationForFoundries());
	foundryModal.data("markerData", getDefaultMarkerCustomization());
	foundryModal.data("allowedJobs", null);
	foundryModal.data("objectData", getDefaultObjectCustomization());
}

$("#new-foundry-btn").click(function() {
	let foundryModal = $("#foundry-modal");

	// Converts from edit modal to create modal
	foundryModal.data("action", "create");
	
	$("#delete-foundry-btn").hide();
	$("#save-foundry-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfFoundry();

	foundryModal.modal("show");
});

$("#foundry-customize-blip-btn").click(async function() {
	let foundryModal = $("#foundry-modal");

	let oldBlipData = foundryModal.data("blipData");
	let newBlipData = await blipDialog(oldBlipData);

	foundryModal.data("blipData", newBlipData);
});

$("#foundry-customize-marker-btn").click(async function() {
	let foundryModal = $("#foundry-modal");

	let oldMarkerData = foundryModal.data("markerData");
	let newMarkerData = await markerDialog(oldMarkerData);

	foundryModal.data("markerData", newMarkerData);
});

$("#foundry-customize-object-btn").click(async function() {
	let foundryModal = $("#foundry-modal");

	let oldObjectData = foundryModal.data("objectData");
	let newObjectData = await objectCustomizationDialog(oldObjectData);

	foundryModal.data("objectData", newObjectData);
});

$("#foundry-allowed-jobs-btn").click(async function() {
	let foundryModal = $("#foundry-modal");

	let oldAllowedJobs = foundryModal.data("allowedJobs");
	let newAllowedJobs = await jobsDialog(oldAllowedJobs);

	foundryModal.data("allowedJobs", newAllowedJobs);
});

$("#foundry-current-coords-btn").click(async function() {
	const coords = await getCurrentCoords();
	
	$("#foundry-coords-x").val(coords.x);
	$("#foundry-coords-y").val(coords.y);
	$("#foundry-coords-z").val(coords.z);
});

async function chooseAllowedFormulas() {
	let foundryModal = $("#foundry-modal");

	let oldAllowedFormulas = foundryModal.data("allowedFormulas");
	let newAllowedFormulas = await formulasDialog(oldAllowedFormulas);

	foundryModal.data("allowedFormulas", newAllowedFormulas);
}

$("#foundry-allowed-formulas-btn").click(async function() {
	chooseAllowedFormulas()
});

$("#foundry-explode-on-failure-checkbox").change(function() {
	const isEnabled = $(this).prop("checked");

	$("#foundry-seconds-before-explosion-div").toggle(isEnabled);
	$("#foundry-seconds-before-explosion").prop("required", isEnabled);

	if(!isEnabled) {
		$("#foundry-seconds-before-explosion").val(0);
	}
})

$("#foundry-alert-police-on-failure-checkbox").change(function() {
	const isEnabled = $(this).prop("checked");

	$("#foundry-alert-police-probability-div").toggle(isEnabled);
	$("#foundry-alert-police-probability").prop("required", isEnabled);

	if(!isEnabled) {
		$("#foundry-alert-police-probability").val(0);
	}
})

function editFoundry(id) {
	let foundryModal = $("#foundry-modal");

	// Converts from create modal to edit modal
	foundryModal.data("action", "edit");
	foundryModal.data("foundryId", id);

	$("#delete-foundry-btn").show();
	$("#save-foundry-btn").text( getLocalizedText("menu:save") );

	let foundryData = foundries[id];

	// Generic
	$("#foundry-label").val(foundryData.label);
	$("#foundry-minimum-police").val(foundryData.data.minimumPolice);
	$("#foundry-radius").val(foundryData.data.radius);
	$("#foundry-explode-on-failure-checkbox").prop("checked", foundryData.data.explodeOnFailure).change();
	$("#foundry-seconds-before-explosion").val(foundryData.data.secondsBeforeExplosion);
	$("#foundry-alert-police-on-failure-checkbox").prop("checked", foundryData.data.alertPoliceOnFailure).change();
	$("#foundry-alert-police-probability").val(foundryData.data.alertPoliceProbability);

	// Coordinates
	$("#foundry-coords-x").val(foundryData.data.coords.x);
	$("#foundry-coords-y").val(foundryData.data.coords.y);
	$("#foundry-coords-z").val(foundryData.data.coords.z);

	foundryModal.data("blipData", foundryData.data.blipData);
	foundryModal.data("markerData", foundryData.data.markerData);
	foundryModal.data("allowedJobs", foundryData.data.allowedJobs || null);
	foundryModal.data("allowedFormulas", foundryData.data.allowedFormulas);
	foundryModal.data("objectData", foundryData.data.objectData);

	foundryModal.modal("show");
}

$("#foundry-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let foundryModal = $("#foundry-modal");
	let action = foundryModal.data("action");

	let foundryData = {
		label: $("#foundry-label").val(),
		data: {
			minimumPolice: parseInt( $("#foundry-minimum-police").val() ),
			radius: parseFloat( $("#foundry-radius").val() ),
			explodeOnFailure: $("#foundry-explode-on-failure-checkbox").prop("checked"),
			secondsBeforeExplosion: parseInt( $("#foundry-seconds-before-explosion").val() ),
			alertPoliceOnFailure: $("#foundry-alert-police-on-failure-checkbox").prop("checked"),
			alertPoliceProbability: parseInt( $("#foundry-alert-police-probability").val() ),
			blipData: foundryModal.data("blipData") || [getDefaultBlipCustomization()],
			markerData: foundryModal.data("markerData") || [getDefaultMarkerCustomization()],
			objectData: foundryModal.data("objectData") || [getDefaultObjectCustomization()],
			allowedJobs: foundryModal.data("allowedJobs" || null),
			allowedFormulas: foundryModal.data("allowedFormulas"),
			coords: {
				x: parseFloat( $("#foundry-coords-x").val() ),
				y: parseFloat( $("#foundry-coords-y").val() ),
				z: parseFloat( $("#foundry-coords-z").val() ),
			},
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createFoundry`, JSON.stringify(foundryData), function(isSuccessful) {
				if(isSuccessful) {
					foundryModal.modal("hide");
					loadFoundries();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateFoundry`, JSON.stringify({foundryId: foundryModal.data("foundryId"), foundryData: foundryData}), function(isSuccessful) {
				if(isSuccessful) {
					foundryModal.modal("hide");
					loadFoundries();
				}
			});

			break;
		}
	}
})

$("#delete-foundry-btn").click(function() {
	let foundryModal = $("#foundry-modal");
	let foundryId = foundryModal.data("foundryId");

	$.post(`https://${resName}/deleteFoundry`, JSON.stringify({foundryId: foundryId}), function(isSuccessful) {
		if(isSuccessful) {
			foundryModal.modal("hide");
			loadFoundries();
		}
	});
});

/*
███████  ██████  ██████  ███    ███ ██    ██ ██       █████  ███████
██      ██    ██ ██   ██ ████  ████ ██    ██ ██      ██   ██ ██     
█████   ██    ██ ██████  ██ ████ ██ ██    ██ ██      ███████ ███████
██      ██    ██ ██   ██ ██  ██  ██ ██    ██ ██      ██   ██      ██
██       ██████  ██   ██ ██      ██  ██████  ███████ ██   ██ ███████
*/

let formulas = {};

async function loadFormulas() {
	$.post(`https://${resName}/getAllFormulas`, {}, async function(rawFormulas) {
		// Manually create the table to avoid incompatibilities due table indexing
		formulas = {};

		for(const[k, formulaData] of Object.entries(rawFormulas)) {
			formulas[formulaData.id] = formulaData;
		}
	})
}

$("#formula-produces-smoke-checkbox").change(function() {
	const isEnabled = $(this).prop("checked");

	$("#formula-smoke-color").toggle(isEnabled);
});

function setDefaultDataOfFormula() {
	// Generic
	$("#formula-label").val("Default");
	$("#formula-probability-of-failure").val(0);
	$("#formula-produces-smoke-checkbox").prop("checked", false).change();
	$("#formula-smoke-color").val("#FF0000");

	// Required items
	$("#formula-required-items-list").empty();

	// Reward items
	$("#formula-reward-items-list").empty();

	$("#formula-reward-min-objects-amount").val(1);
	$("#formula-reward-max-objects-amount").val(1);

	// Other
	let formulaModal = $("#formula-modal");
	formulaModal.data("animations", [defaultFormulaAnimData]);
}

$("#formula-animations-btn").click(async function() {
	let formulaModal = $("#formula-modal");
	
	const oldAnimations = formulaModal.data("animations");
	const newAnimations = await animationsDialog(oldAnimations);

	formulaModal.data("animations", newAnimations);
});

async function addRequiredItemToFormula(requiredItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 required-item justify-content-center">
			<button type="button" class="btn-close delete-required-item-btn me-3" ></button>	

			<select class="form-select required-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control required-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating">
				<input type="number" min=0 class="form-control required-item-quantity" placeholder="${getLocalizedText("menu:quantity")}" required>
				<label>${getLocalizedText("menu:quantity")}</label>
			</div>

			<div class="form-check my-auto fs-4 ms-1">
				<input class="form-check-input required-item-lose-on-use-checkbox" type="checkbox" value="">
				<label class="form-check-label">${getLocalizedText("menu:lose_on_use")}</label>
			</div>

		</div>
	`);
	
	itemDiv.find(".delete-required-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".required-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".required-item-name").val(objectName);
	}).tooltip();

	
	if(requiredItem) {
		itemDiv.find(".required-item-type").val(requiredItem.type);
		itemDiv.find(".required-item-name").val(requiredItem.name);
		itemDiv.find(".required-item-quantity").val(requiredItem.quantity);
		itemDiv.find(".required-item-lose-on-use-checkbox").prop("checked", requiredItem.loseOnUse);
	}

	$("#formula-required-items-list").append(itemDiv);
}
$("#formula-add-required-item-btn").click(function() {
	addRequiredItemToFormula();
});

async function addRewardItemToFormula(rewardItem) {
	let itemDiv = $(`
		<div class="row g-2 row-cols-auto align-items-center text-body my-2 reward-item justify-content-center">
			<button type="button" class="btn-close delete-reward-item-btn me-3" ></button>	

			<select class="form-select reward-item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				<option value="account">${getLocalizedText("menu:account")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating">
				<input type="text" class="form-control reward-item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-min-quantity" placeholder="${getLocalizedText("menu:min_quantity")}" required>
				<label>${getLocalizedText("menu:min_quantity")}</label>
			</div>

			<div class="form-floating col-2">
				<input type="number" min=0 class="form-control reward-item-max-quantity" placeholder="${getLocalizedText("menu:max_quantity")}" required>
				<label>${getLocalizedText("menu:max_quantity")}</label>
			</div>
			
			<div class="form-floating col-2">
				<input type="number"  class="form-control reward-item-chances" placeholder="${getLocalizedText("menu:probability")}" required>
				<label>${getLocalizedText("menu:probability")}</label>
			</div>
		</div>
	`);
	
	itemDiv.find(".delete-reward-item-btn").click(function() {
		itemDiv.remove();
	});

	itemDiv.find(".choose-item-btn").click(async function() {
		let objectType = itemDiv.find(".reward-item-type").val();

		let objectName = await objectDialog(objectType);

		itemDiv.find(".reward-item-name").val(objectName);
	}).tooltip();

	
	if(rewardItem) {
		itemDiv.find(".reward-item-type").val(rewardItem.type);
		itemDiv.find(".reward-item-name").val(rewardItem.name);
		itemDiv.find(".reward-item-min-quantity").val(rewardItem.minQuantity);
		itemDiv.find(".reward-item-max-quantity").val(rewardItem.maxQuantity);
		itemDiv.find(".reward-item-chances").val(rewardItem.chances);
	}

	$("#formula-reward-items-list").append(itemDiv);
}
$("#formula-add-reward-item-btn").click(function() {
	addRewardItemToFormula();
});

function getRewardItemsFromformula() {
	let rewardItems = [];

	$("#formula-reward-items-list").find(".reward-item").each(function() {
		let rewardItem = {
			type: $(this).find(".reward-item-type").val(),
			name: $(this).find(".reward-item-name").val(),
			minQuantity: parseInt( $(this).find(".reward-item-min-quantity").val() ),
			maxQuantity: parseInt( $(this).find(".reward-item-max-quantity").val() ),
			chances: parseInt( $(this).find(".reward-item-chances").val() )
		}

		rewardItems.push(rewardItem);
	});

	return rewardItems;
}

function getRequiredItemsFromformula() {
	let requiredItems = [];

	$("#formula-required-items-list").find(".required-item").each(function() {
		let requiredItem = {
			type: $(this).find(".required-item-type").val(),
			name: $(this).find(".required-item-name").val(),
			quantity: parseInt( $(this).find(".required-item-quantity").val() ),
			loseOnUse: $(this).find(".required-item-lose-on-use-checkbox").prop("checked")
		}

		requiredItems.push(requiredItem);
	});

	return requiredItems;
}

$("#new-formula-btn").click(function() {
	let formulaModal = $("#formula-modal");

	// Converts from edit modal to create modal
	formulaModal.data("action", "create");
	
	$("#delete-formula-btn").hide();
	$("#save-formula-btn").text( getLocalizedText("menu:create") );
	
	setDefaultDataOfFormula();

	formulaModal.modal("show");
});

function editFormula(id) {
	let formulaModal = $("#formula-modal");

	// Converts from create modal to edit modal
	formulaModal.data("action", "edit");
	formulaModal.data("formulaId", id);

	$("#delete-formula-btn").show();
	$("#save-formula-btn").text( getLocalizedText("menu:save") );

	let formulaData = formulas[id];

	// Generic
	$("#formula-label").val(formulaData.label);
	$("#formula-probability-of-failure").val(formulaData.data.probabilityOfFailure);
	$("#formula-produces-smoke-checkbox").prop("checked", formulaData.data.producesSmoke);
	$("#formula-smoke-color").val( rgbToHex(formulaData.data.smokeColor.r, formulaData.data.smokeColor.g, formulaData.data.smokeColor.b) );
	$("#formula-reward-min-objects-amount").val(formulaData.data.minObjectsAmount);
	$("#formula-reward-max-objects-amount").val(formulaData.data.maxObjectsAmount);

	// Required items
	$("#formula-required-items-list").empty();
	if(formulaData.data.requiredItems) {
		for(let requiredItem of formulaData.data.requiredItems) {
			addRequiredItemToFormula(requiredItem);
		}
	}

	// Reward items
	$("#formula-reward-items-list").empty();
	if(formulaData.data.rewardItems) {
		for(let rewardItem of formulaData.data.rewardItems) {
			addRewardItemToFormula(rewardItem);
		}
	}

	// Anims
	formulaModal.data("animations", formulaData.data.animations);

	formulaModal.modal("show");
}

$("#formula-form").submit(function(event) {
	if(isThereAnyErrorInForm(event)) return;

	let formulaModal = $("#formula-modal");
	let action = formulaModal.data("action");

	let formulaData = {
		label: $("#formula-label").val(),
		data: {
			animations: formulaModal.data("animations"),
			probabilityOfFailure: parseInt( $("#formula-probability-of-failure").val() ),
			producesSmoke: $("#formula-produces-smoke-checkbox").prop("checked"),
			smokeColor: hexToRgb( $("#formula-smoke-color").val() ),
			requiredItems: getRequiredItemsFromformula(),
			rewardItems: getRewardItemsFromformula(),
			minObjectsAmount: parseInt( $("#formula-reward-min-objects-amount").val() ),
			maxObjectsAmount: parseInt( $("#formula-reward-max-objects-amount").val() ),
		}
	}
	
	switch(action) {
		case "create": {
			$.post(`https://${resName}/createFormula`, JSON.stringify(formulaData), function(isSuccessful) {
				if(isSuccessful) {
					formulaModal.modal("hide");
					loadFormulas();
					chooseAllowedFormulas();
				}
			});

			break;
		}

		case "edit": {
			$.post(`https://${resName}/updateFormula`, JSON.stringify({formulaId: formulaModal.data("formulaId"), formulaData: formulaData}), function(isSuccessful) {
				if(isSuccessful) {
					formulaModal.modal("hide");
					loadFormulas();
					chooseAllowedFormulas();
				}
			});

			break;
		}
	}
})

$("#delete-formula-btn").click(function() {
	let formulaModal = $("#formula-modal");
	let formulaId = formulaModal.data("formulaId");

	$.post(`https://${resName}/deleteFormula`, JSON.stringify({formulaId: formulaId}), function(isSuccessful) {
		if(isSuccessful) {
			formulaModal.modal("hide");
			loadFormulas();
			chooseAllowedFormulas();
		}
	});
});
