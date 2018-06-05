1. `docker build -t 3_steps .`
2. `docker run --name 3_steps -d -p 3302:3301 -p 8090:8080 -v {current_path}/data:/var/lib/tarantool 3_steps`
3. `docker exec -i -t 3_steps sh`
4. (inside container sh) `tarantoolctl start app1`
5. (from your machine) `curl http://localhost:8090/` several times.
_(inside container sh):_
6. `cd /var/lib/tarantool/app1`
7. `tarantoolctl stop app1`
8. `tarantool`
9. `box.cfg{}`
10. `box.space.hosts:select{}`