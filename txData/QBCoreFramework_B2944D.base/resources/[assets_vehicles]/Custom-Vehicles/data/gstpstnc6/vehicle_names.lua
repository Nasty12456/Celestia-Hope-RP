function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	AddTextEntry("gstpstnc6", "Chevrolet C6 Corvette PISTON ZERO EDTN")
	AddTextEntry("gstpstnc6b", "2009")
end)
