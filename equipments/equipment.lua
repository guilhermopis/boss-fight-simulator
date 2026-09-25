local class = require("libs.middleclass")

local Equipment = class("Equipment")

function Equipment:initialize(nome, peso, raridade)
    self.nome = nome
    self.peso = peso
    self.raridade = raridade
end

return Equipment