local recoils = {
    -- Handguns
    [`weapon_pistol`] = 0.3,
    [`weapon_pistol_mk2`] = 0.5,
    [`weapon_combatpistol`] = 0.2,
    [`weapon_appistol`] = 0.3,
    [`weapon_stungun`] = 0.1,
    [`weapon_pistol50`] = 0.6,
    [`weapon_snspistol`] = 0.2,
    [`weapon_heavypistol`] = 0.5,
    [`weapon_vintagepistol`] = 0.4,
    [`weapon_flaregun`] = 0.9,
    [`weapon_marksmanpistol`] = 0.9,
    [`weapon_revolver`] = 0.6,
    [`weapon_revolver_mk2`] = 0.6,
    [`weapon_doubleaction`] = 0.3,
    [`weapon_snspistol_mk2`] = 0.3,
    [`weapon_raypistol`] = 0.3,
    [`weapon_ceramicpistol`] = 0.3,
    [`weapon_navyrevolver`] = 0.3,
    [`weapon_gadgetpistol`] = 0.3,
    [`weapon_pistolxm3`] = 0.4,

    -- Submachine Guns
    [`weapon_microsmg`] = 0.5,
    [`weapon_smg`] = 0.4,
    [`weapon_smg_mk2`] = 0.1,
    [`weapon_assaultsmg`] = 0.1,
    [`weapon_combatpdw`] = 0.2,
    [`weapon_machinepistol`] = 0.3,
    [`weapon_minismg`] = 0.1,
    [`weapon_raycarbine`] = 0.3,
    [`weapon_tecpistol`] = 0.3,

    -- Shotguns
    [`weapon_pumpshotgun`] = 0.4,
    [`weapon_sawnoffshotgun`] = 0.7,
    [`weapon_assaultshotgun`] = 0.4,
    [`weapon_bullpupshotgun`] = 0.2,
    [`weapon_musket`] = 0.7,
    [`weapon_heavyshotgun`] = 0.2,
    [`weapon_dbshotgun`] = 0.7,
    [`weapon_autoshotgun`] = 0.2,
    [`weapon_pumpshotgun_mk2`] = 0.4,
    [`weapon_combatshotgun`] = 0.0,

    -- Assault Rifles
    [`weapon_assaultrifle`] = 0.5,
    [`weapon_assaultrifle_mk2`] = 0.2,
    [`weapon_carbinerifle`] = 0.3,
    [`weapon_carbinerifle_mk2`] = 0.1,
    [`weapon_advancedrifle`] = 0.1,
    [`weapon_specialcarbine`] = 0.2,
    [`weapon_bullpuprifle`] = 0.2,
    [`weapon_compactrifle`] = 0.3,
    [`weapon_specialcarbine_mk2`] = 0.2,
    [`weapon_bullpuprifle_mk2`] = 0.2,
    [`weapon_militaryrifle`] = 0.0,
    [`weapon_heavyrifle`] = 0.3,
    [`weapon_tacticalrifle`] = 0.2,

    -- Light Machine Guns
    [`weapon_mg`] = 0.1,
    [`weapon_combatmg`] = 0.1,
    [`weapon_gusenberg`] = 0.1,
    [`weapon_combatmg_mk2`] = 0.1,

    -- Sniper Rifles
    [`weapon_sniperrifle`] = 0.5,
    [`weapon_heavysniper`] = 0.7,
    [`weapon_marksmanrifle`] = 0.3,
    [`weapon_remotesniper`] = 1.2,
    [`weapon_heavysniper_mk2`] = 0.6,
    [`weapon_marksmanrifle_mk2`] = 0.3,
    [`weapon_precisionrifle`] = 0.3,

    -- Heavy Weapons
    [`weapon_rpg`] = 0.0,
    [`weapon_grenadelauncher`] = 1.0,
    [`weapon_grenadelauncher_smoke`] = 1.0,
    [`weapon_minigun`] = 0.1,
    [`weapon_firework`] = 0.3,
    [`weapon_railgun`] = 2.4,
    [`weapon_hominglauncher`] = 0.0,
    [`weapon_compactlauncher`] = 0.5,
    [`weapon_rayminigun`] = 0.3,

    -- DoItDigital Assault Rifles
    [`weapon_a15rc`]      = 0.5,
    [`weapon_ak47s`]      = 0.5,
    [`weapon_famasu1`]    = 0.5,
    [`weapon_grau`]       = 0.5,
    [`weapon_iar`]        = 0.5,
    [`weapon_jrbak`]      = 0.5,
    [`weapon_m133`]       = 0.5,
    [`weapon_neva`]       = 0.5,
    [`weapon_sr47`]       = 0.5,
    [`weapon_ak4k`]       = 0.5,
    [`weapon_akmkh`]      = 0.5,
    [`weapon_bulldog`]    = 0.5,
    [`weapon_casr`]       = 0.5,
    [`weapon_drh`]        = 0.5,
    [`weapon_fmr`]        = 0.5,
    [`weapon_fn42`]       = 0.5,
    [`weapon_galilar`]    = 0.5,
    [`weapon_m16a3`]      = 0.5,
    [`weapon_slr15`]      = 0.5,
    [`weapon_arc15`]      = 0.5,
    [`weapon_ars`]        = 0.5,
    [`weapon_howa_2`]     = 0.5,
    [`weapon_mza`]        = 0.5,
    [`weapon_safak`]      = 0.5,
    [`weapon_sar`]        = 0.5,
    [`weapon_sfak`]       = 0.5,
    [`weapon_arma1`]      = 0.5,
    [`weapon_g36`]        = 0.5,
    [`weapon_lr300`]      = 0.5,
    [`weapon_m416p`]      = 0.5,
    [`weapon_nanite`]     = 0.5,
    [`weapon_sf2`]        = 0.5,
    [`weapon_sfrifle`]    = 0.5,
    [`weapon_ak47`]       = 0.5,
    [`weapon_aug`]        = 0.5,
    [`weapon_cfs`]        = 0.5,
    [`weapon_g3_2`]       = 0.5,
    [`weapon_groza`]      = 0.5,
    [`weapon_sunda`]      = 0.5,
    [`weapon_acr`]        = 0.5,
    [`weapon_acwr`]       = 0.5,
    [`weapon_anarchy`]    = 0.5,
    [`weapon_far`]        = 0.5,
    [`weapon_gk47`]       = 0.5,
    [`weapon_tar21`]      = 0.5,
    [`weapon_akpu`]       = 0.5,
    [`weapon_an94_2`]     = 0.5,
    [`weapon_art64`]      = 0.5,
    [`weapon_gys`]        = 0.5,
    [`weapon_sm237`]      = 0.5,
    [`weapon_ss2_2`]      = 0.5,
    [`weapon_ar121`]      = 0.5,
    [`weapon_ar727`]      = 0.5,
    [`weapon_lgwii`]      = 0.5,
    [`weapon_scarsc`]     = 0.5,
    [`weapon_va030`]      = 0.5,
    [`weapon_anr15`]      = 0.5,
    [`weapon_dks501`]     = 0.5,
    [`weapon_scifw`]      = 0.5,
    [`weapon_ssr56`]      = 0.5,
    [`weapon_akbg`]       = 0.5,
    [`weapon_anm4`]       = 0.5,
    [`weapon_gvandal`]    = 0.5,
    [`weapon_l85`]        = 0.5,
    [`weapon_limpid`]     = 0.5,
    [`weapon_truvelo`]    = 0.5,

    -- DoItDigital Submachine Guns
    [`weapon_sb4s`]       = 0.5,
    [`weapon_h2smg`]      = 0.5,
    [`weapon_hfsmg`]      = 0.5,
    [`weapon_ms32`]       = 0.5,
    [`weapon_sarb`]       = 0.5,
    [`weapon_ue4`]        = 0.5,
    [`weapon_idw`]        = 0.5,
    [`weapon_uzi`]        = 0.5,
    [`weapon_heavysmg`]   = 0.5,
    [`weapon_smg9`]       = 0.5,
    [`weapon_r99`]        = 0.5,
    [`weapon_sb181`]      = 0.5,
    [`weapon_ump45`]      = 0.5,
    [`weapon_smg1311`]    = 0.5,
    [`weapon_autosmg`]    = 0.5,
    [`weapon_mx4`]        = 0.5,
    [`weapon_pasmg`]      = 0.5,

    -- DoItDigital Handguns
    [`weapon_fn502`]      = 0.3,
    [`weapon_hfap`]       = 0.3,
    [`weapon_knr`]        = 0.3,
    [`weapon_cz75`]       = 0.3,
    [`weapon_pl14`]       = 0.3,

    -- DoItDigital Snipers
    [`weapon_awp`]        = 0.5,
    [`weapon_ditdg`]      = 0.5,
    [`weapon_m82`]        = 0.5,

    -- DoItDigital Shotguns
    [`weapon_dcs`]       = 0.4,
    [`weapon_m90s`]      = 0.4,
    [`weapon_owshotgun`] = 0.4,
    [`weapon_benellim4`] = 0.4,
}

AddEventHandler('CEventGunShot', function(entities, eventEntity, args)
    local ped = PlayerPedId()
    if eventEntity ~= ped then return end
    if IsPedDoingDriveby(ped) then return end
    local _, weap = GetCurrentPedWeapon(ped, false)
    if recoils[weap] and recoils[weap] ~= 0 then
        local tv = 0
        if GetFollowPedCamViewMode() ~= 4 then
            repeat
                Wait(0)
                local p = GetGameplayCamRelativePitch()
                SetGameplayCamRelativePitch(p + 0.1, 0.2)
                tv += 0.1
            until tv >= recoils[weap]
        else
            repeat
                Wait(0)
                local p = GetGameplayCamRelativePitch()
                if recoils[weap] > 0.1 then
                    SetGameplayCamRelativePitch(p + 0.6, 1.2)
                    tv += 0.6
                else
                    SetGameplayCamRelativePitch(p + 0.016, 0.333)
                    tv += 0.1
                end
            until tv >= recoils[weap]
        end
    end
end)
