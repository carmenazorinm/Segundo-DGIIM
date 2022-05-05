require_relative 'GameUniverseToUI'
require_relative 'GameStateController'
require_relative 'Dice'
require_relative 'Loot'
require_relative 'CombatResult'
require_relative 'GameCharacter'
require_relative 'ShotResult'
require_relative 'SpaceStation'
require_relative 'CardDealer'
require_relative 'EnemyStarShip'

module Deepspace
	class GameUniverse
		@@WIN=10
	
		#constructor
		def initialize
			@currentStationIndex=-1
			@turns=0
			@spaceStations=Array.new
			@currentStation=nil
			@dice=Dice.new
			@gameState=GameStateController.new
			@currentEnemy=nil
		end

		def combatGo (station, enemy)
			state=@gameState.state
			ch=@dice.firstShot
			
			if (ch==GameCharacter::ENEMYSTARSHIP)
				fire=enemy.fire
				result=station.receiveShot(fire)
				
				if (result==ShotResult::RESIST)
					fire=station.fire
					result=enemy.receiveShot(fire)
					enemyWins=(result==ShotResult::RESIST)
				else
					enemyWins=true
				end
				
			else 
				fire=station.fire
				result=enemy.receiveShot(fire)
				enemyWins=(result==ShotResult::RESIST)
			end
			
			if (enemyWins)
				s=station.speed
				moves=@dice.spaceStationMoves(s)
				
				if(!moves)
					damage=enemy.damage
					station.setPendingDamage(damage)
					combatResult=CombatResult::ENEMYWINS
				else
					station.move
					combatResult=CombatResult::STATIONESCAPES
				end
			
			else
				aLoot=enemy.loot
				station.setLoot(aLoot)
				combatResult=CombatResult::STATIONWINS
			
			end
			
			@gameState.next(@turns, @spaceStations.length)
			return combatResult	
	
			
		end
		
		def combat ()
			if  (state== GameState::BEFORECOMBAT) || (state== GameState::INIT) 
				return combatGo(@currentStation, @currentEnemy)
			else	
				return CombatResult::NOCOMBAT
			end
		end
		
		def discardHangar ()
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
			@currentStation.discardHangar
			end
		end
		
		def discardShieldBooster (i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				#cambiado
				@currentStation.discardShieldBooster(i)
			end
		end
		
		def discardShieldBoosterInHangar (i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				@currentStation.discardShieldBoosterInHangar(i)
			end
		end
		
		def discardWeapon (i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				@currentStation.discardWeapon(i)
			end
		end
		
		def discardWeaponInHangar (i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				@currentStation.discardWeaponInHangar(i)
			end
		end
		
		def state ()
			#revisar, no se si está bien (probably no)
			@gameState.state
		end
		
		def getUIversion()
			GameUniverseToUI.new(@currentStation,@currentEnemy)
		end
		
		def haveAWinner
			return (@currentStation.nMedals>=@@WIN)
		end
		
		def init (names)
			state=@gameState.state
			if (state==GameState::CANNOTPLAY)
				dealer=CardDealer.instance
				i=0
				while (i<names.length)
					supplies=dealer.nextSuppliesPackage
					station=SpaceStation.new(names[i], supplies)
					@spaceStations << station
					
					nh=@dice.initWithNHangars
					nw=@dice.initWithNWeapons
					ns=@dice.initWithNShields
					
					lo=Loot.new(0, nw, ns, nh, 0)
					station.setLoot(lo)
					
					i=i+1
				end	
				
				nPlayers=names.length			
				@currentStationIndex=@dice.whoStarts(nPlayers)
				@currentStation=@spaceStations[@currentStationIndex]
				#puts @currentStation
				@currentEnemy=dealer.nextEnemy
				#puts @currentEnemy
				@gameState.next(@turns, @spaceStations.length)
			end
			#puts @spaceStations.inspect
		end
		
		def mountShieldBooster (i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				@currentStation.mountShieldBooster(i)
			end
		end
		
		def mountWeapon(i)
			if (@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT)
				@currentStation.mountWeapon(i)
			end
		end
		
		def nextTurn()
			state=@gameState.state
			if (state==GameState::AFTERCOMBAT)
				stationState=@currentStation.validState
				if (stationState)
					#cambiado, mirar @spaceStationS
					@currentStationIndex= (@currentStationIndex+1) % (@spaceStations.length) 
					@turns +=1
					
					@currentStation=@spaceStations[@currentStationIndex]
					@currentStation.cleanUpMountedItems
					dealer=CardDealer.instance
					@currentEnemy=dealer.nextEnemy
					@gameState.next(@turns, @spaceStations.length)
					
					return true
				end
				return false
			end
			return false
		end
	end
end