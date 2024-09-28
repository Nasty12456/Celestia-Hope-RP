var categoryInput = false
var targetID = undefined
var targetNumber = undefined
var call = false
var currentPage = "base"
var callPage = undefined

var second = 00
var minute = 00


function onCall() {
     if(second == 59) {
          minute++
          second = 0
     }
     else {
          second++
     }
     let fakeMinute = 0
     let fakeSecond = 0
     if(minute.toString().length == 1) {
          fakeMinute = "0"+minute
     }
     else {
          fakeMinute = minute
     }
     if(second.toString().length == 1) {
          fakeSecond = "0"+second
     }
     else {
          fakeSecond = second
     }
     document.getElementById('call-text').innerHTML = fakeMinute+":"+fakeSecond
     if(call) {
          setTimeout(() => onCall(), 1000);
     }
}

$(function() {
    window.addEventListener('message', function(event) {
        var item = event.data
      if (item.type == "updateSettings") {
          if(item.value) {
               document.getElementById(item.settings).style.color = "rgb(31, 161, 221)"
          }
          else {
               document.getElementById(item.settings).style.color = "rgb(147, 151, 151)"
          }
      }
      if (item.type == "updateHealth") {
          document.getElementById('healt-can').innerHTML = item.health
          document.getElementById('hunher2').innerHTML = parseInt(item.hungry)
          document.getElementById('thirste2').innerHTML = parseInt(item.thirst)
      }
      if (item.type == "addFriend") {
          div = `<div id="friends_`+item.number+`" class="contact-friends">
          <div onclick="callFriend('`+item.number+`')" class="contact-friends-user">
              <i class="fa-solid fa-circle-user"></i>
          </div>
          <p onclick="callFriend('`+item.number+`')" class="contact-friends-name">`+item.name+`</p>
          <i onclick="sms('`+item.number+`', '`+item.name+`')" class="fa-solid fa-comment-sms contact-friends-friendLogos"></i>
          <i onclick="removeFriend('`+item.number+`')" class="fa-solid fa-trash contact-friends-friendLogos"></i>
      </div>`
          $("#contact-friend-side").append(div)
      }
      if (item.type == "clearFriends") {
          document.querySelectorAll(".contact-friends").forEach(function(a){a.remove()})
      }
      if (item.type == "clearMessageList") {
          document.querySelectorAll(".message-1").forEach(function(a){a.remove()})
      }
      if (item.type == "addLastcall") {
          var date = new Date(item.date);
          var hours = date.getHours().toString().replace(/^(\d)$/, '0$1');

          let accounttime = formatTime(date.getHours())+":"+formatTime(date.getSeconds())
          if(item.status) {
               icon = 'green'
          }
          else {
               icon = 'red'
          }
          div = `<div class="users">
          <div class="users-`+icon+`"></div>
          <i class="fa-solid fa-phone users-phone"></i>
          <p class="users-name">`+item.name+`</p>
          <p class="users-time">`+accounttime+`</p>
      </div>`
          $("#contacts-side").append(div)

      }
      if (item.type == "onCall") {
          call = true
          document.getElementById('contacts-all').style.display = "block"
          document.getElementById('call-keyboard').style.display = "none"
          document.getElementById('contacts-all').style.display = "none"
          document.getElementById('call-screen').style.display = "block"
          document.getElementById('oncall-icons').style.display = "block"
          document.getElementById('call-icons').style.display = "none"
          setTimeout(() => document.getElementById("call-screen").style.transform = "scale(1)", 50);
          document.getElementById('call-name').innerHTML = item.name
          document.getElementById('call-text').innerHTML = "CALLING..."
          targetID = item.id
          sound("calling", true)
     }
     if (item.type == "closeCall") {
          cancelCall()
     }
     if (item.type == "closeCallFly") {
          call = true
          document.getElementById('call-text').innerHTML = "BUSY..."
          sound("busy")
          setTimeout(() => document.getElementById("call-screen").style.transform = "scale(1)", 50);
          document.getElementById('call-keyboard').style.display = "none"
          document.getElementById('contacts-all').style.display = "none"
          document.getElementById('call-screen').style.display = "block"
          document.getElementById('oncall-icons').style.display = "block"
          document.getElementById('call-icons').style.display = "none"
          setTimeout(() => cancelCall(), 3000);
          document.getElementById('call-name').innerHTML = item.name
          targetID = item.id
     }
     if (item.type == "closeCallNot") {
          call = true
          document.getElementById('call-text').innerHTML = "NOT AVAILABLE..."
          sound("busy")
          setTimeout(() => document.getElementById("call-screen").style.transform = "scale(1)", 50);
          document.getElementById('call-keyboard').style.display = "none"
          document.getElementById('call-screen').style.display = "block"
          document.getElementById('contacts-all').style.display = "none"
          document.getElementById('oncall-icons').style.display = "block"
          document.getElementById('call-icons').style.display = "none"
          setTimeout(() => cancelCall(), 3000);
          document.getElementById('call-name').innerHTML = $("#call-keyboard-value").text()
          document.getElementById('call-name').innerHTML = item.name
          targetID = item.id
     }
     if (item.type == "openMessage") {
          document.getElementById('contacts-all').style.display = "none"
          document.getElementById('message-side').style.display = "block"
          document.getElementById('messageSend-area').style.display = "block"
          setTimeout(() => document.getElementById("message-side").style.transform = "scale(1)", 50);
          document.getElementById('messageList-area').style.display = "none"
          document.getElementById('name-up-icon').innerHTML = item.name
          document.getElementById('message-text-add').scrollTop = "1000252500";
          targetNumber = item.number
          currentPage = "message"
     }
     if (item.type == "addMessage") {
          if(item.status) {
               div = `<div class="message-you message-box">
               `+item.message+`
           </div> `          }
          else {
               div = `<div class="message-target message-box">
               `+item.message+`
           </div> `
          }
          $("#message-text-add").append(div)
     }
     if (item.type == "addMessageList") {
          div = `<div onclick="sms('`+item.number+`', '`+item.name+`')" class="message-1">
          <i class="fa-solid fa-circle-user"></i>
          <p class="message-name">`+item.name+`</p>
          <p class="messsage-hello">`+item.message+`</p>
          <p class="message-time">`+item.time+`</p>
      </div>`
      $("#message-all").append(div)
     }
     if (item.type == "startCall") {
          exit()
          document.getElementById('apps').style.display = "none"
          document.getElementById('watchBackground').style.display = "none"
          document.getElementById('clock-side').style.display = "none"
          document.getElementById('call-keyboard').style.display = "none"
          document.getElementById('call-screen').style.display = "block"
          document.getElementById('oncall-icons').style.display = "none"
          document.getElementById('call-icons').style.display = "block"
          setTimeout(() => document.getElementById("call-screen").style.transform = "scale(1)", 50);
          document.getElementById('call-name').innerHTML = item.name
          document.getElementById('call-text').innerHTML = "INCOMING CALL"
          targetID = item.id
          sound("ringtone", true)
          call = true    
     }
     if (item.type == "openCall") {
          if(snd) {
               snd.pause()
          }
          document.getElementById('oncall-icons').style.display = "block"
          document.getElementById('call-icons').style.display = "none"
          second = 00
          minute = 00
          call = true
          onCall()
     }
     if (item.type == "open") {
          document.getElementById('qb-applewatch').style.display = "block"
          setTimeout(() => document.getElementById("qb-applewatch").style.top = "20%", 50);
          document.getElementById('watch-one').src = "images/general/watch-"+item.color+".png"
     }
     if (item.type == "addMessageOnline") {
          sound("notify")
          div = `<div class="message-you message-box">
          `+item.message+`
          </div>`
          $("#message-text-add").append(div)
          document.getElementById('message-text-add').scrollTop = "1000252500";
     }
     if (item.type == "clearLastcall") {
          document.querySelectorAll(".users").forEach(function(a){a.remove()})
     }
     if (item.type == "updateNumber") {
          document.getElementById('settings-value').innerHTML = item.number
     }
  })
})



