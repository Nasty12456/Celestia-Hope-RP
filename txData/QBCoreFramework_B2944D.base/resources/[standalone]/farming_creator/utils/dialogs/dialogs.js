async function objectDialog(type) {
	return new Promise(async function(resolve, reject) {
		switch(type) {
			case "item": {
				resolve( await itemsDialog() );
	
				break;
			}
	
			case "account": {
				resolve( await accountsDialog() );

				break;
			}
	
			case "weapon": {
				resolve( await weaponsDialog() );

				break;
			}
		}
	});
}

function getDefaultMarkerCustomization() {
	return {
		type: 27,
		scale: {
			x: 0.7,
			y: 0.7,
			z: 0.7
		},
		color: {
			red: 0,
			green: 255,
			blue: 0,
			opacity: 200
		},
		rotation: {
			x: 0.0,
			y: 0.0,
			z: 0.0
		},
		followCamera: false,
		bounce: false,
		rotate: true
	}
}

async function markerDialog(currentMarkerData) {
	return new Promise((resolve, reject) => {
		let markerModal = $("#marker-customization-dialog-modal");

		if(!currentMarkerData) {
			currentMarkerData = getDefaultMarkerCustomization()
		}

		$("#marker-type").val(currentMarkerData.type);
		$("#marker-size-x").val(currentMarkerData.scale.x);
		$("#marker-size-y").val(currentMarkerData.scale.y);
		$("#marker-size-z").val(currentMarkerData.scale.z);
		$("#marker-color-red").val(currentMarkerData.color.red);
		$("#marker-color-green").val(currentMarkerData.color.green);
		$("#marker-color-blue").val(currentMarkerData.color.blue);
		$("#marker-color-opacity").val(currentMarkerData.color.opacity);
		$("#marker-rotation-x").val(currentMarkerData.rotation.x);
		$("#marker-rotation-y").val(currentMarkerData.rotation.y);
		$("#marker-rotation-z").val(currentMarkerData.rotation.z);
		$("#marker-follow-camera").prop("checked", currentMarkerData.followCamera);
		$("#marker-bounce").prop("checked", currentMarkerData.bounce);
		$("#marker-rotate").prop("checked", currentMarkerData.rotate);

		$("#marker-customization-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			let markerData = {
				type: parseInt( $("#marker-type").val() ),
				scale: {
					x: parseFloat( $("#marker-size-x").val() ),
					y: parseFloat( $("#marker-size-y").val() ),
					z: parseFloat( $("#marker-size-z").val() )
				},
				color: {
					red: parseInt( $("#marker-color-red").val() ),
					green: parseInt( $("#marker-color-green").val() ),
					blue: parseInt( $("#marker-color-blue").val() ),
					opacity: parseInt( $("#marker-color-opacity").val() )
				},
				rotation: {
					x: parseFloat( $("#marker-rotation-x").val() ),
					y: parseFloat( $("#marker-rotation-y").val() ),
					z: parseFloat( $("#marker-rotation-z").val() )
				},
				followCamera: $("#marker-follow-camera").prop("checked"),
				bounce: $("#marker-bounce").prop("checked"),
				rotate: $("#marker-rotate").prop("checked")
			}

			markerModal.modal("hide");

			resolve(markerData);
		})

		markerModal.modal("show");
	});
}

function getDefaultBlipCustomization() {
	return {
		isEnabled: true,
		sprite: 651,
		label: "Field",
		scale: 0.8,
		color: 2,
		display: 2,
	}
}

function getDefaultBlipCustomizationForFarms() {
	return {
		isEnabled: true,
		sprite: 1,
		label: "Farm",
		scale: 0.8,
		color: 2,
		display: 2,
	}
}

function getDefaultBlipCustomizationForWorkbenches() {
	return {
		isEnabled: false,
		sprite: 1,
		label: "Workbench",
		scale: 0.8,
		color: 2,
		display: 2,
	}
}

