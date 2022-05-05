require_relative'LootToUI'
module Deepspace
    class Loot
        def initialize(nsu,nw,nsh,nh,nm)
            @nSupplies=nsu  
            @nWeapons=nw
            @nShields=nsh 
            @nHangars=nh
            @nMedals=nm 
        end

        def nSupplies
            @nSupplies
        end 

        def nWeapons
            @nWeapons
        end

        def nShields
            @nShields
        end

        def nHangars
            @nHangars
        end

        def nMedals
            @nMedals
        end

        def getUIversion
            LootToUI.new(self)
        end

        def to_s
            mensaje = "Loot: \nSupplies = #{nSupplies} \nWeapons = #{nWeapons} \nShields = #{nShields} \nHangars = #{nHangars} \nMedals = #{nMedals}"
            return mensaje
        end
    end
end