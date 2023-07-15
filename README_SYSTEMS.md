# Liza - Systems in Development

These systems operate at a very small capacity, and will be fleshed out in the future.

## Happy

Try Liza and build an ASCII game

    exe/liza happy axo

## Networking

Try Liza to connect with Sqlite and Redis

    exe/liza net

```ruby

NetBox.clients.get :sqlite
NetBox.clients.get :redis_url

NetBox.databases.sql
NetBox.databases.sqlite
NetBox.databases.redis

RedisDb.current
SqliteDb.current

RedisDb.current.call "TIME"
SqliteDb.current.call "SELECT name, sql FROM sqlite_master WHERE type = 'table';"

```

## Rack Web Server

Try Liza with the Rack Web Server

    exe/liza rack

http://localhost:3000/

http://localhost:3000/xxxxxxx

http://localhost:3000/api/xxxxxxx

http://localhost:3000/api/auth/sign_up

http://localhost:3000/api/auth/sign_in

http://localhost:3000/api/auth/account

http://localhost:3000/api/auth/sign_out

http://localhost:3000/assets/app.css

http://localhost:3000/assets/app.js

## Web Request

Try Liza with the Rack Web Server

    exe/liza request get /

    exe/liza request post /

    exe/liza request get /xxxxxxx

    exe/liza request get /api/xxxxxxx

    exe/liza request get /api/auth/sign_up

    exe/liza request get /api/auth/sign_in

    exe/liza request get /api/auth/account

    exe/liza request get /api/auth/sign_out

    exe/liza request get /assets/app.css

    exe/liza request get /assets/app.js
