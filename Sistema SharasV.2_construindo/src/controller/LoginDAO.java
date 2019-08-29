/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import model.Usuarios;

/**
 *
 * @author Aluno 02
 */
public class LoginDAO {

    public static int falha;
    public static int tipo;
    private static int status;
    //Atributos
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    Usuarios usuario = new Usuarios();

    //Métodos
    //Consultar Usuário e Senha
    public void consultarUsuarioLogin(JTextField loginUsu, JPasswordField senhaUsu, JFrame jfLogin, JFrame jfPrincipal) {

        try {

            con = Conexoes.conectar();
            sql = "select usu_login from usuario  where usu_login = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, loginUsu.getText());
            rs = pst.executeQuery();
            if (rs.next()) {

                sql = "select * from usuario  where usu_login = ? and usu_senha = md5(?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, loginUsu.getText());
                pst.setString(2, senhaUsu.getText());
                rs = pst.executeQuery();

                if (rs.next()) {
                    status = rs.getInt("usuario_status");
                    if (status == 1) {
                        tipo = rs.getInt("usu_tipo");
                        jfPrincipal.setVisible(true);
                        jfLogin.setVisible(false);
                        try {
                            sql = "insert into log (log_acao, log_usuario, log_entidade, log_time) values ('ENTROU',?,'SISTEMA',now()); ";
                            pst = con.prepareStatement(sql);
                            pst.setString(1, loginUsu.getText());
                            pst.execute();

                        } catch (Exception e) {
                            JOptionPane.showMessageDialog(jfLogin, "Erro ao Excluir no log: " + e);
                        }
                    } else {
                        //Usuario desativado
                        falha = 3;
                        loginUsu.setText("");
                        senhaUsu.setText("");
                        loginUsu.requestFocus();
                    }
                } else {
                    //Erro senha incorreta
                    falha = 2;
                    senhaUsu.setText("");
                    loginUsu.requestFocus();
                }

            } else {
                //Erro usuario não encontrado
                falha = 1;
                loginUsu.setText("");
                senhaUsu.setText("");
                loginUsu.requestFocus();
            }

            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(jfLogin, "Erro ao acessar :( " + e);
        }

    }

}
