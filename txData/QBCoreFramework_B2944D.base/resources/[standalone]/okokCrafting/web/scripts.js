function addStr(str, index, stringToAdd){
	return str.substring(0, index) + stringToAdd + str.substring(index, str.length);
}

var isTimerOn = false;
var lastTime;
var categories = [];
var selectedCategory = "general_cat";
var craft2;
var job2;
var gang;
var craftData;
var sideCraftMenu;
var itemClaiming = 0;
var CraftQueue = [];
var maxCraft = 10;
var canCraftItem = true;
var showAllCrafts = false;
var canClaimAll = true;

var canClaimItem = true;
var canOpenSideCraft = true;

let Inventory = '';

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'openCraft':
			selectedCategory = "general_cat";
			canOpenSideCraft = true;
			canClaimItem = true;
			itemClaiming = 0;
			showAllCrafts = event.data.showAllCrafts;
			Inventory = event.data.inventory;
			var queue = event.data.queue;
			craftData = event.data;
			categories = event.data.categories;
			var craft = event.data.craft;
			craft2 = craft;
			var num = craft.length;
			var paragraph = '';
			var row = '<div class="row">';
			var lastRowNum = 0;
			var job = event.data.job;
			job2 = event.data.job;
			gang = event.data.gang;
			var added = 0;
			var useCategories = event.data.useCategories;
			var categoriesButtonsHTML = `
				<input type="radio" class="btn-check cat_tab" name="category" value="general_cat" id="general_cat" checked>
				<label class="btn btn-category first-category" for="general_cat">General</label>
			`;
			document.querySelector('#claimall-button').disabled = false;
			if(useCategories){
				for(let i = 0; i < categories.length; i++){
					categoriesButtonsHTML += `
						<input type="radio" class="btn-check cat_tab" name="category" value="${categories[i]}" id="${categories[i]}">
						<label class="btn btn-category last-category" for="${categories[i]}">${categories[i]}</label>
					`;
				}
				$('#categories_btns').html(categoriesButtonsHTML);
				$('#categories_box').show();
			} else {
				$('#categories_box').hide();
			}

			if(num >= 13){
				$('.itemslist_window').css('padding', '0.3125rem 0.55rem 0.3125rem 0.625rem');
			} else {
				$('.itemslist_window').css('padding', '0.3125rem 1.05rem 0.3125rem 0.625rem');
			}

			for(var i = 0; i < num; i++) {
				for(var i1 = 0; i1 < craft[i].job.length; i1++){
					if(selectedCategory == "general_cat" || craft[i].category == selectedCategory){
						if(craft[i].job[i1] == job || craft[i].job[i1] == gang || craft[i].job[i1] == ''){
							if(!event.data.UseXP){
								var itemName = event.data.itemNames;
								var itemId = craft[i].item;
								var index = i;
								added++
								row += `
									<div class="col-md-3">
										<div class="card item_card" id="${itemId}wb_${event.data.wb}wb_${index}">
											<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${event.data.wb}wb_${index}">
												<span class="item-title text-center">${itemName[itemId]}</span>
												<img src="nui://${Inventory}/${itemId}.png" class="image">
											</div>
										</div>
									</div>
								`;
								var myEle = document.getElementById(itemId+"wb_"+event.data.wb+"wb_"+index);
								if(!myEle) {
									$(document).on('click', "#"+itemId+"wb_"+event.data.wb+"wb_"+index, function() {
										if(canOpenSideCraft) {
											canOpenSideCraft = false;
											allID = this.id;
											id = allID.substring(0, allID.indexOf('wb_'));
											index2 = allID.split("wb_");
											$('.item_card-body').css('background-color', 'rgba(220, 220, 220, 0.20)');
											$('#selected'+this.id).css('background-color', 'rgba(31, 94, 255, 1)');
											var sound = new Audio('click.mp3');
											sound.volume = 0.3;
											sound.play();
											$.post('https://okokCrafting/action', JSON.stringify({
												action: "craft",
												item: id,
												crafts: craft,
												itemName: itemName,
												index: index2[2],
											}));
										}
									});
								}

								if ((added) % 4 === 0) {
									row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
									lastRowNum = row.length+6;
								}
							} else {
								if(craft[i].levelNeeded <= event.data.level || showAllCrafts){
									var itemName = event.data.itemNames;
									var itemId = craft[i].item;
									var index = i;
									added++
									row += `
										<div class="col-md-3">
											<div class="card item_card" id="${itemId}wb_${event.data.wb}wb_${index}">
												<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${event.data.wb}wb_${index}">
													<span class="item-title text-center">${itemName[itemId]}</span>
													<img src="nui://${Inventory}/${itemId}.png" class="image">
												</div>
											</div>
										</div>
									`;
									var myEle = document.getElementById(itemId+"wb_"+event.data.wb+"wb_"+index);
									if(!myEle) {
										$(document).on('click', "#"+itemId+"wb_"+event.data.wb+"wb_"+index, function() {
											if(canOpenSideCraft) {
												canOpenSideCraft = false;
												allID = this.id;
												id = allID.substring(0, allID.indexOf('wb_'));
												index2 = allID.split("wb_");
												$('.item_card-body').css('background-color', 'rgba(220, 220, 220, 0.20)');
												$('#selected'+this.id).css('background-color', 'rgba(31, 94, 255, 1)');
												var sound = new Audio('click.mp3');
												sound.volume = 0.3;
												sound.play();
												$.post('https://okokCrafting/action', JSON.stringify({
													action: "craft",
													item: id,
													crafts: craft,
													itemName: itemName,
													index: index2[2],
													level: event.data.level,
												}));
											}
										});
									}

									if ((added) % 4 === 0) {
										row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
										lastRowNum = row.length+6;
									}
								}
							}
						}
					}
				}
			}
			row += `</div>`;
			
			if(event.data.UseXP) {
				$('#currentlevel').html(event.data.level);
				document.documentElement.style.setProperty('--percentage-width', event.data.percentage+"%");
				$('.xpbar-col').css('margin-top', '-1.8rem');
			} else {
				$('.xpbar').hide();
				$('.xpbar-col').css('margin-top', '5.05rem');
			}

			var queueRow = '';
			CraftQueue = queue;
			if(queue.length > 0){
				if(queue.length >= 6){
					$('.craftingq_window').css('padding-right', '0.35rem');
				} else {
					$('.craftingq_window').css('padding-right', '0rem');
				}
				for (var i = 0; i < queue.length; i++) {
					if(queue[i].isDone == true) {
						if(queue[i].suc){
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item-concluded mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Concluded</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-claimbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-check"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item-concluded mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Concluded</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-claimbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-check"></i></div></span>
										</div>
									</div>
								`;
							}
						} else {
							queueRow += `
								<div class="d-flex justify-content-between w-100 queue-item-failed mt-2">
									<div class="d-flex align-items-center">
										<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
										<div class="ms-2">
											<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
											<div class="queue-itemstate">Failed to craft</div>
										</div>
									</div>
									<div class="d-flex align-items-center queue-item-mr">
										<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-failbutton-bg" data-id="${i}" onclick="claimFail(this)"><i class="fas fa-check"></i></div></span>
									</div>
								</div>
							`;
						}
					} else {
						if(queue[i].isPending){
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Pending</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Pending</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							}
						} else {
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Time left: ${queue[i].time}s</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Time left: ${queue[i].time}s</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							}
						}
					}
				}
			} else {
				queueRow = `<div class="d-flex justify-content-center noitq">The crafting queue is empty</div>`
			}

			$('.craftingq_window').html(queueRow);
			$('#craft-table').html(row);
			$('.title-name').html(event.data.name);

			$('.title').fadeIn();
			$('.itemslist').fadeIn();
			$('.crafting-body').fadeIn();
		break
	case 'openSideCraft':
		sideCraftMenu = event.data;
		canOpenSideCraft = true;
		var useLevels = false;
		if(sideCraftMenu.level != undefined){
			var levelNeeded = sideCraftMenu.crafts[sideCraftMenu.index].levelNeeded;
			var level = sideCraftMenu.level;
			useLevels = true;
		}
		
		var isLevel = false;
		$('#quantity').val(1); 
		maxCraft = sideCraftMenu.maxCraft;
		if(canCraftItem == false){
			canCraftItem = true;
			document.querySelector('#craft-button').disabled = false;
		}

		var canCraft = true;
		var isAvailable = false;
		var num = event.data.recipe.length;
		var recipe = ``;
		var img = `
			<img src="nui://${Inventory}/${event.data.itemNameID}.png" class="image_itemselected">
			<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${event.data.itemName} x${event.data.itemAmount}</span>
		`;

		if(sideCraftMenu.isDis){
			$('#top_text').html(`Requirements`);
			$('#bot_text').html(`You will receive`);
			img = `
				<img src="nui://${Inventory}/${event.data.itemNameID}.png" class="image_itemselected">
				<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${event.data.itemName} x${event.data.itemAmount} (${event.data.isDisItemAmt})</span>
			`;
		} else {
			$('#top_text').html(`You will receive`);
			$('#bot_text').html(`Requirements`);
		}

		$('#side-image').html(img);
		$('#craft-time').html(event.data.time);

		if(useLevels){
			if(level >= levelNeeded){
				canCraft = true;
				isAvailable = true;
				isLevel = true;
			} else {
				isAvailable = false;
				canCraft = false;
				isLevel = true;
			}
		}

		for(var i = 0; i < num; i++){
			var idName = event.data.recipe[i][0];
			if(sideCraftMenu.isDis){
				recipe += `
					<div class="d-flex align-items-center mx-1">
						<img src="nui://${Inventory}/${event.data.recipe[i][0]}.png" class="image_components">
						<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${event.data.itemNames[idName]} x${event.data.recipe[i][1]}</span>
					</div>
				`;
				if(event.data.itemAmount > event.data.isDisItemAmt){
					canCraft = false
				}
			} else {
				recipe += `
					<div class="d-flex align-items-center mx-1">
						<img src="nui://${Inventory}/${event.data.recipe[i][0]}.png" class="image_components">
						<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${event.data.itemNames[idName]} x${event.data.recipe[i][1]} (${event.data.inventory[i].key})</span>
					</div>
				`;
				if(event.data.recipe[i][1] > event.data.inventory[i].key){
					canCraft = false
				}
			}
		}
		

		$('#craft-button-div').html(`
			<button type="button" id="craft-button" data-item="${event.data.itemNameID}" data-recipe="${event.data.recipe}" data-amount="${event.data.itemAmount}" data-xp="${event.data.xp}" data-isDis="${event.data.isDis}" data-index="${sideCraftMenu.index}" data-level="${sideCraftMenu.level}" onclick="craft(this)" class="btn btn-blue flex-grow-1">CRAFT</button>
		`);

		if(canCraft) {
			$('#craft-buttons-info').fadeIn();
			$('#craft-button-div').fadeIn();
			$('#craft-buttons-info-level').hide();
		} else {
			$('#craft-buttons-info').hide();
			$('#craft-buttons-info-level').hide();
		}
		
		if(useLevels){
			if(!isAvailable && isLevel){
				$('#craft-button-div-level').html(`
					<span class="btn-blue-level"><i class="fa-solid fa-lock"></i> LEVEL REQUIRED: ${levelNeeded}</span>
				`);
				$('#craft-buttons-info-level').fadeIn();
				$('#craft-button-div-level').fadeIn();
			}
		}

		$('#craft-percentage').html(event.data.percentage);
		$('.components_window').html(recipe);

		$('.itemrequirements').fadeIn();
		break
	case 'ShowCraftCount':
		var time = event.data.time;
		var itemName = event.data.name;
		
		$('#crafting-text').html(`Crafting`);
		$('#item-name').html(`${itemName}`);
		$('#item-timer').html(`${time}s`);
		if(time == lastTime) {
			$('#cog').removeClass('fa-spin');
		} else {
			$('#cog').addClass('fa-spin');
		}
		

		if(!isTimerOn){
			isTimerOn = true;
			$('.timer').fadeIn();
		}
		lastTime = time
		break
	case 'CompleteCraftCount':
		var itemName = event.data.name;

		$('.timer_card-body').css('background-color', '#1fa34a');
		$('#crafting-text').html(`Crafted`);
		$('#item-name').html(`${itemName}`);
		$('#item-timer').html(`0s`);

		$('#cog').removeClass('fa-spin');
		$('#cog').removeClass('fa-cog');

		$('#cog').addClass('fa-check');
		
		break
	case 'FailedCraftCount':
		var itemName = event.data.name;

		$('.timer_card-body').css('background-color', '#990b0b');
		$('#crafting-text').html(`Failed to craft`);
		$('#item-name').html(`${itemName}`);
		$('#item-timer').html(`0s`);

		$('#cog').removeClass('fa-spin');
		$('#cog').removeClass('fa-cog');

		$('#cog').addClass('fa-times');
		
		break
	case 'HideCraftCount':
		isTimerOn = false;
		$('.timer').fadeOut();
		setTimeout(function(){
			$('#cog').removeClass('fa-times');
			$('#cog').removeClass('fa-check');
			$('#cog').addClass('fa-spin');
			$('#cog').addClass('fa-cog');

			$('.timer_card-body').css('background-color', 'rgba(31, 94, 255, 1)');
		}, 400);
		break
	case 'updateCraftingItems':
		canClaimItem = true;
		if(selectedCategory != ""){
			var queue = event.data.queue;
			var queueRow = '';
			CraftQueue = queue;
			if(queue.length > 0){
				if(queue.length >= 6){
					$('.craftingq_window').css('padding-right', '0.35rem');
				} else {
					$('.craftingq_window').css('padding-right', '0rem');
				}
				for (var i = 0; i < queue.length; i++) {
					if(queue[i].isDone == true) {
						if(queue[i].suc){
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item-concluded mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Concluded</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-claimbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-check"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item-concluded mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Concluded</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-claimbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-check"></i></div></span>
										</div>
									</div>
								`;
							}
						} else {
							queueRow += `
								<div class="d-flex justify-content-between w-100 queue-item-failed mt-2">
									<div class="d-flex align-items-center">
										<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
										<div class="ms-2">
											<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
											<div class="queue-itemstate">Failed to craft</div>
										</div>
									</div>
									<div class="d-flex align-items-center queue-item-mr">
										<span class="queue-claimbutton"><div class="d-flex justify-content-center align-items-center queue-failbutton-bg" data-id="${i}" onclick="claimFail(this)"><i class="fas fa-check"></i></div></span>
									</div>
								</div>
							`;
						}
					} else {
						if(queue[i].isPending){
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Pending</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Pending</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							}
						} else {
							if(queue[i].isDis){
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Time left: ${queue[i].time}s</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="claim(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							} else {
								queueRow += `
									<div class="d-flex justify-content-between w-100 queue-item mt-2">
										<div class="d-flex align-items-center">
											<img src="nui://${Inventory}/${queue[i].item}.png" class="image_components">
											<div class="ms-2">
												<div class="queue-itemname">${queue[i].itemName} x${queue[i].amount}</div>
												<div class="queue-itemstate">Time left: ${queue[i].time}s</div>
											</div>
										</div>
										<div class="d-flex align-items-center queue-item-mr">
											<span class="queue-cancelbutton"><div class="d-flex justify-content-center align-items-center queue-cancelbutton-bg" data-id="${i}" onclick="cancel(this)"><i class="fas fa-times"></i></div></span>
										</div>
									</div>
								`;
							}
						}
					}
				}
			} else {
				queueRow = `<div class="d-flex justify-content-center noitq">The crafting queue is empty</div>`
			}
			$('.craftingq_window').html(queueRow);
		}
		break
	case 'resetItemNumber':
		itemClaiming = 0;
		break
	case 'resetButton':
		if(canCraftItem == false){
			canCraftItem = true;
			document.querySelector('#craft-button').disabled = false;
		}
		break
	case 'canClaimAll':
		document.querySelector('#claimall-button').disabled = false;
		break
	case 'closeMenu':
		closeMenu();
		break
	}
});

