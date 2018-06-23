box.cfg {
    log_level = 5;
    listen = 9999;
}

box.once('grant', function()
    box.schema.user.grant('guest', 'read,write,execute', 'universe')
end)

-- Table
users = box.schema.space.create('users', {if_not_exists=true})
users:create_index('user_id', {if_not_exists=true})

function add_user(user_first_name, user_last_name)
  return users:auto_increment{user_first_name, user_last_name}
end

function add_user_ex(user_first_name, user_last_name, ...)
  return users:auto_increment{user_first_name, user_last_name, ...}
end

function get_user_by_id(user_id)
  return users.index.user_id:get{user_id}
end

function get_users()
  return users:select{}
end

function hello()
  return 'OK' 
end
