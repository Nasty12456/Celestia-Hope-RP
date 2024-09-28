$(function () {
	let translations = {};
	let audio, money, machine, object, page, pages;

	let counterNo = 0;

	function counterEffect(to, now) {
		counterNo++;

		let no = counterNo;

		jQuery({ Counter: now || 0 }).animate(
			{ Counter: to },
			{
				duration: 1000,
				easing: "swing",
				step: function () {
					$("#counter-" + no).text(Math.round(this.Counter));
				},
			}
		);

		return `<span id="counter-${no}"></span>`;
	}

	function setNotify(text, color) {
		$(".notify").html(
			`<marquee direction="right" scrollamount="20" loop="1" style="color: ${
				color || "inherit"
			};">${text}</marquee>`
		);
	}

	function buyItem(item) {
		if (money < item.Price) {
			return setNotify(translations["NoMoney"] || "Not Enough Money", "#ff4848");
		}

		$.post("https://qb-automat/buyItem", JSON.stringify({ object, item }));

		closePage();
	}

	function setPurity(percent) {
		$(".purity-wrapper .percent-1").html(counterEffect(percent) + "/" + counterEffect(100));
		$(".purity-wrapper .percent-2").html(counterEffect(percent) + "%");
		$(".purity-wrapper .cake").css(
			"background-image",
			`conic-gradient(${
				machine.Type == "Beverage" ? "#3c64f4" : machine.Type == "Coffee" ? "#371f17" : "#ff4848"
			} ${percent}%, transparent 0%, transparent)`
		);
	}

	function setAvailability(now, max) {
		let percent = (now * 100) / max || 0;

		$(".availability-wrapper .percent-1").html(counterEffect(now) + "/" + counterEffect(max));
		$(".availability-wrapper .percent-2").html(counterEffect(percent) + "%");
		$(".availability-wrapper .cake").css(
			"background-image",
			`conic-gradient(${
				machine.Type == "Beverage" ? "#3c64f4" : machine.Type == "Coffee" ? "#371f17" : "#ff4848"
			} ${percent}%, transparent 0%, transparent)`
		);
	}

	function setPage(no) {
		if (no == page || no > pages) return;

		$(".items-wrapper").html("");

		let now = 0;
		let max = 0;

		for (let i = 0; i < 8; i++) {
			let index = i + no * 8;
			let item = machine.Items[index];

			if (item) {
				now += item.Amount || 1;
				max += item.Stock || 1;

				$(".items-wrapper").append(
					$(`
				<div class="item">
					<div class="item-amount">${item.Amount || '<i class="fa-solid fa-infinity"></i>'}</div>
					<div class="item-img"><img src="assets/items/${item.Item}.png" /></div>
					<div class="item-name">${item.Label}&nbsp;<span>${item.Price}$</span></div>
				</div>
				`).click(() => buyItem(item))
				);
			}
		}

		if (now == 0) {
			$(".items-wrapper").html(`<div class="empty">${translations["Empty"] || "Empty"}</div>`);

			$(".availability-wrapper .cake").css("opacity", 0);
		} else {
			$(".availability-wrapper .cake").css("opacity", 1);
		}

		setAvailability(now, max);

		$(".items-wrapper").css("opacity", 0);
		$(".items-wrapper").animate({ opacity: 1 }, 500);

		$(`.page:nth-child(${(page || 0) + 1})`).removeClass("active");
		$(`.page:nth-child(${no + 1})`).addClass("active");

		page = no;
	}

	$(window).on("message", function ({ originalEvent: { data: msg } }) {
		switch (msg.action) {
			case "open":
				money = msg.player.accounts ? msg.player.accounts.money : msg.player.money.cash;
				machine = msg.machine;
				object = msg.object;
				page = -1;
				pages = machine.Items.length / 8;

				$(document.body).attr("class", machine.Type);
				$(".line").attr("src", `assets/images/${machine.Type}Line.png`);
				$(".background").attr("src", `assets/images/${machine.Type}Bg.png`);

				$(".pages").html("");

				for (let i = 0; i < pages; i++) {
					$(".pages").append($(`<div class="page"></div>`).click(() => setPage(i)));
				}

				setPage(0);
				setPurity(machine.Purity);

				if (machine.Title) {
					$(".content-wrapper .title-2").text(machine.Title);
				}

				$(document.body).fadeIn();
				break;

			case "audio":
				if (audio != null) {
					audio.pause();
				}

				audio = new Howl({ src: ["./assets/sounds/" + msg.file + ".mp3"] });
				audio.play();

				break;
		}
	});

	function closePage() {
		$(document.body).fadeOut();

		$.post("https://qb-automat/close");
	}

	$(".close-btn").click(closePage);

	$(window).on("keydown", function ({ originalEvent: { key } }) {
		if (key == "Escape") closePage();
	});

	$.post("https://qb-automat/loaded", function (locales) {
		$("*[data-translate]").each((_, el) => {
			translations = locales;

			if (locales[el.dataset.translate]) el.innerText = translations[el.dataset.translate];
		});
	});
});
