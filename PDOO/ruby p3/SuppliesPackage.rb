module Deepspace
    class SuppliesPackage
        def initialize(ap,fu,sp)
            @ammoPower=ap
            @fuelUnits=fu
            @shieldPower=sp
        end

        def self.newCopy(copy)
            new(copy.ammoPower,copy.fuelUnits, copy.shieldPower)
        end

        def ammoPower
            @ammoPower
        end

        def fuelUnits
            @fuelUnits
        end

        def shieldPower
            @shieldPower
        end

        def to_s
            mensaje = "Supplies Package: \nAmmonition Power = #{ammoPower} \nFuel Units = #{fuelUnits} \nShield Power = #{shieldPower}"
            return mensaje
        end
    end
end
