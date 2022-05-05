#!/usr/bin/env ruby
#encoding:utf-8

require_relative 'Hangar'
require_relative 'EnemyStarShip'
require_relative 'Damage'
require_relative 'GameUniverse'
require_relative 'SpaceStation'
require_relative 'DamageToUI'
require_relative 'EnemyToUI'
require_relative 'HangarToUI'
require_relative 'SpaceStationToUI'

#Class for test main program for second practice

module Deepspace

    class TestP3

        def self.main
            puts "******************Probando método ADJUST******************"
            weapons = Array.new
            #w1=Weapon.new("Arma1",WeaponType::LASER,3)
            w2=Weapon.new("Arma2",WeaponType::MISSILE,2)
            #w5=Weapon.new("Arma2",WeaponType::MISSILE,5)
            #w3=Weapon.new("Arma3",WeaponType::PLASMA,1)
            #w4=Weapon.new("Arma4",WeaponType::LASER,2)

            puts "\nAñadiendo 2 armas al vector Weapons"
            #weapons << w1
            weapons << w2
            #weapons << w5
            #weapons << w4

            puts "\nAñadiendo 1 escudo al vector Shields"
            shields = Array.new
            s1=ShieldBooster.new("Escudo1",0.3,4)

            shields << s1

            weap_adjust = Array.new
            #weap_adjust << WeaponType::LASER
            #weap_adjust << WeaponType::LASER
            #weap_adjust << WeaponType::PLASMA
            weap_adjust << WeaponType::MISSILE
            damage = Damage.newSpecificWeapons(weap_adjust,1)
            damage_adjust = damage.adjust(weapons,shields)

            # weapons = laser, missile
            # weap_adjust = laser, laser, plasma
            # debería salir:
            # weapons = laser
            puts damage_adjust
        end

    end
    TestP3.main
end

