var Routes = {};
var Tasks = {};
var tasksfixsayi = 0;
var maxkm = 20;
var clothes = false;
var money = 0;
var DailyLimit = 0;
var firstOpen = true;
var profilePhoto = "";
var startedjob = false;
var startedjobid = 500;
var Locales = {};
var level = 0;
var completedtasks = 0;

$(function () {
    $(".menu").hide();
    $(".General").hide();

    $("#jobroutesprice").click(function () {
        $.post("https://qb-garbage/SiralaPrice");
        document.getElementById("jobroutesprice").className = "Category selectCategory";
        document.getElementById("jobroutesroute").className = "Category";
        document.getElementById("jobroutesrandom").className = "Category";
    });

    $("#jobroutesroute").click(function () {
        $.post("https://qb-garbage/SiralaDistance");
        document.getElementById("jobroutesprice").className = "Category";
        document.getElementById("jobroutesroute").className = "Category selectCategory";
        document.getElementById("jobroutesrandom").className = "Category";
    });

    $("#jobroutesrandom").click(function () {
        $.post("https://qb-garbage/SiralaRandom");
        document.getElementById("jobroutesprice").className = "Category";
        document.getElementById("jobroutesroute").className = "Category";
        document.getElementById("jobroutesrandom").className = "Category selectCategory";
    });

    // $("#jobClothesButton").click(function () {
    //     clothes = !clothes;
    //     $.post("https://qb-garbage/WearClothes", JSON.stringify({ wear: clothes }));
    //     if (clothes) {
    //         notify("success", Locales["weared_clothes"]);
    //         document.getElementById("jobClothesButton").style.background = "linear-gradient(179deg, #ff3333 0%, #404040 100%)";
    //     } else {
    //         notify("error", Locales["unweared_clothes"]);
    //         document.getElementById("jobClothesButton").style.background = "linear-gradient(179deg, #929292 0%, #404040 100%)";
    //     }
    // });

    $("#collectButton").click(function () {
        var price = document.getElementById("ParaDeger").value;
        price = Number(price);
        if (price) {
            if (Number.isInteger(price)) {
                $.post("https://qb-garbage/WithdrawMoney", JSON.stringify({ price: price }));
            } else {
                notify("error", Locales["integar_value"]);
            }
        } else {
            notify("error", Locales["no_price"]);
        }
    });

    $("#tasks").click(function () {
        setuptasks(Tasks);
    });

    $("#earningsButton").click(function () {
        $(".earningsMenu").fadeIn(500);
    });

    $("#exitBoxEarning").click(function () {
        $(".earningsMenu").fadeOut(500);
    });

    $("#exitBoxButton").click(function () {
        $.post("https://qb-garbage/close");
        close();
    });

    $("#ExitTasks").click(function () {
        $(".jobTasks").fadeOut(300);
    });
});

