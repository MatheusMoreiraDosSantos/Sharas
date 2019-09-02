/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

/**
 *
 * @author maikon.rosa
 */


import controller.Validacoes;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.*;
public class F_email {
    Validacoes valid = new Validacoes();
    public  void Enviar(JTextField email,String senha) {
      Properties props = new Properties();
//Conectar com o servidor Gmail
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.socketFactory.port", "465");
    props.put("mail.smtp.socketFactory.class", 
    "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "465");
 
    Session session = Session.getDefaultInstance(props,
      //Usuário e senha do gmail
            new javax.mail.Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() 
           {
                 return new PasswordAuthentication("systemawalla@gmail.com", 
                 "2017mm2019");
           }
      });
    try {
 
      Message message = new MimeMessage(session);
   //quem envia
      message.setFrom(new InternetAddress("systemawalla@gmail.com")); 
     //mensagem 
      Address[] toUser = InternetAddress.parse(email.getText());  
 
      message.setRecipients(Message.RecipientType.TO, toUser);
      message.setSubject("Senha do Sistema sharas");
      message.setText("Foi requisitado seu login ou senha no sistema Sharas.\n"
              + " por favor siga os sequintes passos \n"
              + "\t\t 1° Logue no sistema com a senha: \t"+senha+"\n"
              + "\t\t 2° Altere a sua senha na parte de Gerenciamento de conta\n"
              + "Com os seguintes passos sera gerado uma nova senha");
      /**Método para enviar a mensagem criada*/
      Transport.send(message);
 
        JOptionPane.showMessageDialog(null,"email enviado");
 
     } catch (MessagingException f) {
        JOptionPane.showMessageDialog(null,"não enviado");
         throw new RuntimeException(f);
    }
 
 }
  public boolean verificaEmail(JTextField email , JLabel emailerro){
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


}
    

