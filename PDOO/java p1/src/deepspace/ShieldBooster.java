/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */
class ShieldBooster {
    private String name;
    private float boost;
    private int uses;
    
    ShieldBooster(String n, float b, int u){
        name = n;
        boost = b;
        uses = u;
    }
    
    ShieldBooster(ShieldBooster sb){
        name = sb.name;
        boost = sb.getBoost();
        uses = sb.getUses();
    }
    
    public float getBoost(){
        return boost;
    }
    
    public int getUses(){
        return uses;
    }
    
    public float useIt(){
        if (uses > 0){
            uses--;
            return boost;
        }else
            return 1;
    }
}