function tiktak() {
    let second = new Date().getSeconds();
    let minute = new Date().getMinutes();
    let hour = new Date().getHours();

    document.getElementById("second").style.transform = `rotate(${180 + (second * 6)}deg)`
    document.getElementById("minute").style.transform = `rotate(${180 + (minute * 6)}deg)`
    document.getElementById("hour").style.transform = `rotate(${180 + (hour * 30)}deg)`
}

setInterval(tiktak, 1000);


var firstnumber = 0
var firstvalue = 0
var subtract = false
var add = false
var divide = false
var multiply = false
var newnumber = 0

function calculatorvalue(value) {
   if(value == "0") { 
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 0
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 0
        }
   }
   if(value == "1") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 1
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 1
        }
   }
   if(value == "2") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 2
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 2
        }
   }
   if(value == "3") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 3
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 3
        }
   }
   if(value == "4") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 4
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 4
        }
   }
   if(value == "5") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 5
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 5
        }
   }
   if(value == "6") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 6
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == '0') {
             document.getElementById('calcutor-value').innerHTML = 6
        }
   }
   if(value == "7") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 7
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == 0) {
             document.getElementById('calcutor-value').innerHTML = 7
        }
   }
   if(value == "8") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 8
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == 0) {
             document.getElementById('calcutor-value').innerHTML = 8
        }
   }
   if(value == "9") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + 9
        newnumber_tostring = newnumber.toString()
        newnumber_tostring_lenght = newnumber.toString().length

        if (newnumber_tostring_lenght > 8) {
             newnumber = firstvalue
        } 

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == 0) {
             document.getElementById('calcutor-value').innerHTML = 9
        }
   }
   if(value == "AC") {
        add = false
        subtract = false
        divide = false
        multiply = false
        newnumber = 0
        firstvalue = 0
        document.getElementById('calcutor-value').innerHTML = 0
   }
   if(value == "+/-") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = -firstvalue

        document.getElementById('calcutor-value').innerHTML = newnumber
        if (firstvalue == 0) {
             document.getElementById('calcutor-value').innerHTML = 0
        }
   }
   if(value == "point") {
        firstvalue = document.getElementById('calcutor-value').innerHTML
        newnumber = firstvalue + '.'

        document.getElementById('calcutor-value').innerHTML = newnumber
   }
   if(value == "+") {
        firstnumber = document.getElementById('calcutor-value').innerHTML

        document.getElementById('calcutor-value').innerHTML = ''
        add = true
   }
   if(value == "-") {
        firstnumber = document.getElementById('calcutor-value').innerHTML

        document.getElementById('calcutor-value').innerHTML = ''
        subtract = true
   }
   if(value == "/") {
        firstnumber = document.getElementById('calcutor-value').innerHTML

        document.getElementById('calcutor-value').innerHTML = ''
        divide = true
   }
   if(value == "*") {
        firstnumber = document.getElementById('calcutor-value').innerHTML

        document.getElementById('calcutor-value').innerHTML = ''
        multiply = true
   }
   if(value == "%") {
        firstnumber = document.getElementById('calcutor-value').innerHTML
        firstnumber = Number(firstnumber)

        document.getElementById('calcutor-value').innerHTML = eval(firstnumber * 0.01)
   }
   if(value == "=") { 
        secondnumber = document.getElementById('calcutor-value').innerHTML
        firstnumber = Number(firstnumber)
        secondnumber = Number(secondnumber)

        if (add == true) {
             document.getElementById('calcutor-value').innerHTML = eval(firstnumber + secondnumber)
        }
        if (subtract == true) {
             document.getElementById('calcutor-value').innerHTML = eval(firstnumber - secondnumber)
        }
        if (divide == true) {
             document.getElementById('calcutor-value').innerHTML = eval(firstnumber / secondnumber)
        }
        if (multiply == true) {
             document.getElementById('calcutor-value').innerHTML = eval(firstnumber * secondnumber)
        }
        add = false
        subtract = false
        divide = false
        multiply = false
   } 
}

