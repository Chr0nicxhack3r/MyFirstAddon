local addon = LibStub("AceAddon-3.0"):NewAddon("Bunnies", "AceConsole-3.0")
local bunnyLDB = LibStub("LibDataBroker-1.1"):NewDataObject("MyFirstAddon", {
    type = "data source",
    text = "MyFirstAddon",
    icon = "Interface\\Icons\\INV_Chest_Cloth_17",
    OnClick = function() print("BUNNIES ARE TAKING OVER THE WORLD") end,
})
local icon = LibStub("LibDBIcon-1.0")
icon:Register("MyLDB", myLDB, savedVarTable)
 
function addon:OnInitialize()
    -- Obviously you'll need a ## SavedVariables: BunniesDB line in your TOC, duh!
    self.db = LibStub("AceDB-3.0"):New("MyFirstAddon", {
        profile = {
            minimap = {
                hide = false,
            },
        },
    })
    icon:Register("MyFirstAddon", bunnyLDB, self.db.profile.minimap)
    self:RegisterChatCommand("bunnies", "CommandTheBunnies")
end
 
function addon:CommandTheBunnies()
    self.db.profile.minimap.hide = not self.db.profile.minimap.hide
    if self.db.profile.minimap.hide then
        icon:Hide("MyFirstAddon")
    else
        icon:Show("MyFirstAddon")
    end
end

message('Addon has properly loaded.')