function getDefaultBlipCustomizationForFoundries() {
	return {
		isEnabled: true,
		sprite: 436,
		label: "Foundry",
		scale: 0.8,
		color: 2,
		display: 2,
	}
}

async function blipDialog(currentBlipData) {
	return new Promise((resolve, reject) => {
		let blipModal = $("#blip-customization-dialog-modal");

		if(!currentBlipData) {
			currentBlipData = getDefaultBlipCustomization()
		}

		$("#blip-enabled").prop("checked", currentBlipData.isEnabled).change();
		$("#blip-sprite").val(currentBlipData.sprite);
		$("#blip-name").val(currentBlipData.label);
		$("#blip-color").val(currentBlipData.color);
		$("#blip-display").val(currentBlipData.display);
		$("#blip-scale").val(currentBlipData.scale);

		$("#blip-customization-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			let blipData = {
				isEnabled: $("#blip-enabled").prop("checked"),
				sprite: parseInt( $("#blip-sprite").val() ),
				label: $("#blip-name").val(),
				scale: parseFloat( $("#blip-scale").val() ),
				color: parseInt( $("#blip-color").val() ),
				display: parseInt( $("#blip-display").val() ),
			}

			blipModal.modal("hide");

			resolve(blipData);
		})

		blipModal.modal("show");
	});
}

$("#blip-enabled").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#blip-customization-form").find("input, select").not( $(this) )
		.prop("disabled", !isEnabled)
		.prop("required", isEnabled);
})

async function doorsDialog(alreadySelectedDoors = {}) {
	return new Promise((resolve, reject) => {
		let inputDoorsModal = $("#input-doors-dialog-modal")
		inputDoorsModal.modal("show");
	
		$("#input-door-search").val("");
		
		$.post(`https://${resName}/getAllDoors`, JSON.stringify({}), function (doors) {
			let inputDoorsList = $("#doors-list");
	
			inputDoorsList.empty();
	
			for(const[buildingId, data] of Object.entries(doors)) {	
				let buildingDiv = $(`
					<div class="form-check fs-3 mb-2">
						<p class="fw-bold mb-0">${data.label}</p>
						
						<div class="doors-list">

						</div>
					</div>
				`);

				for(let [doorsId, doorsData] of Object.entries(data.doors)) {
					let doorDiv = $(`
						<div class="door-div mx-auto">
							<input class="form-check-input" type="checkbox" data-doors-id=${doorsData.id}>
							<label class="form-check-label">
								${doorsData.id} - ${doorsData.label}
							</label>
						</div>
					`);

					buildingDiv.find(".doors-list").append(doorDiv);
				}
				
				inputDoorsList.append(buildingDiv);
			}

			for(let [doorsId, _] of Object.entries(alreadySelectedDoors) ) {
				$(`input[data-doors-id=${doorsId}]`).prop("checked", true);
			}

			// Unbinds the button and rebinds it to callback the selected doors
			$("#input-doors-confirm-btn").unbind().click(function() {
				let selectedDoors = {};
		
				inputDoorsList.find("input:checked").each(function() {	
					let doorsId = parseInt( $(this).data("doorsId") )
						
					selectedDoors[doorsId] = true;
				});
	
				inputDoorsModal.modal("hide");
	
				resolve(selectedDoors);
			})
		});
	})
}

$("#input-door-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#doors-list .form-check").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

