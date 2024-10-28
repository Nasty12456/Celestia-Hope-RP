$(function () {
    var sound = new Audio('sound.mp3');
    sound.volume = 0.8;
    window.addEventListener('message', function (event) {
        if (event.data.action == 'open') {

            TranslateX = localStorage.getItem("MenuPositionX")
            TranslateY = localStorage.getItem("MenuPositionY")
            if (TranslateX > -((screen.width-300)/2)){
            TranslateX = +TranslateX + +50
            }
            else{
                TranslateX = +TranslateX - +50
            }
            Translate = 'translate(' + TranslateX + 'px , ' + TranslateY + 'px)'

            var number = Math.floor((Math.random() * 1000) + 1);

            $('.toast').append(`
            <div class="wrapper-${number}" id="wrapper-${number}">
                <div class="notification_main-${number}">
                    <div class="title-${number}"></div>
                    <div class="text-${number}">
                        ${event.data.message}
                    </div>
                </div>
                <div class="progress-${number}"></div>
            </div>`)

            $(`.wrapper-${number}`).css({
                "margin-bottom": "10px",
                "width": "275px",
                "margin": "0px 0 0 -180px",
                "border-radius": "10px",
                "transform": Translate,
                "opacity": "0",
            })
            $('.notification_main-'+number).addClass('main')
            $('.text-'+number).css({
                "font-size": "14px"
            })
            $(`.progress-${number}`).css({
                "position": "absolute",
                "bottom":"6px",
                "left": "6px",
                "height": "6px",
                "width": "95%",
                "border-radius": "3px",
                "transition": "0.2s",
            })

            var width = 95;
                var id = setInterval(frame, event.data.time/100);
                function frame() {
                    if (width === 0) {
                    clearInterval(id);
                    } 
                    else {
                    width = width - 1; 
                    $(`.progress-${number}`).css("width" , width + '%');
                    }
                }

            if (event.data.type == 'success') {
                $(`.title-${number}`).html(event.data.title).css({
                    "font-size": "16px",
                    "font-weight": "600",
                    "color": "#47cf73",
                })
                $(`.notification_main-${number}`).addClass('success-icon')
                $(`.wrapper-${number}`).addClass('success')
                $(`.progress-${number}`).css({
                    "background": "#47cf73",
                })
                
                if (TranslateY > ((screen.height-480)/2)){
                    $(`.wrapper-${number}`).css({
                        "margin": "0 0"+ -(+((document.getElementById(`wrapper-${number}`).offsetHeight)*2) + +8) +"px -180px",
                    })
                }
                else {
                $(`.wrapper-${number}`).css({
                    "margin": "0 0 8px -180px",
                })
                }

                sound.play();
            } else if (event.data.type == 'info') {
                $(`.title-${number}`).html(event.data.title).css({
                    "font-size": "16px",
                    "font-weight": "600",
                    "color": "#2f83ff",
                })
                $(`.notification_main-${number}`).addClass('info-icon')
                $(`.wrapper-${number}`).addClass('info')
                $(`.progress-${number}`).css({
                    "background": "#2f83ff",
                })
                
                if (TranslateY > ((screen.height-480)/2)){
                    $(`.wrapper-${number}`).css({
                        "margin": "0 0"+ -(+((document.getElementById(`wrapper-${number}`).offsetHeight)*2) + +8) +"px -180px",
                    })
                }
                else {
                $(`.wrapper-${number}`).css({
                    "margin": "0 0 8px -180px",
                })
                }

                sound.play();
            } else if (event.data.type == 'error') {
                $(`.title-${number}`).html(event.data.title).css({
                    "font-size": "16px",
                    "font-weight": "600",
                    "color": "#dc3545",
                })
                $(`.notification_main-${number}`).addClass('error-icon')
                $(`.wrapper-${number}`).addClass('error')
                $(`.progress-${number}`).css({
                    "background": "#dc3545",
                })
                
                if (TranslateY > ((screen.height-480)/2)){
                    $(`.wrapper-${number}`).css({
                        "margin": "0 0"+ -(+((document.getElementById(`wrapper-${number}`).offsetHeight)*2) + +8) +"px -180px",
                    })
                }
                else {
                $(`.wrapper-${number}`).css({
                    "margin": "0 0 8px -180px",
                })
                }
                
                sound.play();
            } else if (event.data.type == 'warning') {
                $(`.title-${number}`).html(event.data.title).css({
                    "font-size": "16px",
                    "font-weight": "600",
                    "color": "#ffc107",
                })
                $(`.notification_main-${number}`).addClass('warning-icon')
                $(`.wrapper-${number}`).addClass('warning')
                $(`.progress-${number}`).css({
                    "background": "#ffc107",
                })
                
                if (TranslateY > ((screen.height-480)/2)){
                    $(`.wrapper-${number}`).css({
                        "margin": "0 0"+ -(+((document.getElementById(`wrapper-${number}`).offsetHeight)*2) + +8) +"px -180px",
                    })
                }
                else {
                $(`.wrapper-${number}`).css({
                    "margin": "0 0 8px -180px",
                })
                }
               
                sound.play();
            }

            if (TranslateX > -((screen.width-300)/2)){
                anime({
                    targets: `.wrapper-${number}`,
                    opacity: 1,
                    translateX: -50,
                    duration: 750,
                    easing: 'spring(1, 80, 10, 0)'
                })
                setTimeout(function () {
                    anime({
                        targets: `.wrapper-${number}`,
                        opacity: 0,
                        translateX: 50,
                        duration: 750,
                        easing: 'spring(1, 80, 10, 0)'
                    })
                    setTimeout(function () {
                        $(`.wrapper-${number}`).remove()
                    }, 750)
                }, event.data.time)
            }
            else{
                anime({
                    targets: `.wrapper-${number}`,
                    opacity: 1,
                    translateX: 50,
                    duration: 750,
                    easing: 'spring(1, 80, 10, 0)'
                })
                setTimeout(function () {
                    anime({
                        targets: `.wrapper-${number}`,
                        opacity: 0,
                        translateX: -50,
                        duration: 750,
                        easing: 'spring(1, 80, 10, 0)'
                    })
                    setTimeout(function () {
                        $(`.wrapper-${number}`).remove()
                    }, 750)
                }, event.data.time)
            }

        }
        else if (event.data.action == 'open2') {

            TranslateX = localStorage.getItem("MenuPositionX")
            TranslateY = localStorage.getItem("MenuPositionY")
            Translate = 'translate(' + TranslateX + 'px , ' + TranslateY + 'px)'

            number = 1;
            window.number = number
            $('.toast').append(`
            <div class="wrapper-${number}" id="wrapper-${number}">
                <div class="notification_main-${number}">
                    <div class="title-${number}"></div>
                    <div class="text-${number}">
                        ${event.data.message}
                    </div>
                </div>
            </div>`)

            $(`.wrapper-${number}`).css({
                "margin-bottom": "10px",
                "width": "275px",
                "margin": "0 0 8px -180px",
                "border-radius": "10px",
                "transform": Translate,
                "opacity": "0",
            })
            $('.notification_main-'+number).addClass('main')
            $('.text-'+number).css({
                "font-size": "14px"
            })

            $(`.title-${number}`).html(event.data.title).css({
                "font-size": "16px",
                "font-weight": "600",
                "color": "#47cf73"
            })
            $(`.notification_main-${number}`).addClass('success-icon')
            $(`.wrapper-${number}`).addClass('success')

            anime({
                targets: `.wrapper-${number}`,
                opacity:  1,
                duration: 2500,
            })

            panel = document.getElementById(`wrapper-${number}`)

            panel.onmousedown = function(e){
                panel.style.cursor = "move"
                panel.style.opacity = "0.6"
                panel.style.transition = " 0s"
                panel.style.transition = "opacity 0.4s"
            
                isDown = true;
            };
            
            document.addEventListener('mouseup', function() {
                isDown = false;

                panel.style.transition = "all 0.7s"
                panel.style.cursor = ""
                panel.style.opacity = "1"
            }, true);
            
            document.addEventListener('mousemove', function(event) {
                event.preventDefault();
                if (isDown) {
                    mousePosition = {
            
                        x : event.clientX,
                        y : event.clientY
            
                    };
                    xCenter = panel.offsetLeft + panel.offsetWidth / 2;
                    yCenter = panel.offsetTop + panel.offsetHeight / 2;

                    TranslateX = mousePosition.x - xCenter
                    TranslateY = mousePosition.y - yCenter
                    Translate = 'translate(' + TranslateX + 'px , ' + TranslateY + 'px)'
                    panel.style.transform  = Translate;

                    localStorage.setItem("MenuPositionX", TranslateX)
                    localStorage.setItem("MenuPositionY", TranslateY)
                }
            }, true);
        }
        else if (event.data.action == 'reset') {
            TranslateX = 0
            TranslateY = 0
            localStorage.setItem("MenuPositionX", TranslateX)
            localStorage.setItem("MenuPositionY", TranslateY)
        }
    })
})

document.onkeyup = function() {
    if (event.key == 'Escape') {
        $.post('https://'+GetParentResourceName()+'/close');
        anime({
            targets: `.wrapper-${number}`,
            opacity: 0,
            duration: 750,
        })
        setTimeout(function () {
            $(`.wrapper-${number}`).remove()
        }, 750)
    }
};

var mousePosition;
var offset = [0,0];
var isDown = false;