window.addEventListener("message", function (event) {
    if (event.data.UpdateMoney) {
        money = money - event.data.Money;
        moneypart = "";
        moneypart += `
            <div class="earningPrice" id="Earning">
                <h2>
                Earnings
                <p>$${money}</p>
                </h2>
            </div>
            <div class="earningPrice" id="Earning">
                <h2>
                Daily Earnings Limit
                <p style="color: #dc5353">$${DailyLimit}</p>
                </h2>
            </div>
            `;
        $("#earningsPriceBox").html(moneypart);
        return;
    }
    if (event.data.action == "routesguncelle") {
        SetupRoutes(event.data.routes);
        Routes = event.data.routes;
        return;
    }
    if (event.data.action == "notify") {
        notify(event.data.type, event.data.text);
        return;
    }
    if (event.data.action == "startjob") {
        startedjob = true;
        startedjobid = event.data.routeid;
        return;
    }
    if (firstOpen) {
        Locales = event.data.Locales;
        document.getElementById("descriptionText").innerHTML = Locales.descriptionText;
        document.getElementById("earningsDescription").innerHTML = Locales.earningsDescription;
        document.getElementById("profileDescription").innerHTML = Locales.profileDescription;
        document.getElementById("earningInformation").innerHTML = Locales.earningInformation;
        firstOpen = false;
        var xhr = new XMLHttpRequest();
        xhr.responseType = "text";
        xhr.open("GET", event.data.steamid, true);
        xhr.send();
        xhr.onreadystatechange = processRequest;
        function processRequest(e) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var string = xhr.responseText.toString();
                var array = string.split("avatarfull");
                var array2 = array[1].toString().split('"');
                profilePhoto = array2[2].toString();
                // $(".ProfilePhoto").attr("src", profilePhoto);
                console.log(profilePhoto);
                document.getElementById("profileImg").style.backgroundImage = "url(" + profilePhoto + ")";
            }
        }
    }
    var open = event.data.showUI;
    var data = event.data.data;
    Routes = event.data.routes;
    maxkm = event.data.maxkm;
    Tasks = event.data.tasks;
    progresspartreactanglemenu = "";
    namepart = "";
    htmlaq = "";
    if (open) {
        var leveltext = data.Level;
        if (data.Level > 9) {
        } else {
            if (data.Level > 0) {
                // EKLEME
                leveltext = "0" + data.Level;
            }
        }
        level = data.Level;
        completedtasks = data.completedtask + " Tasks"
        var currentXP = data.currentXP;
        var NeededXP = event.data.NeededXP;
        var yuzdeprogress = ((NeededXP - currentXP) / NeededXP) * 100;
        var yuzdeprogress2 = 100 - yuzdeprogress;
        $(".General").fadeIn(500);
        $(".menu").fadeIn(500);
        namepart += `
            ${data.name}
                    <div class="moneyBox">
                    <div class="moneyIcon">
                        <i id="paraIcon" class="fa-solid fa-money-bill"></i>
                    </div>
                    <div class="moneyText">${data.money}</div>
                    </div>
        `;
        $("#profileInfoBox").html(namepart);
        htmlaq += `
        <div class="single-chart">
            <svg viewBox="0 0 36 36" class="circular-chart orange">
            <path
                class="circle-bg"
                d="M18 2.0845
                        a 15.9155 15.9155 0 0 1 0 31.831
                        a 15.9155 15.9155 0 0 1 0 -31.831"
            />
            <path
                class="circle"
                stroke-dasharray="${yuzdeprogress2}, 100"
                d="M18 2.0845
                        a 15.9155 15.9155 0 0 1 0 31.831
                        a 15.9155 15.9155 0 0 1 0 -31.831"
            />
            <text x="18" y="18.85" class="percentage">${leveltext}</text>
            <text x="18" y="25.65" class="percentage2">LvL</text>
            </svg>
        </div>
        <div class="levelText">
            <h2>
            Level
            <p>${leveltext}</p>
            </h2>
            <div class="levelProgress">
            <h2>
                ${currentXP}
                <p>/${NeededXP}exp</p>
            </h2>
            <div style="width: ${yuzdeprogress2}%" class="progressSay"></div>
            </div>
        </div>
        `;
        $("#levelBox").html(htmlaq);
        money = data.EarnedMoney;
        DailyLimit = event.data.DailyLimit;
        moneypart = "";
        moneypart += `
            <div class="earningPrice" id="Earning">
                <h2>
                Earnings
                <p>$${money}</p>
                </h2>
            </div>
            <div class="earningPrice" id="Earning">
                <h2>
                Daily Earnings Limit
                <p style="color: #dc5353">$${DailyLimit}</p>
                </h2>
            </div>
            `;
        $("#earningsPriceBox").html(moneypart);
        document.getElementById("taskcount").innerHTML = completedtasks;
        SetupRoutes(Routes);
    } else {
        $(".General").fadeOut(500);
        $(".menu").fadeOut(500);
    }
});

function setuptasks(tasks) {
    $("#jobTasksSide").empty();
    $("#jobTasks").fadeIn(500);
    sira1 = "";
    for (var i = 0; i < Object.entries(tasks).length; i++) {
        var element = Tasks[i];
        var elementtext = "PRICE:";
        var elementcollect = false;
        if (element.hasCount >= element.requiredCount) {
            if (element.Collected) {
                elementtext = "COLLECTED";
                elementcollect = false;
            } else {
                elementtext = "COLLECT";
                elementcollect = true;
            }
        }
        var tamamlanan = (100 / element.requiredCount) * element.hasCount;
        sira1 += `
            <div class="jobTaskBox">
                <div class="jobTaskBoxTopSide">
                <h2 class="jobTaskBoxTitle">
                    ${element.TaskName}
                    <p>
                    ${element.TaskDescription}
                    </p>
                </h2>
                <div class="single-chart" style="width: 5vw">
                    <svg viewBox="0 0 36 36" class="circular-chart orange">
                    <path
                        class="circle-bg"
                        d="M18 2.0845
                                a 15.9155 15.9155 0 0 1 0 31.831
                                a 15.9155 15.9155 0 0 1 0 -31.831"
                    />
                    <path
                        class="circle"
                        stroke-dasharray="${tamamlanan}, 100"
                        d="M18 2.0845
                                a 15.9155 15.9155 0 0 1 0 31.831
                                a 15.9155 15.9155 0 0 1 0 -31.831"
                    />
                    <text x="18" y="18.85" class="percentage">${element.hasCount}</text>
                    <text x="18" y="25.65" class="percentage2">/${element.requiredCount}</text>
                    </svg>
                </div>
                </div>
                <div class="jobTaskBoxBottomSide" id="jobTaskBoxBottomSide" data-index="${element.id}" data-token="${elementcollect}">
                <div class="taskPriceBox">${elementtext} : $${element.Reward.Price}</div>
                <div class="taskExpBox">${element.Reward.Exp} Exp</div>
                </div>
            </div>
        `;
    }

    $("#jobTasksSide").html(sira1);

    $(".jobTaskBoxBottomSide").click(function () {
        console.log($(this).data("token"));
        if ($(this).data("token")) {
            $.post("https://qb-garbage/GetReward", JSON.stringify({ index: $(this).data("index") }));
            close();
        } else {
            notify("error", Locales["task_successfully"]);
        }
    });
}

