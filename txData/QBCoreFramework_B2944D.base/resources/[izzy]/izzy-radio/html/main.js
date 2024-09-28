var createPageValue = false
var currentFrenq = undefined
var inRadio = false

function changePage(page) {
    $('.pages').hide()
    $('.page-'+page).show()

    $('.buttons').removeClass('active')
    $('.button-'+page).addClass('active')

    $('.radio-channel-text').text('Radio Channel;')
    $('.radio-channel-input-box').removeClass('active')
    $('.bluetooth-icon').removeClass('active')
    if(!inRadio) {
        $('.radio-input').val('00.0')
        currentFrenq = undefined
    }
    $('.radio-input').attr('placeholder', '00.0')
    password = false
}

var memberListValue = true

function memberListSmall() {
    if(memberListValue) {
        $('.menu-container').removeClass('active')
        memberListValue = false
    }
    else {
        memberListValue = true
        $('.menu-container').addClass('active')
    }
}

function back() {
    if(password) {
        currentFrenq = undefined

        $('.radio-channel-text').text('Radio Channel;')
        $('.radio-channel-input-box').removeClass('active')
        $('.bluetooth-icon').removeClass('active')
        $('.radio-input').val('00.0')
        $('.radio-input').attr('placeholder', '00.0')
        password = false
    }
}

