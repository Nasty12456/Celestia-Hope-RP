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
		type: 29,
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
		followCamera: true,
		bounce: false,
		rotate: false
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
			if (!this.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
		
				return;
			} else {
				$(this).removeClass("was-validated");
			}

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
		sprite: 52,
		label: "Shop",
		scale: "0.8",
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
			if (!this.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
		
				return;
			} else {
				$(this).removeClass("was-validated");
			}

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

/* Limited objects dialog */
async function limitedObjectsDialog(oldLimitedObjects) {
	return new Promise((resolve, reject) => {
		let limitedObjectsModal = $("#limited-objects-dialog-modal")
		limitedObjectsModal.modal("show");
	
		$("#limited-objects-list").empty();

		if(oldLimitedObjects) {
			
			if(oldLimitedObjects.item) {
				for(const objectName of Object.keys(oldLimitedObjects.item)) {
					let objectData = {
						name: objectName,
						type: "item",
					}
	
					addLimitedObjectToList(objectData);
				}
			}
			
			if(oldLimitedObjects.weapon) {
				for(const objectName of Object.keys(oldLimitedObjects.weapon)) {
					let objectData = {
						name: objectName,
						type: "weapon",
					}
	
					addLimitedObjectToList(objectData);
				}
			}
		}
		
		$("#limited-objects-form").unbind().submit(function(event) {
			if (!this.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
		
				return;
			} else {
				$(this).removeClass("was-validated");
			}

			let limitedObjects = {
				"item": {},
				"weapon": {},
			};

			$("#limited-objects-list .limited-object").each(function() {
				let type = $(this).find(".item-type").val();
				let name = $(this).find(".item-name").val();

				limitedObjects[type][name] = true;
			})
			
			limitedObjectsModal.modal("hide");

			resolve(limitedObjects);
		})
	})
}

async function addLimitedObjectToList(objectData) {
	let objectDiv = $(`
		<div class="d-flex gap-3 align-items-center text-body my-2 limited-object justify-content-center">
			<button type="button" class="btn btn-danger delete-limited-object-btn me-3" ><i class="bi bi-trash-fill"></i></button>	

			<select class="form-select item-type" style="width: auto;">
				<option selected value="item">${getLocalizedText("menu:item")}</option>
				${await getFramework() == "ESX" ? `<option value="weapon">${getLocalizedText("menu:weapon")}</option>` : ""}
			</select>
			
			<div class="form-floating col">
				<input type="text" class="form-control item-name" placeholder="Name" required>
				<label>${ getLocalizedText("menu:object_name") }</label>
			</div>

			<button type="button" class="btn btn-secondary col-auto choose-item-btn" data-bs-toggle="tooltip" data-bs-placement="top" title="${ getLocalizedText("menu:choose") }"><i class="bi bi-list-ul"></i></button>	
		</div>
	`);

	objectDiv.find(".delete-limited-object-btn").click(function() {
		objectDiv.remove();
	});

	objectDiv.find(".choose-item-btn").click(async function() {
		let objectType = objectDiv.find(".item-type").val();

		let objectName = await objectDialog(objectType);

		objectDiv.find(".item-name").val(objectName);
	}).tooltip();

	if(objectData) {
		objectDiv.find(".item-type").val(objectData.type);
		objectDiv.find(".item-name").val(objectData.name);
	}

	$("#limited-objects-list").append(objectDiv);
}

$("#limited-objects-list-add-object-btn").click(function() {
	addLimitedObjectToList();
})

async function inputDialog(title, label) {
	return new Promise((resolve, reject) => {
		let inputDialogModal = $("#input-dialog-modal");
		$("#input-dialog-modal-value").val("");
		$("#input-dialog-modal-title").text(title);
		$("#input-dialog-modal-label").text(label);
	
		inputDialogModal.modal("show");

		$("#input-dialog-modal-form").unbind().submit(function(event) {
			if (!this.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
		
				return;
			} else {
				$(this).removeClass("was-validated");
			}
	
			inputDialogModal.modal("hide");
	
			resolve( $("#input-dialog-modal-value").val() );
		});
	})
}

async function permissionsDialog(permissions) {
	return new Promise((resolve, reject) => {
		let permissionsModal = $("#player-shop-permissions-dialog-modal");

		permissionsModal.find(".permission").prop("checked", false);

		if(permissions) {
			for(const [permissionName, enabled] of Object.entries(permissions)) {
				permissionsModal.find(`.permission[data-permission-name="${permissionName}"]`).prop("checked", enabled);
			}
		}

		$("#player-shop-permissions-dialog-modal-form").unbind().submit(function(event) {
			let permissions = {};

			permissionsModal.find(".permission").each(function() {
				let permissionName = $(this).data("permission-name");

				permissions[permissionName] = $(this).prop("checked");
			})

			permissionsModal.modal("hide");

			resolve(permissions);
		});

		permissionsModal.modal("show");
	});
}

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