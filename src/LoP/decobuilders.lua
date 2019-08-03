--[[
This library defines functions to initialize the values of the rawcodes[] array, which
should contain the rawcodes of all existing Deco Builders, in alphabetical order. Special builders 
are listed first, though.
]]--

local decobuilders = {}

decobuilders.typeIds = {}
decobuilders.typeIds.specialDecos = {
    'u015',  -- Units and Trees
    'u02E',  -- Terrain
    'u003',  -- Docks
    'u00W'  -- Misc
}
decobuilders.typeIds.basicDecos = {
    'u014',  -- Archways
    'u00A',  -- Bushes
    'u035',  -- Camp
    'u016',  -- City 1
    'u017',  -- City 2
    'u01T',  -- City 3
    'u00N',  -- Corpses
    'u00B',  -- Crops
    'u01P',  -- Dungeons
    'u036',  -- Effects
    'u01C',  -- Fire
    'u03Q',  -- Furniture
    'u00V',  -- Gates
    'u03P',  -- Ice
    'u013',  -- Rocks
    'u01R',  -- Seats
    'u01N',  -- Statue 1
    'u000',  -- Walls (Wood)
    'u02J',  -- Walls 1
    'u02K',  -- Walls 2
    'u00Z',  -- Water
    'u02P'  -- Webs
}
decobuilders.typeIds.advancedDecos = {
    'u02G',  -- Arabian 1
    'u02H',  -- Arabian 2
    'u01E',  -- Blacksmith
    'u03A', -- Blocks
    'u029',  -- Celtic
    'u039',  -- Chaos
    'u027',  -- Chess
    'u02D',  -- Dalaran
    'u02O',  -- Draenei
    'u03Z',  -- Drow
    'u02A',  -- Elves Blood
    'u045',  -- Elves High
    'u040',  -- Elves Forest
    'u03I',  -- Fence
    'u005',  -- Flags
    'u02C',  -- Floors
    'u004',  -- Flowers 1
    'u006',  -- Flowers 2
    'u025',  -- Forsaken
    'u02R',  -- Goblin
    'u02S',  -- Gravestones
    'u02I',  -- Mansion
    'u01D',  -- Market
    'u01S',  -- Medieval 1
    'u02L',  -- Medieval 2
    'u046',  -- Mushrooms
    'u03R',  -- Naga
    'u03S',  -- Nordic
    'u00Y',  -- Obelisks
    'u02N',  -- Pandaren
    'u026',  -- Quilboar
    'u02Q',  -- Rostrodle
    'u02T',  -- Ruined 1
    'u044',  -- Ruined 2
    'u00X',  -- Ruins
    'u001',  -- Runes
    'u02M',  -- Runic
    'u00G',  -- S&S Kingdom 1
    'u00L',  -- S&S Kingdom 2
    'u008',  -- S&S Manor 1
    'u009',  -- S&S Manor 2
    'u023',  -- Statue 2
    'u007',  -- Tableware
    'u01B',  -- Trees
    'u01O',  -- Village
    'u011',  -- Walls (Icecrown)
    'u012',  -- Walls (Ruins)
    'u010'  -- Walls (Stone)
}





return decobuilders