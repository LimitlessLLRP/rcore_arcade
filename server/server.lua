local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("rcore_arcade:buyTicket")
AddEventHandler("rcore_arcade:buyTicket", function(ticket)
        local data = Config.ticketPrice[ticket]
        local xPlayer = QBCore.Functions.GetPlayer(source);
        local moneyPlayer = xPlayer.PlayerData.money['cash']

        if moneyPlayer > data.price then
            xPlayer.Functions.RemoveMoney("cash", data.price);
            TriggerClientEvent("rcore_arcade:ticketResult", source, ticket);
        else
            TriggerClientEvent("rcore_arcade:nomoney", source);
        end
end)