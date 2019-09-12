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
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import model.Misc;
import model.Usuario;
import model.Pessoa;
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
      public void  selectusuario(Usuario usuario){
          try{
          con = Conexao.conectar();
            sql = "SELECT usuario_id from usuario where usuario_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, usuario.getUsuario_id());  
          rs=pst.executeQuery();
          if(rs.next()){
              usuario.setUsuario_id(rs.getInt("usuario_id"));
          }
          Conexao.desconectar();
          }catch(SQLException e){                     
          }
      }
       public void salvarUsuario(Usuario usuario, Misc misc,JFrame jfUsuario) {
         try {
            selectusuario(usuario);
             con = Conexao.conectar();
            sql = "INSERT INTO `bd_sharas`.`usuario` "
                    + "(`usuario_id`,"
                    + "`usuario_login`,"
                    + "`usuario_senha`,"
                    + "`usuario_tipo`,"
                    + "`usuario_status`"
                    + ",`usuario_notificacao`"
                    + ",`pessoa_pessoa_id`)"
                  + "VALUES"
                    + "(null,"
                    + " ?, "
                    + "md5('?'),"
                    + " ?,"
                    + "?,"
                    + "?,"
                    + "?)";
            pst = con.prepareStatement(sql);
            pst.setString(2, usuario.getUsuario_senha());
            pst.setInt(3, usuario.getUsuario_tipo());
            pst.setInt(4, usuario.getUsuario_status());
            pst.setString(5, usuario.getUsuario_notificacao());
            pst.setInt(6, usuario.getPessoa_pessoa_id());
            pst.setString(1, usuario.getUsuario_login());
            pst.execute();
            Conexao.desconectar();
            JOptionPane.showMessageDialog(jfUsuario, "Cadastrado com Sucesso!");
        }catch(SQLException e){
                System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
    }
       public void tabUsuario(JTextField campo,JTable tabela){
         try{
           con = Conexao.conectar();
            sql = "SELECT * from vw_tab_atualiza_usu WHERE (Nome LIKE ?)OR(CPF like ?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%"+campo.getText()+"%");  
            pst.setString(2, "%"+campo.getText()+"%");
            rs=pst.executeQuery();
            tabela.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
 
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
       }
        public void tabdados(JTable tabela,JTextField nome,JTextField cpf,JTextField login,JComboBox cargo,JComboBox status){
          int linha = tabela.getSelectedRow();
           String valor = String.valueOf(tabela.getValueAt(linha, 2));  
           id=valor;
           System.out.println(id);
           try{
           con = Conexao.conectar();
            sql = "SELECT * from vw_at_dados WHERE CPF = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, valor); 
            rs=pst.executeQuery();
           if(rs.next()){
                nome.setText(rs.getString("Nome"));
                cpf.setText(rs.getString("CPF"));
                login.setText(rs.getString("Login"));
                cargo.setSelectedIndex(rs.getInt("Cargo"));
                status.setSelectedIndex(rs.getInt("Status"));
           }
 
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
        }
        public void alterarUsu(JTextField campo,Usuario usuario,String campotabela,String nome){
           try{
               System.out.println(""+id);
           con = Conexao.conectar();
            sql = "update usuario u inner join pessoa p set u."+campotabela+" = ? "
                + "WHERE u.pessoa_pessoa_id = p.pessoa_id and p.pessoa_cpfcnpj = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            pst.setString(2, id); 
            pst.execute();
             JOptionPane.showMessageDialog(null, nome+" alterado com Sucesso!");
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
        
        }
        public void alterarUsuCB(JComboBox campo,Usuario usuario,String tabela,String campotabela,String nome){
          try{
            con = Conexao.conectar();
            sql = "update usuario u inner join pessoa p set u."+campotabela+" = ? "
                + "WHERE u.pessoa_pessoa_id = p.pessoa_id and p.pessoa_cpfcnpj = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, campo.getSelectedIndex());
            pst.setString(2, id); 
            pst.execute();
             JOptionPane.showMessageDialog(null, nome+" alterado com Sucesso!");
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
        }
public void deletarUsuario(){
 /*try{
            con = Conexao.conectar();
            sql = "delete from usuario";
            pst = con.prepareStatement(sql);
            pst.setInt(1, campo.getSelectedIndex());
            pst.setString(2, id); 
            pst.execute();
             JOptionPane.showMessageDialog(null, nome+" alterado com Sucesso!");
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
*/
}

}
