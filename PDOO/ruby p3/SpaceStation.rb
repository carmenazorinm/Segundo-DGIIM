require_relative 'SpaceStationToUI'
module Deepspace
    class SpaceStation

        @@MAXFUEL=100
        @@SHIELDLOSSPERUNITSHOT=0.1

        def initialize(n,supplies,han=nil,sb=Array.new,w=Array.new,dam=Damage.new(-1,0,Array.new))
            @ammoPower=supplies.ammoPower
            @fuelUnits=supplies.fuelUnits
            @name=n
            @nMedals=0
            @shieldPower=supplies.shieldPower
            @pendingDamage=dam
            @weapons=w
            @shieldBoosters=sb
            @hangar=han
        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def assignFuelValue(f)
            if((@fuelUnits + f)<=@@MAXFUEL)
                @fuelUnits+=f
            else
                @fuelUnits=@@MAXFUEL
            end
        end

        def cleanPendingDamage
            if(@pendingDamage.hasNoEffect)
                @pendingDamage=nil
            end
        end

        def receiveWeapon(w)
            if(@hangar!=nil)
                return @hangar.addWeapon(w)
            else
                return false
            end
        end

        def receiveShieldBooster(s)
            if(@hangar!=nil)
                return @hangar.addShieldBooster(s)
            else
                return false
            end
        end

        def receiveHangar(h)
            if(@hangar==nil)
                @hangar=h
            end
        end

        def discardHangar
            @hangar=nil
        end

        def receiveSupplies(s)
            @ammoPower+=s.ammoPower
            @shieldPower+=s.shieldPower
            assignFuelValue(s.fuelUnits)
        end

        #terminar en java
        def setPendingDamage(d)
            damage=Damage.newCopy(d)
            damage=damage.adjust(@weapons,@shieldBoosters)
            @pendingDamage=damage
        end

        def mountWeapon(i)
            if(@hangar!=nil)
                arma=@hangar.removeWeapon(i)
                if(arma!=nil)
                    weapons << arma
                end
            end
        end

        def mountShieldBooster(i)
            if(@hangar!=nil)
                potenciador=@hangar.removeShieldBooster(i)
                if(potenciador!=nil)
                    shieldBoosters << potenciador
                end
            end
        end

        def discardWeaponInHangar(i)
            if(@hangar!=nil)
                @hangar.removeWeapon(i)
            end
        end

        def discardShieldBoosterInHangar(i)
            if(@hangar!=nil)
                @hangar.removeShieldBooster(i)
            end
        end

        def speed
            speed=@fuelUnits/@@MAXFUEL
            speed
        end

        def move
            @fuelUnits=@fuelUnits-speed
            if(@fuelUnits<0)
                @fuelUnits=0
            end
        end

        def validState
            return(@pendingDamage== nil || @pendingDamage.hasNoEffect)
        end

        def cleanUpMountedItems
            contador=0
            while(contador<weapons.length)
                if(weapons[contador].uses==0)
                    weapons.delete_at(contador)
                end
                contador+=1
            end

            contador=0
            while(contador<shieldBoosters.length)
                if(shieldBoosters[contador].uses==0)
                    shieldBoosters.delete_at(contador)
                end
                contador+=1
            end
        end

        def ammoPower
            @ammoPower
        end

        def fuelUnits
            @fuelUnits
        end

        def hangar
            @hangar
        end

        def name
            @name
        end

        def nMedals
            @nMedals
        end

        def pendingDamage
            @pendingDamage
        end

        def shieldBoosters
            @shieldBoosters
        end

        def shieldPower
            @shieldPower
        end

        def weapons
            @weapons
        end

        def discardWeapon(i)
            size=@weapons.length
            if(i>=0 && i<size)
                w=@weapons.delete_at(i)
                if(@pendingDamage!=nil)
                    @pendingDamage.discardWeapon(w)
                    cleanPendingDamage
                end
            end
        end

        def discardShieldBooster(i)
            size=@shieldBoosters.length
            if(i>=0 && i<size)
                s=@shieldBoosters.delete_at(i)
                if(@pendingDamage!=nil)
                    @pendingDamage.discardShieldBooster
                    cleanPendingDamage
                end
            end
        end

        def fire
            size=@weapons.length
            factor=1
            counter=0
            while(counter<size)
                w=@weapons[counter]
                #puts w DA ERROR EN LA INSTRUCCION DE ABAJO
                factor=factor*w.useIt
                counter+=1
            end
            
             @ammoPower*factor
        end

        def protection
            size=@shieldBoosters.length
            factor=1
            counter=0
            while(counter<size)
                s=@shieldBoosters[counter]
                factor*=s.useIt
                counter+=1
            end

            return @shieldPower*factor
        end

        def receiveShot(shot)
            myProtection=protection
            if(myProtection>=shot)
                @shieldPower-=@@SHIELDLOSSPERUNITSHOT*shot
                @shieldPower=[0.0,@shieldPower].max
                return(ShotResult::RESIST)
            else
                @shieldPower=0.0
                return(ShotResult::DONOTRESIST)
            end
        end

        def to_s
			getUIversion.to_s
		end

        def setLoot(loot)
            dealer=CardDealer.instance
            h=loot.nHangars
            if(h>0)
                h=dealer.nextHangar
                #no se si es eso
                receiveHangar(h)
            end
            elements=loot.nSupplies
            counter=0
            while(counter<elements)
                sup=dealer.nextSuppliesPackage
                receiveSupplies(sup)
                counter+=1
            end
            elements=loot.nWeapons
            counter=0
            while(counter<elements)
                weap=dealer.nextWeapon
                receiveWeapon(weap)
                counter+=1
            end
            elements=loot.nShields
            counter=0
            while(counter<elements)
                sh=dealer.nextShieldBooster
                receiveShieldBooster(sh)
                counter+=1
            end
            medals=loot.nMedals
            @nMedals+=medals
        end

    end
end
