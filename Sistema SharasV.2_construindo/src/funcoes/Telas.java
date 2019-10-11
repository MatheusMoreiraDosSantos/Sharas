/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funcoes;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import view.JF_Celeiro;
import view.JF_Cliente;
import view.JF_Financeiro;
import view.JF_Log;
import view.JF_Pastagem;
import view.JF_Principal1;
import view.JF_Servico;
import view.JF_Ususario;
import view.JF_Veterinario;
import view.JF_animais;
import view.JF_calendario;
import view.JF_ferrageamento;
import view.JF_funcionarios;

/**
 *
 * @author maikon.rosa
 */
public class Telas {
    //Faz a alteração das telas de forma controlada
    /**
     * 
     * @param aberta pega a tela que está aberta 
     * @param tela o numero da tela que vai aparecer 
     * 1 para tela prncipal(home)
     * 2 Cadastro de cliente 
     * 3 Vendas/serviços
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
     * 12 log 
     * 13Usuarios 
     */
    public void alterar(JFrame aberta, int tela){
        JFrame n_tela = null; 
        //pega como parametro o nome da tela que vai abrir 
        switch(tela){ 
            case 1 : n_tela = new JF_Principal1();break;
            case 2 : n_tela = new JF_Cliente();break;
            case 3:  n_tela = new JF_Servico();break;
           case 4:  n_tela = new JF_calendario();break;
            case 5: n_tela= new JF_animais() ;break;
            case 6 :n_tela = new JF_Pastagem();break;
            case 7 : n_tela = new JF_Celeiro();break;
            case 8 :n_tela=new JF_ferrageamento();break;
             case 9:n_tela = new JF_Veterinario();break;
             case 10:n_tela = new JF_Financeiro();break;
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
    
}
