/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import java.sql.Date;
import javax.swing.*;
import com.toedter.calendar.JDateChooser;

/**
 *
 * @author maiko
 */
public class F_JF_principal {
    
    public void nivelacesso(JButton a,JButton b,JButton c){
    
    
    }
    //Converte a data e retorna nulo ser for inválida
    public static Date convertedata(JDateChooser data, JLabel nasc){
    try{
        java.sql.Date sqldata = new java.sql.Date(data.getDate().getTime());    
        nasc.setText("");
       return sqldata;
    }catch(Exception e){
        nasc.setText("Data inválida");
        return null;
    }
    }
    public void desabilitarbotao(JButton excluir , JButton alterar){
       excluir.setEnabled(false);
       alterar.setEnabled(false);
    }
    public void removerPainel(JTabbedPane telas ,JPanel painel){
       telas.setVisible(true);
       telas.removeAll();
       telas.add(painel);
    }
    //retorna falso se o campo estiver vazio
    public static boolean camponull(JTextField campo,JLabel erro){
        if(!"".equals(campo.getText())){
            erro.setText("");
             System.out.println(""+campo.getText());
            return(true);
        }else{
              erro.setText("preencha o capo acima");
              System.out.println(""+campo.getText());
              return (false);
        }
                
    }
    //Verifica a senha e retorna verdadeiro ou falso 
    public static boolean Verifsenha(JTextField senha, JTextField  confirma_senha,JLabel senhaerro ,JLabel senhaconf){
        if(senha.getText().length() >= 4 && senha.getText().length() <= 15){
            senhaerro.setText("");
              if(senha.getText().equals(confirma_senha.getText())){
                senhaconf.setText("");
                  return (true);
                 }else
                    senhaconf.setText("Senhas diferentes");
                        return (false);
            }else{
           return (false);
        }
        
    }
    
  /* 
    //Main para testes 
    public static void main(String[] args){
    String senha1= JOptionPane.showInputDialog(null, "senha1");
     String senha2= JOptionPane.showInputDialog(null, "senha2");
    if(camponull(senha1)){
       JOptionPane.showMessageDialog(null, "deuc certo");
    }
   }*/
    
}
