require_relative 'EnemyToUI'
require_relative 'Damage'
require_relative 'Loot'
require_relative 'ShotResult'

module Deepspace
	class EnemyStarShip
	
		#constructor
		def initialize (n,a,s,l,d)
			@ammoPower=a
			@name=n
			@shieldPower=s
			@loot=l
			@damage=d
			
		end
		
		#constructor de copia
		def self.newCopy(e)
		    new(e.name, e.ammoPower, e.shieldPower, e.loot, e.damage)
		end
	
		def getUIversion()
			EnemyToUI.new(self)
		end
	
		def fire ()
			@ammoPower
		end 
		
		#Getters
		def ammoPower()
			@ammoPower
		end

		def damage()
			@damage
		end
		
		def loot()
			@loot
		end
		
		def name()
			@name
		end
		
		def shieldPower()
			@shieldPower
		end

		def protection ()
			@shieldPower
		end
	
		#para ver si resiste a un disparo
		def receiveShot (shot)
			if (shot>@shieldPower)
				return ShotResult::DONOTRESIST
			else 
				return ShotResult::RESIST
			end
		end

		#Para representacion en string
		def to_s
			getUIversion().to_s
		end
	end
end
