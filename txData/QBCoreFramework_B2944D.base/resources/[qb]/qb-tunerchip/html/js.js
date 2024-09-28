
$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.action == "openChip") {
      $("body").css("display", "flex");
    }
  });
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27: // ESC
      close();
  }
});

function OpenMenu(g) {
  const blueGradient =
    "radial-gradient(298.91% 335.29% at 50.36% -235.29%,#0085ff 0%,rgba(0, 133, 255, 0) 100%)";
  const whiteTransparency = "rgba(255, 255, 255, 0.49)";
  const blackTransparency = "rgba(0, 0, 0, 0.81)";

  if (g === "CarMode") {
    $.post("https://qb-tunerchip/Sound");
    $(".CustomBottomArea, .lightBottomArea").css("display", "none");
    $(".BottomArea").css("display", "flex");
    $("#carmode").css({ background: "#0085ff", color: blackTransparency });
    $("#light").css({ color: whiteTransparency, background: blueGradient });
    $("#details").css({ color: whiteTransparency, background: blueGradient });
  } else if (g === "Light") {
    $.post("https://qb-tunerchip/Sound");
    $(".CustomBottomArea").css("display", "none");
    $(".lightBottomArea").css("display", "flex");
    $(".BottomArea").css("display", "none");
    $("#light").css({ background: "#0085ff", color: blackTransparency });
    $("#carmode").css({ color: whiteTransparency, background: blueGradient });
    $("#details").css({ color: whiteTransparency, background: blueGradient });
  } else if (g === "Restart") {
    $.post("https://qb-tunerchip/Restart");
  } else if (g === "Details") {
    $.post("https://qb-tunerchip/Sound");
    $(".CustomBottomArea").css("display", "flex");
    $(".lightBottomArea, .BottomArea").css("display", "none");
    $("#details").css({ background: "#0085ff", color: blackTransparency });
    $("#carmode, #light").css({
      color: whiteTransparency,
      background: blueGradient,
    });
  } else if (g === "Comfort" || g === "Drift" || g === "Sport") {
    $.post("https://qb-tunerchip/Mode", JSON.stringify({ i: g }));
  } else if (g === "Close") {
    close();
  }
}

function close() {
  $("body").css("display", "none");
  $.post("https://qb-tunerchip/close");
}

function ChangeColor(type, color) {
  const colorObj = { type, color };
  if (type == "Neon") {
    $.post(
      "https://qb-tunerchip/ChangeNeon",
      JSON.stringify({ neon: color })
    );
  } else {
    $.post("https://qb-tunerchip/ChangeColor", JSON.stringify(colorObj));
  }
}
function ChangeLightColor(t, c) {
  if (t == "Neon") {
    $.post(
      "https://qb-tunerchip/ChangeLightColor",
      JSON.stringify({ color: c })
    );
  }
}

function renkSecildi() {
  const renkSecici = document.getElementById("renkSecici");
  const secilenRenk = renkSecici.value;

  const r = parseInt(secilenRenk.substring(1, 3), 16);
  const g = parseInt(secilenRenk.substring(3, 5), 16);
  const b = parseInt(secilenRenk.substring(5, 7), 16);
  $.post(
    "https://qb-tunerchip/ChangeLightColorrgb",
    JSON.stringify({ r: r, g: g, b: b })
  );
}

function DetailSettings(i) {
  const detailOptions = [
    "boost",
    "acceleration",
    "gear",
    "breaking",
    "drivetrain",
  ];
  const detailLevels = ["l", "m", "h", "v", "e"];

  for (const option of detailOptions) {
    for (const level of detailLevels) {
      const button = $(`#${option}-${level}`);
      if (i === `${option}-${level}`) {
        DetailButtonReset(option);
        button.css("background", "#0094ff");
        button.css("color", "#000000");
        $.post(
          "https://qb-tunerchip/DetailChange",
          JSON.stringify({ i: i })
        );
      }
    }
  }
}

function DetailButtonReset(option) {
  const detailLevels = ["l", "m", "h", "v", "e"];

  for (const level of detailLevels) {
    const button = $(`#${option}-${level}`);
    button.css("background", "");
    button.css("color", "");
  }
}

function DetailButtonReset(i) {
  $("." + i).removeAttr("style");
}
