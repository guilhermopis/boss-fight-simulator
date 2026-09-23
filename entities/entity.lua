local class = require("libs.middleclass")

local Entity = class("Entity")

local escalaDefesa <const> = 0.2

function Entity:initialize(vida, vidaMax, dano, forca, defesa, agilidade)
    self.vida = vida
    self.vidaMax = vidaMax
    self.dano = dano
    self.forca = forca
    self.defesa = defesa
    self.agilidade = agilidade
end

function Entity:getVida()
    return self.vida
end

function Entity:getVidaMax()
    return self.vidaMax
end

function Entity:vidaPercent()
    return self.vida / self.vidaMax
end

function Entity:isLowHp()
    return (self.vida / self.vidaMax) < 0.3
end

function Entity:isAlive()
    return self.vida > 0
end

function Entity:isDead()
    return not self:isAlive()
end

function Entity:takeDamage(damage)
    self.vida = self.vida - damage
    return self.vida
end

function Entity:attack(target)
    local damageX = self.dano / (1 + escalaDefesa * target.defesa)
    local damageX = math.floor(damageX + 0.5)
    return damageX
end

function Entity:chanceEsquiva()
    return math.random(1, 10) <= self.agilidade
end

return Entity