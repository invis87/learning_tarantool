function handler(self)
local selfVar = self.peer.host; box.space.bigspace:auto_increment{selfVar}; return self:render({
json = selfVar })
end

function start()
local server = require('http.server').new(nil, 8081) server:route({ path = '/'}, handler)
server:start()
end

return { start = start; }