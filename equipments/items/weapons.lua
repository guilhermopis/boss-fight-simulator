local Weapon = require("equipments.weapon")

local weapons = {}

weapons.espadaLonga = Weapon(
    "Espada Longa",
    2.5,
    "Comum",
    2
)

weapons.martelo = Weapon(
    "Martelo",
    2.2,
    "Incomum",
    2.5
)

weapons.machadoBatalha = Weapon(
    "Machado de Batalha",
    1.9,
    "Raro",
    2.4
)

return weapons