ChoosedButton = 0
InSubMenu = false
SignalRotation = 0
ChangingText = false

window.addEventListener('message', function(event) {
    let data = event.data

    if (data.action === "OpenGangJobMenu"){
      InteractionsTable = data.interactionstable
      CreateJobMenu()
    }
    else if (data.action === "ChangeFocus"){
      ChangeFocus(data.type)
    }
    else if (data.action === "ChooseBTN"){
      Close()
      document.getElementById("circle_"+ChoosedButton).click()
    }
    else if (data.action === "BlackFade"){
      if (data.value){
        show('black_fade')
      }
      else{
        hide('black_fade')
      }
    }
    else if (data.action === "Hostage"){
      $(".hostage").css("display", "block")
      $(".hostage").css("animation", "hostage_anim 0.8s ease-in-out both")
    }
    else if (data.action === "HideHostage"){
      $(".hostage").css("animation", "hostage_anim_reverse 0.8s ease-in-out both")
      setTimeout(() => {
        $(".hostage").css("display", "none")
      }, 500);
    }
    else if (data.action === "close"){
      $(".circles_label").css("animation", "")
      Close()
    }
})

document.onkeydown = function(data) {
  if (event.key == 'Escape') {
    Close()
  }
}

function Close(){
  HideJobMenu()
  $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"close"}))
}

/////////////////////////////////////////////////////////////////////      |  _ \  __ )        \  |  ____|  \  | |   | \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/////////////////////////////////////////////////////////////////////      | |   | __ \       |\/ |  __|     \ | |   | \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/////////////////////////////////////////////////////////////////////  \   | |   | |   |      |   |  |     |\  | |   | \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
///////////////////////////////////////////////////////////////////// \___/ \___/ ____/      _|  _| _____|_| \_|\___/  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

function ChangeFocus(direction){
  if(direction === "up"){
    SignalRotation = SignalRotation-MenuBTNRot
    if(InSubMenu === false){
      if(InteractionsTable.length >= ChoosedButton +2){
        ChoosedButton++
      }
      else if(InteractionsTable.length === ChoosedButton +1){
        ChoosedButton = 0
      }
    }
    else{
      if(InteractionsTable[SubNumber].table.length > ChoosedButton + 1){
        ChoosedButton++
      }
      else if(InteractionsTable[SubNumber].table.length === ChoosedButton +1){
        ChoosedButton = 0
      }
    }
  }
  else{
    SignalRotation = SignalRotation+MenuBTNRot
    if(InSubMenu === false){
      if(ChoosedButton === 0){
        ChoosedButton = InteractionsTable.length -1
      }
      else{
        ChoosedButton = ChoosedButton -1
      }
    }
    else{
      if(ChoosedButton === 0){
        ChoosedButton = InteractionsTable[SubNumber].table.length -1
      }
      else{
        ChoosedButton = ChoosedButton -1
      }
    }
  }

  if(InSubMenu){
    for(let i=0; i<InteractionsTable[SubNumber].table.length; i++){
      document.getElementById("circle_"+i).classList.remove("hovered_circle")
    }
    Circle_Label = InteractionsTable[SubNumber].table[ChoosedButton].label
  }
  else{
    for(let i=0; i<InteractionsTable.length; i++){
      document.getElementById("circle_"+i).classList.remove("hovered_circle")
    }
    Circle_Label = InteractionsTable[ChoosedButton].label
    Circle_Description = InteractionsTable[ChoosedButton].description
  }

  $(".rotating_con").css("transform", "translate(-50%, -50%) rotate("+SignalRotation+"deg)")
  document.getElementById("circle_"+ChoosedButton).classList.add("hovered_circle")

  $(".circles_label").css("display", "none")
  $(".circles_label").css("animation", "text_anim 0.3s ease-in-out")
  setTimeout(() => {
    $(".circles_label").css("display", "block")
  }, 8);
  
  if (!ChangingText){
    setTimeout(() => {
      ChangingText = false
      $(".circles_label").html(Circle_Label)
    }, 150);
  }
  else{
    $(".circles_label").html('')
  }
  ChangingText = true
  $(".circles_description").html(Circle_Description)
}

