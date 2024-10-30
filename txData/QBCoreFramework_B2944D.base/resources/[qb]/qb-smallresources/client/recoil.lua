local weapons = {
	--  Custom Weapons -- Hand Guns
	[GetHashKey("weapon_glock17")] = {recoil = 0.3, shake = 0.06},
	[GetHashKey("weapon_glock18c")] = {recoil = 0.3, shake = 0.06},
	[GetHashKey("weapon_glock22")] = {recoil = 0.3, shake = 0.06},
	[GetHashKey("weapon_deagle")] = {recoil = 0.3, shake = 0.06},
	[GetHashKey("weapon_fnx45")] = {recoil = 0.3, shake = 0.06},
	[GetHashKey("weapon_m1911")] = {recoil = 0.3, shake = 0.06},
    [GetHashKey("weapon_glock20")] = {recoil = 0.3, shake = 0.06},
    [GetHashKey("weapon_glock19gen4")] = {recoil = 0.3, shake = 0.06},
	--  Custom Weapons -- SMGs
    [GetHashKey("weapon_pmxfm")] = {recoil = 0.1, shake = 0.045},
    [GetHashKey("weapon_mac10")] = {recoil = 0.1, shake = 0.045},
	--  Custom Weapons -- Rifles
	[GetHashKey("weapon_mk47fm")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_m6ic")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_scarsc")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_m4")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_ak47")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_ak74")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_aks74")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_groza")] = {recoil = 0.2, shake = 0.06},
    [GetHashKey("weapon_scarh")] = {recoil = 0.2, shake = 0.06},
	------------- 
	[GetHashKey('WEAPON_PISTOL')] = {recoil = 0.3, shake = 0.06}, 	--PISTOL	
	[GetHashKey('WEAPON_PISTOL_MK2')] = {recoil = 0.3, shake = 0.03}, 	--PISTOL MK2
	[GetHashKey('WEAPON_COMBATPISTOL')] = {recoil = 0.2, shake = 0.03}, -- COMBAT PISTOL
	[GetHashKey('WEAPON_APPISTOL')] = {recoil = 0.1, shake = 0.05}, -- AP PISTOL
	[GetHashKey('WEAPON_PISTOL50')] = {recoil = 0.6, shake = 0.05}, -- PISTOL .50
	[GetHashKey('WEAPON_MICROSMG')] = {recoil = 0.2, shake = 0.035}, -- MICRO SMG
	[GetHashKey('WEAPON_SMG')] = {recoil = 0.1, shake = 0.045}, -- SMG
	[GetHashKey('WEAPON_SMG_MK2')] = {recoil = 0.1, shake = 0.055}, -- SMG MK2
	[GetHashKey('WEAPON_ASSAULTSMG')] = {recoil = 0.1, shake = 0.050}, -- ASSAULT SMG
	[GetHashKey('WEAPON_ASSAULTRIFLE')] = {recoil = 0.2, shake = 0.07}, -- ASSAULT RIFLE
	[GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = {recoil = 0.2, shake = 0.072},-- ASSAULT RIFLE MK2
	[GetHashKey('WEAPON_CARBINERIFLE')] = {recoil = 0.1, shake = 0.06}, -- CARBINE RIFLE
	[GetHashKey('WEAPON_CARBINERIFLE_MK2')] = {recoil = 0.1, shake = 0.065}, -- CARBINE RIFLE MK2
	[GetHashKey('WEAPON_ADVANCED_RIFLE')] = {recoil = 0.1, shake = 0.06}, -- ADVANCED RIFLE
	[GetHashKey('WEAPON_MG')] = {recoil = 0.1, shake = 0.07}, -- MG
	[GetHashKey('WEAPON_COMBATMG')] = {recoil = 0.1, shake = 0.08}, -- COMBAT MG
	[GetHashKey('WEAPON_COMBATMG_MK2')] = {recoil = 0.1, shake = 0.085},-- COMBAT MG MK2
	[GetHashKey('WEAPON_PUMPSHOTGUN')] = {recoil = 0.4, shake = 0.07}, -- PUMP SHOTGUN
	[GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = {recoil = 0.4, shake = 0.085},-- PUMP SHOTGUN MK2
	[GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = {recoil = 0.7, shake = 0.06}, -- SAWNOFF SHOTGUN
	[GetHashKey('WEAPON_ASSAULTSHOTGUN')] = {recoil = 0.4, shake = 0.12}, -- ASSAULT SHOTGUN
	[GetHashKey('WEAPON_BULLPUPSHOTGUN')] = {recoil = 0.2, shake = 0.08},-- BULLPUP SHOTGUN
	[GetHashKey('WEAPON_STUNGUN')] = {recoil = 0.1, shake = 0.01},-- STUN GUN
	[GetHashKey('WEAPON_SNIPERRIFLE')] = {recoil = 0.5, shake =  0.2},-- SNIPER RIFLE
	[GetHashKey('WEAPON_HEAVYSNIPER')] = {recoil = 0.7, shake = 0.3},-- HEAVY SNIPER
	[GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = {recoil = 0.7, shake = 0.35}, -- HEAVY SNIPER MK2
	[GetHashKey('WEAPON_REMOTESNIPER')] = {recoil  = 1.2, shake = 0.1},-- REMOTE SNIPER
	[GetHashKey('WEAPON_GRENADELAUNCHER')] = {recoil = 1.0, shake = 0.08},-- GRENADE LAUNCHER
	[GetHashKey('WEAPON_GRENADELAUCHER_SMOKE')] = {recoil = 1.0, shake = 0.04},-- GRENADE LAUNCHER SMOKE
	[GetHashKey('WEAPON_RPG')] = {recoil = 0.0, shake = 0.9},-- RPG
	[GetHashKey('WEAPON_STINGER')] = {recoil = 0.0, shake = 0.3},-- STINGER
	[GetHashKey('WEAPON_MINIGUN')] = {recoil = 0.01, shake = 0.25},  -- MINIGUN
	[GetHashKey('WEAPON_SNSPISTOL')] = {recoil = 0.2, shake = 0.02},-- SNS PISTOL
	[GetHashKey('WEAPON_SNSPISTOL_MK2')] = {recoil = 0.25, shake = 0.025}, -- SNS PISTOL MK2
	[GetHashKey('WEAPON_GUSENBERG')] = {recoil = 0.1, shake = 0.05}, -- GUSENBERG
	[GetHashKey('WEAPON_SPECIALCARBINE')] = {recoil = 0.2, shake = 0.06},-- SPECIAL CARBINE
	[GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = {recoil = 0.25, shake = 0.075}, -- SPECIAL CARBINE MK2
	[GetHashKey('WEAPON_HEAVYPISTOL')] = {recoil = 0.4, shake = 0.04},-- HEAVY PISTOL		--new hashkey
	[GetHashKey('WEAPON_BULLPUPRIFLE')] = {recoil = 0.2, shake = 0.05},-- BULLPUP RIFLE
	[GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = {recoil = 0.25, shake = 0.055}, -- BULLPUP RIFLE MK2
	[GetHashKey('WEAPON_VINTAGEPISTOL')] = {recoil = 0.4, shake = 0.025}, -- VINTAGE PISTOL
	[GetHashKey('WEAPON_DOUBLEACTION')] = {recoil = 0.4, shake = 0.025}, -- DOUBLE ACTION REVOLVER
	[GetHashKey('WEAPON_MUSKET')] = {recoil = 0.7, shake = 0.09}, -- MUSKET
	[GetHashKey('WEAPON_HEAVYSHOTGUN')] = {recoil = 0.2, shake = 0.13}, -- HEAVY SHOTGUN
	[GetHashKey('WEAPON_MARKSMANRIFLE')] = {recoil = 0.3, shake = 0.05}, -- MARKSMAN RIFLE
	[GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = {recoil = 0.35, shake = 0.035}, -- MARKSMAN RIFLE MK2
	[GetHashKey('WEAPON_HOMINGLAUNCHER')] = {recoil = 0, shake = 0.04}, -- HOMING LAUNCHER
	[GetHashKey('WEAPON_FLAREGUN')] = {recoil = 0.9, shake = 0.04}, -- FLARE GUN
	[GetHashKey('WEAPON_COMBATPDW')] = {recoil = 0.2, shake = 0.05}, -- COMBAT PDW
	[GetHashKey('WEAPON_MARKSMANPISTOL')] = {recoil = 0.9, shake = 0.04}, -- MARKSMAN PISTOL
  	[GetHashKey('WEAPON_RAILGUN')] = {recoil = 2.4, shake = 0.08}, -- RAILGUN
	[GetHashKey('WEAPON_MACHINEPISTOL')] = {recoil = 0.3, shake = 0.04},-- MACHINE PISTOL
	[GetHashKey('WEAPON_REVOLVER')] = {recoil = 0.6, shake = 0.05}, -- REVOLVER
	[GetHashKey('WEAPON_REVOLVER_MK2')] = {recoil = 0.65, shake = 0.055}, -- REVOLVER MK2
	[GetHashKey('WEAPON_DBSHOTGUN')] = {recoil = 0.7, shake = 0.04}, -- DOUBLE BARREL SHOTGUN
	[GetHashKey('WEAPON_COMPACTRIFLE')] = {recoil = 0.3, shake = 0.03}, -- COMPACT RIFLE
	[GetHashKey('WEAPON_AUTOSHOTGUN')] = {recoil = 0.2, shake = 0.04},-- AUTO SHOTGUN
	[GetHashKey('WEAPON_COMPACTLAUNCHER')] = {recoil = 0.5, shake = 0.05}, -- COMPACT LAUNCHER
	[GetHashKey('WEAPON_MINISMG')] = {recoil = 0.1, shake = 0.03}, -- MINI SMG
	[GetHashKey('weapon_A15RC')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ACR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ACWR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AK47')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AK4K')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AK47S')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AKBG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AKMKH')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AKPU')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ANARCHY')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ANM4')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ANR15')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AR121')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AR727')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ARC15')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ARMA1')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ARS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ART64')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AUG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AUTOSMG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_AWP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BENELLIM4')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BULLDOG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_CASR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_CFS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_CZ75')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_DCS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_DITDG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_DKS501')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_DRH')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FAMASU1')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FAR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FMR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FN42')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FN502')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_G3_2')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_G36')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GALILAR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GK47')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GRAU')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GROZA')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GVANDAL')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GYS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_H2SMG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_HEAVYSMG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_HFAP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_HFSMG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_HOWA_2')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_IAR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_IDW')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_JRBAK')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_KNR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_L85')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_LGWII')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_LIMPID')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_LR300')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M16A3')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M82')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M90S')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M133')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M416P')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_MS32')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_MX4')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_MZA')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_NANITE')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_NEVA')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_OWSHOTGUN')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_PASMG')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_PL14')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_R99')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SAFAK')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SAR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SARB')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SB4S')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SB181')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SCARSC')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SCIFW')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SF2')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SFAK')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SFRIFLE')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SLR15')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SM237')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SMG9')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SMG1311')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SR47')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SS2_2')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SSR56')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SUNDA')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_TAR21')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_TRUVELO')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_U64')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_UMP45')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_UZI')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_VA030')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_ILLGLOCK17')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_MIDASGLOCK')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BLUEGLOCKS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GLOCK21')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_P210')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GLOCKBEAMS')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_SR40')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_T1911')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_MGGLOCK')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_TGLOCK19')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_GLOCK41')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_FN57')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_P30L')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_TEC9S')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_KRISSVECTOR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_REDM4A1')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_R590')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_M500')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_LBTARP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BLACKARP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_TARP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_WOARP')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_THOMPSON')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BAR15')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_BSCAR')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_DMK18')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_galaxy')] = {recoil = 0.2, shake = 0.06},
	[GetHashKey('weapon_celap')] = {recoil = 0.2, shake = 0.06},
	

}

--separated coroutines

CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
		for hash, data in pairs(weapons) do
			if weapon == hash then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', data.shake)
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if weapons[wep].recoil and weapons[wep].recoil ~= 0 then
				tv = 0
				repeat 
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p+0.1, 0.2)
					end
					tv = tv+0.1
				until tv >= weapons[wep].recoil
			end
			
		end
	end
end)