function societiesDialog(oldSocieties) {
	return new Promise((resolve, reject) => {
		let inputSocietiesModal = $("#input-societies-dialog-modal")
		inputSocietiesModal.modal("show");
	
		$("#input-society-search").val("");
		
		$.post(`https://${resName}/getAllJobs`, JSON.stringify({}), function (jobs) {
			let societiesListDiv = $("#societies-list");
	
			societiesListDiv.empty();
	
			for(const[jobName, jobData] of Object.entries(jobs)) {
				let jobDiv = $(`
					<div class="row mb-2 society">
						<div class="form-check fs-3 my-auto ms-2" style="width: auto">
							<input class="form-check-input society-checkbox" type="checkbox" data-job-name="${jobName}">

							<p class="mb-0">${jobData.label}</p>
						</div>

						<div class="col-5 ms-auto">
							<div class="input-group">
								<span class="input-group-text">${getLocalizedText("menu:percentage")}</span>
								<input type="number" class="form-control percentage" placeholder="%" disabled>
							</div>
						</div>
					</div>
					
				`);
	
				$(jobDiv).find(".society-checkbox").change(function() {
					let isEnabled = $(this).prop("checked");

					$(this).closest(".society").find(".percentage").prop("disabled", !isEnabled).prop("required", isEnabled);
				})
				
				societiesListDiv.append(jobDiv);
			}

			if(oldSocieties) {
				for(let [jobName, percentage] of Object.entries(oldSocieties)) {
					$("#societies-list")
						.find(`[data-job-name="${jobName}"]`).prop("checked", true).change()
						.closest(".society").find(".percentage").val(percentage);
				}
			}

			// Unbinds the button and rebinds it to callback the selected jobs
			$("#input-societies-confirm-btn").unbind().click(function() {
				let selectedSocieties = {};
	
				let isThereAnySociety = false;
				let isAllValid = true;

				societiesListDiv.find("input:checked").each(function() {
					isThereAnySociety = true;
	
					let percentageDiv = $(this).closest(".society").find(".percentage");

					let jobName = $(this).data("jobName");
					let percentage = parseInt( percentageDiv.val() );

					if(percentage) {
						selectedSocieties[jobName] = percentage;
					} else {
						isAllValid = false;
					}
				});
	
				if(isAllValid) {
					inputSocietiesModal.modal("hide");
		
					resolve(isThereAnySociety ? selectedSocieties : false);
				}
			})
		});
	})
}
$("#input-society-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#societies-list .society").filter(function() {
		$(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

/* Single job dialog */
async function singleJobDialog() {
	return new Promise((resolve, reject) => {
		let inputSingleJobModal = $("#input-single-job-dialog-modal")
		inputSingleJobModal.modal("show");
	
		$("#input-single-job-search").val("");
		
		$.post(`https://${resName}/getAllJobs`, JSON.stringify({}), function (jobs) {
			let jobsListDiv = $("#single-jobs-list");
	
			jobsListDiv.empty();
	
			for(const[jobName, jobData] of Object.entries(jobs)) {
				let jobDiv = $(`
					<li class="list-group-item list-group-item-action" value=${jobName}>${jobData.label}</li>
				`);
	
				jobDiv.click(function() {
					inputSingleJobModal.modal("hide");
					resolve(jobName);
				});
	
				jobsListDiv.append(jobDiv);
			}
		});
	})
}

$("#input-single-job-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#single-jobs-list li").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
    });
})

/* Ground materials */
function getDefaultMaterialsOptions() {
	return {
		[0]: null,
		[1187676648]: null,
		[-1084640111]: null,
		[282940568]: null,
		[-840216541]: null,
		[-124769592]: null,
		[765206029]: null,
		[576169331]: null,
		[1639053622]: null,
		[1945073303]: null,
		[592446772]: null,
		[1913209870]: null,
		[-1595148316]: null,
		[510490462]: null,
		[909950165]: null,
		[-1907520769]: null,
		[-1937569590]: null,
		[-878560889]: null,
		[1619704960]: null,
		[951832588]: 0.8,
		[2128369009]: 0.8,
		[-356706482]: 0.9,
		[-1885547121]: 1.0,
		[-1942898710]: 1.0,
		[1635937914]: 1.0,
		[-273490167]: null,
		[1109728704]: 1.0,
		[223086562]: 1.0,
		[1584636462]: 0.8,
		[1144315879]: null,
		[560985072]: 0.7,
		[-461750719]: 1.0,
		[1333033863]: 1.0,
		[-1286696947]: 1.0,
		[-1833527165]: null,
		[-913351839]: null,
		[-2041329971]: 0.8,	
	}
}