$(document).on('click', ".cat_tab", function() {
	selectedCategory = $("input[name='category']:checked").val();
	var num = craft2.length;
	var paragraph = '';
	var row = '<div class="row">';
	var lastRowNum = 0;
	var added = 0
	for(var i = 0; i < num; i++) {
		for(var i1 = 0; i1 < craft2[i].job.length; i1++){
			if(selectedCategory == "general_cat" || craft2[i].category == selectedCategory){
				if(craft2[i].job[i1] == job2 || craft2[i].job[i1] == gang || craft2[i].job[i1] == ''){
					if(!craftData.UseXP){
						var itemName = craftData.itemNames;
						var itemId = craft2[i].item;
						var index = i;
						added++
						row += `
							<div class="col-md-3">
								<div class="card item_card" id="${itemId}wb_${craftData.wb}wb_${index}">
									<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${craftData.wb}wb_${index}">
										<span class="item-title text-center">${itemName[itemId]}</span>
										<img src="nui://${Inventory}/${itemId}.png" class="image">
									</div>
								</div>
							</div>
						`;
						if ((added) % 4 === 0) {
							row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
							lastRowNum = row.length+6;
						}
					} else {
						if(craft2[i].levelNeeded <= craftData.level || showAllCrafts){
							var itemName = craftData.itemNames;
							var itemId = craft2[i].item;
							var index = i;
							added++
							row += `
								<div class="col-md-3">
									<div class="card item_card" id="${itemId}wb_${craftData.wb}wb_${index}">
										<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${craftData.wb}wb_${index}">
											<span class="item-title text-center">${itemName[itemId]}</span>
											<img src="nui://${Inventory}/${itemId}.png" class="image">
										</div>
									</div>
								</div>
							`;

							if ((added) % 4 === 0) {
								row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
								lastRowNum = row.length+6;
							}
						}
					}
				}
			}
		}
	}
	row += `</div>`;
	
	if(craftData.UseXP) {
		$('#currentlevel').html(craftData.level);
		document.documentElement.style.setProperty('--percentage-width', craftData.percentage+"%");
		$('.xpbar-col').css('margin-top', '-1.8rem');
	} else {
		$('.xpbar').hide();
		$('.xpbar-col').css('margin-top', '5.05rem');
	}

	$('#craft-table').html(row);
	$('.title-name').html(craftData.name);

	$('.title').fadeIn();
	$('.itemslist').fadeIn();
	$('.crafting-body').fadeIn();
});

