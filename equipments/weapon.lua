local Equipment = require("equipments.equipment")

local Weapon = Equipment:subclass("Weapon")

function Weapon:initialize(nome, peso, raridade, dano)
    Equipment.initialize(self, nome, peso, raridade)
    self.dano = dano
end

return Weapon