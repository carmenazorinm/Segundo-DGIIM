require_relative'DamageToUI'

module Deepspace
    class Damage
        
        def initialize(w, s, wl)
            @nShields = s
            @nWeapons = w
            @weapons = wl
        end

        def getUIversion
            DamageToUI.new(self)
        end

        def to_s
			getUIversion.to_s
		end

        def self.newSpecificWeapons(wl,s)
            new(-1,s,wl)
        end

        def self.newNumericWeapons(w,s)
            new(w,s,nil)
        end

        def self.newCopy(copy)
            new(copy.getNWeapons,copy.getNShields,copy.getWeapons)
        end

        def getWeapons
            @weapons
        end

        def getNWeapons
            @nWeapons
        end

        def getNShields
            @nShields
        end

        def hasNoEffect
            if(@nWeapons==-1)
                return (@weapons.length + @nShields)==0
            else
                return (@nWeapons + @nShields) == 0
            end
        end

        def discardShieldBooster
            if(@nShields>0)
                @nShields=@nShields-1
            else
                @nShields=0
            end
        end

        def discardWeapon(w)
            if(@nWeapons == -1)
                if(@weapons.length > 0)
                    indice = @weapons.index(w.type)
                    if(indice >= 0)
                        @weapons.delete_at(indice)
                    end
                end
            else
                if(@nWeapons > 0)
                    @nWeapons -= 1
                end
            end
        end

        #array de weapons contiene tal weaponType
        def arrayContainsType(w,t)
            contador=0
            encontrado=false
            while((contador < w.length) && (!encontrado))
                if(w[contador].type==t)
                    encontrado=true
                end
                contador+=1
            end
            
            if(encontrado)
                return contador-1
            else
                return -1
            end
        end

        def adjust(w,s)
            shields=@nShields
            weap=@nWeapons
            if(s.length<@nShields) 
                shields=s.length
            end

            if(@nWeapons != -1)
                #creo que es un error
                if(w.length < @nWeapons) 
                    weap=w.length
                end
                return Damage.newNumericWeapons(weap,shields)
            else
                #damage = Damage.newSpecificWeapons(@weapons,shields)
                contador=0
                weapons_aux=@weapons.clone
                w_aux=w.clone
                #en este while se quitan los weapons que están en @weapons pero no están en w
                while(contador < @weapons.length)
                    posicion=arrayContainsType(w_aux,@weapons[contador])
                    #puts posicion
                    if(posicion < 0)
                        indice=weapons_aux.index(@weapons[contador])
                        #puts indice
                        if(indice>=0)
                            weapons_aux.delete_at(indice)
                        end
                    else
                        w_aux.delete_at(posicion)
                    end
                    contador+=1
                end

                #si @weapons sigue teneiendo más armas que w, se van quitando las últimas armas de @weapons
                if(weapons_aux.length > w.length) 
                    contador=weapons_aux.length - w.length
                    while(contador > 0)
                        weapons_aux.delete_at(contador)
                        contador-=1
                    end
                end
                damage = Damage.newSpecificWeapons(weapons_aux,shields)
            end
        end
        
    end
end
