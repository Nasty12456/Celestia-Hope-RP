var fullscreenStatus = false
function fullscreen() {
     if(!fullscreenStatus) {
          $('.cube').addClass('fullscreen')
          $('.fullscreenIcon').addClass('fullIcon')
          fullscreenStatus = true
     }
     else {
          $('.cube').removeClass('fullscreen')
          $('.fullscreenIcon').removeClass('fullIcon')
          fullscreenStatus = false
     }
}

$(function() {
     window.addEventListener('message', function(event) {
         var item = event.data
          if(item.type == "open") {
               $('body').show()
          }
     })
})

window.addEventListener("keyup", (event) => {
     event.preventDefault();
     if (event.key == "Escape") {
           exit()
     }
})

function exit() {
     $('body').hide()
     $.post('http://qb-rubikcube/exit', JSON.stringify({}));
}