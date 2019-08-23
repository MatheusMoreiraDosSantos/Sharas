/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import javax.swing.*;


/**
 *
 * @author maiko
 */
public class F_JF_principal {
    
    public void removerPainel(JTabbedPane telas ,JPanel painel){
       telas.setVisible(true);
       telas.removeAll();
       telas.add(painel);
    }
    public static boolean camponull(String campo){
        if(campo == null){
           System.out.println(""+campo);
            return (false);
        }
     
        else{
              System.out.println(""+campo);
        return (true);
        }
                
    }
    
    public static boolean Verifsenha(String senha, String confirma_senha){
      if(senha == null){
       return (false);
      }
      if(senha.equals(confirma_senha)){
       if(senha.length() >= 4 && senha.length() <= 15){    
           return (true);
      }else{
           return (false);}}
      return (false);   
    }
    
   public static void main(String[] args){
    String senha1= JOptionPane.showInputDialog(null, "senha1");
     String senha2= JOptionPane.showInputDialog(null, "senha2");
    if(camponull(senha1)){
       JOptionPane.showMessageDialog(null, "deuc certo");
    }
   }
    
}
