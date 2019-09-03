/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import java.sql.Date;
import javax.swing.*;
import com.toedter.calendar.JDateChooser;
import java.util.InputMismatchException;

/**
 *
 * @author maiko
 */
public class F_JF_principal {
    
    public void telefoneformato(JTextField campo){
     String numero = "";
        if(campo.getText().length()==4){
         campo.setText(campo.getText()+"-");
     }
     if(campo.getText().length()==10){
         for(int i =0;i<campo.getText().length();i++){
           char n= campo.getText().charAt(i);
          if(n!='-'){
            numero= numero+""+n;
          }
            if(numero.length()==5){
          numero=numero+'-';
     }
         }
         campo.setText(numero);
     }
    }
    public void nivelacesso(JButton a,JButton b,JButton c){
    
    
    }
    public boolean desativado(JComboBox campo){
        if(campo.getSelectedIndex()==0){  
        String opcoes[] = {"Sim", "Não"};
        int opc = JOptionPane.showOptionDialog(null, "Deseja salvar usuário como 'Desativado ' ?", "Confirmação"
                       , JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, opcoes, opcoes[1]);
        if (opc == 0) {
                return (true);
        } else{
                return(false);
        }
        }
        return (true);   
    }
    public boolean combonull(JComboBox campo){
        String n = campo.getName();
        System.out.println(""+n);
        if(campo.getSelectedIndex() == 0){
                    return (false);
        }
                    return(true);
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
    public void removerTable(JTabbedPane telas ,JTabbedPane painel){
       telas.setVisible(true);
       telas.removeAll();
       telas.add(painel);
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
      public static boolean textareanull(JTextArea campo,JLabel erro){
        if(!"".equals(campo.getText())){
            erro.setText("");
             System.out.println(""+campo.getText());
            return(true);
        }else{
              erro.setText("preencha o capo ");
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
            senhaerro.setText("senha deve ter entre 4 e 15 caractere");
           return (false);
        }
    }
    //Verifica se o cpf é valido 
        public static boolean cpf(JTextField Cpf,JLabel erro) {
          String CPF = ""; 
      //Loop que ignora tudo que não for numero  
          for(int i=0;i<Cpf.getText().length();i++){
         char s = Cpf.getText().charAt(i);
         if(   s == '1' || s == '2' || s == '3'
            || s == '4' || s == '5' || s == '6'
            || s == '7' || s == '8' || s == '9'  
            || s == '0'){
             CPF=CPF+s;
         }
       }            
// considera-se erro CPF's formados por uma sequencia de numeros iguais
        if (CPF.equals("00000000000") ||
            CPF.equals("11111111111") ||
            CPF.equals("22222222222") || CPF.equals("33333333333") ||
            CPF.equals("44444444444") || CPF.equals("55555555555") ||
            CPF.equals("66666666666") || CPF.equals("77777777777") ||
            CPF.equals("88888888888") || CPF.equals("99999999999") ||
            (CPF.length() != 11)){
            erro.setText("CPF inválido");
            return(false);
            
        }
        char dig10, dig11;
        int sm, i, r, num, peso;
          
        // "try" - protege o codigo para eventuais erros de conversao de tipo (int)
        try {
        // Calculo do 1o. Digito Verificador
            sm = 0;
            peso = 10;
            for (i=0; i<9; i++) {              
        // converte o i-esimo caractere do CPF em um numero:
        // por exemplo, transforma o caractere '0' no inteiro 0         
        // (48 eh a posicao de '0' na tabela ASCII)         
            num = (int)(CPF.charAt(i) - 48); 
            sm = sm + (num * peso);
            peso = peso - 1;
            }
          
            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                dig10 = '0';
            else dig10 = (char)(r + 48); // converte no respectivo caractere numerico
          
        // Calculo do 2o. Digito Verificador
            sm = 0;
            peso = 11;
            for(i=0; i<10; i++) {
            num = (int)(CPF.charAt(i) - 48);
            sm = sm + (num * peso);
            peso = peso - 1;
            }
          
            r = 11 - (sm % 11);
            if ((r == 10) || (r == 11))
                 dig11 = '0';
            else dig11 = (char)(r + 48);
          
        // Verifica se os digitos calculados conferem com os digitos informados.
            if ((dig10 == CPF.charAt(9)) && (dig11 == CPF.charAt(10)))
                 return(true);
            else{ 
                erro.setText("CPF inválido");
                return(false);}
                } catch (InputMismatchException e) {
                   erro.setText("CPF inválido");
                    return(false);
                }
            
        }
    public boolean verificaBanco(JTextField campo,String nomebanco){
       
        return (true); 
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
