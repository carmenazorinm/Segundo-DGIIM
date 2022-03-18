/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */
public class TestP1 {
    public static void main(String []args){
        //System.out.print("Hola");
        
        WeaponType laser = WeaponType.LASER;
        System.out.println("Laser power = " + laser.getPower());
        WeaponType missile = WeaponType.MISSILE;
        System.out.println("Missile power = " + missile.getPower());
        WeaponType plasma = WeaponType.PLASMA;
        System.out.println("Plasma power = " + plasma.getPower());
        
        
        Loot loot = new Loot(0,4,50,6,-7);
        System.out.println("Loot supplies = " + loot.getNSupplies());
        System.out.println("Loot weapons = " + loot.getNWeapons());
        System.out.println("Loot shields = " + loot.getNShields());
        System.out.println("Loot hangars = " + loot.getNHangars());
        System.out.println("Loot medals = " + loot.getNMedals());
        
        SuppliesPackage suppliespack = new SuppliesPackage(1.0f,2.9f,3.5098f);
        System.out.println("Ammonition power = " + suppliespack.getAmmoPower());
        System.out.println("Fuel units = " + suppliespack.getFuelUnits());
        System.out.println("Shield power = " + suppliespack.getShieldPower());
                
        
    }
}
