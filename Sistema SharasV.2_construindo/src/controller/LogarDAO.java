/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import funcoes.F_email;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import model.Sessao;
import model.Usuario;

/**
 *
 * @author maikon.rosa
 */
public class LogarDAO {
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    F_email fmail = new F_email();
    Sessao sessao = new Sessao();
    public boolean logarSistem(JTextField login,JTextField senha,JLabel erro){
        try{
                con=Conexao.conectar();
                sql="SELECT * from vw_login WHERE usuario_login = ? and usuario_senha=md5(?)";
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
                }else{erro.setText("usuário ou senha errados");}
        }catch(SQLException e ){
            JOptionPane.showMessageDialog(erro, "erro ao logar"+e);
                       Conexao.desconectar();
            return(false);
        } 
                   Conexao.desconectar();
        return (false);
    }
    public boolean recuperarSenha(JTextField campo, Usuario usuario,JLabel erro){
      try {
            con = Conexao.conectar();
            sql = "SELECT u.usuario_id from usuario u inner join pessoa p "
                + "WHERE pessoa_pessoa_id=pessoa_id and  pessoa_email= ?";
            pst = con.prepareStatement(sql);
            pst.setString(1,campo.getText());
            rs = pst.executeQuery();
            if (rs.next()) {
                usuario.setUsuario_id(rs.getInt("usuario_id"));
                Random r = new Random();
                String senha_nova = Integer.toString(Math.abs(r.nextInt()), 36).substring(0, 6); 
                usuario.setUsuario_senha(senha_nova);
                sql = "update usuario u inner join pessoa p set u.usuario_senha=md5(?) "
                    + "WHERE u.pessoa_pessoa_id=p.pessoa_id and p.pessoa_email =?";
                pst = con.prepareStatement(sql);
                pst.setString(1,senha_nova);
                pst.setString(2,campo.getText());
                pst.execute();
                fmail.Enviar(campo,senha_nova);
                Conexao.desconectar();
                return(true);
            }else{
            Conexao.desconectar();
            erro.setText("Email não cadastrado");
            return (false);
            }     
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao consultar: " + e);
            Conexao.desconectar();
            return(false);
        }
 
    }
    
    
    
    
}
