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
import javax.swing.JTable;
import javax.swing.JTextField;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class LogDAO {
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
     public void consultarVeterinario(JTextField txt_pesquisa_log, JTable  tab_log, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select log_id as ID, log_acao as ACAO, log_entidade as ENTIDADE, log_usuario as USUARIO, log_time as QUANDO, log_how as SOFREU_ALTERACAO  from log where log_usuario like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_pesquisa_log.getText() + "%");
            rs = pst.executeQuery();
            tab_log.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
