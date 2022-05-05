require_relative './Loot.rb'
require_relative './Dice.rb'
require_relative './CombatResult.rb'
require_relative './GameCharacter.rb'
require_relative './ShieldBooster.rb'
require_relative './ShotResult.rb'
require_relative './SuppliesPackage.rb'
require_relative './Weapon.rb'
require_relative './WeaponType.rb'
require_relative './Hangar.rb'

module Deepspace
    class TestP1
        def self.main
            puts "Valores de Loot(1,2,3,4,5)"
            loot=Loot.new(1,2,3,4,5)
            puts "Supplies: #{loot.nSupplies}"
            puts "Weapons: #{loot.nWeapons}"
            puts "Shields: #{loot.nShields}"
            puts "Hangars: #{loot.nHangars}"
            puts "Medals: #{loot.nMedals}"

            puts "\nValores de SuppliesPackage(1,2,0)"
            suppack=SuppliesPackage.new(1,2,0)
            puts "Ammo Power: #{suppack.ammoPower}"
            puts "Fuel: #{suppack.fuelUnits} units"
            puts "Shield Power: #{suppack.shieldPower}"
            suppack_cp=SuppliesPackage.newCopy(suppack)
            puts "Ammo Power Copia: #{suppack_cp.ammoPower}"
            puts "Fuel: #{suppack_cp.fuelUnits} units"
            
            puts "\nValores de ShieldBooster"
            shboost=ShieldBooster.new("shboost",2.98,3)
            puts "Boost: #{shboost.boost}"
            puts "Uses: #{shboost.uses}"
            shboost_cp=ShieldBooster.newCopy(shboost)
            puts "Boost copy: #{shboost_cp.boost}"
            puts "Uses copy: #{shboost_cp.uses}"
            shboost_boost=shboost.useIt
            puts "shboost se usa"
            puts "useIt devuelve: #{shboost_boost}"
            puts "Uses actual: #{shboost.uses}"
            
            puts "\nValores de Weapon(weapon,laser,0)"
            weapon=Weapon.new("weapon",WeaponType::LASER,0)
            puts "Weapon type: #{weapon.type}"
            puts "Uses: #{weapon.uses}"
            weapon_cp=Weapon.newCopy(weapon)
            puts "Weapon type copia: #{weapon_cp.type}"
            puts "Uses copia: #{weapon_cp.uses}"
            puts "Potencia de disparo copia: #{weapon_cp.power}"
            weapon_dev=weapon.useIt
            puts "weapon se usa"
            puts "useIt devuelve: #{weapon_dev}"
            puts "Uses actual: #{weapon.uses}"

            puts "\nValores de Dice"
            dice=Dice.new
            puts "Numero hangares recibidos aleatoriamente: #{dice.initWithNHangars}"
            puts "Numero de armas recibidas aleatoriamente: #{dice.initWithNWeapons}"
            puts "Numero de potenciadores de escudo recibidos: #{dice.initWithNShields}"
            puts "Que jugador inicia la partida: #{dice.whoStarts(3)}"
            puts "Quien dispara primero: #{dice.firstShot}"
            puts "La estacion esquiva el disparo? #{dice.spaceStationMoves(2.98)}"

            puts "\nProbando Hangar"
            hangar=Hangar.new(4)
            puts hangar.to_s
        end
    end
    TestP1.main
end