function groundMaterialsDialog(oldMaterials) {
	return new Promise((resolve, reject) => {
		oldMaterials = oldMaterials || getDefaultMaterialsOptions();
		
		let inputGroundMaterialsModal = $("#input-ground-materials-dialog-modal")
		inputGroundMaterialsModal.modal("show");
			
		$.post(`https://${resName}/getAllGroundMaterials`, JSON.stringify({}), function (groundMaterials) {
			let groundMaterialsListDiv = $("#ground-materials-list");
	
			groundMaterialsListDiv.empty();
	
			for(const[materialId, materialLabel] of Object.entries(groundMaterials)) {
				let materialDiv = $(`
					<div class="row mb-2 material mx-auto" data-material-id="${materialId}">
						<div class="form-check fs-4 col-6 my-auto">
							<input class="form-check-input allowed-material-checkbox" type="checkbox">

							<p class="mb-0 fs-5 d-inline">${materialLabel}</p>							
						</div>

						<div class="form-floating col-5 p-0 speed-multiplier-div col-2" data-bs-toggle="tooltip" data-bs-placement="top" title="${getLocalizedText("menu:speed_multiplier_description")}">
							<input type="number" class="form-control speed-multiplier" placeholder="Speed" step="0.1" min="0.1" disabled>
							<label class="ms-1">${getLocalizedText("menu:speed_multiplier")}</label>
						</div>
					</div>
				`);

				materialDiv.find(".allowed-material-checkbox").change(function() {
					const enabled = $(this).prop("checked");

					materialDiv.find(".speed-multiplier").prop("disabled", !enabled).prop("required", enabled);
					
					if(!enabled) {
						materialDiv.find(".speed-multiplier").val("");
					}
				});

				materialDiv.find(".speed-multiplier-div").tooltip({html: true});
	
				groundMaterialsListDiv.append(materialDiv);
			}
	
			if(oldMaterials) {
				for(const[material, speedMultiplier] of Object.entries(oldMaterials)) {
					let materialDiv = groundMaterialsListDiv.find(`[data-material-id="${material}"]`);
	
					materialDiv.find(".allowed-material-checkbox").prop("checked", speedMultiplier != undefined).change();
					materialDiv.find(".speed-multiplier").val(speedMultiplier);
				}
			}

			// Unbinds the button and rebinds it to callback the resolve function
			$("#input-ground-materials-form").unbind().submit(function(event) {
				if(isThereAnyErrorInForm(event)) return;

				let selectedMaterials = {};
	
				groundMaterialsListDiv.find(".material").each(function() {
					let isMaterialUsable = $(this).find(".allowed-material-checkbox").prop("checked");

					if(isMaterialUsable) {
						let materialId = $(this).data("material-id");
						let speedMultiplier = parseFloat( $(this).find(".speed-multiplier").val() );
	
						selectedMaterials[materialId] = speedMultiplier;
					}
				})
	
				inputGroundMaterialsModal.modal("hide");
	
				resolve(selectedMaterials);
			})
		});
	})
}

const defaultPlantingAnimData = {
	type: "scenario",
	scenarioName: "WORLD_HUMAN_GARDENER_PLANT",
	duration: 5
}

const defaultPlantInteractionAnimData = {
	type: "scenario",
	scenarioName: "PROP_HUMAN_BUM_BIN",
	duration: 5
}

const defaultWorkbenchAnimData = {
	type: "animation",
	animDict: "missmechanic",
	animName: "work2_base",
	duration: 5
}

const defaultFormulaAnimData = {
	type: "animation",
	animDict: "missmechanic",
	animName: "work2_base",
	duration: 5
}

