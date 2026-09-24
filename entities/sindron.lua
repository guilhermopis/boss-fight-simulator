local Boss = require("entities.boss")

local Sindron = Boss:subclass("Sindron")

function Sindron:initialize()
    Boss:initialize("Sindron", 150, 150, 14, 7, 4, 0)
end



return Sindron