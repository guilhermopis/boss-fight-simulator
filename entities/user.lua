local Entity = require("entities.entity")
local Equipment = require("equipments.equipment")

local User = Entity:subclass("User")

function User:initialize()
    Entity.initialize(self, 100, 100, 20, 7, 5, 5)
    self.baseDano = self.dano
    self.baseForca = self.forca
    self.baseDefesa = self.defesa
    self.baseAgilidade = self.agilidade
    self.inventory = {}
    ---@type {weapon: {dano: number}?, armor: {forca: number, defesa: number, agilidade: number}?}
    self.equipment = {
        weapon = nil,
        armor = nil
    }
    self.peso = 0
end

function User:addItem(item)
    table.insert(self.inventory, item)
end

function User:equipWeapon(weapon)
    self.equipment.weapon = weapon
    self:updateStats()
end

function User:unequipWeapon()
    self.equipment.weapon = nil
    self:updateStats()
end

function User:equipArmor(armor)
    self.equipment.armor = armor
    self:updateStats()
end

function User:unequipArmor()
    self.equipment.armor = nil
    self:updateStats()
end

function User:updateStats()
    self.dano = self.baseDano
    self.forca = self.baseForca
    self.defesa = self.baseDefesa
    self.agilidade = self.baseAgilidade
    if self.equipment.weapon then
        self.dano = self.dano + self.equipment.weapon.dano
    end
    if self.equipment.armor then
        self.forca = self.forca + self.equipment.armor.forca
        self.defesa = self.defesa + self.equipment.armor.defesa
        self.agilidade = self.agilidade + self.equipment.armor.agilidade
    end
end

function User:resetForFight()
    self.vida = self.vidaMax
    self.guarda = false
    self:updateStats()
end

return User