function refreshListColor() {
    $(".member-item").each(function(index) {
        if (index % 2 === 0) {
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });
}

function createPage() {
    if(!createPageValue) {
        $('.channel-list-item-container').hide()
        $('.create-channel').show()

        createPageValue = true
    }
    else {
        $('.create-channel').hide()
        $('.channel-list-item-container').show()
        
        createPageValue = false
    }
}

function quickConnect(frequency) {    
    if(!inRadio) {
        changePage('main')
        $('.radio-input').val(frequency)
        connect()
    }
}

function createChannel() {
    let frequency = $('.radio-input-2').val()
    let password = $('.channel-password-inp').val()
    
    if(parseInt(frequency)) {
        $.post(`https://${GetParentResourceName()}/createChannel`, JSON.stringify({
            frequency: frequency,
            password: password
        }), function(response) {
            if (response){
                createPage()
                changePage('main')
                
                currentFrenq = frequency

                $('.radio-input-2').val("")
                $('.channel-password-inp').val("")

                $('.connect-btn').hide()
                $('.disconnect-btn').css('display', 'flex')
                $('.text-mhz').text(currentFrenq+'Mhz')

                $('.menu-container').show()

                $('.radio-input').val(frequency)
                $(".radio-input").prop("disabled", true);

                inRadio = true

                $('.kablo-icon').addClass('active')
            }
        });
    }
}

$(function() {
    window.addEventListener('message', function(event) {
        var item = event.data
        if(item.action == "reset") {
            resetPosition()
        }
        if(item.action == "open") {
            $('.telsiz-main-container').show()

            setTimeout(function(){
                $('.telsiz-main-container').css('bottom', '1vh')
            }, 100);
        }
        if(item.action == "forceKick") {
            disconnect()
        }
        if(item.action == "resetMembers") {
            $('.member-item').remove()
            $('.mic-item').remove()
        }
        if(item.action == "talking") {
            if(item.value) {
                $('.players_'+item.id).addClass('active')
            }
            else {
                $('.players_'+item.id).removeClass('active')
            }
        }
        if(item.action == "updateMemberCount") {
            $('.member-list-num').text(item.value)

            refreshListColor()
        }
        if(item.action == "addMember") {
            // console.log(item.data.id, item.data.name)
            let div = `<div class="member-item players_`+item.data.id+`">
            <img class="menu-anten-icon" src="public/menu-anten-icon.svg">
            <p class="member-item-text">`+item.data.name+`</p>
            <svg class="menu-mic-icon" width="17" height="17" viewBox="0 0 17 17" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path class="menu-mic-icon"
                    d="M8.49984 9.91675C7.90956 9.91675 7.40782 9.71015 6.99463 9.29696C6.58143 8.88376 6.37484 8.38203 6.37484 7.79175V3.54175C6.37484 2.95147 6.58143 2.44973 6.99463 2.03654C7.40782 1.62335 7.90956 1.41675 8.49984 1.41675C9.09012 1.41675 9.59185 1.62335 10.005 2.03654C10.4182 2.44973 10.6248 2.95147 10.6248 3.54175V7.79175C10.6248 8.38203 10.4182 8.88376 10.005 9.29696C9.59185 9.71015 9.09012 9.91675 8.49984 9.91675ZM7.7915 14.8751V12.697C6.56373 12.5317 5.54845 11.9827 4.74567 11.0501C3.94289 10.1174 3.5415 9.03133 3.5415 7.79175H4.95817C4.95817 8.77161 5.3036 9.60697 5.99446 10.2978C6.68532 10.9887 7.52045 11.3339 8.49984 11.3334C9.47923 11.3329 10.3146 10.9875 11.0059 10.2971C11.6973 9.60673 12.0424 8.77161 12.0415 7.79175H13.4582C13.4582 9.03133 13.0568 10.1174 12.254 11.0501C11.4512 11.9827 10.4359 12.5317 9.20817 12.697V14.8751H7.7915Z"
                    fill="white" fill-opacity="0.61" />
            </svg>
            </div>`
            $('.member-items-container').append(div)

            div = `<div class="mic-item players_`+item.data.id+`">
            <p class="mic-item-name">`+item.data.name+`</p>
            <svg class="green-mic-item" width="25" height="25" viewBox="0 0 25 25" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path class="green-mic-item"
                    d="M0 0H22C23.6569 0 25 1.34315 25 3V22C25 23.6569 23.6569 25 22 25H0V0Z"
                    fill="#B2FFB0" fill-opacity="0.04" />
                <path class="green-mic-item-path-2"
                    d="M12.5002 7.4585C12.8011 7.4585 13.0991 7.51777 13.3772 7.63294C13.6552 7.74811 13.9078 7.91691 14.1206 8.12971C14.3334 8.34251 14.5022 8.59514 14.6174 8.87318C14.7326 9.15122 14.7918 9.44922 14.7918 9.75016V11.5835C14.7918 12.1913 14.5504 12.7742 14.1206 13.2039C13.6909 13.6337 13.108 13.8752 12.5002 13.8752C11.8924 13.8752 11.3095 13.6337 10.8797 13.2039C10.45 12.7742 10.2085 12.1913 10.2085 11.5835V9.75016C10.2085 9.14238 10.45 8.55948 10.8797 8.12971C11.3095 7.69994 11.8924 7.4585 12.5002 7.4585ZM8.40039 12.0418H9.32393C9.43498 12.8049 9.81704 13.5024 10.4002 14.0068C10.9834 14.5113 11.7287 14.7889 12.4997 14.7889C13.2708 14.7889 14.0161 14.5113 14.5992 14.0068C15.1824 13.5024 15.5645 12.8049 15.6755 12.0418H16.5995C16.4953 12.9717 16.0782 13.8385 15.4167 14.5001C14.7551 15.1618 13.8883 15.579 12.9585 15.6833V17.5418H12.0418V15.6833C11.112 15.5791 10.2451 15.1619 9.58343 14.5002C8.92178 13.8386 8.50462 12.9717 8.40039 12.0418Z"
                    fill="#B2FFB0" fill-opacity="0.21" />
            </svg>
            </div>`
            $('.mic-items-container').append(div)

        }
        if(item.action == "updateFavorite") {
            if(item.isFavorite) {
                $('.star-icon').addClass('active')
            }
            else {
                $('.star-icon').removeClass('active')
            }
        }
        if(item.action == "resetRefresh") {
            $('.channel-list-item').remove()
        }
        if(item.action == "addFavorite") {
            let div = `<div class="channel-list-item">
            <p class="mhz-text">`+item.name+`Mhz</p>
            <img onclick="quickFavorite('`+item.name+`')" src="public/star-icon-channel.svg" class="star-channel-icon">
            <svg onclick="quickConnect('`+item.name+`')" class="channel-kablo-icon" width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path class="channel-kablo-icon" d="M0 0H22C23.6569 0 25 1.34315 25 3V22C25 23.6569 23.6569 25 22 25H0V0Z" fill="#8AFF88" fill-opacity="0.18"/>
                <g clip-path="url(#clip0_953_1755)">
                <path class="channel-kablo-icon-path" d="M17.5239 6.99989C17.4292 7.01008 17.3406 7.05197 17.2726 7.11878L15.3028 9.08905C14.3703 8.41551 13.077 8.53651 12.2088 9.36659C12.2088 9.39874 11.8471 9.75159 11.5217 10.0672L11.1114 9.65724C11.061 9.6052 10.9982 9.56694 10.9289 9.54613C10.8595 9.52531 10.786 9.52264 10.7154 9.53835C10.6379 9.55237 10.566 9.58769 10.5075 9.64036C10.449 9.69303 10.4064 9.76096 10.3845 9.83651C10.3625 9.91206 10.362 9.99224 10.3831 10.068C10.4042 10.1438 10.446 10.2123 10.5038 10.2656L14.7346 14.4964C14.7745 14.5363 14.822 14.568 14.8742 14.5896C14.9264 14.6113 14.9823 14.6224 15.0388 14.6224C15.0953 14.6224 15.1512 14.6113 15.2034 14.5896C15.2556 14.568 15.303 14.5363 15.343 14.4964C15.3829 14.4564 15.4146 14.409 15.4362 14.3568C15.4579 14.3046 15.469 14.2487 15.469 14.1922C15.469 14.1357 15.4579 14.0798 15.4362 14.0276C15.4146 13.9754 15.3829 13.928 15.343 13.888L14.933 13.4785L15.6336 12.7905C16.4629 11.9613 16.5471 10.6722 15.8981 9.71055L17.8814 7.72716C17.9481 7.66525 17.993 7.5835 18.0095 7.49405C18.026 7.4046 18.0133 7.31221 17.9732 7.23058C17.933 7.14895 17.8677 7.08242 17.7867 7.04087C17.7058 6.99931 17.6137 6.98494 17.5239 6.99989ZM9.92167 10.3714C9.90378 10.3746 9.88611 10.379 9.86879 10.3845C9.79136 10.3985 9.71938 10.4338 9.66093 10.4865C9.60247 10.5392 9.55986 10.6071 9.53789 10.6827C9.51591 10.7582 9.51544 10.8384 9.53653 10.9142C9.55761 10.99 9.59942 11.0584 9.65725 11.1118L10.0672 11.5217L9.36659 12.2088C8.53736 13.038 8.45317 14.3276 9.10217 15.2897L7.11836 17.2722C7.07836 17.3122 7.04663 17.3597 7.02498 17.412C7.00333 17.4642 6.99219 17.5202 6.99219 17.5768C6.99219 17.6334 7.00333 17.6894 7.02498 17.7417C7.04663 17.7939 7.07836 17.8414 7.11836 17.8814C7.15837 17.9214 7.20586 17.9532 7.25812 17.9748C7.31039 17.9965 7.36641 18.0076 7.42298 18.0076C7.47955 18.0076 7.53557 17.9965 7.58784 17.9748C7.6401 17.9532 7.68759 17.9214 7.72759 17.8814L9.69744 15.9112C10.6299 16.5847 11.9232 16.4637 12.7914 15.6336C12.7914 15.6015 13.1531 15.2486 13.4785 14.933L13.8889 15.343C13.9288 15.3829 13.9762 15.4145 14.0284 15.4361C14.0806 15.4577 14.1365 15.4688 14.193 15.4688C14.2495 15.4688 14.3054 15.4577 14.3576 15.436C14.4097 15.4144 14.4571 15.3827 14.497 15.3428C14.537 15.3028 14.5686 15.2554 14.5902 15.2032C14.6118 15.151 14.6229 15.0951 14.6229 15.0386C14.6229 14.9822 14.6117 14.9262 14.5901 14.8741C14.5685 14.8219 14.5368 14.7745 14.4968 14.7346L10.2661 10.5038C10.2224 10.4573 10.1688 10.4213 10.1092 10.3984C10.0496 10.3756 9.98567 10.3665 9.92209 10.3718L9.92167 10.3714Z" fill="#8AFF88" fill-opacity="0.960784"/>
                </g>
                <defs>
                <clipPath id="clip0_953_1755">
                <rect width="11" height="11" fill="white" transform="translate(7 7)"/>
                </clipPath>
                </defs>
            </svg>
            </div>`
            $('.channel-list-item-container').append(div)
        }
    })
})

$(document).ready(function(){
    var $div = $(".menu-container");
    var isMouseDown = false;

    loadPosition();

    $div.on("mousedown", function(e) {
        isMouseDown = true;
        var offset = $div.offset();
        var offsetX = e.pageX - offset.left;
        var offsetY = e.pageY - offset.top;

        $(document).on("mousemove", function(e) {
            if (isMouseDown) {
                $div.css({
                    top: e.pageY - offsetY,
                    left: e.pageX - offsetX
                });
            }
        });
    });

    $(document).on("mouseup", function() {
        if (isMouseDown) {
            isMouseDown = false;
            $(document).off("mousemove");

            var finalPosition = $div.offset();
            savePosition(finalPosition.left, finalPosition.top);
        }
    });

    function savePosition(left, top) {
        localStorage.setItem("divPosition", JSON.stringify({ left: left, top: top }));
    }

    function loadPosition() {
        var savedPosition = JSON.parse(localStorage.getItem("divPosition"));
        if (savedPosition) {
            $div.css({
                left: savedPosition.left + 'px',
                top: savedPosition.top + 'px'
            });
        }
    }
});

function resetPosition() {
    var $div = $(".menu-container");

    localStorage.removeItem("divPosition");
    $div.css({
        left : "",
        right: '1vh',
        top: '1.5vh'
    });

    localStorage.setItem("divPosition", JSON.stringify({ right: "1vh", top: "1.5vh" }));
}

function disconnect() {
    $.post(`https://${GetParentResourceName()}/disconnect`, JSON.stringify({
    }), function(response) {
        if (response){
            $('.connect-btn').css('display', 'flex')
            $('.text-mhz').text('00.0Mhz')

            $('.disconnect-btn').hide()
            $('.menu-container').hide()

            $('.radio-input').val("00.0")
            $(".radio-input").prop("disabled", false);
            $('.star-icon').removeClass('active')
            $('.kablo-icon').removeClass('active')

            $('.member-item').remove()
            $('.mic-item').remove()

            inRadio = false
        }
    });
}

function quickFavorite(frequency) {
    $.post(`https://${GetParentResourceName()}/favorite`, JSON.stringify({
        frequency: frequency
    }))
}

function favorite() {
    if(inRadio) {
        $.post(`https://${GetParentResourceName()}/favorite`, JSON.stringify({
            frequency: currentFrenq
        }))
    }
}

function volume(value) {
    if(inRadio) {
        $.post(`https://${GetParentResourceName()}/volume`, JSON.stringify({
            value: value
        }))
    }
}

var password = false

function connect() {
    if(!password) {
        let frequency = $('.radio-input').val()
    
        if(parseInt(frequency)) {
            $.post(`https://${GetParentResourceName()}/connect`, JSON.stringify({
                frequency: frequency,
                password: password
            }), function(response) {
                if (response.value == "password"){
                    currentFrenq = $('.radio-input').val()

                    $('.radio-channel-text').text('Radio Password;')
                    $('.radio-channel-input-box').addClass('active')
                    $('.bluetooth-icon').addClass('active')
                    $('.radio-input').val('')
                    $('.radio-input').attr('placeholder', 'Password..')
                    password = true
                }
                else if (response.value == "special"){
                    $('.radio-input').val('00.0')
                }
                else {    
                    currentFrenq = $('.radio-input').val()

                    $('.connect-btn').hide()
                    $('.disconnect-btn').css('display', 'flex')
                    $('.text-mhz').text(currentFrenq+'Mhz')

                    $('.menu-container').show()
    
                    $(".radio-input").prop("disabled", true);
                    $('.kablo-icon').addClass('active')

                    inRadio = true
                    
                    if(response.isFavorite) {
                        $('.star-icon').addClass('active')
                    }
                    password = false
                }
            });
        }
    }
    else {
        let passwordValue = $('.radio-input').val()
    
        if(passwordValue) {
            $.post(`https://${GetParentResourceName()}/password`, JSON.stringify({
                password: passwordValue,
                frequency: currentFrenq
            }), function(response) {
                if (response.value == "close"){
                    $('.radio-channel-text').text('Radio Channel;')
                    $('.radio-channel-input-box').removeClass('active')
                    $('.bluetooth-icon').removeClass('active')
                    $('.radio-input').val('')
                    $('.radio-input').attr('placeholder', '00.0')

                    password = false
                }
                else if (response.value){
                    $('.radio-channel-text').text('Radio Channel;')
                    $('.radio-channel-input-box').removeClass('active')
                    $('.bluetooth-icon').removeClass('active')
                    $('.radio-input').attr('placeholder', '00.0')
                    $('.radio-input').val(currentFrenq)
                    $(".radio-input").prop("disabled", true);
                    $('.kablo-icon').addClass('active')

                    inRadio = true

                    $('.connect-btn').hide()
                    $('.disconnect-btn').css('display', 'flex')
                    $('.text-mhz').text(currentFrenq+'Mhz')

                    $('.menu-container').show()
                
                    if(response.isFavorite) {
                        $('.star-icon').addClass('active')
                    }

                    password = false
                }
                else {
                    $('.radio-input').val("")
                }
            });
        }
    }
}

window.addEventListener("keyup", (event) => {
    event.preventDefault();
    if (event.key == "Escape") {
        $('.telsiz-main-container').css('bottom', '-80vh')
        setTimeout(function(){
            $('.telsiz-main-container').hide()
        }, 600);
        $.post(`https://${GetParentResourceName()}/exit`,JSON.stringify({}));
    }
})

function updateDate() {
    const d = new Date();
    let m = addZero(d.getMinutes());
    let h = addZero(d.getHours());

    $(".top-clock").text(h+":"+m)
}

function addZero(i) {
    if (i < 10) {i = "0" + i}
    return i;
}   


setInterval(updateDate, 5000); 