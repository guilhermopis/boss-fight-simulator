local Boss = require("entities.boss")

local Cx486 = Boss:subclass("Cx486")

function Cx486:initialize()
    Boss.initialize(
        self,
        "CX-486",
        "O Autômato",
        "Desenvolvido pela Cruyster Robotics, CX-486 é o modelo mais moderno da linha 'Behemoth' de robôs da Cruyster. Criado para a proteção pessoal de Donovan Cruyster, CX-486 é capaz de soltar rajadas de fogo pelos braços e boca, além de emitir aleatoriamente ondas de choque capazes de desligar temporariamente ferramentas. Ele possui um revestimento de titânio, mas costuma sobreaquecer.",
        220,
        220,
        14,
        7,
        4,
        0
    )
end

return Cx486