
window.addEventListener('message', function(event) {
  let data = event.data

  if (data.action === "open") {
    $("h1").html(data.text)
    $("h1").css("top", "10%")
    $(".bg").css("top", "0%")
    setTimeout(function(){
      $("h1").css("top", "-50%")
      $(".bg").css("top", "-50%")
    }, 7000)
  }
})

document.onkeyup = function() {
if (event.key == 'Escape') {
  Close()
}
}

function Close(){
$.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
}

function show(element){
$(element).css("display", "block");
setTimeout(function(){
    $(element).css("opacity", "1");
}, 10);
}

function hide(element){
$(element).css("opacity", "0");
setTimeout(function(){
  $(element).css("display", "none");
}, 400);
}
