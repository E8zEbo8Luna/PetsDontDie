#check if a pet has died
execute as @s[tag=!dontdie_dying, nbt=\
!{equipment:{mainhand:{id:"minecraft:totem_of_undying", count:1, components:{"minecraft:death_protection":{death_effects:[{type:"minecraft:play_sound",sound:"minecraft:item.totem.use"}]}}}}}] \
run function dontdie:dying

#update pet health + max_health
execute as @s store result score @s dontdie_health run data get entity @s Health
execute as @s[type=!#dontdie:pets_preset_hp] store result score @s dontdie_maxhealth run data get entity @s attributes[{id:"minecraft:max_health"}].base
execute as @s[type=parrot] run scoreboard players set @s dontdie_maxhealth 6
execute as @s[type=cat] run scoreboard players set @s dontdie_maxhealth 10
execute as @s[type=player] run scoreboard players set @s dontdie_maxhealth 20

#revive pet if health = max health
execute as @s[tag=dontdie_dying] if score @s dontdie_health = @s dontdie_maxhealth run data merge entity @s {NoAI:0b, Invulnerable:0b, NoGravity:0b}
execute as @s[tag=dontdie_dying] if score @s dontdie_health = @s dontdie_maxhealth run effect clear @s
execute as @s[tag=dontdie_dying] if score @s dontdie_health = @s dontdie_maxhealth run \
data modify entity @s equipment.mainhand set value {id:"totem_of_undying", count:1, components:{death_protection:{death_effects:[{type:"minecraft:play_sound",sound:"item.totem.use"}]}}}
execute as @s[tag=dontdie_dying] if score @s dontdie_health = @s dontdie_maxhealth run tag @s remove dontdie_dying