function selectApp(app) {
     currentPage = "main"
     document.getElementById('apps').style.display = "none"
     document.getElementById('watchBackground').style.display = "none"
     if(app != "clock") {
          document.getElementById('clock-side').style.display = "none"
     }
     document.getElementById(app).style.display = "block"
     setTimeout(() => document.getElementById(app).style.transform = "scale(1)", 50);

     if(app == "contacts-all") {
          changePage('contacts-side')
     }  
     else if(app == "gameArea") { 
          div = `<iframe class="gamesGG" style="position:absolute;width: 100%; height: 100%; top:0;z-index: 522;" src="https://wilds.io/"></iframe>`
          $("#gameArea").append(div)
     }
}

function changePage(page) {
     document.querySelectorAll(".contacts-pages").forEach(function(a){a.style.display = "none"})
     document.querySelectorAll(".contacts-logos").forEach(function(a){a.style.color = "gray"})
     document.getElementById(page).style.transform = "scale(0.6)"

     document.getElementById(page).style.display = "block"
     setTimeout(() => document.getElementById(page).style.transform = "scale(1)", 50);
     document.getElementById("logo-"+page).style.color = "rgb(31, 161, 221)"
}

var lastNumber = ""

function phoneAdd(Number) {
     lastNumber = lastNumber+Number
     document.getElementById('call-keyboard-value').innerHTML = lastNumber
}

