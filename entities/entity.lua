local class = require("libs.middleclass")

local Entity = class("Entity")

local escalaDefesa <const> = 0.2

function Entity:initialize(vida, vidaMax, dano, forca, defesa, agilidade, guarda)
    self.vida = vida
    self.vidaMax = vidaMax
    self.dano = dano
    self.forca = forca
    self.defesa = defesa
    self.agilidade = agilidade
    self.guarda = false
end

-- retorna a vida da entidade
function Entity:getVida()
    return self.vida
end

-- retorna a vida máxima da entidade
function Entity:getVidaMax()
    return self.vidaMax
end

-- retorna a porcentagem da vida
function Entity:vidaPercent()
    return self.vida / self.vidaMax
end

-- retorna um boolean se a vida está baixa ou não
function Entity:isLowHp()
    return (self.vida / self.vidaMax) < 0.3
end

-- retorna se a entidade está viva
function Entity:isAlive()
    return self.vida > 0
end

-- retorna se a entidade está morta
function Entity:isDead()
    return not self:isAlive()
end

-- calcula o dano que a entidade irá tomar
function Entity:takeDamage(damage)
    self.vida = self.vida - damage
    return self.vida
end

-- calcula o dano que a entidade irá aplicar
function Entity:attack(target)
    local damageX = self.dano / (1 + escalaDefesa * target.defesa)
    local damageX = math.floor(damageX + 0.5)
    return damageX
end

-- calcula a chance da entidade se esquivar
function Entity:chanceEsquiva()
    return math.random(1, 10) <= self.agilidade
end

function Entity:levantarGuarda()
    if not self.guarda then
        self.defesa = self.defesa + 2
        self.guarda = true
    end
end

function Entity:baixarGuarda()
    if self.guarda then
        self.defesa = self.defesa - 2
        self.guarda = false
    end
end

return Entity