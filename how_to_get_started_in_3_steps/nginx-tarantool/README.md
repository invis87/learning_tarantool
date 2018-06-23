1. `docker build -t tutorial_3_tarantool .`
2. 
```
docker run -d \
-p 3302:3301 \
-p 9999:9999 \
-v {current_path}/data:/var/lib/tarantool \
-v {current_path}/users.lua:/usr/local/etc/tarantool/instances.enabled/users.lua \
--name tutorial_3_tarantool \
tarantool-nginx_tarantool
```
3. `docker exec -i -t tutorial_3_tarantool sh`
4. (inside container sh) `tarantoolctl start users`
5. (from your machine) 
```
docker run -d \
-p 8888:80 \
-v {current_path}/nginx.conf:/etc/nginx/conf.d/default.conf \
--name tutorial_3_nginx \
tarantool/tarantool-nginx
```
6. Now lets send some requests:
```
curl -X POST --data "{\"params\": [\"FirstName\", \"LastName\"]}" localhost:8888/add_user
curl -X POST --data "{\"params\": [\"FirstName\", \"LastName_2\"]}" localhost:8888/add_user
curl -X POST --data "{\"params\": [\"FirstName\", \"LastName_3\"]}" localhost:8888/add_user
curl -X GET localhost:8888/get_users
```
7. Lets see what is inside our `users` space: `docker exec -i -t tutorial_3_tarantool sh`
```
/opt/tarantool # tarantoolctl connect localhost:9999
connected to localhost:9999
localhost:9999> box.space.users:select{}
---
- - [1, 'FirstName', 'LastName']
  - [2, 'FirstName', 'LastName_2']
  - [3, 'FirstName', 'LastName_3']
  - [4, 'FirstName', 'LastName']
...
```

