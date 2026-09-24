local Boss = require("entities.boss")

local Yengror = Boss:subclass("Yengror")

function Yengror:initialize()
    Boss:initialize("Yengror", 150, 150, 14, 7, 4, 0)
end



return Yengror