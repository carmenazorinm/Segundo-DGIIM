
module Deepspace

# 2.3.17 - Translation from Java
# @author Profe
    
class DamageToUI
  
  attr_reader :nWeapons, :weapons, :nShields
  
  def initialize (d) 
    @nWeapons=d.getNWeapons
    @nShields=d.getNShields
    tmp=d.getWeapons
    if (tmp!=nil) then
      @weapons=Array.new(tmp)
    else
      @weapons=nil
    end
  end
    
  public
  
  def getWeaponInfo() 
    out = "";
    
    if (@nWeapons == -1) then
      out += "[" + @weapons.join(", ") + "]"
    else
      out += @nWeapons.to_s
    end
    return out
  end
    
  def to_s
    out = "Weapons: " + getWeaponInfo() + ", Shields: #{@nShields}"
  end
  
end # class

end # module
