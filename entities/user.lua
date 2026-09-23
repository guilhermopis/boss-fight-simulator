local Entity = require("entities.entity")

local User = Entity:subclass("User")

function User:initialize()
    Entity.initialize(self, 100, 100, 20, 5, 5, 5, false)
end

return User