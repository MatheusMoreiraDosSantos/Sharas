/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.toedter.calendar.JDateChooser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Ferrajamento;
import model.Racao;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class RacaoDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarRacao(Racao racao,String nome, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "insert into racao (racao_compra,racao_duracao ,racao_fornecedor,racao_quantidade,racao_valor,racao_descricao)values(?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setDate(1, racao.getRacao_compra());
            pst.setDate(2, racao.getRacao_duracao());
            pst.setString(3, racao.getRacao_fornecedor());
            pst.setInt(4, racao.getRacao_quantidade());
            pst.setFloat(5, racao.getRacao_valor());
            pst.setString(6, racao.getRacao_descricao());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'RACAO',now(),(select max(racao_id)from racao)); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Excluir no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarRacao(Racao racao,String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "update  racao set racao_compra=?, racao_duracao=?, racao_fornecedor=?, racao_quantidade=?, racao_valor=?, racao_descricao=? where racao_id=?";
            pst = con.prepareStatement(sql);
            pst.setDate(1, racao.getRacao_compra());
            pst.setDate(2, racao.getRacao_duracao());
            pst.setString(3, racao.getRacao_fornecedor());
            pst.setInt(4, racao.getRacao_quantidade());
            pst.setFloat(5, racao.getRacao_valor());
            pst.setString(6, racao.getRacao_descricao());
            pst.setInt(7, racao.getRacao_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'RACAO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2,how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Excluir no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarRacao(Racao racao,String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "delete from racao where racao_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, racao.getRacao_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'RACAO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Excluir no log: " + e);
                }
                Conexoes.desconectar();
            }

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(JF_Principal1, "Erro ao deletar: " + e);
        }

    }

    //CONSULTAR POR Numero
    public void consultarRacaoID(int racao_id, JTextField txt_racao_id, JDateChooser jdata_racao_compra, JDateChooser jdata_racao_duracao, JTextField txt_racao_fornecedor, JTextField txt_racao_quantidade, JTextField txt_racao_valor, JTextArea txt_racao_descricao, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select * from racao where racao_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, racao_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_racao_id.setText(rs.getString("racao_id"));
                jdata_racao_compra.setDate(rs.getDate("racao_compra"));
                jdata_racao_duracao.setDate(rs.getDate("racao_duracao"));
                txt_racao_fornecedor.setText(rs.getString("racao_fornecedor"));
                txt_racao_quantidade.setText(rs.getString("racao_quantidade"));
                txt_racao_valor.setText(rs.getString("racao_valor"));
                txt_racao_descricao.setText(rs.getString("racao_descricao"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarRacao(JTextField txt_racao_pesquisa, JTable tab_racao, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select racao_id as ID, racao_compra as COMPRA, racao_duracao as DURACAO, racao_fornecedor as fORNECEDOR, racao_quantidade as QUANTIDADE, racao_valor as VALOR, racao_descricao as DESCRICAO from racao where racao_fornecedor like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_racao_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tab_racao.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