function restartCrafts(){
	selectedCategory = 'general_cat';
	var num = craft2.length;
	var paragraph = '';
	var row = '<div class="row">';
	var lastRowNum = 0;
	var added = 0
	for(var i = 0; i < num; i++) {
		for(var i1 = 0; i1 < craft2[i].job.length; i1++){
			if(selectedCategory == "general_cat" || craft2[i].category == selectedCategory){
				if(craft2[i].job[i1] == job2 || craft2[i].job[i1] == gang || craft2[i].job[i1] == ''){
					if(!craftData.UseXP){
						var itemName = craftData.itemNames;
						var itemId = craft2[i].item;
						var index = i;
						added++
						row += `
							<div class="col-md-3">
								<div class="card item_card" id="${itemId}wb_${craftData.wb}wb_${index}">
									<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${craftData.wb}wb_${index}">
										<span class="item-title text-center">${itemName[itemId]}</span>
										<img src="nui://${Inventory}/${itemId}.png" class="image">
									</div>
								</div>
							</div>
						`;
						if ((added) % 4 === 0) {
							row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
							lastRowNum = row.length+6;
						}
					} else {
						if(craft2[i].levelNeeded <= craftData.level || showAllCrafts){
							var itemName = craftData.itemNames;
							var itemId = craft2[i].item;
							var index = i;
							added++
							row += `
								<div class="col-md-3">
									<div class="card item_card" id="${itemId}wb_${craftData.wb}wb_${index}">
										<div class="card-body item_card-body d-flex justify-content-center align-items-center" style="background-color: rgba(220, 220, 220, 0.20)" id="selected${itemId}wb_${craftData.wb}wb_${index}">
											<span class="item-title text-center">${itemName[itemId]}</span>
											<img src="nui://${Inventory}/${itemId}.png" class="image">
										</div>
									</div>
								</div>
							`;

							if ((added) % 4 === 0) {
								row = addStr(row, row.length, `</div><div class="row itemslist_row-h">`);
								lastRowNum = row.length+6;
							}
						}
					}
				}
			}
		}
	}
	row += `</div>`;
	
	if(craftData.UseXP) {
		$('#currentlevel').html(craftData.level);
		document.documentElement.style.setProperty('--percentage-width', craftData.percentage+"%");
		$('.xpbar-col').css('margin-top', '-1.8rem');
	} else {
		$('.xpbar').hide();
		$('.xpbar-col').css('margin-top', '5.05rem');
	}

	$('#craft-table').html(row);
	$('.title-name').html(craftData.name);
}

