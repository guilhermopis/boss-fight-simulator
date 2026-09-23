local Entity = require("entities.entity")

local Boss = Entity:subclass("Boss")

function Boss:initialize(nome, vida, vidaMax, dano, forca, defesa, agilidade, guarda)
    Entity.initialize(self, 200, 200, 20, 5, 2, 1, false)
    self.nome = nome
end

return Boss