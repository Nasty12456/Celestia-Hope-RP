$(function() {
	window.addEventListener('message', function(event) {
		if (event.data.enable) {
			let battlepass = {civilian: event.data.civilian, criminal: event.data.criminal};
			
			GenerateCivilianProgress(battlepass.civilian);
			GenerateCivilianRewards(battlepass.civilian, event.data.path);
			
			battlepass.civilian.nextLevelEta != 0 ? $('#before-get-exp-time').html(battlepass.civilian.nextLevelEta +` minute(s)`) : $('#before-get-exp-time').html(`CLAIM YOUR REWARD`);
			
			GenerateCriminalProgress(battlepass.criminal);
			GenerateCriminalRewards(battlepass.criminal, event.data.path);
			
			battlepass.criminal.nextLevelEta != 0 ? $('#criminal-before-get-exp-time').html(battlepass.criminal.nextLevelEta +` minute(s)`) : $('#criminal-before-get-exp-time').html(`CLAIM YOUR REWARD`);
			
			$('body').show();
			$('#wrap').show();
		}
		else if (event.data.hide) {
			$('body').hide();
			$('#wrap').hide();
			
			$.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
		}
	});
	
	$('#btn-buy-level').click(function() {
		$('body').hide();
		$('#wrap').hide();
		
		$.post(`https://${GetParentResourceName()}/buy_level`, JSON.stringify({type: 'civilian'}));
	});
	
	$('#btn-buy-criminal-level').click(function() {
		$('body').hide();
		$('#wrap').hide();
		
		$.post(`https://${GetParentResourceName()}/buy_level`, JSON.stringify({type: 'criminal'}));
	});
	
	$('#btn-reset-level').click(function() {
		$('body').hide();
		$('#wrap').hide();
		
		$.post(`https://${GetParentResourceName()}/reset_battlepass`, JSON.stringify({type: 'civilian'}));
	});
	
	$('#btn-reset-criminal-level').click(function() {
		$('body').hide();
		$('#wrap').hide();
		
		$.post(`https://${GetParentResourceName()}/reset_battlepass`, JSON.stringify({type: 'criminal'}));
	});
	
	document.onkeyup = function(event) {
		if (event.key == 'Escape') {
			$('body').hide();
			$('#wrap').hide();
			
			$.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
		}
	};
});

function ClaimReward(type) {
	$.post(`https://${GetParentResourceName()}/reward`, JSON.stringify({type: type}));
}

function GenerateCivilianProgress(data) {
	$('#exp-progress').html(`
		<span class="type">CIVILIAN</span> BATTLEPASS
		<br/><br/>
		<table style="width:100%">
		<tr>
			<td>
				<span id="exp-current">`+ data.xp +` /</span> <span id="exp-goal">`+ data.maxXp +`</span><br/>
				<span id="exp-progress-desc">EXP TO THE NEXT LEVEL</span>
			</td>
		</tr>
		<tr><td><center><div id="levelbar"></div></center></td></tr>
		</table>
		<script>
		var bar = new ProgressBar.Circle(levelbar, {
		  strokeWidth: 6,
		  color: 'rgba(255,255,255,0.1)',
		  trailColor: 'rgba(255,255,255,0.2)',
		  trailWidth: 1,
		  easing: 'easeInOut',
		  duration: 2000,
		  svgStyle: null,
		  text: {
			value: '',
			alignToBottom: false
		  },
		  
		  // Set default step function for all animate calls
		  step: (state, bar) => {
			bar.path.setAttribute('stroke', state.color);
			var value = Math.round(bar.value() * 100);
			bar.setText("<span id='level-circle'>`+ data.level +`</span><br/><span id='level-circle-desc'>LEVEL</span>");
			bar.text.style.color = state.color;
		  }
		});
		bar.animate(`+ Math.floor(data.xp/data.maxXp*100) +` / 100); 
		</script>`
	);
}

function GenerateCivilianRewards(data, path) {
	let finalHTML = ``;
	
	for (let i = 0; i < data.rewards.length; i++) {
		let itemStatus;
		let itemReceived;
		let itemLevel = i + 1;
		let backgroundImg = path + data.rewards[i].item +`.png`
		
		if (i % 5 == 0) {
			if (data.level >= itemLevel && data.level < (itemLevel + 5)) {
				finalHTML += `<div class="item active">`;
			}
			else {
				finalHTML += `<div class="item">`;
			}
		}
		
		if (data.level == itemLevel) {
			let xpPerc = Math.floor(data.xp/data.maxXp*100)
			
			if (xpPerc == 100) {
				itemStatus = `<div id="battlepass-done"><i class="fal fa-check-square"></i> DONE</div>`;
				itemReceived = `<button onclick="ClaimReward(\'civilian\')" id="battlepass-claim">CLAIM REWARD</button>`;
			}
			else {
				itemStatus = `<div id="battlepass-accomp">ACCOMPLISHMENT</div>`;
				itemReceived = `<div id="battlepass-inprogress" class="w3-border">IN PROGRESS <div class="w3-red" style="width:`+ xpPerc +`%"></div></div>`;
			}
		}
		else if (data.level < itemLevel) {
			itemStatus = `<div id="battlepass-waiting">WAITING</div>`;
			itemReceived = `<div id="battlepass-received">WAITING</div>`;
		}
		else if (data.level > itemLevel) {
			itemStatus = `<div id="battlepass-done"><i class="fal fa-check-square"></i> DONE</div>`;
			itemReceived = `<div id="battlepass-received">RECEIVED</div>`;
		}
		
		finalHTML += `
		<div id="battlepass-block">
			<div id="battlepass-level">LEVEL `+ itemLevel +`</div>
			<div id="battlepass-block-bg">
				`+ itemStatus +`
				<div id="battlepass-reward-img" style="background:url(`+ backgroundImg +`) center center no-repeat;background-size:cover;background-origin:content-box;"></div>
				<div id="battlepass-reward-title">`+ data.rewards[i].title +`</div>
				<div id="battlepass-reward-desc">`+ data.rewards[i].desc +`</div>
				`+ itemReceived +`
			</div>
		</div>`;
		
		if (i % 5 == 4) {
			finalHTML += `</div>`;
		}
	}
	
	$("#rewards").html(finalHTML);
}

