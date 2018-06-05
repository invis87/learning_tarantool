box.cfg{}

-- Creates a blank table at startup and an index

box.once('schema', function()

    box.schema.create_space('hosts')

    box.space.hosts:create_index('primary', { type = 'hash',

       parts = {1, 'str'} })

end)

-- The GET request handler to / (web server root directory)

local function handler(self)

    -- Get the client's IP address

    local ipaddr = self.peer.host

    -- Insert a new entry for the address or increment the existing one

    box.space.hosts:upsert({ ipaddr, 1 }, {{'+', 2, 1}})

    -- Return all rows as JSON to the client

    return self:render{ json = box.space.hosts:select() }

end

local httpd = require('http.server')

local server = httpd.new('0.0.0.0', 8080)

server:route({ path = '/'  }, handler)

server:start()