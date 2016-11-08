# openresty-todo-app
sample mini  todo app with openresty

init db: see `conf/db.sql`
tune your local db settings in `app/config.lua`

start app:
 ```
nginx -p `pwd`/ -c conf/nginx.conf
```

reload:
```
nginx -p `pwd`/ -c conf/nginx.conf -s reload
```

testouilles
```shell
#mini sample html todo-app
http://127.0.0.1:8000/

curl http://127.0.0.1:8000/todo-app/v0.1/todos
curl -XPOST -d '{"task" : "kikou", "priority": 1 }' http://127.0.0.1:8000/todo-app/v0.1/todos -v
curl -XPUT -d '{"id" = 2, "task" : "kikou", "priority": 1 }' http://127.0.0.1:8000/todo-app/v0.1/todos/1 -v
curl -XDELETE http://127.0.0.1:8000/todo-app/v0.1/todos/1 -v

```
