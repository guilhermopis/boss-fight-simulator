local Boss = require("entities.boss")

local Cx486 = Boss:subclass("Cx486")

function Cx486:initialize()
    Boss:initialize("CX-486", 150, 150, 14, 7, 4, 0)
end



return Cx486