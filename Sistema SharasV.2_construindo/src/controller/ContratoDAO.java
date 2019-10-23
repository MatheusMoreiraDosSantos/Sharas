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
import view.JF_Contrato;

/**
 *
 * @author maikon.rosa
 */
public class ContratoDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    JF_Contrato tela = new JF_Contrato();
  //Carrega os dados da tabela de cliente 
    public void CarregarTabelacli(JTable cli,JTextField pesquisa) {
        try {
            con = Conexao.conectar();
            sql = "select * from vw_tab_cliente";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" +pesquisa.getText()+ "%");
            rs = pst.executeQuery();
            cli.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(tela, "Erro ao consultar: " + e);
        }

    }
    //carrega os dados da tabela de produto
          public void CarregarTabelapro(JTable cli,JTextField pesquisa) {
        try {
            con = Conexao.conectar();
            sql = "select * from vw_tab_produto";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" +pesquisa.getText()+ "%");
            rs = pst.executeQuery();
            cli.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(tela, "Erro ao consultar: " + e);
        }

    }
}
