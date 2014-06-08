--[[
ShutUpMeg
Copyright (c) Gnarfoz. All rights reserved
Find me on IRC at #wildstaruidev @ freenode
]]--
 
require "Apollo"
require "ApolloTimer"
require "DatacubeLib"
 
local ShutUpMeg = {} 
 
function ShutUpMeg:Init()
    Apollo.RegisterAddon(self, false)
end
 

function ShutUpMeg:OnLoad()
	-- Timer to wait out the 'pick up' sound effect, according to HUDAlerts\HUDAlerts.lua:324
	local delay = 3.375 + 0.025
	self.PickUpDelayTimer = ApolloTimer.Create(delay, false, "ShutUp", self)
	self.PickUpDelayTimer:Stop()
	
	Apollo.RegisterEventHandler("DatacubeUpdated", "OnEvent", self)
end

function ShutUpMeg:OnEvent()
	Print("Im Eventhandler")
	self.PickUpDelayTimer:Start()
end

function ShutUpMeg:ShutUp()
	DatacubeLib.StopDatacubeSound()
	Event_FireGenericEvent("GenericEvent_Collections_StopDatacube")
end

ShutUpMeg:Init()