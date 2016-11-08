local dao = require "todo-dao"

local connect_opts = {
  host = "127.0.0.1",
  port = 3306,
  database = "tasks",
  user = "task_user",
  password = "task_user"
}

local _M = {}

_M.create = function()
  ngx.req.read_body()  -- explicitly read the req body
  local data = ngx.req.get_body_data()
  if data then
      local todo = cjson.decode(data)
      local query = "INSERT INTO task (task, priority) VALUES (\""..todo.task.."\","..todo.priority..")"
      local res, err = mysql_exec(query, connect_opts)
      if not res then
        ngx.status = 500
      else
        ngx.status = 201 --created
        todo.id = res.insert_id
        ngx.say(cjson.encode(todo))
      end
  end

end

_M.delete = function(params)
  local res, err = mysql_exec("DELETE FROM task where id = " ..params.id, connect_opts)
  if not res then
    ngx.status = 500
  else
    ngx.status = 204
  end
end

_M.update = function(params)
  ngx.req.read_body()  -- explicitly read the req body
  local data = ngx.req.get_body_data()
  if data then
      local todo = cjson.decode(data)
      local query = "UPDATE task SET task=\""..todo.task.."\" , priority="..todo.priority.." WHERE id="..params.id
      local res, err = mysql_exec(query, connect_opts)
      if not res then
        ngx.status = 500
      else
        ngx.status = 200
        ngx.say(cjson.encode(todo))
      end
  end
end


_M.getAll = function()

  local res, err = mysql_exec("SELECT * FROM task", connect_opts)
  if not res then
    ngx.status = 500
  else
    ngx.header.content_type = 'application/json';
    ngx.say(cjson.encode(res))

  end
  --ngx.print(cjson.encode({name= "kikou", done= true}))
end


return _M
