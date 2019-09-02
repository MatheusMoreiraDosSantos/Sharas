/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import model.Usuario;

/**
 *
 * @author maiko
 */
public class PessoaDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
   
      public void salvarPessoa(Usuario usuario, JFrame jfUsuario) {
         try {
            con = Conexao.conectar();
            sql = "INSERT INTO pessoa (pessoa_id , pessoa_ind, pessoa_cpfcnpj, pessoa_nome, pessoa_email,pesoa_cargo)"
                   +" VALUES (NULL, 'pf', ?, ?, ?, '1');";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getPessoa_cpfcnpj());
            pst.setString(2, usuario.getPessoa_nome());
            pst.setString(3, usuario.getPessoa_email());
            //pst.setInt(4, usuario.getPessoa_cargo());
            pst.execute();
            Conexao.desconectar();
        }catch(SQLException e){
                 System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
    }
              public void alterarUsu(JTextField campo,Usuario usuario,String campotabela,String nome,UsuarioDAO usu){
          System.out.println(""+usu.id);
                  try{
           con = Conexao.conectar();
            sql = "update  pessoa  set "+campotabela+"=? where pessoa_cpfcnpj =?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            pst.setString(2,usu.id); 
            pst.execute();
             JOptionPane.showMessageDialog(null, nome+" alterado com Sucesso!");
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
        
        }
}
