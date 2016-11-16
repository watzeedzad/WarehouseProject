/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.model;

/**
 *
 * @author int303
 */
public class TestDice {
    public static void main(String[] args) {
        Dice d1 = new Dice();
        for (int i = 0; i < 10; i++) {
            System.out.println("Face: "+d1.getFace());
            d1.roll();
        }
    }
}