$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
			closeMenu();
		}
	};
});

$(document).ready(function(){
	$('#plus').click(function(e) {
		var quantity = parseInt($('#quantity').val());
		if(quantity < maxCraft){
			$('#quantity').val(quantity + 1); 
			updateSideMenu(quantity + 1);
		}
	});

	$('#minus').click(function(e) {
		var quantity = parseInt($('#quantity').val());
		
		if(quantity > maxCraft){
			$('#quantity').val(maxCraft);
			updateSideMenu(maxCraft);
		} else {
			if(quantity > 1) {
				$('#quantity').val(quantity - 1);
				updateSideMenu(quantity - 1);
			}
		}
	});
	$('#max').click(function(e) {
		var quantity = parseInt($('#quantity').val());
		
		if(quantity != maxCraft){
			$('#quantity').val(maxCraft);
			updateSideMenu(maxCraft);
		}
	});
});

function quantity_change(t) {
	var quantity = parseInt($('#quantity').val());
		
	if(quantity > maxCraft){
		$('#quantity').val(maxCraft);
		updateSideMenu(maxCraft);
	} else if(quantity < 1) {
		$('#quantity').val(1);
		updateSideMenu(1);
	} else {
		updateSideMenu(quantity);
	}
}

function craft(t) {
	if(canCraftItem){
		canCraftItem = false;
		document.querySelector('#craft-button').disabled = true;
		var itemId = t.dataset.item;
		var recipe = t.dataset.recipe;
		var amount = t.dataset.amount;
		var xp = t.dataset.xp;
		var isDis = t.dataset.isDis;
		var index = t.dataset.index;
		var level = t.dataset.level;
		var quantity = document.getElementById("quantity").value;
		if(quantity > maxCraft){
			quantity = maxCraft;
			$('#quantity').val(quantity - 1);
			updateSideMenu(quantity - 1);
		}
		$.post('https://okokCrafting/action', JSON.stringify({
			action: "craft-button",
			itemID: itemId,
			recipe: recipe,
			amount: amount,
			xp: xp,
			quantity: quantity,
			isDis: isDis,
			index: index,
			level: level,
		}));
	}
}

