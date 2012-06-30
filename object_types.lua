object_types = {}
object_names = {}

function Crate()
    o = rigidbody(0, 0, 0.125, 0.125, "crate.png", 50, 0, 0, 1, DOWN) 
    o.typ = "Crate"
    return o
end
object_types[#object_types+1] = Crate

function BadCrate() 
    o = rigidbody(0, 0, 0.125, 0.125, "crate_move.png", 50, 0, 0, 1, DOWN) 
    o.typ = "BadCrate"
    return o
end
object_types[#object_types+1] = BadCrate

function SawBlade() 
    o = rigidbody(0, 0, 0.25, 0.25, "sawblade.png", 50, 0, 0, 1, DOWN) 
    o.typ = "SawBlade"
    o.on_collide = function(other)
        if other == player then
            player.kill()
        end
    end
    return o
end
object_types[#object_types+1] = SawBlade
    
function initObjects() 
    for i, v in ipairs(object_types) do
        object_names[i] = v().typ
        print(v().typ)
    end
end