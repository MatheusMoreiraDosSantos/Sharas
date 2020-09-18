/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import com.toedter.calendar.JDateChooser;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.sql.Date;
import java.util.InputMismatchException;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author maikon.rosa
 */
public class Validacoes {
    public java.sql.Date data;
 //Validção de campos com JTextfield , que retornam verdadeiro ou falso 
    char numeros[] = {'1','2','3','4','5','6','7','8','9'};
   //Para a verificação de campos de textos 
    public boolean CampoTexto(JTextField campo,JLabel erro){   
     erro.setText("");
        if(campo.getText().equals("")){
           erro.setText("Campo não pode estar vazio");
            return  (false);
        }else
          return (true);
}
    //Para a verificação de campos numericos 
    public boolean Camponumero(JTextField campo,JLabel erro){
    try{
            float num = Float.parseFloat(campo.getText());
            if(num > 0)
                return (true);
            else{
                erro.setText("o valor não pode ser zero");
                return(false);}
    }catch(NumberFormatException e){
            erro.setText("Numero inválido");
            return (false);
    }
    }
    //Para campos de datas  
    public boolean  Campodata(JDateChooser  campo,JLabel erro){
   erro.setText("");
        try{
   data = new java.sql.Date(campo.getDate().getTime());
    return (true);
    }catch(Exception e){
    erro.setText("Data inválida");
        return (false);
    }}
    // Para validar combox
    public boolean Campoescolha(JComboBox campo,JLabel erro){
       erro.setText("");
        if(campo.getSelectedIndex() == 0){
            erro.setText("Escolha inválida");
            return (false);
        }
                    return(true);
    }
    //Para validar senha , Tamanho ou se é igual a confirmação;
    public boolean Camposenha(JTextField senha,JTextField confirmasenha,JLabel erro){
      erro.setText("");
        if(senha.getText().length() >= 4 && senha.getText().length() <=15){
            if(senha.getText().equals(confirmasenha.getText())){
                      return (true);
            }else{
            erro.setText("senha diferente da confirmação");
            return (false);
            }
      }else{
         erro.setText("Senha deve ter entre 4 a 15 caracteres");
         return (false);
      } 
    }
//Para validar o cpf 
    public static boolean campocpf(JTextField Cpf,JLabel erro) {
        erro.setText("");
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
       // verifica se o email tem caracteristicas de validade 
  public boolean campoEmail(JTextField email , JLabel emailerro){
      emailerro.setText("");  
      int c=0,c2=0;
        for(int i=0;i<email .getText().length();i++){
             char r = email .getText().charAt(i);
             if(r == '@'){
                 c++;
             }else if(r == '.'){
              c2++;
           }
        }
        if(c == 1 && c2>0){        
            return(true);
        }else{
          email.setText("");
          emailerro.setText("Email inválido");
        }    
      return (false);     
  }
public boolean campoTelefone(JTextField campo,JLabel erro,String string){
    erro.setText("");
    campo.setText(string);
    if(campo.getText().length()<=14 && campo.getText().length() >= 10){//comapara o tamanho dos dados 
        String numero = "";//cria a string que recebera somente numeros 
       for(int i =0;i<campo.getText().length();i++){//inicia o processo para verificar se tem numeros
       char n = campo.getText().charAt(i);
            for(int j = 0;i<9;i++){
              if(n==numeros[i]){
              numero=numero+n;
              }}}
              System.out.println(""+numero.length());
       if(numero.length()==10 || numero.length()==11)//comparas se os campo tem quantidade de numeros validos
           
           return (true);
       else{
        erro.setText("numero imvalido");
       return (false);   
       }
   }
   erro.setText("numero imvalido");
   return(false);
}  
public Boolean campoEspescial(JTextField campo,String nome,JLabel erro){
String valid = JOptionPane.showInputDialog("Digite o "+nome+ "outra vez","Campo Importante");
if(!campo.getText().equals(valid)&&!campo.getText().equals("")){
    erro.setText("Confirmação Inválida ");
    return (false);
}else 
return(true);
}

}
