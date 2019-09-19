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
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Ferrajamento;
import model.Pastagem;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class FerrajamentoDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarFerrajamento(Ferrajamento ferrajamento, String nome, JFrame JF_Principal1) {
        try {
            con = Conexao.conectar();
            sql = "select animal_nome from animal where animal_nome = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, ferrajamento.getFerrajamento_animal());
            rs = pst.executeQuery();
            if (rs.next()) {
                try {
                    con = Conexao.conectar();
                    sql = "insert into ferrajamento (ferrajamento_inicio,ferrajamento_termino ,ferrajamento_ferrador,ferrajamento_animal,ferrajamento_valor,ferrajamento_descricao)values(?,?,?,?,?,?)";
                    pst = con.prepareStatement(sql);
                    pst.setDate(1, ferrajamento.getFerrajamento_inicio());
                    pst.setDate(2, ferrajamento.getFerrajamento_termino());
                    pst.setString(3, ferrajamento.getFerrajamento_ferrador());
                    pst.setString(4, ferrajamento.getFerrajamento_animal());
                    pst.setFloat(5, ferrajamento.getFerrajamento_valor());
                    pst.setString(6, ferrajamento.getFerrajamento_descricao());
                    pst.execute();

                    JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
                    try {
                        sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'FERRAJAMENTO',now(), (select max(ferrajamento_id)from ferrajamento)); ";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, nome);
                        pst.execute();

                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(JF_Principal1, "Erro ao cadastrar no log: " + e);
                    }
                    Conexao.desconectar();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar: " + e);
                }
            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Animal nao existe ");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Animal nao existe " + e);
        }

    }

    //ALTERAR
    public void alterarFerrajamento(Ferrajamento ferrajamento, String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexao.conectar();
            sql = "update  ferrajamento set ferrajamento_inicio=?, ferrajamento_termino=?, ferrajamento_ferrador=?, ferrajamento_animal=?, ferrajamento_valor=?, ferrajamento_descricao=? where ferrajamento_id=?";
            pst = con.prepareStatement(sql);
            pst.setDate(1, ferrajamento.getFerrajamento_inicio());
            pst.setDate(2, ferrajamento.getFerrajamento_termino());
            pst.setString(3, ferrajamento.getFerrajamento_ferrador());
            pst.setString(4, ferrajamento.getFerrajamento_animal());
            pst.setFloat(5, ferrajamento.getFerrajamento_valor());
            pst.setString(6, ferrajamento.getFerrajamento_descricao());
            pst.setInt(7, ferrajamento.getFerrajamento_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'FERRAJAMENTO',now(),?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2, how);
                pst.execute();

            } catch (Exception e) {
                JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar no log: " + e);
            }
            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarFerrajamento(Ferrajamento ferrajamento, String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "delete from ferrajamento where ferrajamento_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, ferrajamento.getFerrajamento_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'FERRAJAMENTO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Excluir no log: " + e);
                }
                Conexao.desconectar();
            }

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(JF_Principal1, "Erro ao deletar: " + e);
        }

    }

    //CONSULTAR POR Numero
    public void consultarFerrajamentoID(int ferrajamento_id, JTextField txt_ferrajamento_id, JDateChooser data_ferrajamento_inicio, JDateChooser data_ferrajamento_termino, JTextField txt_ferrajamento_ferrador, JTextField txt_ferrajamento_animal, JTextField txt_ferrajamento_valor, JTextArea txt_ferrajamento_descricao, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select * from ferrajamento where ferrajamento_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, ferrajamento_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_ferrajamento_id.setText(rs.getString("ferrajamento_id"));
                data_ferrajamento_inicio.setDate(rs.getDate("ferrajamento_inicio"));
                data_ferrajamento_termino.setDate(rs.getDate("ferrajamento_termino"));
                txt_ferrajamento_ferrador.setText(rs.getString("ferrajamento_ferrador"));
                txt_ferrajamento_animal.setText(rs.getString("ferrajamento_animal"));
                txt_ferrajamento_valor.setText(rs.getString("ferrajamento_valor"));
                txt_ferrajamento_descricao.setText(rs.getString("ferrajamento_descricao"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarFerrajamento(JTextField txt_ferrajamento_pesquisa, JTable tabferrajamento, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select ferrajamento_id as ID, ferrajamento_inicio as INICIO, ferrajamento_termino as TERMINO, ferrajamento_ferrador as FERRADOR, ferrajamento_animal as ANIMAL, ferrajamento_valor as VALOR, ferrajamento_descricao as DESCRICAO from ferrajamento where ferrajamento_animal like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_ferrajamento_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tabferrajamento.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
