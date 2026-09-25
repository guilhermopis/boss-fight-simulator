local Sindron = require("entities.sindron")
local Cx486 = require("entities.cx486")
local Yengror = require("entities.yengror")
local User = require("entities.user")
local weapons = require("equipments.items.weapons")
local armors = require("equipments.items.armors")

local game = {}

-- lista de bosses
local bosses = {
    [1] = Sindron,
    [2] = Cx486,
    [3] = Yengror,
}

-- lista de armas
local weaponOptions = {
    weapons.espadaLonga,
    weapons.martelo,
    weapons.machadoBatalha
}

-- lista de roupas
local clothingOptions = {
    armors.couraca,
    armors.tunica,
    armors.chapeu
}

-- header para os menus
local function printHeader()
    print("------------------------------")
    print("     BOSS FIGHT SIMULATOR")
    print("------------------------------")
    print("")
end

-- menu principal
function game.menuScreen()
    printHeader()
    print("1. Iniciar Luta")
    print("2. Build")
    print("3. Sair")
    print("")
    print("------------------------------")
    return io.read("n")
end

-- menu das builds
function game.buildScreen(user)
    local running = true
    while running do
        printHeader()
        print("BUILD")
        print("")
        print("1. Pontos")
        print("2. Roupas")
        print("3. Armas")
        print("4. Voltar")
        print("")
        print("------------------------------")
        local choice = io.read("n")
        if choice == 1 then
            print("")
        elseif choice == 2 then
            game.clothingScreen(user)
        elseif choice == 3 then
            game.weaponScreen(user)
        elseif choice == 4 then
            running = false
        else
            print("Opção inválida.")
        end
    end
end

-- menu dos pontos, ligado ao menu das builds
function game.statScreen(user)

end

-- menu das roupas, ligado ao menu das builds
function game.clothingScreen(user)
    local running = true
    while running do
        printHeader()
        print("ROUPAS")
        print("")
        for i, armor in ipairs(clothingOptions) do
            print(string.format(
                "%d. %s | Força: %+.1f | Defesa: %+.1f | Agilidade: %+.1f | Peso: %.1f | %s",
                i,
                armor.nome,
                armor.forca,
                armor.defesa,
                armor.agilidade,
                armor.peso,
                armor.raridade
            ))
        end
        print("")
        print("4. Desequipar arma")
        print("5. Voltar")
        print("")
        print("------------------------------")
        local choice = io.read("n")
        if clothingOptions[choice] then
            local armor = clothingOptions[choice]
            user:equipArmor(armor)
            print("")
            print(string.format("%s equipada!", armor.nome))
        elseif choice == 4 then
            user:unequipArmor()
            print("Roupa desequipada.")
        elseif choice == 5 then
            running = false
        else
            print("Opção inválida.")
        end
    end
end

-- menu das armas, ligado ao menu das builds
function game.weaponScreen(user)
    local running = true
    while running do
        printHeader()
        print("ARMAS")
        print("")
        for i, weapon in ipairs(weaponOptions) do
            print(string.format(
                "%d. %s | Dano: +%.1f | Peso: %.1f | %s",
                i,
                weapon.nome,
                weapon.dano,
                weapon.peso,
                weapon.raridade
            ))
        end
        print("")
        print("4. Desequipar arma")
        print("5. Voltar")
        print("")
        print("------------------------------")
        local choice = io.read("n")
        if weaponOptions[choice] then
            local weapon = weaponOptions[choice]
            user:equipWeapon(weapon)
            print("")
            print(string.format("%s equipada!", weapon.nome))
        elseif choice == 4 then
            user:unequipWeapon()
            print("Arma desequipada.")
        elseif choice == 5 then
            running = false
        else
            print("Opção inválida.")
        end
    end
end

-- menu de escolha do boss
function game.bossScreen()
    printHeader()
    print("ESCOLHA O BOSS QUE DESEJA ENFRENTAR")
    print("")
    print("1. Sindron, O Leproso")
    print("2. CX-486, O Autômato")
    print("3. Yengror, O Devorador de Montanhas")
    print("")
    print("------------------------------")
    local choice = io.read("n")
    local bossEscolhido = bosses[choice]
    if bossEscolhido then
        return bossEscolhido:new()
    end
    return nil
end

-- função responsável pelos turnos da partida
function game.turnoIniciar(boss, user)
    print("------------------------------")
    print("")
    print(string.format("%s, %s", boss.nome, boss.titulo))
    print("")
    print(string.format("Descrição: %s", boss.descricao))
    print("")
	print("BOSS:")
    print(string.format("Vida: %.3f", boss.vida))
    print(string.format("Forca: %.1f", boss.forca))
    print(string.format("Defesa: %.1f", boss.defesa))
    print(string.format("Agilidade: %.1f", boss.agilidade))
    print("")
    print("PLAYER:")
    print(string.format("Vida: %.3f", user.vida))
    print(string.format("Forca: %.1f", user.forca))
    print(string.format("Defesa: %.1f", user.defesa))
    print(string.format("Agilidade: %.1f", user.agilidade))
    print("")
    print("------------------------------")
    print("")
    print("AÇÕES:")
    print("1. Ataque Básico")
    print("2. guarda")
    print("")
    print("------------------------------")
end

-- função responsável pelo combate
function game.fight(boss, user)
    while boss:isAlive() and user:isAlive() do
        if user.guarda then
            user:baixarGuarda()
        end
        game.turnoIniciar(boss, user)
        local es
        repeat
            es = io.read("n")
            if es ~= 1 and es ~= 2 then
                print("Escolha errada. Tente novamente.")
            end
        until es == 1 or es == 2
        if es == 1 then -- ataque básico
            if boss:chanceEsquiva() then
                print("O boss desviou.")
        else
            local danoTomado = user:attack(boss)
            boss:takeDamage(danoTomado)
        end
        elseif es == 2 then -- guarda
            user:levantarGuarda()
        end
        if boss:isDead() then
            print(string.format("Parabéns! Você derrotou %s, %s!", boss.nome, boss.titulo))
            print("")
            break
        end
        if user:chanceEsquiva() then
            print("Você se esquivou!")
        else
            boss:agir(user)
        end
        if user:isDead() then
            print("Você perdeu!")
            print("")
            break
        end
    end
end

-- função responsável por iniciar o jogo
function game.Start()
    local running = true
    local userGen = User:new()
    os.execute("chcp 65001 > NUL")
    while running do
        local choiceUser = game.menuScreen()
        if choiceUser == 1 then
            local bossGen = game.bossScreen()
            if bossGen then
                userGen:resetForFight()
                game.fight(bossGen, userGen)
            end
        elseif choiceUser == 2 then
            game.buildScreen(userGen)
        elseif choiceUser == 3 then
            running = false
        else
            print("Opção inválida.")
        end
    end
end

return game