function SetupRoutes(data) {
    $(".routesList").empty();
    itemsHTML = "";
    negatifdeger = maxkm / 4;
    for (var i = 0; i < Object.entries(data).length; i++) {
        // console.log(data[i].RouteName, "DONDU");
        deger1 = 0;
        deger2 = 0;
        deger3 = 0;
        deger4 = 0;
        var started = false;
        var starttext = "START JOB";
        var starttextimage = "./images/startjob.png";
        var color = "linear-gradient(179deg, #71d23f 0%, #359e00 100%)";
        var element = data[i];
        if (element.id == startedjobid) {
            starttext = "LEAVE JOB";
            starttextimage = "./images/leavejob.png";
            color = "linear-gradient(179deg, #D23F3F 0%, #9E0000 100%)";
            started = true;
        } else {
            starttext = "START JOB";
            color = "linear-gradient(179deg, #71d23f 0%, #359e00 100%)";
        }
        if (level < element.Level) {
            starttext = "LEVEL NOT YET";
            color = "linear-gradient(179deg, #808080 0%, #565656 100%)";
        }
        if (element.RouteDistance < maxkm - negatifdeger * 3) {
            deger1 = element.RouteDistance;
            deger2 = 0;
            deger3 = 0;
            deger4 = 0;
        } else if (element.RouteDistance < maxkm - negatifdeger * 2) {
            deger1 = maxkm;
            deger2 = element.RouteDistance - negatifdeger;
            deger3 = 0;
            deger4 = 0;
        } else if (element.RouteDistance < maxkm - negatifdeger) {
            deger1 = maxkm;
            deger2 = maxkm;
            deger3 = element.RouteDistance - negatifdeger * 2;
            deger4 = 0;
        } else {
            deger1 = maxkm;
            deger2 = maxkm;
            deger3 = maxkm;
            deger4 = element.RouteDistance - negatifdeger * 3;
        }
        if (level < element.Level) {
            itemsHTML += `
                <div class="routeBox">
                    <div class="routeBoxLeft">
                        <div
                            class="routeImg"
                            style="background-image: url(${element.Photo})"
                        ></div>
                        <div class="routeTitleBox">
                            <h3 class="routeTitle">
                            ${element.RouteName}
                            <p>${element.RouteSmallText}</p>
                            </h3>
                            <div class="routeDistanceBox">
                            <div class="routeDistance">
                                <progress max="${maxkm / 4}" value="${deger1}" class="cubuk1"></progress>
                                <progress max="${maxkm / 4}" value="${deger2}" class="cubuk2"></progress>
                                <progress max="${maxkm / 4}" value="${deger3}" class="cubuk3"></progress>
                                <progress max="${maxkm / 4}" value="${deger4}" class="cubuk4"></progress>
                            </div>
                            ${element.RouteDistance}KM
                            </div>
                        </div>
                        </div>
                        <div class="routeLocationBox">
                        <div class="routeLocation startLocation">
                            <i class="fa-solid fa-location-dot"></i>${element.RouteStartStreet}
                        </div>
                        <div class="routeLocation finishLocation">
                            <i class="fa-solid fa-location-crosshairs"></i>${element.RouteFinishStreet}
                        </div>
                        </div>
                        <div class="routeButtonBox">
                        <h3 class="routePriceText">
                            PRICE:
                            <p>$${element.Price}</p>
                        </h3>
                        <div style="background: ${color};" class="routeButton startButton" id="routeButtonstartButton" data-level="${
                element.Level
            }" data-started="${started}" data-token="${i}">
                            <i class="fa-solid fa-lock"></i>${starttext}
                        </div>
                        <h3 class="routeLevelText">
                        Required Level ${element.Level}
                        </h3>
                    </div>
                </div>
                `;
        } else {
            if (started) {
                itemsHTML += `
                    <div class="routeBox">
                        <div class="routeBoxLeft">
                            <div
                                class="routeImg"
                                style="background-image: url(${element.Photo})"
                            ></div>
                            <div class="routeTitleBox">
                                <h3 class="routeTitle">
                                ${element.RouteName}
                                <p>${element.RouteSmallText}</p>
                                </h3>
                                <div class="routeDistanceBox">
                                <div class="routeDistance">
                                    <progress max="${maxkm / 4}" value="${deger1}" class="cubuk1"></progress>
                                    <progress max="${maxkm / 4}" value="${deger2}" class="cubuk2"></progress>
                                    <progress max="${maxkm / 4}" value="${deger3}" class="cubuk3"></progress>
                                    <progress max="${maxkm / 4}" value="${deger4}" class="cubuk4"></progress>
                                </div>
                                ${element.RouteDistance}KM
                                </div>
                            </div>
                            </div>
                            <div class="routeLocationBox">
                            <div class="routeLocation startLocation">
                                <i class="fa-solid fa-location-dot"></i>${element.RouteStartStreet}
                            </div>
                            <div class="routeLocation finishLocation">
                                <i class="fa-solid fa-location-crosshairs"></i>${element.RouteFinishStreet}
                            </div>
                            </div>
                            <div class="routeButtonBox">
                            <h3 class="routePriceText">
                                PRICE:
                                <p>$${element.Price}</p>
                            </h3>
                            <div style="background: ${color};" class="routeButton startButton" id="routeButtonstartButton" data-level="${
                    element.Level
                }" data-started="${started}" data-token="${i}">
                                <i class="fa-solid fa-arrow-right-from-bracket"></i>${starttext}
                            </div>
                            <h3 class="routeLevelText">
                            Required Level ${element.Level}
                            </h3>
                        </div>
                </div>
                `;
            } else {
                itemsHTML += `
                    <div class="routeBox">
                        <div class="routeBoxLeft">
                            <div
                                class="routeImg"
                                style="background-image: url(${element.Photo})"
                            ></div>
                            <div class="routeTitleBox">
                                <h3 class="routeTitle">
                                ${element.RouteName}
                                <p>${element.RouteSmallText}</p>
                                </h3>
                                <div class="routeDistanceBox">
                                <div class="routeDistance">
                                    <progress max="${maxkm / 4}" value="${deger1}" class="cubuk1"></progress>
                                    <progress max="${maxkm / 4}" value="${deger2}" class="cubuk2"></progress>
                                    <progress max="${maxkm / 4}" value="${deger3}" class="cubuk3"></progress>
                                    <progress max="${maxkm / 4}" value="${deger4}" class="cubuk4"></progress>
                                </div>
                                ${element.RouteDistance}KM
                                </div>
                            </div>
                            </div>
                            <div class="routeLocationBox">
                            <div class="routeLocation startLocation">
                                <i class="fa-solid fa-location-dot"></i>${element.RouteStartStreet}
                            </div>
                            <div class="routeLocation finishLocation">
                                <i class="fa-solid fa-location-crosshairs"></i>${element.RouteFinishStreet}
                            </div>
                            </div>
                            <div class="routeButtonBox">
                            <h3 class="routePriceText">
                                PRICE:
                                <p>$${element.Price}</p>
                            </h3>
                            <div style="background: ${color};" class="routeButton startButton" id="routeButtonstartButton" data-level="${
                    element.Level
                }" data-started="${started}" data-token="${i}">
                                <i class="fa-solid fa-backward-step"></i>${starttext}
                            </div>
                            <h3 class="routeLevelText">
                            Required Level ${element.Level}
                            </h3>
                        </div>
                </div>
                `;
            }
        }
        $("#routesList").html(itemsHTML);
    }

    $(".routeButton").click(function () {
        if (level >= $(this).data("level")) {
            if ($(this).data("started")) {
                $.post("https://qb-garbage/LeaveJob");
                notify("error", Locales["leave_job"]);
                startedjob = false;
                startedjobid = false;
                SetupRoutes(Routes);
            } else {
                StartJobSetup($(this).data("token"));
            }
        } else {
            notify("error", Locales["level_not_yet"]);
        }
    });
}

