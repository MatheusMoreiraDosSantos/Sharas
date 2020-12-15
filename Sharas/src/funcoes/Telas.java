/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import java.awt.Dimension;
import java.awt.Toolkit;
import javax.swing.*;
import model.Sessao;
import view.JF_Haras;
import view.JF_Cliente;
import view.JF_Contrato;

import view.JF_Log;

import view.JF_Principal1;
import view.JF_Ususario;

//import view.JF_animais;
import view.JF_calendario;

import view.JF_funcionarios;

/**
 *
 * @author maikon.rosa
 */
public class Telas {
    
public void SessaoB(JButton haras,JButton log,JButton usuario,JButton rh){
    Sessao sessao = new Sessao();
            if(sessao.getUsario_cargo()<5){
            rh.setVisible(false);
            haras.setVisible(false);
            log.setVisible(false);
            usuario.setVisible(false); 
           }else if(sessao.getUsario_cargo()<6){
            log.setVisible(false);
            usuario.setVisible(false);       
            }else{
            
            
            
            }
                 
    
    
    }


//Faz a alteração das telas de forma controlada
    /**
     * 
     * @param aberta pega a tela que está aberta 
     * @param tela o numero da tela que vai aparecer 
     * 1 para tela prncipal(home)
     * 2 Cadastro de cliente 
     * 3 Vendas/serviços/contrato
     * 4 calendario
     * 5 animais 
     * 6 pastagem
     * 7 Celeiro
     * //Telas especiais 
     *8 ferrejeamento 
     * 9 veterinario 
     * //Tela de alto nivel 
     * 10 financeiro 
     * 11  cadastrar funcionario
     * 12 Usuarios 
     * 13log
     */
    
    public void alterar(JFrame aberta, int tela){
      
        
        JFrame n_tela = null; 
        //pega como parametro o nome da tela que vai abrir 
        switch(tela){ 
            case 1 : n_tela = new JF_Principal1();break;
            case 2 : n_tela = new JF_Cliente();break;
            case 3:  n_tela = new JF_Contrato();break;
           case 4:  n_tela = new JF_calendario();break;
           // case 5: n_tela= new JF_animais() ;break;
            case 7 : n_tela = new JF_Haras();break;
             case 11: n_tela = new JF_funcionarios();break;
             case 12:   n_tela = new JF_Ususario() ; break;
             case 13:n_tela=new JF_Log();break;
        
             default: JOptionPane.showMessageDialog(aberta, "tela não encontrada");
         }
        if(n_tela != null){
        n_tela.setVisible(true);
        aberta.dispose();
        }
        
    }
      public void Resolucao(JFrame j) {

        Toolkit tk = Toolkit.getDefaultToolkit();
        Dimension d = tk.getScreenSize();
        j.setSize(d.width, d.height);
    
        
    }
      public void alterarTelaAnimal(JLabel nome,JLabel registro,JTextField txtregistro,JLabel proprietario,JLabel nasc,JLabel sexo,
          JCheckBox ch_nome,JCheckBox ch_proprietario,JCheckBox ch_nasc,JCheckBox ch_sexo,JButton cadastrar,JButton alterar,JButton cancelar){
      nome.setText(mudarTexto(nome));
      if(registro.isVisible())
         registro.setVisible(false);
      else
          registro.setVisible(true);
      proprietario.setText(mudarTexto(proprietario));
      nasc.setText(mudarTexto(nasc));
      sexo.setText(mudarTexto(sexo));
          altenarcheck(ch_sexo);
          altenarcheck(ch_nome);
          altenarcheck(ch_proprietario);
          altenarcheck(ch_nasc);
          altenarbotao(cadastrar, alterar, cancelar);
      }
      public void alterarTelaservco(JLabel nome,JLabel cat,JLabel preco,JCheckBox ch_nome,JCheckBox ch_cat,JCheckBox ch_preco, JButton cadastrar,JButton alterar,JButton cancelar){
      nome.setText(mudarTexto(nome));
      cat.setText(mudarTexto(cat));
      preco.setText(mudarTexto(preco));
          altenarcheck(ch_cat);
          altenarcheck(ch_nome);
          altenarcheck(ch_preco);
          altenarbotao(cadastrar,alterar,cancelar);
      }
    public void alterartelaUsuario(JLabel login,JLabel senha,JLabel status,JCheckBox ch_login,JCheckBox ch_senha,JCheckBox ch_status,JButton cad,JButton alterar,JButton cancelar){
    login.setText(mudarTexto(login));
    senha.setText(mudarTexto(senha));
    status.setText(mudarTexto(status));
        altenarcheck(ch_senha);
        altenarcheck(ch_login);
        altenarcheck(ch_status);
   
        altenarbotao(cad,alterar,cancelar);
    
    }
    public void alterarTelacliente(JLabel nome,JLabel cpf,JLabel email,JLabel tel/*labels*/
    /*checkbox*/,JCheckBox md_nome,JCheckBox md_cpf,JCheckBox md_email,JCheckBox md_tel,JButton cad,JButton alt,JButton cancelar,JPanel painel){
    nome.setText(mudarTexto(nome));
    cpf.setText(mudarTexto(cpf));
    email.setText(mudarTexto(email));
    tel.setText(mudarTexto(tel));
      altenarcheck(md_cpf);
      altenarcheck(md_email);
      altenarcheck(md_nome);
      altenarcheck(md_tel);
    if(painel.isVisible())
        painel.setVisible(false);
    else{
        painel.setVisible(true);
    }
      altenarbotao(cad,alt,cancelar);
    
    }
    public void altenarcheck(JCheckBox ch){
    if(ch.isVisible())
        ch.setVisible(false);
    else 
        ch.setVisible(true);
    }
    public void altenarbotao(JButton cadastrar,JButton alterar,JButton cancelar){
    if(cadastrar.isVisible())
        cadastrar.setVisible(false);
    else
        cadastrar.setVisible(true);
     if(alterar.isVisible())
        alterar.setVisible(false);
    else
        alterar.setVisible(true);
       if(cancelar.isVisible())
        cancelar.setVisible(false);
    else
        cancelar.setVisible(true);
    
    }
    
public String mudarTexto(JLabel lbl){
    String n = lbl.getText();
    String md = "Mudar ";
    String alterado="";
    char teste = n.charAt(0);
    if(teste=='M'){
    for(int i =0;i<n.length();i++){
    if(i>5){
        char alterar = n.charAt(i);
        alterado=alterado+alterar;
    }
    }
    return alterado;
    }else{
    return md+n;
    }

}
}