local QBCore = exports['qb-core']:GetCoreObject()

-------------------------------- 

function notify(text)
      TriggerEvent('QBCore:Notify',text)
end