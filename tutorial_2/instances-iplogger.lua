box.cfg{}

if not box.space.bigspace then
s = box.schema.space.create('bigspace') s:create_index('primary', {type = 'tree', parts = {1, 'unsigned'}}) end

local m = require('iplogger').start({...})