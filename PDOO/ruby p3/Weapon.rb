require_relative 'WeaponType'
require_relative 'WeaponToUI'
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
                return (power)
            else
                return(1.0)
            end
        end

        def to_s
            getUIversion.to_s
        end

        def getUIversion
            WeaponToUI.new(self)
        end

    end
end