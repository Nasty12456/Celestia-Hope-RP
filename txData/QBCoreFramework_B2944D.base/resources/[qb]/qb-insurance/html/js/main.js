$(function () {

    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.type === 'checkinsurance') {
            $('#papers').html(`
            LOS SATOS INSURANCE DEPARTMENT<br/><br/>
            This is certify that vehicle number <b>${item.data.plate}</b> is insured with <b>${item.data.insurance}</b>
            insurance.
            `)
            $('#insurance_papers').fadeIn()
        }
        if (item.type === 'open') {
            let seletedVehicle = ''
            let seletedPlan = ''
            let seletedGarage = ''
            let instype = ''
            $('#insurance').fadeIn()
            $('#username').text(item.name + '!')
            $('#plans').html('')
            $('#allvehicles').html('')
            $('#garages').html('')
            item.vehicles.forEach(vehicle => {
                $('#allvehicles').append(
                    `
                    <div class="vehicle" data='${vehicle.plate}' instype='${vehicle.insurance}'>
                        <div class="vehicleimage">
                            <img
                                src="https://www.bajajallianz.com/content/dam/bagic/index/motor-insurance-online-policy.png">
                            <div class="icon">
                                ${vehicle.insurance == 'none' ? '<i class="fa-solid fa-circle-exclamation"></i>' : '<i class="fa-solid fa-solid fa-circle-check"></i>'}
                            </div>
                            <div class='countdown' id = '${vehicle.plate}'>
                            </div>
                        </div>
                        <div class="vehicle-details">
                            <div class="name">
                                <span>Vehcile Name :</span>
                            </div>
                            <div class="detail">
                                <span id="vname">${vehicle.vehicle.toUpperCase()}</span>
                            </div>
                            <div class="name">
                                <span>Vehcile Plate :</span>
                            </div>
                            <div class="detail">
                                <span id="vname">${vehicle.plate}</span>
                            </div>
                        </div>
                    </div>
                    `
                )
            });
            $('.vehicle').click(function () {
                $('.active-vehicle').removeClass('active-vehicle')
                $(this).addClass('active-vehicle')
                seletedVehicle = $(this).attr('data')
                instype = $(this).attr('instype')
            })

            for (const [key, value] of Object.entries(item.plans)) {
                var claimTime = (value.claimTime / 60);
                if (claimTime < 1) {
                    claimTime = value.claimTime + " seconds";
                } else {
                    claimTime = claimTime + " minutes"
                }

                var cooldown = (value.cooldown / 60);
                if (cooldown < 1) {
                    cooldown = value.cooldown + " seconds";
                } else {
                    cooldown = cooldown + " minutes"
                }
                $('#plans').append(
                    `
                <div class="insurance-div" data='${key}'>
                    <h1>${value.label} Insurance</h1>
                    <div class="insurance-details">
                        <p>
                            - Hourly price $${value.intervalPrice} <br>
                            -  Payment on calim insurance $${value.franchise} <br>
                            - ${claimTime} minute Wait time to claim insurance <br>
                            - You can insurance this vehcile again after 30 minutes
                        </p>
                    </div>
                    <div class="price">
                        $${value.oneTimePrice}
                    </div>
                </div>
                `
                )
            }
            $('.insurance-div').click(function () {
                $('.active-purple').removeClass('active-purple')
                $(this).addClass('active-purple')
                seletedPlan = $(this).attr('data')
            })

            $('#buynow').click(function () {
                if (seletedPlan != '' && seletedVehicle != '') {
                    if (seletedVehicle == 'underprocess') {
                        error('Can\'t do this now vehicle is in insurance claim process.')
                    } else {
                        choosePlan(seletedVehicle, seletedPlan)
                        seletedVehicle = ''
                        seletedPlan = ''
                    }
                }
                else {
                    error('Select vehicle and plan to buy an insurance.')
                }
            })

            for (const [key, value] of Object.entries(item.garages)) {
                $('#garages').append(
                    `
                    <div class="garage-div" data='${key}'>
                        <h1>${value.label}<i class="fa-solid fa-warehouse"></i></h1>
                    </div>
                `
                )
            }
            $('.garage-div').click(function () {
                $('.active-purple').removeClass('active-purple')
                $(this).addClass('active-purple')
                seletedGarage = $(this).attr('data')
            })

            $('#claimnow').click(function () {
                if (seletedGarage != '' && seletedVehicle != '') {
                    if (seletedVehicle == 'underprocess') {
                        error('Can\'t do this now vehicle is in insurance claim process.')
                    }
                    else if (instype != 'none') {
                        claim(seletedVehicle, instype, seletedGarage)
                        seletedVehicle = ''
                        instype = ''
                        seletedGarage = ''
                    } else {
                        error('Select vehicle is uninsured.')
                    }
                }
                else {
                    error('Select vehicle and garage to claim insurance.')
                }
            })
        }

        if (item.type === 'claim') {
            var date = new Date(0);
            date.setSeconds(parseInt(item.time));
            var timeString = date.toISOString().substr(14, 5);
            $(`#${item.vehicle}`).html(timeString)
            var disableVeh = document.querySelector(`[data = '${item.vehicle}']`);
            $(disableVeh).attr('data', 'underprocess')
        }
    })

    $('#claim').click(function () {
        $(this).addClass('active')
        if ($('#dashboard').hasClass('active')) {
            $('#dashboard').removeClass('active')
        }
        $('#claiminsurance').css('display', 'block')
        $('#insuranceplans').css('display', 'none')
    })

    $('#dashboard').click(function () {
        $(this).addClass('active')
        if ($('#claim').hasClass('active')) {
            $('#claim').removeClass('active')
        }
        $('#insuranceplans').css('display', 'block')
        $('#claiminsurance').css('display', 'none')
    })

    $('#logout').click(function () {
        closeMenu();
    })


    function closeMenu() {
        seletedVehicle = ''
        seletedPlan = ''
        seletedGarage = ''
        instype = ''
        $('#insurance').fadeOut()
        $('#insurance_papers').fadeOut()
        $.post(`http://${GetParentResourceName()}/close`, JSON.stringify({}));
    }

    function error(msg) {
        $('#error').html(`<p><i class="fa-solid fa-circle-exclamation"></i>${msg}</p>`)
        $('#error').fadeIn()
        setTimeout(() => {
            $('#error').fadeOut()
        }, 3000);
    }

    function choosePlan(k, plan) {
        $.post(`https://${GetParentResourceName()}/changePlan`, JSON.stringify({
            vehicle: k,
            plan: plan
        }));
        closeMenu();
    }

    function claim(k, type, garage) {
        $.post(`https://${GetParentResourceName()}/claim`, JSON.stringify({
            vehicle: k,
            type: type,
            garage: garage
        }));
        closeMenu();
    }

    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            closeMenu();
        }
    };
})