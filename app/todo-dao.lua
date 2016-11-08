local mysql = require "resty.mysql"


function mysql_exec(query, opts)
  local db, err = mysql:new()
  if not db then
      return nil, err
  end

  db:set_timeout(1000) -- 1 sec

  local ok, err, errcode, sqlstate = db:connect(opts)

  if not ok then
      return nil, err
  end

  local res, err, errcode, sqlstate = db:query(query)
  if not res then
    return nil, err
  end

  -- put it into the connection pool of size 100,
 -- with 10 seconds max idle timeout
  db:set_keepalive(10000, 100)

  return res



end
