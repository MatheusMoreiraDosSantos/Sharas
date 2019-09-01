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
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import model.Sessao;

/**
 *
 * @author maikon.rosa
 */
public class LogarDAO {
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    public boolean logarSistem(JTextField login,JTextField senha,JLabel erro,Sessao sessao){
        try{
                con=Conexao.conectar();
                sql = "select usuario_status,usuario_id,usuario_login,usuario_tipo,pessoa_pessoa_id from usuario WHERE usuario_login =? and usuario_senha=md5(?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, login.getText());
                pst.setString(2, senha.getText());
                rs = pst.executeQuery();
                if(rs.next()){
                        int status = rs.getInt("usuario_status");
                        if(status == 1){
                            sessao.setId_pessoa(rs.getInt("pessoa_pessoa_id"));
                            sessao.setId_usuario(rs.getInt("usuario_id"));
                            sessao.setUsario_cargo(rs.getInt("usuario_tipo"));
                            sessao.setLogin(rs.getString("usuario_login")); 
                            Conexao.desconectar();
                            return(true);
                        }else{
                        erro.setText("usuário desativado");
                                   Conexao.desconectar();
                        return(false);
                        }
                }
        }catch(SQLException e ){
            JOptionPane.showMessageDialog(erro, "erro ao logar"+e);
                       Conexao.desconectar();
            return(false);
        } 
                   Conexao.desconectar();
        return (false);
    }
}
