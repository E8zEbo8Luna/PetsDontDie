tag @s add dontdie_owned
data modify entity @s equipment.mainhand set value {id:"totem_of_undying", count:1, components:{death_protection:{death_effects:[{type:"minecraft:play_sound",sound:"item.totem.use"}]}}}