function clearPhone() {
     lastNumber = ""
     document.getElementById('call-keyboard-value').innerHTML = ""
}

function setSettings(settings) {
     $.post('http://qb-applewatch/saveSettings', JSON.stringify({
          settings: settings
     }));
}

function closeCall() {
     $.post('http://qb-applewatch/closeCall', JSON.stringify({
          number: targetID,
     }));
     targetID = undefined
}

function callFriend(number) {
     callPage = "call"
     $.post('http://qb-applewatch/sendCall', JSON.stringify({
          number: number,
     }));
}

function sendCall() {
     let number = $("#call-keyboard-value").text()

     if(number != "") {
          $.post('http://qb-applewatch/sendCall', JSON.stringify({
               number: number,
          }));
     }
     else {
          sound("wrong")
     }
}

function addFriend() {
     let name = $("#name").val()
     let lastname = $("#lastname").val()
     let number = $("#number").val()

     if(name && lastname && number) {
          $.post('http://qb-applewatch/addFriend', JSON.stringify({
               name: name,
               lastname: lastname,
               number: number
          }));
          $("#name").val("")
          $("#lastname").val("")
          $("#number").val("")
          sound("effect")
     }
     else {
          sound("wrong")
     }

}

function sound(a, loop) {
     snd = new Audio("sounds/"+a+".wav"); // buffers automatically when created
     snd.volume = "0.4"
     snd.play();
     if(loop) {
          snd.loop = true
     }
 }
 

$(document).ready(function () {
$("#searchInput").on("keyup", function () {
     var value = $(this).val().toLowerCase();
     $(".contact-friends").filter(function () {
     $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
     });
});
});

function exit() {
     if(!call) {
          if(currentPage == "main") {
               currentPage = "base"
               document.querySelectorAll(".app-pages").forEach(function(a){a.style.display = "none"})
               document.getElementById('apps').style.display = "block"
               document.getElementById('watchBackground').style.display = "block"
               document.getElementById('clock-side').style.display = "block"
               document.querySelectorAll(".app-pages").forEach(function(a){a.style.transform = "scale(0.6)"})
          }
          else if(currentPage == "message") {
               currentPage = "main"
               document.getElementById('messageSend-area').style.display = "none"
               document.getElementById('messageList-area').style.display = "block"
               document.querySelectorAll(".message-box").forEach(function(a){a.remove()})
               document.querySelectorAll(".gamesGG").forEach(function(a){a.remove()})
          }
          else{
               $.post('http://qb-applewatch/exit', JSON.stringify({}));
               document.getElementById("qb-applewatch").style.top = "100%"
               setTimeout(() => document.getElementById("qb-applewatch").style.display = "none", 1100);
          }
     }
}

function cancelCall() {
     if(call) {
          call = false
          snd.pause()
          document.getElementById('call-screen').style.display = "none"
          document.getElementById("call-screen").style.transform = "scale(0.6)"
          currentPage = "main"
          exit()
          // if(callPage == "call") {
          //      document.getElementById('contacts-all').style.display = "block"
          //      callPage = undefined
          // }
          // else {
          //      document.getElementById('call-keyboard').style.display = "block"
          // }
     }
}

window.addEventListener("keyup", (event) => {
     event.preventDefault();
     if (event.key == "Escape") {
       exit()
     }
 })

function sms(number, name) {
     document.querySelectorAll(".message-box").forEach(function(a){a.remove()})
     $.post('http://qb-applewatch/loadSMS', JSON.stringify({
          number: number,
          name: name
     }));
}
 
function sendMessage() {
     let message = $("#messageInput").val()
     var date = new Date();
     let accounttime = formatTime(date.getHours())+":"+formatTime(date.getSeconds())

     if (message) {
          sound("effect")
          $.post('http://qb-applewatch/sendMessage', JSON.stringify({
               number: targetNumber,
               message: message,
               time: accounttime
          }));
          $("#messageInput").val("")
          div = `<div class="message-target message-box">
          `+message+`
          </div>`
          $("#message-text-add").append(div)
          document.getElementById('message-text-add').scrollTop = "1000252500";
     }
     else {
          sound("wrong")
     }
}


function removeFriend(number) {
     document.getElementById('friends_'+number).remove()
     $.post('http://qb-applewatch/removeFriend', JSON.stringify({
          number: number
     }));
     sound("effect")
}

function openCall() {
     $.post('http://qb-applewatch/openCall', JSON.stringify({
          number: targetID,
     }));
}


function formatTime(time) {
     return time.toString().replace(/^(\d)$/, '0$1');
}