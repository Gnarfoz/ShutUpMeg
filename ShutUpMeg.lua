--[[
ShutUpMeg
Copyright (c) Gnarfoz. All rights reserved
Find me on IRC at #wildstaruidev @ freenode
]]--
 
require "DatacubeLib"
 
local ShutUpMeg = {} 
 
function ShutUpMeg:Init()
    Apollo.RegisterAddon(self, false)
end
 

function ShutUpMeg:OnLoad()
	Apollo.RegisterEventHandler("DatacubeUpdated", "ShutUp", self)
end

function ShutUpMeg:ShutUp()
	DatacubeLib.StopDatacubeSound()
end

-- Pseudo-OO instantiation
local ShutUpMegInst = ShutUpMeg:new()
ShutUpMegInst:Init()
