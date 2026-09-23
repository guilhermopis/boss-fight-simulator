local Boss = require("entities.boss")
local User = require("entities.user")

local game = {}

local bossGen = Boss:new()
local userGen = User:new()

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
function game.buildScreen()
    local running = true
    while running do
        printHeader()
        print("BUILD")
        print("")
        print("1. Pontos")
        print("2. Roupas")
        print("3. Armas")
        print("")
        print("------------------------------")
        local choice = io.read("n")
    end
end

-- função responsável pelos turnos da partida
function game.turnoIniciar()
    print("------------------------------")
    print("")
    print("Sindron, O Leproso")
    print("")
    print("Descrição: Vindo das terras de Miskogyor, Sindron é um monarca louco por poder que, em busca da imortalidade, acabou contraindo uma rara variante da Lepra causada pelo consumo do sangue de um titã. Por conta disso, O Leproso se tornou um homem fisicamente fraco, mas extremamente perigoso, sendo capaz de imbuir sua lâmina com a doença maldita. Seus ataques são extremamente fortes, mas sua defesa deixa a deseja. Incapaz de desviar por conta de sua condição.")
    print("")
	print("BOSS:")
    print(string.format("Vida: %.3f", bossGen.vida))
    print(string.format("Forca: %.1f", bossGen.forca))
    print(string.format("Defesa: %.1f", bossGen.defesa))
    print(string.format("Agilidade: %.1f", bossGen.agilidade))
    print("")
    print("PLAYER:")
    print(string.format("Vida: %.3f", userGen.vida))
    print(string.format("Forca: %.1f", userGen.forca))
    print(string.format("Defesa: %.1f", userGen.defesa))
    print(string.format("Agilidade: %.1f", userGen.agilidade))
    print("")
    print("------------------------------")
    print("")
end

function game.Start()
    local running = true
    while running do
        os.execute("chcp 65001 > NUL")
        local choiceUser = game.menuScreen()
        if choiceUser == 1 then
            while bossGen:isAlive() do
                game.turnoIniciar()
                local es = io.read("n")
                if es == 1 then
                    if bossGen:chanceEsquiva() then
                        print("O boss desviou.")
                    else
                        local danoTomado = userGen:attack(bossGen)
                        bossGen:takeDamage(danoTomado)
                    end
                else
                    print("Escolha inválida otário")
                end
                if bossGen:isDead() then
                    print("Parabéns! Você derrotou o chefão!")
                    print("")
                    break
                end
                if userGen:chanceEsquiva() then
                    print("Você se esquivou!")
                else
                    local danoTomado = bossGen:attack(userGen)
                    userGen:takeDamage(danoTomado)
                end
                if userGen:isDead() then
                    print("Você perdeu!")
                    print("")
                    break
                end
            end
        elseif choiceUser == 2 then
            game.buildScreen()
        elseif choiceUser == 3 then
            running = false
        else
            print("Opção inválida.")
        end
    end
end

return game