/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.toedter.calendar.JDateChooser;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import model.Contrato;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author PC_Sala
 */
public class ContratoDAO {

    Connection con;
    String sql, sql2;
    PreparedStatement pst;
    ResultSet rs;

    public void venda_produto(Contrato contrato) {
        try {
            con = Conexao.conectar();
            sql = "select servico_id from carrinho";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            sql = "insert into item_contrato values(?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(2, contrato.getContratoid());
            while (rs.next()) {
                pst.setInt(1, rs.getInt(1));
                pst.execute();
            }
            Conexao.desconectar();
            JOptionPane.showMessageDialog(null, "Venda Concluida");
        } catch (SQLException e) {
            System.err.println("venda_produto erro " + e);
        }

    }

    public void Finalizar(Contrato contrato) {
        try {
            con = Conexao.conectar();
            System.out.println(contrato.getClienteid());
            sql = "insert into contrato values (null,?,?,(SELECT SUM(Valor) FROM vw_carrinho),CURRENT_TIMESTAMP(),?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(1, contrato.getClienteid());
            pst.setInt(2, contrato.getAnimalid());
            pst.setString(3, contrato.getDescontoTipo());
            pst.setFloat(4, contrato.getDescontoValor());
            pst.execute();
            sql = "select contrato_id from contrato ORDER by contrato_id desc limit 1";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                contrato.setContratoid(rs.getInt(1));
                venda_produto(contrato);
            }
        } catch (SQLException e) {
            System.err.println("Venda erro : " + e);
        }
    }

    public void CarregarTabela(int escolha, JTable contrato, JTextField buscar, JDateChooser de_data, JDateChooser ate_data) {

        try {
            con = Conexao.conectar();
            switch (escolha) {
                case 1:
                    sql = "select * from vw_contrato where Pessoa like ? ";break;
                case 2:
                    sql = "SELECT * FROM `vw_contrato` WHERE Data BETWEEN date_format(?,'%d/%m/%y') and date_format(CURRENT_TIMESTAMP,'%d/%m/%y') ";
                    break;
                case 3:
                    sql = "SELECT * FROM `vw_contrato` WHERE Data BETWEEN date_format(?,'%d/%m/%y') and date_format(?,'%d/%m/%y')";
                    break;
                case 4:
                    sql = "select * from vw_contrato where Pessoa like ? and Data BETWEEN  date_format(?,'%d/%m/%y') and date_format(CURRENT_TIMESTAMP,'%d/%m/%y')";
                    break;
                case 5:
                    sql = "select * from vw_contrato where Pessoa like ? and Data BETWEEN date_format(?,'%d/%m/%y') and date_format(?,'%d/%m/%y')";
                    break;
            }
            pst = con.prepareStatement(sql);
            switch (escolha) {
                case 1:
                    pst.setString(1, "%" + buscar.getText() + "%");break;
                case 2:
                    pst.setDate(1, new Date(de_data.getDate().getTime()));break;
                case 3:
                    pst.setDate(1, new Date(de_data.getDate().getTime()));
                    pst.setDate(2, new Date(ate_data.getDate().getTime()));
                    break;
                case 4:
                    pst.setString(1, "%" + buscar.getText() + "%");
                    pst.setDate(2, new Date(de_data.getDate().getTime()));
                    ;break;
                case 5:
                    pst.setString(1, "%" + buscar.getText() + "%");
                    pst.setDate(2, new Date(de_data.getDate().getTime()));
                    pst.setDate(2, new Date(ate_data.getDate().getTime()));
                    break;
            }
            rs = pst.executeQuery();
            contrato.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            System.err.println("venda_produto erro " + e);
        }

    }
}