function claim(t) {
	var index = parseInt(t.dataset.id)+1;
	var itemRndID = parseInt(CraftQueue[index-1].randomID);
	if(itemClaiming != itemRndID && canClaimItem){
		canClaimItem = false;
		itemClaiming = itemRndID;
		$.post('https://okokCrafting/action', JSON.stringify({
			action: "claim-item",
			index: index,
		}));
	}
}

function claimall(t) {
	if(CraftQueue[0] != undefined && CraftQueue[0].isDone && canClaimItem){
		canClaimItem = false;
		document.querySelector('#claimall-button').disabled = true;
		$.post('https://okokCrafting/action', JSON.stringify({
			action: "claim-all",
		}));
	}
	
}

function claimFail(t) {
	var index = parseInt(t.dataset.id)+1;
	var itemRndID = parseInt(CraftQueue[index-1].randomID);
	if(itemClaiming != itemRndID && canClaimItem){
		canClaimItem = false;
		itemClaiming = itemRndID;
		$.post('https://okokCrafting/action', JSON.stringify({
			action: "fail-item",
			index: index,
		}));
	}
}

function cancel(t) {
	var index = parseInt(t.dataset.id)+1;
	var itemRndID = parseInt(CraftQueue[index-1].randomID);
	if(itemClaiming != itemRndID && canClaimItem){
		canClaimItem = false;
		itemClaiming = itemRndID;
		$.post('https://okokCrafting/action', JSON.stringify({
			action: "cancel-item",
			index: index,
		}));
	}
}

