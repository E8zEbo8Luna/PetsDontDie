execute as @e[type=#dontdie:pets, tag=!dontdie_owned] if data entity @s Owner run function dontdie:new_owner
advancement revoke @s only dontdie:tame_pet