function addAnimation(animData) {
	let animListDiv = $("#animations-dialog-animations-list");
	const index = animListDiv.children().length;
	
	let animDiv = $(`
		<div class="animation">
			<div class="text-center fs-5 mb-3 animation-type-div">
				<div class="form-check form-check-inline">
					<input class="form-check-input animation-type-radio" type="radio" name="animation-type-${index}" value="animation" checked>
					<label class="form-check-label">${getLocalizedText("menu:animation")}</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input animation-type-radio" type="radio" name="animation-type-${index}" value="scenario">
					<label class="form-check-label">${getLocalizedText("menu:scenario")}</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input animation-type-radio" type="radio" name="animation-type-${index}" value="special">
					<label class="form-check-label">${getLocalizedText("menu:special")}</label>
				</div>
			</div>

			<div class="animation-div text-center">
				<a class="fst-italic clickable" target="_blank"  onclick='window.invokeNative("openUrl", "https://en.los-santos-multiplayer.com/dev.airdancer?cxt=anim")'>${getLocalizedText("menu:animations_list")}</a>
				
				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:animation_dictionary")}</span>
					<input type="text" class="form-control animation-dictionary" placeholder="amb@world_human_gardener_plant@male@base" required>
				</div>
				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:animation_name")}</span>
					<input type="text" class="form-control animation-name" placeholder="base" required>
				</div>
				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:duration")}</span>
					<input type="number" step="0.1" class="form-control animation-duration" placeholder="${getLocalizedText("menu:seconds")}" required>
				</div>
			</div>

			<div class="scenario-div text-center" style="display:none">
				<a class="fst-italic clickable" target="_blank"  onclick='window.invokeNative("openUrl", "https://wiki.rage.mp/index.php?title=Scenarios")'>${getLocalizedText("menu:scenarios_list")}</a>
				
				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:scenario_name")}</span>
					<input type="text" class="form-control scenario-name" placeholder="WORLD_HUMAN_GARDENER_PLANT">
				</div>
				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:duration")}</span>
					<input type="number" step="0.1" class="form-control scenario-duration" placeholder="${getLocalizedText("menu:seconds")}">
				</div>
			</div>

			<div class="special-div text-center mx-1" style="display:none">			
				<select class="form-select special-animation">
					<option value="watering" selected>${getLocalizedText("menu:watering")}</option>
					<option value="pickaxe">${getLocalizedText("menu:pickaxe")}</option>
					<option value="axe">${getLocalizedText("menu:axe")}</option>
				</select>

				<div class="input-group my-1">
					<span class="input-group-text">${getLocalizedText("menu:duration")}</span>
					<input type="number" step="0.1" class="form-control special-duration" placeholder="${getLocalizedText("menu:seconds")}">
				</div>
			</div>

			<div class="d-inline-block col-12 mt-1">
				<button type="button" class="btn btn-warning btn-sm float-end remove-animation-btn">${getLocalizedText("menu:remove_animation")}</button>
			</div>

			<hr>
		</div>
	`);

	let animationTypeDiv = animDiv.find(".animation-type-div");

	animationTypeDiv.find(".animation-type-radio").change(function() {
		const newValue = $(this).val();

		if(newValue == "scenario") {
			animDiv.find(".animation-div").hide().find("input").prop("required", false);
			animDiv.find(".special-div").hide().find("input").prop("required", false);
			animDiv.find(".scenario-div").show().find("input").prop("required", true);
		} else if(newValue == "animation") {
			animDiv.find(".scenario-div").hide().find("input").prop("required", false);
			animDiv.find(".special-div").hide().find("input").prop("required", false);
			animDiv.find(".animation-div").show().find("input").prop("required", true);
		} else if(newValue == "special") {
			animDiv.find(".scenario-div").hide().find("input").prop("required", false);
			animDiv.find(".animation-div").hide().find("input").prop("required", false);
			animDiv.find(".special-div").show().find("input").prop("required", true);
		}
	});

	animDiv.find(".remove-animation-btn").click(function() {
		animDiv.remove();
	});

	if(animData) {
		animationTypeDiv.find(`.animation-type-radio[value="${animData.type}"]`).prop("checked", true).change();

		if(animData.type == "scenario") {
			animDiv.find(".scenario-name").val(animData.scenarioName);
			animDiv.find(".scenario-duration").val(animData.duration);
		} else if(animData.type == "animation") {
			animDiv.find(".animation-dictionary").val(animData.animDict);
			animDiv.find(".animation-name").val(animData.animName);
			animDiv.find(".animation-duration").val(animData.duration);
		} else if(animData.type == "special") {
			animDiv.find(".special-animation").val(animData.specialAnimation);
			animDiv.find(".special-duration").val(animData.duration);
		}
	}

	animListDiv.append(animDiv);
}