function updateSideMenu(quantity){
	var canCraft = true
	var num = sideCraftMenu.recipe.length;
	var recipe = ``;
	var img = `
		<img src="nui://${Inventory}/${sideCraftMenu.itemNameID}.png" class="image_itemselected">
		<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${sideCraftMenu.itemName} x${sideCraftMenu.itemAmount*quantity}</span>
	`;

	if(sideCraftMenu.isDis){
		img = `
			<img src="nui://${Inventory}/${sideCraftMenu.itemNameID}.png" class="image_itemselected">
			<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${sideCraftMenu.itemName} x${sideCraftMenu.itemAmount*quantity} (${sideCraftMenu.isDisItemAmt})</span>
		`;
	}

	$('#side-image').html(img);
	$('#craft-time').html(sideCraftMenu.time*quantity);

	for(var i = 0; i < num; i++){
		var idName = sideCraftMenu.recipe[i][0];
		if(sideCraftMenu.isDis){
			recipe += `
				<div class="d-flex align-items-center mx-1">
					<img src="nui://${Inventory}/${sideCraftMenu.recipe[i][0]}.png" class="image_components">
					<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${sideCraftMenu.itemNames[idName]} x${sideCraftMenu.recipe[i][1]*quantity}</span>
				</div>
			`;
			if(sideCraftMenu.itemAmount > sideCraftMenu.isDisItemAmt){
				canCraft = false
			}
		} else {
			recipe += `
				<div class="d-flex align-items-center mx-1">
					<img src="nui://${Inventory}/${sideCraftMenu.recipe[i][0]}.png" class="image_components">
					<span style="color: #fff; font-weight: 600; font-size: 20px;" class="ms-2">${sideCraftMenu.itemNames[idName]} x${sideCraftMenu.recipe[i][1]*quantity} (${sideCraftMenu.inventory[i].key})</span>
				</div>
			`;
			if(sideCraftMenu.recipe[i][1] > sideCraftMenu.inventory[i].key){
				canCraft = false
			}
		}
	}

	$('#craft-button-div').html(`
		<button type="button" id="craft-button" data-item="${sideCraftMenu.itemNameID}" data-recipe="${sideCraftMenu.recipe}" data-amount="${sideCraftMenu.itemAmount}" data-xp="${sideCraftMenu.xp}" data-isDis="${sideCraftMenu.isDis}" data-index="${sideCraftMenu.index}" data-level="${sideCraftMenu.level}" onclick="craft(this)" class="btn btn-blue flex-grow-1">CRAFT</button>
	`);

	if(canCraft) {
		$('#craft-button-div').fadeIn();
	} else {
		$('#craft-button-div').hide();
	}

	$('#craft-percentage').html(sideCraftMenu.percentage);
	$('.components_window').html(recipe);

	$('.itemrequirements').fadeIn();
}

function closeMenu(){
	selectedCategory = "";
	$('.crafting-body').fadeOut();
	$('.title').fadeOut();
	$('.itemslist').fadeOut();
	$('.itemrequirements').fadeOut();
	setTimeout(function(){
		restartCrafts();
	}, 400);
	$.post('https://okokCrafting/action', JSON.stringify({
		action: "close",
	}));
}