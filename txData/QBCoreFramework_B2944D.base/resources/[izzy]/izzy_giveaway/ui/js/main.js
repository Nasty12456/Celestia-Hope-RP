let closed = false
let maxplayers = 1
let mins = 1

$(function(){
    $(".giveawayTitle").click(function(){
        if (closed){
            uiReset()
        }else{
            $(".continueMenu .menuGift").hide()
            $(".continueMenu .giftTitle").hide()
            $(".continueMenu .playerBox").hide()
            $(".continueMenu .joinButton").hide()
            $(".continueMenu .leftSide").css("width", "12.5625vw")
            $(".continueMenu").css("padding-left", "1.1979vw")
            $(".continueMenu .timeBox").css("width", "12.5625vw")
            $(".continueMenu .arrow i").css("rotate", "180deg")
            $(".giftInfoBox").css("flex-direction", "column")
            closed = true
        }
    })

    $(".joinButton").click(function(){
        $.post(`https://${GetParentResourceName()}/join`, function(canJoin){
            $(".joinButton").addClass("disabled")
        })
    })

    window.addEventListener("message", function(e){
        let data = e.data

        if (data.action == "refresh"){
            $(".playerText span").text(data.players)
        } 

        if (data.action == "createMenu"){
            $(".createSide-wrapper").show()
        } 

        if (data.action == "sendTime"){
            modiyTime(data.time)
        }

        if (data.action == "start"){
            uiReset()
            $(".giftTitle h2").text(data.gift)
            $(".joinCoss").text("$"+data.price)
            $(".maxPlayers").text("/ "+data.maxPlayer)
            $(".continueMenu-wrapper").show()

            setTimeout(() => {
                if (!closed){
                    $(".giveawayTitle").click()
                }
            }, 4000)
        } 

        if (data.action == "finish"){
            let winners = ''
            winnerUi()

            if ((data.winners).length == 0){
                $(".winnerSubTitle p").text(data.gift)
                $(".Menu .winnerTitle p").text("NO WINNER")
            }else{
                data.winners.forEach(winner => {
                    winners += (winner.name+", ")
                });

                $(".winnerSubTitle p").text(data.gift)
                $(".Menu .winnerTitle p").text(winners)
            }

            setTimeout(() => {
                $(".Menu-wrapper").hide()
            }, 10000)
        } 
    })

    $(".exitBox").click(function(){
        $.post(`https://${GetParentResourceName()}/close`)
        $(".createSide-wrapper").hide()
    })

    $("#timeMinus").click(function(){
       mins = mins > 1 ? --mins : 1
       $("#numTime").val(mins)
    }) 

    $("#timeUp").click(function(){
        ++mins
        $("#numTime").val(mins)
    })

    $("#joinMinus").click(function(){
        maxplayers = maxplayers > 1 ? --maxplayers : 1
       $("#numPlayers").val(maxplayers)
    }) 

    $("#joinUp").click(function(){
        ++maxplayers
        $("#numPlayers").val(maxplayers)
    })

    $("#numPlayers").on("change", function(){
        maxplayers = $(this).val()
    })

    $("#numTime").on("change", function(){
        mins = $(this).val()
    })

    $(".createButton").click(function(){
        let tip = $("select").val()
        let item = $("#modern-input").val()
        let time = mins
        let joinCoss = $("#price-modern").val()
        let label = $("#itemLabel").val()
        let amount = $("#itemAmount").val()
        let winners = $("#winnerAmount").val()

        if (winners == "" || label == "" || amount == "" || joinCoss == "" || item == "" || maxplayers < 0 || time < 0){
            $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify("InvalidInput"))
        }else{
            $.post(`https://${GetParentResourceName()}/create`, JSON.stringify({
                tip: tip,
                item: item, 
                maxplayers: maxplayers, 
                time: time,
                joinCoss: joinCoss,
                label: label,
                winners: winners,
                amount: amount
            }))
            $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify("Success"))
            $.post(`https://${GetParentResourceName()}/close`)
            $(".createSide-wrapper").hide()
        }
    })

    $(window).on("keydown", function ({ originalEvent: { key } }) {
        if (key == "Escape"){
            $.post(`https://${GetParentResourceName()}/close`)
            $(".createSide-wrapper").hide()
        }
    });

    $(".continueMenu").draggable({
		cursor: "move",
		start: function (e) {
			const $target = $(e.target)

			$target.css({
				right: "auto",
				bottom: "auto",
			})
		},
	})
})

function winnerUi(){
    $(".continueMenu-wrapper").hide()
    setTimeout(() => {
        $(".Menu-wrapper").show()
        $(".joinButton").removeClass("disabled")
        $(".playerText span").text("0")
    }, 200)
}

const convertValue = (value, oldMin, oldMax, newMin, newMax) => {
	const oldRange = oldMax - oldMin
	const newRange = newMax - newMin
	const newValue = ((value - oldMin) * newRange) / oldRange + newMin
	return newValue
}

function uiReset(){
    $(".continueMenu .menuGift").show()
    $(".continueMenu .giftTitle").show()
    $(".continueMenu .playerBox").show()
    $(".continueMenu .joinButton").show()
    $(".continueMenu .leftSide").css("width", "230px")
    $(".continueMenu").css("padding-left", "7.6042vw")
    $(".continueMenu .timeBox").css("width", "5.5625vw")
    $(".continueMenu .arrow i").css("rotate", "0deg")
    $(".giftInfoBox").css("flex-direction", "row")
    closed = false
}

function modiyTime(time) {
    minutes = parseInt(time / 60, 10);
    seconds = parseInt(time % 60, 10);
    
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;
    
    document.querySelector('.timeP').textContent = minutes + ":" + seconds;
}

