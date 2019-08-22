/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import javax.swing.JComboBox;
import javax.swing.JFrame;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Usuario;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Aluno 02
 */
public class UsuarioDAO {

    //Atributos
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    public static boolean verif;
    //Métodos
    //SALVAR
    
    
    public void salvarUsuario(Usuario usuario,String nome, String how, JFrame jfUsuario) {
        
        try {
            con = Conexao.conectar();
            sql = "select usu_login from Usuario where usu_login = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getUsu_login());
            rs = pst.executeQuery();
            if(rs.next()){
                verif=true;
                Conexao.desconectar();
            }else{
            sql = "insert into Usuario (usu_login, usu_senha, usu_tipo, usuario_status, usuario_notificacao)values(?,md5(?),?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getUsu_login());
            pst.setString(2, usuario.getUsu_senha());
            pst.setInt(3, usuario.getUsu_tipo());
            pst.setInt(4, usuario.getUsuario_status());
            pst.setString(5, usuario.getUsuario_notificacao());
            pst.execute();

            JOptionPane.showMessageDialog(jfUsuario, "Cadastrado com Sucesso!");
             try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'USUARIO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                    Conexao.desconectar();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar no log: " + e);
                }
            Conexao.desconectar();
            verif=false;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarUsuario(Usuario usuario,String nome, String how, JFrame jfUsuario) {
         try {
             con = Conexao.conectar();
            sql = "update Usuario set usu_login=?, usu_senha=md5(?), usu_tipo=?, usuario_status=? ,usuario_notificacao=? where usu_id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getUsu_login());
            pst.setString(2, usuario.getUsu_senha());
            pst.setInt(3, usuario.getUsu_tipo());
            pst.setInt(4, usuario.getUsuario_status());
            pst.setString(5, usuario.getUsuario_notificacao());
            pst.setInt(6, usuario.getUsu_id());
            pst.execute();

            JOptionPane.showMessageDialog(jfUsuario, "Alterado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'USUARIO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                    Conexao.desconectar();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar no log: " + e);
                }
            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarUsuario(Usuario usuario,String nome, String how, JFrame jfUsuario) {
            
        try {
             con = Conexao.conectar();
             sql = "delete from Usuario where usu_id = ?";
             pst=con.prepareStatement(sql);
             pst.setInt(1, usuario.getUsu_id());
             
             if(JOptionPane.showConfirmDialog(jfUsuario, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION)==0){
                 pst.execute();
                 JOptionPane.showMessageDialog(jfUsuario, "Deletado com Sucesso!");
                 try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'USUARIO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                    Conexao.desconectar();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar no log: " + e);
                }
                 Conexao.desconectar();
             }
             
        } catch (Exception e) {
             JOptionPane.showConfirmDialog(jfUsuario, "Erro ao deletar: "+e);
        }
          
         

    }

    //CONSULTAR POR NOME
    public void consultarUsuarioNome(JTextField txtPesquisa, JTable tabUsuario, JFrame jfUsuario) {
        
        try {
            con = Conexao.conectar();
            sql = "select usu_id as ID, usu_login as Login,usu_tipo as Tipo, usuario_status as STATUS , usuario_notificacao as NOTIFICACAO from Usuario where usu_login like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%"+txtPesquisa.getText()+"%");
            rs=pst.executeQuery();
            tabUsuario.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao consultar: "+e);
        }

    }

    //CONSULTAR POR ID
    public void consultarUsuarioID(int codUsuario,JTextField txtid, JTextField txtlogin, JComboBox tipo, JComboBox cbstatus , JTextArea txt_usuario_notificacao,JTextField txt_senha,JTextField txtsenha,JFrame jfUsuario) {
        
        try {
            con = Conexao.conectar();
            sql = "select * from Usuario where usu_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, codUsuario);
            rs=pst.executeQuery();
            
            if(rs.next()){
                txtid.setText(String.valueOf(rs.getInt("usu_id")));
                txtlogin.setText(rs.getString("usu_login"));
                tipo.setSelectedIndex(rs.getInt("usu_tipo"));
                cbstatus.setSelectedIndex(rs.getInt("usuario_status"));
                txt_usuario_notificacao.setText(rs.getString("usuario_notificacao"));
                
            }else{
                JOptionPane.showMessageDialog(jfUsuario, "Nenhum Registro Encontrado");
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao consultar: "+e);
        }

    }
    public void consultarUsuarioNotificacao(String nome,JTextArea txt_notificacao_home,JFrame jfUsuario) {
        
        try {
            con = Conexao.conectar();
            sql = "select usuario_notificacao from Usuario where usu_login like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, nome);
            rs=pst.executeQuery();
            
            if(rs.next()){
                
                txt_notificacao_home.setText(rs.getString("usuario_notificacao"));
            }else{
                JOptionPane.showMessageDialog(jfUsuario, "Nenhum Registro Encontrado");
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao consultar: "+e);
        }

    }
     public void alterarUsuarioNotificacao(Usuario usuario, JFrame jfUsuario) {
         try {
            con = Conexao.conectar();
            sql = "update Usuario set usuario_notificacao=? where usu_tipo=1";
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario.getUsuario_notificacao());
            
            pst.execute();

            JOptionPane.showMessageDialog(jfUsuario, "Alterado com Sucesso!");

            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao Alterar: " + e);
        }
    }

}
