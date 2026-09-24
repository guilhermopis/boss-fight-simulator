local Boss = require("entities.boss")

local Sindron = Boss:subclass("Sindron")

function Sindron:initialize()
    Boss.initialize(
        self,
        "Sindron",
        "O Leproso",
        "Vindo das terras de Miskogyor, Sindron é um monarca louco por poder que, em busca da imortalidade, acabou contraindo uma rara variante da Lepra causada pelo consumo do sangue de um titã. Por conta disso, O Leproso se tornou um homem fisicamente fraco, mas extremamente perigoso, sendo capaz de imbuir sua lâmina com a doença maldita. Seus ataques são extremamente fortes, mas sua defesa deixa a deseja. Incapaz de desviar por conta de sua condição.",
        150,
        150,
        14,
        7,
        4,
        0
    )
end

return Sindron