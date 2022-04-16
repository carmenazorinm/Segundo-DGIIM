require_relative './WeaponType'
module Deepspace
    class Weapon
        def initialize(n,t,u)
            @name=n 
            @type=t
            @uses=u 
        end

        def self.newCopy(copy)
            new("copia",copy.type,copy.uses)
        end

        def type 
            @type 
        end

        def uses 
            @uses 
        end

        def power 
            @type.power
        end

        def useIt
            if(@uses > 0)
                @uses -= 1
                return (@boost)
            else
                return(1.0)
            end
        end

        def to_s
            mensaje = "Weapon: \nName = #{name} \nType = #{type} \nUses = #{uses}"
            return mensaje
        end

    end
end