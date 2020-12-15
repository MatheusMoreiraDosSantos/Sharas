/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import java.sql.*;
import javax.swing.*;
import model.*;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author maikon.rosa
 */
public class UsuarioDAO {
    public String id;
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    Usuario usuario = new Usuario();
     
      //Carregar tabela
      public void carregaTabela(int modo,JTable tabela, JTextField pesquisa){
          try{
            con = Conexao.conectar();
           switch(modo){
               case 1: sql = "select * from tab_usu where Nome like ?";break;
               case 2: sql="select * from tab_usu where Nome like ? and Login <> 'Sem usúario'";break;
               case 3: sql= "select * from tab_usu where Nome like ? and Login ='Sem usúario'";break;
           }
            pst = con.prepareStatement(sql);
            pst.setString(1, "%"+pesquisa.getText()+"%");
            rs= pst.executeQuery();
            tabela.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
          }catch(SQLException e){
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
      }
      public void cadUsuario(Usuario usuario){
          try{
            con = Conexao.conectar(); 
             sql= "insert into usuario values (null,md5(?),?,null,?,?)";
            pst = con.prepareStatement(sql);
           pst.setString(1, usuario.getUsuario_senha());//usuario senha 
           pst.setInt(2, usuario.getUsuario_status());//usuario status
          pst.setInt(3, usuario.getPessoa_pessoa_id());
         pst.setString(4, usuario.getUsuario_login());       //usuario login
           pst.execute();
           JOptionPane.showInputDialog(null,"Usuario cadastrado");
            Conexao.desconectar();
          }catch(SQLException e){
               JOptionPane.showInputDialog(null,"Erro ao cadastrar");
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
      }
          
      
      public void deletarUsu(Usuario usuario){
            String opcoes[] = {"Sim", "Não"};
        int opc = JOptionPane.showOptionDialog(null, "Deseja deletar  usuário  ?", "Confirmação"
                       , JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, opcoes, opcoes[1]);
        if (opc == 0){
          try{
            con = Conexao.conectar(); 
             sql= "delete from usuario WHERE pessoa_pessoa_id = ? ";
            pst = con.prepareStatement(sql);
            pst.setInt(1, usuario.getPessoa_pessoa_id());
              pst.execute();
           JOptionPane.showInputDialog(null,"Usuario deletado");
            Conexao.desconectar();
          }catch(SQLException e){
               JOptionPane.showInputDialog(null,"Erro ao deletar");
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }}
        
      }
      public void alterarUsuario(Usuario usuario,int n){
                 try{
            String campo = null;         
            con = Conexao.conectar(); 
           switch(n){
               case 1: sql="UPDATE usuario SET usuario_login = ?  WHERE pessoa_pessoa_id = ?";campo = "Login";
               case 2: sql="UPDATE usuario SET usuario_senha = md5(?)  WHERE pessoa_pessoa_id = ?";campo = "Senha";
               case 3: sql="UPDATE usuario SET usuario_status = ?  WHERE pessoa_pessoa_id = ?";campo = "Status"; 
           }  
            pst = con.prepareStatement(sql);
            pst.setInt(2, usuario.getPessoa_pessoa_id());
            switch(n){
                case 1:   pst.setString(1, usuario.getUsuario_login());break;
                case 2:   pst.setString(1, usuario.getUsuario_senha());break;
                case 3:  pst.setInt(1, usuario.getUsuario_status());break;
            }
              pst.execute();
           JOptionPane.showInputDialog(null,  campo+"  Alterado");
            Conexao.desconectar();
          }catch(SQLException e){
               JOptionPane.showInputDialog(null,"Erro ao deletar");
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
      }
}
