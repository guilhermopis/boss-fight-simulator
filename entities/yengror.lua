local Boss = require("entities.boss")

local Yengror = Boss:subclass("Yengror")

function Yengror:initialize()
    Boss.initialize(
        self,
        "Yengror",
        "O Devorador de Montanhas",
        "De origem desconhecida, Yengror é o rei dos Terrifossórios, criaturas escamosas dotadas de garras constituídas de Hiperídio, material extremamente raro encontrado apenas nos indivíduos desta espécie, com propriedades corrosivas e altamente destrutivas. Yengror é capaz de disparar ácidos pelas suas garras, além de conseguir mergulhar para dentro da terra com seus dons escavatórios. Ele possui um revestimento incrivelmente resistente e garras capazes de perfurar até mesmo a mais maciça das estruturas, porém é extremamente lento devido ao seu tamanho colossal.",
        350,
        350,
        14,
        7,
        4,
        0
    )
end

return Yengror