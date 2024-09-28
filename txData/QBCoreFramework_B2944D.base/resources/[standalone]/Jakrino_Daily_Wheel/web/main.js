$(document).ready((function() {
    var main = false;
    var colors = ["green", "yellow", "orange", "darkorange", "red"];
    var colorindex = 0;
    var durations = [1350, 1100, 850, 600, 350];
    var durationsSpin = [0, 720, 1080, 1440, 1800];
    var stop = false;
    var tebexLink = "https://celestiahoperp.tebex.io";
    var stopNotify = false;
    var locales = null;
    var babaproblokamk = false;
    var items = [
        { angle: 0.5, name: 'item_1' },
        { angle: 45.5, name: 'item_8' },
        { angle: 90.5, name: 'item_7' },
        { angle: 135.5, name: 'item_6' },
        { angle: 180.5, name: 'item_5' },
        { angle: 225.5, name: 'item_4' },
        { angle: 270.5, name: 'item_3' },
        { angle: 315.5, name: 'item_2' }
    ];

    window.addEventListener('message', event => {
        const { bool, remaining, myCoinAmount, locs, tebx, cycleDay, days } = event.data;
        if (bool === 'open') {
            $('.maintwo').css('display', 'none');
            $('.youHaveXSpin span').text(myCoinAmount);
            $('.spinDesc span').text(remaining);
            let dayBar = document.querySelector('.dayBar');
            dayBar.style.backgroundImage = `url("images/day_${cycleDay}.png")`;
            main = true
            $('body').fadeIn(250);
            $('body').css('display', 'flex');
        } else if (bool === 'close') {
            $('body').fadeOut(250);
            main = false
            setTimeout(() => {
                $('body').css('display', 'none');
            }, 250);
        } else if (bool === 'update') {
            $.each(days, function(key, value) {
                var currentIndex = Number(key) + 1
                let itemClass = document.querySelector(".item_" + currentIndex);
                $(itemClass).html('<h1>' + value.itemLabel + '</h1>' +
                    '<img src="../config/itemimages/'+ value.itemName +'.png" alt="" draggable="false">');
            });
            $('.spinDesc h1').html(locs["SpinText"]);
            $('.useButton h1').html(locs["UseButton"]);
            $('#enterYourCode').attr('placeholder', locs["PlaceHolder"]);
            $('.clickToBuy h1').html(locs["DontHaveCode"]);
            $('.youHaveXSpin h1').html(locs["YouHaveXSpin"]);
            $('.congText h1').text(locs["CongText"]);
            $('.youWon h1').text(locs["YouWon"]);
            tebexLink = tebx
            locales = locs
        }
    });

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            if (!main) {
                main = true
                $('.maintwo').fadeOut(250);
                $('.maintwo').css('display', 'flex');
            } else {
                $('body').fadeOut(250);
                setTimeout(() => {
                    main = false
                    $('body').css('display', 'none');
                    $.post("https://Jakrino_Daily_Wheel/Close");
                }, 250);
            }
        } 
    });

    $('.useButton').on('mousedown', function() {
        $(this).removeClass('hover').addClass('clickedUse');
    });
    $('.useButton').on('mouseup mouseleave', function() {
        $(this).removeClass('clickedUse').addClass('hover');
    });

    $('.claimButton').on('mousedown', function() {
        $(this).removeClass('claimHover').addClass('clickedHover');
    });
    $('.claimButton').on('mouseup mouseleave', function() {
        $(this).removeClass('clickedHover').addClass('claimHover');
    });

    function changeColor() {
        var color = colors[colorindex];
        var duration = durations[colorindex];

        $('.powerBar').css('background-image', 'url("images/' + color + '.png")');

        setTimeout(function() {
            if (stop) { return; };
            colorindex = (colorindex + 1) % colors.length;
            changeColor();
        }, duration);
    }

    changeColor();

    $('.spinContain').on('mousedown', function() {
        $(this).removeClass('spinHover').addClass('clickedSpin');
    });
    $('.spinContain').on('mouseup mouseleave', function() {
        $(this).removeClass('clickedSpin').addClass('spinHover');
    });

    function determineItem(angle) {
        if (angle < 0) {
            angle += 360;
        }
        angle = angle % 360;
        let closestItem = null;
        let minDifference = Infinity;
    
        items.forEach(item => {
            let difference = Math.abs(angle - item.angle);
            if (difference < minDifference) {
                minDifference = difference;
                closestItem = item.name;
            }
        });
        return closestItem;
    }

    let randomMultiplier = Math.floor(Math.random() * 8) + 1;
    let value = 45 * randomMultiplier
    let newvalue = value + 3600;

    $(document).on("click", ".spinContain", function () {
        if (babaproblokamk) { return; }
        babaproblokamk = true
        $.post("https://Jakrino_Daily_Wheel/spinWheel", JSON.stringify({ spinType: "free" }), function (data) {
            if (data) {
                stop = true
                let items = document.querySelector(".items");
                var audio = new Audio('sounds/spineffect.mp3');
                audio.volume = 0.7;
                audio.play();
                $('.youHaveXSpin span').text(data.coinAmount);
                $('.spinDesc span').text(data.serverSide);
                var babapro = newvalue + durationsSpin[colorindex];
                items.style.transform = "rotate(" + babapro + "deg)";
                setTimeout(() => {
                    main = false
                    colorindex = (colorindex + 1) % colors.length;
                    changeColor();
                    stop = false
                    let currentItem = determineItem(babapro);
                    let selectedElement = document.querySelector(`.${currentItem}`);
                    let h1Content = selectedElement.querySelector('h1').textContent;
                    let imgSrc = selectedElement.querySelector('img').src;
                
                    $(".winnedItemText h1").text(h1Content);
                    let winnedItemImage = document.querySelector('.winnedItemImage');
                    winnedItemImage.style.backgroundImage = `url(${imgSrc})`;
                    var newText = currentItem.replace("item_", "");
                    $.post("https://Jakrino_Daily_Wheel/Claimed", JSON.stringify(newText));
                    randomMultiplier = Math.floor(Math.random() * 8) + 1;
                    value = 45 * randomMultiplier
                    newvalue += value + 3600;
                    $('.maintwo').fadeIn(250);
                    var audio2 = new Audio('sounds/wineffect.mp3');
                    audio2.volume = 0.7;
                    audio2.play();
                    $('.maintwo').css('display', 'flex');
                    babaproblokamk = false
                }, 4000);
            } else {
                if (!stopNotify) {
                    stopNotify = true;
                    var eskiIcerik = $(".youHaveXSpin").html();
                    $(".youHaveXSpin").html("<h1>" + locales["NoLuckyWheel"] + "</h1>");
                    setTimeout(() => {
                        stopNotify = false;
                        $(".youHaveXSpin").html(eskiIcerik);
                        babaproblokamk = false
                    }, 2000);
                }
            }
        });
    });

    $(document).on("click", ".useButton", function () {
        var codeInputValue = $("#enterYourCode").val();
        if (codeInputValue != locales["DontHaveCode"] && codeInputValue.length > 0) {
            $.post("https://Jakrino_Daily_Wheel/sendInput", JSON.stringify({input: codeInputValue}), function (data) {
                if (data) {
                    var htmlCoinText = $(".youHaveXSpin span").html();
                    var cuttedText = htmlCoinText.replace(/\D/g, "");
                    var myCoin = parseInt(cuttedText);
                    $('.youHaveXSpin span').text(myCoin + parseInt(data));
                } else {
                    if (!stopNotify) {
                        stopNotify = true;
                        var eskiIcerik = $(".youHaveXSpin").html();
                        $(".youHaveXSpin").html("<h1>" + locales["NoCodeOrSpam"] + "</h1>");
                        setTimeout(() => {
                            stopNotify = false;
                            $(".youHaveXSpin").html(eskiIcerik);
                        }, 2000);
                    }
                }
            });
        }
    });

    $(document).on("click", ".clickToBuy span", function () {
        window.invokeNative("openUrl", tebexLink);
    });

    $(document).on("click", ".exitButton", function () {
        $('body').fadeOut(250);
        setTimeout(() => {
            $('body').css('display', 'none');
            $.post("https://Jakrino_Daily_Wheel/Close");
        }, 250);
    });

    $(document).on("click", ".claimButton", function () {
        if (!main) {
            main = true
            $('.maintwo').fadeOut(250);
            $('.maintwo').css('display', 'flex');
        }
    });
}));