function GenerateCriminalProgress(data) {
	$('#criminal-exp-progress').html(`
		<span class="type">CRIMINAL</span> BATTLEPASS
		<br/><br/>
		<table style="width:100%">
		<tr>
			<td>
				<span id="exp-current">`+ data.xp +` /</span> <span id="exp-goal">`+ data.maxXp +`</span><br/>
				<span id="exp-progress-desc">EXP TO THE NEXT LEVEL</span>
			</td>
		</tr>
		<tr><td><center><div id="clevelbar"></div></center></td></tr>
		</table>
		<script>
		var bar = new ProgressBar.Circle(clevelbar, {
		  strokeWidth: 6,
		  color: 'rgba(255,255,255,0.1)',
		  trailColor: 'rgba(255,255,255,0.2)',
		  trailWidth: 1,
		  easing: 'easeInOut',
		  duration: 2000,
		  svgStyle: null,
		  text: {
			value: '',
			alignToBottom: false
		  },
		  
		  // Set default step function for all animate calls
		  step: (state, bar) => {
			bar.path.setAttribute('stroke', state.color);
			var value = Math.round(bar.value() * 100);
			bar.setText("<span id='level-circle'>`+ data.level +`</span><br/><span id='level-circle-desc'>LEVEL</span>");
			bar.text.style.color = state.color;
		  }
		});
		bar.animate(`+ Math.floor(data.xp/data.maxXp*100) +` / 100); 
		</script>`
	);
}

function GenerateCriminalRewards(data, path) {
	let finalHTML = ``;
	
	for (let i = 0; i < data.rewards.length; i++) {
		let itemStatus;
		let itemReceived;
		let itemLevel = i + 1;
		let backgroundImg = path + data.rewards[i].item +`.png`
		
		if (i % 5 == 0) {
			if (data.level >= itemLevel && data.level < (itemLevel + 5)) {
				finalHTML += `<div class="item active">`;
			}
			else {
				finalHTML += `<div class="item">`;
			}
		}
		
		if (data.level == itemLevel) {
			let xpPerc = Math.floor(data.xp/data.maxXp*100)
			
			if (xpPerc == 100) {
				itemStatus = `<div id="battlepass-done"><i class="fal fa-check-square"></i> DONE</div>`;
				itemReceived = `<button onclick="ClaimReward(\'criminal\')" id="battlepass-claim">CLAIM REWARD</button>`;
			}
			else {
				itemStatus = `<div id="battlepass-accomp">ACCOMPLISHMENT</div>`;
				itemReceived = `<div id="battlepass-inprogress" class="w3-border">IN PROGRESS <div class="w3-red" style="width:`+ xpPerc +`%"></div></div>`;
			}
		}
		else if (data.level < itemLevel) {
			itemStatus = `<div id="battlepass-waiting">WAITING</div>`;
			itemReceived = `<div id="battlepass-received">WAITING</div>`;
		}
		else if (data.level > itemLevel) {
			itemStatus = `<div id="battlepass-done"><i class="fal fa-check-square"></i> DONE</div>`;
			itemReceived = `<div id="battlepass-received">RECEIVED</div>`;
		}
		
		finalHTML += `
		<div id="battlepass-block">
			<div id="battlepass-level">LEVEL `+ itemLevel +`</div>
			<div id="battlepass-block-bg">
				`+ itemStatus +`
				<div id="battlepass-reward-img" style="background:url(`+ backgroundImg +`) center center no-repeat;background-size:cover;background-origin:content-box;"></div>
				<div id="battlepass-reward-title">`+ data.rewards[i].title +`</div>
				<div id="battlepass-reward-desc">`+ data.rewards[i].desc +`</div>
				`+ itemReceived +`
			</div>
		</div>`;
		
		if (i % 5 == 4) {
			finalHTML += `</div>`;
		}
	}
	
	$("#rewards-criminal").html(finalHTML);
}