local Clothing = require("equipments.clothing")

local armors = {}

armors.couraca = Clothing(
    "Couraça de Dragão",
    3.4,
    "Mítico",
    1,
    2,
    -1
)
armors.tunica = Clothing(
    "Tunica",
    2,
    "Incomum",
    1,
    1,
    1
)

armors.chapeu = Clothing(
    "Chapéu",
    0.5,
    "Comum",
    0,
    0,
    1
)

return armors