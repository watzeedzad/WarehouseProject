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
public class Utility {
    public static int isPrime(int n){
        boolean prime = n>1? true:false;
        for (int i = 2; i < n/2+1; i++) {
            if(n%i==0){
                return i;
            }
        }
        return (n<2?-1:1);
    }
    public static void main(String[] args){
        for (int i = 1; i < 100; i++) {
            int x = isPrime(i);
            if(x<1){
                System.out.println("Invalid number:"+i+"(is not prime number)");
            }else if(x==1){
                System.out.println(i+"is prime number");
            }else{
                System.err.println(i+"is not prime number");
            }
        }
    }
}
