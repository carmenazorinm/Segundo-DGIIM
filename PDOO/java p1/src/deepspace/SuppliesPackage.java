/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */
class SuppliesPackage {
    private float ammoPower;
    private float fuelUnits;
    private float shieldPower;
    
    SuppliesPackage(float ammopower, float fuelunits, float shieldpower){
        ammoPower = ammopower;
        fuelUnits = fuelunits;
        shieldPower = shieldpower;
    }
    
    SuppliesPackage(SuppliesPackage s) {
        //no se comparten direcciones de memoria
        ammoPower = s.getAmmoPower();
        fuelUnits = s.getFuelUnits();
        shieldPower = s.getShieldPower();
    }
    
    public float getAmmoPower(){
        return ammoPower;
    }
    
    public float getFuelUnits(){
        return fuelUnits;
    }
    
    public float getShieldPower(){
        return shieldPower;
    }
}