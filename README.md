# openresty-todo-app
sample mini app todo with openresty

start app: ```nginx -p `pwd`/ -c conf/nginx.conf -s start```
reload: ```nginx -p `pwd`/ -c conf/nginx.conf -s reload```

```shell
curl -X POST -H "Content-Type: application/json" --data '{ "name": "kikou" }' http://0.0.0.0:8080/todo-app/v0.1/

curl http://0.0.0.0:8080/todo-app/v0.1/
```

