FROM tarantool/tarantool:1.7
COPY instances-iplogger.lua /usr/local/etc/tarantool/instances.enabled/iplogger.lua
COPY iplogger.lua /usr/share/tarantool/iplogger.lua
RUN mkdir /var/log/tarantool && chmod -R 777 /var/log/tarantool
CMD ["tarantool"]