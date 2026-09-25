local Equipment = require("equipments.equipment")

local Clothing = Equipment:subclass("Clothing")

function Clothing:initialize(nome, peso, raridade, forca, defesa, agilidade)
    Equipment.initialize(self, nome, peso, raridade)
    self.forca = forca
    self.defesa = defesa
    self.agilidade = agilidade
end

return Clothing