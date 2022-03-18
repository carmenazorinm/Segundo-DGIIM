/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package deepspace;
import java.util.Random; //PARA DETECTAR RANDOM

/**
 *
 * @author carmenc
 */
public class Dice {
    private final float NHANGARSPROB;
    private final float NSHIELDSPROB;
    private final float NWEAPONSPROB;
    private final float FIRSTSHOTPROB;
    private Random generator;
    
    Dice(){
        NHANGARSPROB = (float)0.25;
        NSHIELDSPROB = (float) 0.25;
        NWEAPONSPROB= (float) 0.33;
        FIRSTSHOTPROB = (float) 0.5;
        generator = new Random(); //generator.nextFloat
    }
    
    int initWithNHangars(){
        float nrandom = generator.nextFloat();
        if(nrandom < NHANGARSPROB)
            return 0;
        else
            return 1;
    }
    
    int initWithNWeapons(){
        float nrandom = generator.nextFloat();
        if(nrandom < 2*NWEAPONSPROB)
            if(nrandom < NWEAPONSPROB)
                return 1;
            else
                return 2;
        else
            return 3;
    }
    
    int initEithNShields(){
        float nrandom = generator.nextFloat();
        if(nrandom < NSHIELDSPROB)
            return 0;
        else
            return 1;
    }
    
    int whoStarts(int nPlayers){
        return generator.nextInt(nPlayers);
    }
    
    GameCharacter firstShot(){
        float nrandom = generator.nextFloat();
        if(nrandom < FIRSTSHOTPROB)
            return GameCharacter.SPACESTATION;
        else
            return GameCharacter.ENEMYSTARSHIP;
    }
    
    boolean spaceStationMoves(float speed){
        float nrandom = generator.nextFloat();
        if(nrandom < speed)
            return true;
        else
            return false;
    }
}
