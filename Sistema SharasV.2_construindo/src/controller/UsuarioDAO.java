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
import model.Usuario;

/**
 *
 * @author maikon.rosa
 */
public class UsuarioDAO {
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
      public void  selectpessoa(Usuario usuario){
          try{
          con = Conexao.conectar();
            sql = "SELECT pessoa_id from pessoa where pessoa_cpfcnpj=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getPessoa_cpfcnpj());  
          rs=pst.executeQuery();
          if(rs.next()){
              usuario.setPessoa_id(rs.getInt("pessoa_id"));
          }
          Conexao.desconectar();
          }catch(SQLException e){                     
          }
      }
       public void salvarUsuario(Usuario usuario, JFrame jfUsuario) {
         try {
           
            salvarPessoa(usuario, jfUsuario);
            selectpessoa(usuario);
             con = Conexao.conectar();
            sql = "INSERT INTO usuario (usuario_id, usuario_senha, usuario_tipo, usuario_status, usuario_notificacao, pessoa_pessoa_id, usuario_login) "
                  + "VALUES (NULL, md5(?), '0', ?, ?, ?,?);";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getUsuario_senha());
            //pst.setInt(2, usuario.getUsuario_tipo());
            pst.setInt(2, usuario.getUsuario_status());
            pst.setString(3, usuario.getUsuario_notificacao());
            pst.setInt(4, usuario.getPessoa_id());
            pst.setString(5, usuario.getUsuario_login());
            pst.execute();
            Conexao.desconectar();
            JOptionPane.showMessageDialog(jfUsuario, "Cadastrado com Sucesso!");
        }catch(SQLException e){
                System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
    }

}
