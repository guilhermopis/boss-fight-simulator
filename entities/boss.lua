local Entity = require("entities.entity")

local Boss = Entity:subclass("Boss")

function Boss:initialize(nome, titulo, descricao, vida, vidaMax, dano, forca, defesa, agilidade)
    Entity.initialize(
        self,
        vida,
        vidaMax,
        dano,
        forca,
        defesa,
        agilidade
    )
    self.nome = nome
    self.titulo = titulo
    self.descricao = descricao
end

function Boss:agir(user)
    local dano = self:attack(user)
    user:takeDamage(dano)
end

return Boss