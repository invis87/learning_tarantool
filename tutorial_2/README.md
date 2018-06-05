1. `docker build -t tutorial_2 .`
2. `docker run --name tutorial_2 -d -p 3302:3301 -p 8090:8080 -v {current_path}/data:/var/lib/tarantool tutorial_2`
3. `docker exec -i -t tutorial_2 sh`
4. (inside container sh) `tarantoolctl start iplogger`
5. (from your machine) `curl http://localhost:8090/` several times.
_(inside container sh):_
6. `cd /var/lib/tarantool/iplogger`
7. `tarantoolctl stop iplogger`
8. `tarantool`
9. `box.cfg{}`
10. `box.space.bigspace:select{}`
