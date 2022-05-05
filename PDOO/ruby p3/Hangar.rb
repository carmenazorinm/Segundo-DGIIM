require_relative 'HangarToUI'
require_relative 'Weapon'
require_relative 'ShieldBooster'
require_relative 'WeaponType'

module Deepspace

	class Hangar

		#otro constructor
	 	def initialize(maxelem, w= Array.new, s= Array.new)
			@maxElements = maxelem
			@weapons = w
			@shieldBoosters = s
		end
		
		#constructor de copia
		def self.newCopy(h)
			new(h.maxElements, h.weapons, h.shieldBoosters)
	  	end
	   
	   
	   	def getUIversion()
	   		HangarToUI.new(self)
	   	end

		def spaceAvailable ()
			return ((@weapons.length + @shieldBoosters.length)<@maxElements)
		end
		
		def addWeapon (w)
			if (spaceAvailable())
				@weapons << w
				return true
			else
				return false
            end
		end
		
		def addShieldBooster (s)
			if (spaceAvailable())
				@shieldBoosters << s
				return true
			else
				return false
            end
		end
		
		def maxElements ()
			@maxElements
		end

		def shieldBoosters ()
			@shieldBoosters
		end
	
		def weapons()
			@weapons
		end
		
		def removeShieldBooster (s)
			if (s>=0 && s<@shieldBoosters.length())
				return @shieldBoosters.delete_at(s)
			else
				return nil
			end
		end
		
		def removeWeapon (w)
			if (w>=0 && w<@weapons.length())
				return @weapons.delete_at(w)
			else
				return nil
			end
		end
		
		def to_s
			getUIversion.to_s
		end

	end
end