function StartJobSetup(index) {
    $("#jobRouteMenu").fadeIn(500);
    var Route = Routes[index];
    negatifdeger = maxkm / 4;
    deger1 = 0;
    deger2 = 0;
    deger3 = 0;
    deger4 = 0;
    if (Route.RouteDistance < maxkm - negatifdeger * 3) {
        deger1 = Route.RouteDistance;
        deger2 = 0;
        deger3 = 0;
        deger4 = 0;
    } else if (Route.RouteDistance < maxkm - negatifdeger * 2) {
        deger1 = maxkm;
        deger2 = Route.RouteDistance - negatifdeger;
        deger3 = 0;
        deger4 = 0;
    } else if (Route.RouteDistance < maxkm - negatifdeger) {
        deger1 = maxkm;
        deger2 = maxkm;
        deger3 = Route.RouteDistance - negatifdeger * 2;
        deger4 = 0;
    } else {
        deger1 = maxkm;
        deger2 = maxkm;
        deger3 = maxkm;
        deger4 = Route.RouteDistance - negatifdeger * 3;
    }
    StartJobHTML = ""; // PHOTO ROUTE EKLENCEK
    StartJobHTML += `
        <h2 class="jobRouteTitle">JOB ROUTE #1</h2>
        <div class="jobRouteSide">
          <div
            class="jobRouteImg"
            style="background-image: url(${Route.Photo})" 
          ></div>
          <div class="jobRouteRightSide">
            <div class="jobRouteLocationInfo">
              <div class="routeLocation startLocation">
                <i class="fa-solid fa-location-dot"></i>${Route.RouteStartStreet}
              </div>
              <div class="routeLocation finishLocation">
                <i class="fa-solid fa-location-crosshairs"></i>${Route.RouteFinishStreet}
              </div>
            </div>
            <div class="routeDistanceBox">
              <div class="routeDistance">
                <progress max="${maxkm / 4}" value="${deger1}" class="cubuk1"></progress>
                <progress max="${maxkm / 4}" value="${deger2}" class="cubuk2"></progress>
                <progress max="${maxkm / 4}" value="${deger3}" class="cubuk3"></progress>
                <progress max="${maxkm / 4}" value="${deger4}"" class="cubuk4"></progress>
              </div>
              ${Route.RouteDistance}KM
            </div>
            <h2 class="jobRoutePrice">
              PRICE:
              <p>$${Route.Price}</p>
            </h2>
          </div>
        </div>
        <div class="jobRouteButtonBox">
          <div class="jobRouteButton jobRouteCancelButton" id="jobRouteCancelButton">Cancel</div>
          <div class="jobRouteButton jobRouteStartButton" id="jobRouteStartButton">Start Job</div>
        </div>
        <div
          class="exitBox"
          id="exitBox"
          style="position: absolute; right: 1.5625vw; top: 1.5625vw"
        >
          <div class="exitIcon"><i class="fa-solid fa-xmark"></i></div>
        </div>
    `;
    $("#jobRouteMenu").html(StartJobHTML);

    $(".exitBox").click(function () {
        $(".jobRouteMenu").fadeOut(500);
    });

    $(".jobRouteCancelButton").click(function () {
        $(".jobRouteMenu").fadeOut(500);
    });

    $(".jobRouteStartButton").click(function () {
        if (level >= Routes[index].Level) {
            $.post("https://qb-garbage/StartJob", JSON.stringify({ index: Routes[index].id }));
            close();
        } else {
            notify("error", Locales["level_not_yet"]);
        }
    });
}

