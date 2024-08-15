xSound = exports.xsound
local queueList = {}
local queueNumber = 0

function sendSubtitle(speaker, speaker_color, message, timeout)
	queueNumber = queueNumber + 1
	queueList[queueNumber] = {
		type = "subtitle",
		speaker = speaker,
		speaker_color = speaker_color,
		message = message,
		timeout = timeout,
		triggered = false,
	}
end

exports('sendSubtitle', sendSubtitle)

Citizen.CreateThread(function()
	while true do
		for key, listedProcess in ipairs(queueList) do
			if not listedProcess.triggered then
				SendNUIMessage({
					type = "subtitle",
					speaker = listedProcess.speaker,
					speaker_color = listedProcess.speaker_color,
					message = listedProcess.message,
					timeout = listedProcess.timeout,
				})
				Citizen.Wait((listedProcess.timeout + 1000))
				listedProcess.triggered = true
			end
		end
		Citizen.Wait(1000)
	end
end)


--[[
-- Example Usage
exports['qubit-subtitle']:sendSubtitle(
    "COPPER MAHONE", -- Speaker Name
    "#ffd900", -- Speaker Color
    "What kind of thing are you looking for, green weird man?", -- Subtitle
    5000 -- Screen Time
)
]]--