# openresty-todo-app
sample mini app todo with openresty

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


curl http://127.0.0.1:8000/todo-app/v0.1/todos
curl -XPOST -d '{"task" : "kikou", "status": 1 }' http://127.0.0.1:8000/todo-app/v0.1/todos -v
curl -XPUT -d '{"id" = 2, "task" : "kikou", "status": 1 }' http://127.0.0.1:8000/todo-app/v0.1/todos/1 -v
curl -XDELETE http://127.0.0.1:8000/todo-app/v0.1/todos/1 -v

```