$(document).on("keydown", function () {
    // eklenecek
    switch (event.keyCode) {
        case 27: // ESC
            close();
            break;
    }
});

function close() {
    $.post("https://qb-garbage/close");
    $(".General").fadeOut(500);
    $(".menu").fadeOut(500);
    $("#earningsMenu").fadeOut(500);
    $("#jobTasks").fadeOut(500);
    $("#jobRouteMenu").fadeOut(500);
}

function notify(type, text) {
    clicksound();
    $("#notifyerror").hide();
    $("#notifysuccess").hide();
    if (type == "error") {
        $("#notifyerror").fadeIn(500);
        document.getElementById("notifyDescriptionError").innerHTML = text;
        setTimeout(() => {
            $("#notifyerror").fadeOut(500);
        }, 2500);
    } else if (type == "success") {
        $("#notifysuccess").fadeIn(500);
        document.getElementById("notifyDescriptionSuccess").innerHTML = text;
        setTimeout(() => {
            $("#notifysuccess").fadeOut(500);
        }, 2500);
    }
}

function sleep(milliseconds) {
    const date = Date.now();
    let currentDate = null;
    do {
        currentDate = Date.now();
    } while (currentDate - date < milliseconds);
}

function clicksound() {
    let beat = new Audio("./sound/notification.ogg");
    beat.volume = 0.1;
    beat.play();
}
