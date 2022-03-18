/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */
public enum WeaponType {
    LASER(2.0f),
    MISSILE(3.0f),
    PLASMA(4.0f);
    
    private float power;
    
    WeaponType(float p){
        power = p;
    }
    
    float getPower(){
        return power;
    }
}