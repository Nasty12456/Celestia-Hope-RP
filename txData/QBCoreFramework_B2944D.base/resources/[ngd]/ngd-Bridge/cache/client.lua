Cache = setmetatable({}, {
    __index = function(self, key)
        AddEventHandler(('%s:Cache:%s'):format(Bridge.Name, key), function(value)
            self[key] = value
        end)
        return rawset(self, key, exports[Bridge.Name].Cache(nil, key) or false)
    end,
})

Cache.Set = function(key, value)
    if value ~= Cache[key] then
		TriggerEvent(('%s:Cache:%s'):format(Bridge.Name, key), value, Cache[key])
		Cache[key] = value
		return true
	end
end

Cache.On = function(key, cb)
    AddEventHandler(('%s:Cache:%s'):format(Bridge.Name, key), cb)
end