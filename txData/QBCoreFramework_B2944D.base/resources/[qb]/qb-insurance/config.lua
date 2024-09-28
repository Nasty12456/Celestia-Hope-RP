Config = {
    CoreDefine = "qb-core",
    BlipCenterSprite = 649,
    BlipCenterColor = 0,
    BlipCenterText = 'Vehicle Insurance',
    CheckInsuranceCommand = 'checkinsurance',
    InsurancePayNotification = true, -- show player a notification when player pay for car insurance
    InsurancePayInterval = 3600, -- Interval in seconds when you pay insurance during gameplay

    InsurancePlans = {
        ['premium'] = {
            label = 'Premium', -- later to show in NUI
            intervalPrice = 1000, -- Interval  price per InsurancePayInterval time
            oneTimePrice = 8000, -- Price to pay on change plan or choose plan
            franchise = 150, -- price to pay on claim insurnace
            claimTime = 60, -- wait time to  come vehicle to garage
        },
        ['advanced'] = {
            label = 'Advanced',
            intervalPrice = 100,
            oneTimePrice = 3000,
            franchise = 200,
            claimTime = 20,
        },
        ['basic'] = {
            label = 'Basic',
            intervalPrice = 0,
            oneTimePrice = 500,
            franchise = 300,
            claimTime = 20,
        }
    },
    InsuranceDesk = vector3(-31.61, -1098.69, 27.27),
    Text = {
        ['dest_text'] = '[~b~E~w~] Insurance',
        ['plan_changed'] = 'Plan changed!',
        ['not_enough_money'] = 'You don\'t have enough money in your bank!',
        ['inverval_payment'] = 'You\'ve paid for your car insurance!',
        ['inverval_payment_error'] = 'You couldn\'t afford car insurance! It was removed!',
        ['insurance_claimed'] = 'Insurance claimed! Vehicle delivered to the selected garrage.',
        ['no_data_found'] = 'No record found!'
    },

    garages = {
        ["motelgarage"] = {
            label = "Motel Parking",
        },
        ["sapcounsel"] = {
            label = "San Andreas Parking",
        },
        ["spanishave"] = {
            label = "Spanish Ave Parking",
        },
        ["caears24"] = {
            label = "Caears 24 Parking",
        },
        ["caears242"] = {
            label = "Caears 24 Parking",
        },
        ["lagunapi"] = {
            label = "Laguna Parking",
        },
        ["airportp"] = {
            label = "Airport Parking",
        },
        ["beachp"] = {
            label = "Beach Parking",
        },
        ["themotorhotel"] = {
            label = "The Motor Hotel Parking",
        },
        ["liqourparking"] = {
            label = "Liqour Parking",
        },
        ["shoreparking"] = {
            label = "Shore Parking",
        },
        ["haanparking"] = {
            label = "Bell Farms Parking",
        },
        ["dumbogarage"] = {
            label = "Dumbo Private Parking",
        },
        ["pillboxgarage"] = {
            label = "Pillbox Garage Parking",
        }
    }
}
