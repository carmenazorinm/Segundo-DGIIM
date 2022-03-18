/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */

class Weapon {
    private String name;
    private WeaponType type;
    private int uses;
    
    Weapon(String n, WeaponType t, int u){
        name = n;
        type = t;
        uses = u;
    }
    
    Weapon (Weapon w){
        name = w.name;
        type = w.getType();
        uses = w.getUses();
    }
    
    public WeaponType getType(){
        return type;
    }
    
    public int getUses(){
        return uses;
    }
    
    public float power(){
        return type.getPower();
    }
    
    public float useIt(){
        if(uses > 0){
            uses--;
            return power();
        }
        else return 1;
    }
}