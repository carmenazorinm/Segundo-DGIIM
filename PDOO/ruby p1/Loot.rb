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
    end
end