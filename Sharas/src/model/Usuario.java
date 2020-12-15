/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import controller.LogarDAO;
import controller.ValidacoesDao;
import java.util.Objects;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

/**
 *
 * @author maikon.rosa
 */
public class Usuario {
    LogarDAO logar = new LogarDAO();
    
    private int usuario_id;
       private String usuario_login; 
       private String  usuario_senha;
       private  int usuario_tipo;
        private int usuario_status;
        private String usuario_notificacao ;
        private int pessoa_pessoa_id;
   //**********************************************************//     
        public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
      
        this.usuario_id = usuario_id;
    }

    public String getUsuario_login() {
        return usuario_login;
    }

    public void setUsuario_login(String usuario_login) {
            this.usuario_login = usuario_login;
    }

    public String getUsuario_senha() {
        return usuario_senha;
    }

    public void setUsuario_senha(String usuario_senha) {
        this.usuario_senha = usuario_senha;
    }

    public int getUsuario_tipo() {
        return usuario_tipo;
    }

    public void setUsuario_tipo(int usuario_tipo) {
       if(usuario_tipo>1)
        this.usuario_tipo = usuario_tipo;
       else 
         this.usuario_tipo = 1;  
    }

    public int getUsuario_status() {
        return usuario_status;
    }

    public void setUsuario_status(int usuario_status) {
       if(usuario_status == 0){
            String opcoes[] = {"Sim", "Não"};
        int opc = JOptionPane.showOptionDialog(null, "Deseja salvar usuário como 'Desativado ' ?", "Confirmação"
                       , JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, opcoes, opcoes[1]);
        if (opc == 0) 
                this.usuario_status = 0;
      else
               this.usuario_status = 1;
       }else
         this.usuario_status = usuario_status;
    }

    public String getUsuario_notificacao() {
        return usuario_notificacao;
    }

    public void setUsuario_notificacao(String usuario_notificacao) {
        this.usuario_notificacao = usuario_notificacao;
    }

    public int getPessoa_pessoa_id() {
        return pessoa_pessoa_id;
    }

    public void setPessoa_pessoa_id(int pessoa_pessoa_id) {
        this.pessoa_pessoa_id = pessoa_pessoa_id;
    }
}