function animationsDialog(oldAnimations) {
	return new Promise((resolve, reject) => {
		let animationsModal = $("#animations-dialog-modal");

		$("#animations-dialog-animations-list").empty();

		if(oldAnimations) {
			oldAnimations.forEach((animData) => {
				addAnimation(animData);
			});
		}

		animationsModal.modal("show");

		$("#animations-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			const animationsList = [];
			let isThereAnyAnimation = false;

			$("#animations-dialog-animations-list").find(".animation").each(function() {
				isThereAnyAnimation = true;

				const animationType = $(this).find(".animation-type-radio:checked").val();

				if(animationType == "animation") {
					const animDict = $(this).find(".animation-dictionary").val();
					const animName = $(this).find(".animation-name").val();
					const duration = parseFloat( $(this).find(".animation-duration").val() );

					animationsList.push({
						type: "animation",
						animDict: animDict,
						animName: animName,
						duration: duration
					});
				} else if(animationType == "scenario") {
					const scenarioName = $(this).find(".scenario-name").val();
					const duration = parseFloat( $(this).find(".scenario-duration").val() );

					animationsList.push({
						type: "scenario",
						scenarioName: scenarioName,
						duration: duration
					});
				} else if(animationType == "special") {
					const specialAnimation = $(this).find(".special-animation").val();
					const duration = parseFloat( $(this).find(".special-duration").val() );

					animationsList.push({
						type: "special",
						specialAnimation: specialAnimation,
						duration: duration
					});
				}
			});

			animationsModal.modal("hide");

			resolve(isThereAnyAnimation ? animationsList : null);
		})
	})
}
$("#animations-dialog-add-animation-btn").click(function() {
	addAnimation();
})

$("#animations-dialog-add-default-planting-animation-btn").click(function() {
	addAnimation(defaultPlantingAnimData);
})

$("#animations-dialog-add-default-interaction-animation-btn").click(function() {
	addAnimation(defaultPlantInteractionAnimData);
})


async function formulasDialog(alreadySelectedFormulas = {}) {
	return new Promise((resolve, reject) => {
		let inputFormulasModal = $("#formulas-dialog-modal")
		inputFormulasModal.modal("show");
	
		$("#input-formula-search").val("");
		
		$.post(`https://${resName}/getAllFormulas`, JSON.stringify({}), function (formulas) {
			let inputFormulasList = $("#formulas-list");
	
			inputFormulasList.empty();
	
			for(const[formulaId, data] of Object.entries(formulas)) {
				// Many divs because flexbox can't use $.toggle
				let formulaDiv = $(`
					<div class="formula-div">
						<div class="d-flex gap-3 justify-content-center">
							<div class="my-auto formula-checkbox">
								<input class="form-check-input" type="checkbox" data-formula-id=${data.id}>
								<label class="form-check-label">${data.id} - ${data.label}</label>
							</div>

							<button type="button" class="btn btn-secondary ms-3 edit-formula-btn"><i class="bi bi-pencil-square"></i></button>
						</div>
					</div>
				`);
				
				$(formulaDiv).find(".edit-formula-btn").click(function() {
					editFormula(data.id);
				})

				inputFormulasList.append(formulaDiv);
			}

			for(let [formulaId, _] of Object.entries(alreadySelectedFormulas) ) {
				$(`input[data-formula-id=${formulaId}]`).prop("checked", true);
			}

			// Unbinds the button and rebinds it to callback the selected formulas
			$("#formulas-form").unbind().submit(function(event) {
				if(isThereAnyErrorInForm(event)) return;
			
				let selectedFormulas = {};
		
				inputFormulasList.find("input:checked").each(function() {	
					let formulaId = parseInt( $(this).data("formulaId") )
						
					selectedFormulas[formulaId] = true;
				});
	
				inputFormulasModal.modal("hide");
	
				resolve(selectedFormulas);
			})
		});
	})
}

