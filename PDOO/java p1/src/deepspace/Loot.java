/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;

/**
 *
 * @author carmenc
 */
class Loot {

    private int nSupplies;
    private int nWeapons;
    private int nShields;
    private int nHangars;
    private int nMedals;
    
    Loot (int nsupplies, int nweapons, int nshields, int nhangars, int nmedals){
        nSupplies = nsupplies;
        nWeapons = nweapons;
        nShields = nshields;
        nHangars = nhangars;
        nMedals = nmedals;
    }
    
    public int getNSupplies(){
        return nSupplies; //hace falta poner this.nSupplies?
    }
    
    public int getNWeapons(){
        return nWeapons;
    }
    
    public int getNShields(){
        return nShields;
    }
    
    public int getNHangars(){
        return nHangars;
    }
    
    public int getNMedals(){
        return nMedals;
    }
}