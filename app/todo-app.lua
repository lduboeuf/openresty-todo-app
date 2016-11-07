local request_method = ngx.req.get_method()
if request_method == "POST" then
  ngx.req.read_body()  -- explicitly read the req body
  local data = ngx.req.get_body_data()
  if data then
      local todo = cjson.decode(data)
      ngx.say(todo.name)
      return
  end
elseif request_method == "GET" then
  --ngx.say('kikou get')
  ngx.header.content_type = 'application/json';
  ngx.say(cjson.encode({name= "kikou", done= true}))
end
