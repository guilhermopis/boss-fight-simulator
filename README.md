# Boss Fight Simulator

Boss Fight Simulator é um jogo de combate por turnos desenvolvido em Lua.

O projeto foi criado principalmente como forma de praticar conceitos de programação, incluindo:

* Programação Orientada a Objetos
* Herança e composição
* Modularização
* Lógica de combate
* Sistemas de atributos
* Desenvolvimento e organização de um projeto maior em Lua

## Versão atual

**v0.1.0 — Basic Combat Prototype**

Primeiro protótipo jogável do Boss Fight Simulator.

## Funcionalidades atuais

* Menu principal
* Sistema básico de entidades
* Player e Boss
* Ataque básico
* Cálculo de dano baseado em defesa
* Sistema de esquiva baseado em agilidade
* Sistema de vida
* Detecção de morte
* Condição básica de vitória

## Roadmap

* [x] Ataques dos bosses
* [x] Condição de derrota
* [ ] Sistema completo de turnos
* [x] Ação de guarda
* [x] Escolha de boss
* [x] Sindron, O Leproso
* [x] CX-486, O Autômata
* [x] Yengror, O Devorador de Montanhas
* [ ] Sistema de builds
* [ ] Distribuição de atributos
* [x] Armas
* [x] Roupas
* [ ] Peso dos equipamentos
* [ ] Sistema de AP
* [ ] Habilidades
* [ ] Buffs e debuffs
* [ ] Paralisação
* [ ] Poções
* [ ] Balanceamento geral

## Estrutura do projeto

```text
Boss Fight Simulator/
├── entities/
├── equipments/
├── game/
├── libs/
├── main.lua
├── .gitignore
└── README.md
```

## Bibliotecas de terceiros

Este projeto inclui algumas bibliotecas externas dentro da pasta `libs/`.

### middleclass

Biblioteca de orientação a objetos para Lua.

* Autor: Enrique García Cota (kikito)
* Projeto: `kikito/middleclass`
* Licença: MIT

### inspect.lua

Biblioteca para representação legível de tabelas Lua, utilizada principalmente para debugging.

* Autor: Enrique García Cota (kikito)
* Projeto: `kikito/inspect.lua`
* Licença: MIT

### json.lua

Biblioteca leve para codificação e decodificação de JSON em Lua.

* Autor: rxi
* Projeto: `rxi/json.lua`
* Licença: MIT

### ansicolorsx

Biblioteca utilizada para formatação e cores ANSI no terminal.

* Fonte utilizada no projeto: versão distribuída por asumbek

A licença da versão de `ansicolorsx` atualmente incluída no projeto ainda precisa ser confirmada a partir de sua fonte original.

## Desenvolvimento

O projeto está sendo desenvolvido incrementalmente. Novas versões deverão adicionar sistemas de combate, equipamentos, habilidades, bosses e outras mecânicas.

## Status

Em desenvolvimento.
