  --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
  --						Release 1							  --
  -- 						06.04.2011							  --
  -- 				 Protonova of Rexxar - US					  --
  --															  --
  --   This is a LibDataBroker that displays healer relevant 	  --
  --   stats such as:										 	  --
  --   Spell Power			Spell Crit				Spell Hit	  --
  --   Spell Healing		Spell Haste						  	  --
  --   Mp5					Spirit					Mastery		  --
  --															  --
  --   Original Concept derived from Broker_StatsNow by		  --
  --   WNxSajuukCor.											  --
  --++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--

--[[ Load Libraries ]]
local dataobj = LibStub:GetLibrary("LibDataBroker-1.1")

--[[ Define Spell Stats ]]
local Healing_Frame = dataobj:NewDataObject("mS - Healing", {type = "data source", label = "|cff0070deSpHeal|r", text = "", icon = "Interface\\Icons\\spell_holy_greaterheal"})
local MP5_Frame = dataobj:NewDataObject("mS - MP5", {type = "data source", label = "|cff0070deM|r".."|cffffffffp|r".."|cff0070de5|r", text = "", icon = "Interface\\Icons\\Spell_Magic_ManaGain"})
local Spell_Crit_Frame = dataobj:NewDataObject("mS - Spell Crit", {type = "data source", label = "|cff0070deSpCrit|r", text = "", icon = "Interface\\Icons\\spell_arcane_invocation"})
local Spell_Haste_Frame = dataobj:NewDataObject("mS - Spell Haste", {type = "data source", label = "|cff0070deSpHaste|r", text = "", icon = "Interface\\Icons\\spell_nature_astralrecalgroup"})
local Spell_Hit_Frame = dataobj:NewDataObject("mS - Spell Hit", {type = "data source", label = "|cff0070deSpHit|r", text = "", icon = "Interface\\Icons\\Spell_ChargePositive"})
local Spell_Intellect_Frame = dataobj:NewDataObject("mS - Intellect", {type = "data source", label = "|cff0070deIntellect|r", text = "", icon = "Interface\\Icons\\achievement_dungeon_theviolethold_heroic"})
local Spell_Mastery_Frame = dataobj:NewDataObject("mS - Mastery", {type = "data source", label = "|cff0070deMastery|r", text = "", icon = "Interface\\Icons\\spell_mage_flameorb"})
local Spell_Power_Frame = dataobj:NewDataObject("mS - Spell Power", {type = "data source", label = "|cff0070deSp|r", text = "", icon = "Interface\\Icons\\Spell_shaman_spectraltransformation"})
local Spell_Spirit_Frame = dataobj:NewDataObject("mS - Spirit", {type = "data source", label = "|cff0070deSpirit|r", text = "", icon = "Interface\\Icons\\spell_holy_divinespirit"})

--[[ Define Spell Stats ]]
local Healing = CreateFrame("frame")
local MP5 = CreateFrame("frame")
local Spell_Crit = CreateFrame("frame")
local Spell_Haste = CreateFrame("frame")
local Spell_Hit = CreateFrame("frame")
local Spell_Intellect = CreateFrame("frame")
local Spell_Mastery = CreateFrame("frame")
local Spell_Power = CreateFrame("frame")
local Spell_Spirit = CreateFrame("frame")

--[[ Define Spell Stats ]]
Healing:SetScript("OnUpdate", function(self, elap)
	local Total_Healing = GetSpellBonusHealing("player")
	Healing_Frame.text = Total_Healing
end)

MP5:SetScript("OnUpdate", function(self, elap)
	local base, casting = GetManaRegen()
	local MP5_1 = (casting * 5)
	MP5_Frame.text = string.format("%.0f", MP5_1)
end)

Spell_Crit:SetScript("OnUpdate", function(self, elap)
	local SC = GetSpellCritChance("2")
	Spell_Crit_Frame.text = string.format("%.2f%%", SC)
end)

Spell_Haste:SetScript("OnUpdate", function(self, elap)
	local Total_Spell_Haste = GetCombatRatingBonus("20")
	Spell_Haste_Frame.text = string.format("%.2f%%", Total_Spell_Haste)
end)

Spell_Hit:SetScript("OnUpdate", function(self, elap)
	local Total_Spell_Hit = GetCombatRatingBonus("8")
	Spell_Hit_Frame.text = string.format("%.2f%%", Total_Spell_Hit)
end)

Spell_Intellect:SetScript("OnUpdate", function(self, elap)
	local intel = UnitStat("player", 4)
    Spell_Intellect_Frame.text = string.format("%.0f", intel)
end)

Spell_Mastery:SetScript("OnUpdate", function(self, elap)
	local Total_SM = GetMastery("player")
	Spell_Mastery_Frame.text = string.format("%.2f", Total_SM)
end)

Spell_Power:SetScript("OnUpdate", function(self, elap)
	local SP = GetSpellBonusDamage("2")
	Spell_Power_Frame.text = SP
end)

Spell_Spirit:SetScript("OnUpdate", function(self, elap)
	local Total_SSpi = UnitStat("player", 5)
    Spell_Spirit_Frame.text = string.format("%.0f", Total_SSpi)
end)