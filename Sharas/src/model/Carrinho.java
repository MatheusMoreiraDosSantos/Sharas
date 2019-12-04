/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author maiko
 */
public class Carrinho extends Servico{
 
  static private int carrinhoid = 0;

    public int getCarrinhoid() {
        return carrinhoid;
    }
  public void setCarrinhoid2(int carrinhoid){
      this.carrinhoid = carrinhoid;
  }
    public void setCarrinhoid(int carrinhoid) {
       if(carrinhoid==0)
        this.carrinhoid = 1;
       else
        this.carrinhoid = carrinhoid+1;   
    }
  
   public void zerarCarrinho(){
     this.carrinhoid = 0;
   }
}