function CreateJobMenu(){
  InSubMenu = false
  let Num_elements = InteractionsTable.length
  let Angle = 360/(Num_elements)
  let Rot = -90
  MenuBTNRot = []
  ChoosedButton = 0
  MenuBTNRot = Angle

  show('plugin')
  setTimeout(() => {
    $(".job_menu").css("animation", "none")
    $(".job_menu").css("display","block")
  }, 150);

  $(".circle_container").html("")
  for(let i=0; i<Num_elements; i++){
    $(".circle_container").append(`
    <button class="circle_element" id="circle_${i}" onclick="SendBackIntButton(id, false)">${InteractionsTable[i].icon}
    <div class="bg_color"></div>
    </button>
    `)

    $(".job_menu #circle_"+i).css("transform", "rotate("+Rot+"deg) translate(120px) rotate("+Rot*(-1)+"deg)")
    $(".job_menu #circle_"+i).css("animation", "circle_element 0.5s ease "+i*0.05+"s both")
    Rot = Rot - Angle
  }


  document.getElementById("circle_"+ChoosedButton).classList.add("hovered_circle")
  $(".circles_label").html(InteractionsTable[0].label)
  $(".circles_description").html(InteractionsTable[0].description)
  SignalRotation = 0
  $(".rotating_con").css("transform", "translate(-50%, -50%) rotate("+SignalRotation+"deg)")

}

function HideJobMenu(){
  $(".job_menu").css("animation", "ScaleDown 0.4s ease-in-out both")
  hide('plugin')
  setTimeout(function(){
    $(".job_menu").css("display","none")
  },250)
}

function SendBackIntButton(id, value){
  let idnumber = id.split('_').pop()
  
  if (value == true){
    for(let i=0; i<InteractionsTable[SubNumber].table.length; i++){
      if (i == idnumber){
        $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"JobMenu", id:InteractionsTable[SubNumber].table[i].id}))
        break
      }
    }
  }
  else{
    for(let i=0; i<InteractionsTable.length; i++){
      if (i == idnumber){
        HideJobMenu()
        $.post('https://'+GetParentResourceName()+'/UseButton', JSON.stringify({action:"JobMenu", id:InteractionsTable[i].id}))
        break
      }
    }
  }
}


/////////////////////////////////////////////////////////////// BASIC FUNCTIONS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

function show(element){
  $("#"+element).css("display","block")
  document.getElementById(element).style.animation = "showmenu 0.35s ease both";
}

function hide(element){
  document.getElementById(element).style.animation = "hidemenu 0.3s ease";
  setTimeout(function(){
    $("#"+element).css("display","none")
  }, 300)
}

function isNumber(evt) {
  evt = (evt) ? evt : window.event
  var charCode = (evt.which) ? evt.which : evt.keyCode
  if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      return false
  }
  return true
}

function setlenght(id) {
  if (document.getElementById(id).value.length === 2 && document.getElementById(id).value[0] == 0){
    document.getElementById(id).value = document.getElementById(id).value.substring(1)
  }
  if (document.getElementById(id).value.length === 4){
    document.getElementById(id).value = document.getElementById(id).value.substring(1)
  }
  if (document.getElementById(id).value.length === 0){
    document.getElementById(id).value = 0
  }
  changemoney()
  return true
}

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;

  elmnt.onmousedown = dragMouseDown;

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();

    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();

    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;

    elmnt.style.opacity = "0.8"

    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    elmnt.style.opacity = "1"
    document.onmouseup = null;
    document.onmousemove = null;
  }
}

function elementsOverlap(el1, el2) {
  const domRect1 = el1.getBoundingClientRect();
  const domRect2 = el2.getBoundingClientRect();

  return !(
    domRect1.top+50 > domRect2.bottom ||
    domRect1.right-50 < domRect2.left ||
    domRect1.bottom-50 < domRect2.top ||
    domRect1.left+50 > domRect2.right
  );
}

function GetTime(createdtime){
  let time = Math.round(Date.now() / (1000 * 60)) - createdtime
  return time
}

function fancyTimeFormat(duration)
{   
    var hrs = ~~(duration / 3600);
    var mins = ~~((duration % 3600) / 60);
    var secs = ~~duration % 60;

    var ret = "";

    if (hrs > 0) {
        ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
    }

    ret += "" + mins + ":" + (secs < 10 ? "0" : "");
    ret += "" + secs;
    return ret;
}
