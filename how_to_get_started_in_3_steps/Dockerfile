FROM tarantool/tarantool:1.7
COPY app1.lua /usr/local/etc/tarantool/instances.enabled/app1.lua
RUN mkdir /var/log/tarantool && chmod -R 777 /var/log/tarantool
RUN tarantoolctl start app1
CMD ["tarantool"]