$("#input-formula-search").on("keyup", function() {
	let text = $(this).val().toLowerCase();

	$("#formulas-list .formula-div .formula-checkbox").filter(function() {
		const formulaDiv = $(this).closest(".formula-div");
		const canSee = $(this).text().toLowerCase().indexOf(text) > -1;
      	formulaDiv.toggle(canSee);
    });
})

function getDefaultObjectCustomization() {
	return {
		isEnabled: false,
		model: "",
		rotation: {
			x: 0.0,
			y: 0.0,
			z: 0.0
		}
	}
}

function getDefaultObjectCustomizationForWorkbenches() {
	return {
		isEnabled: true,
		model: "prop_tablesaw_01",
		rotation: {
			x: 0.0,
			y: 0.0,
			z: 0.0
		}
	}
}

async function objectCustomizationDialog(currentObjectData) {
	return new Promise((resolve, reject) => {
		let objectModal = $("#object-customization-dialog-modal");

		if(!currentObjectData) {
			currentObjectData = getDefaultObjectCustomization()
		}

		$("#object-enabled").prop("checked", currentObjectData.isEnabled).change();
		$("#object-model").val(currentObjectData.model);
		$("#object-rotation-x").val(currentObjectData.rotation.x);
		$("#object-rotation-y").val(currentObjectData.rotation.y);
		$("#object-rotation-z").val(currentObjectData.rotation.z);

		$("#object-customization-form").unbind().submit(function(event) {
			if(isThereAnyErrorInForm(event)) return;

			let objectData = {
				isEnabled: $("#object-enabled").prop("checked"),
				model: $("#object-model").val(),
				rotation: {
					x: parseFloat( $("#object-rotation-x").val() ),
					y: parseFloat( $("#object-rotation-y").val() ),
					z: parseFloat( $("#object-rotation-z").val() )
				}
			}

			objectModal.modal("hide");

			resolve(objectData);
		})

		objectModal.modal("show");
	});
}

$("#object-enabled").change(function() {
	let isEnabled = $(this).prop("checked");

	$("#object-customization-form").find("input, select").not( $(this) )
		.prop("disabled", !isEnabled)
		.prop("required", isEnabled);
})

function toggleCursor(enabled) {
	if (enabled) {
		$.post(`https://${resName}/enableCursor`, JSON.stringify({}));
	} else {
		$.post(`https://${resName}/disableCursor`, JSON.stringify({}));
	}
}

function loadDialog(dialogName) {
	var script = document.createElement('script');

	console.log(`../utils/dialogs/${dialogName}/${dialogName}.js`)
	script.setAttribute('src',`../utils/dialogs/${dialogName}/${dialogName}.js`);

	document.head.appendChild(script);
}

// Messages received by client
window.addEventListener('message', (event) => {
	let data = event.data;
	let action = data.action;

	switch(action) {
		case "loadDialog": {
			var script = document.createElement('script');
			script.setAttribute('src',`../utils/dialogs/${data.dialogName}/${data.dialogName}.js`);
			document.head.appendChild(script);
			break;
		}
	}
})

$.post(`https://${resName}/nuiReady`, JSON.stringify({}));