local Entity = require("entities.entity")

local Boss = Entity:subclass("Boss")

function Boss:initialize(nome, vida, vidaMax, dano, forca, defesa, agilidade)
    Entity.initialize(self, 200, 200, 20, 5, 2, 1)
    self.nome = nome
end

return Boss