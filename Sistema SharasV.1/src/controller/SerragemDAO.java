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
import javax.swing.JTextField;
import model.Serragem;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class SerragemDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarSerragem(Serragem serragem,String nome, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "insert into serragem (serragem_compra, serragem_tipo, serragem_fornecedor, serragem_metros, serragem_baias,serragem_duracao, serragem_valor)values(?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setDate(1, serragem.getSerragem_compra());
            pst.setString(2, serragem.getSerragem_tipo());
            pst.setString(3, serragem.getSerragem_fornecedor());
            pst.setFloat(4, serragem.getSerragem_metros());
            pst.setInt(5, serragem.getSerragem_bais());
            pst.setDate(6, serragem.getSerragem_duracao());
            pst.setFloat(7, serragem.getSerragem_valor());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
             try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'SERRAGEM',now(),(select max(serragem_id)from serragem)); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Excluir no log: " + e);
                }
            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarSerragem(Serragem serragem,String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexao.conectar();
            sql = "update  serragem set serragem_compra=?, serragem_tipo=?, serragem_fornecedor=?, serragem_metros=?, serragem_baias=?,serragem_duracao=?, serragem_valor=? where serragem_id=?";
            pst = con.prepareStatement(sql);
            pst.setDate(1, serragem.getSerragem_compra());
            pst.setString(2, serragem.getSerragem_tipo());
            pst.setString(3, serragem.getSerragem_fornecedor());
            pst.setFloat(4, serragem.getSerragem_metros());
            pst.setInt(5, serragem.getSerragem_bais());
            pst.setDate(6, serragem.getSerragem_duracao());
            pst.setFloat(7, serragem.getSerragem_valor());
            pst.setInt(8, serragem.getSerragem_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
             try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTERAR',?,'SERRAGEM',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao ALTERAR no log: " + e);
                }
            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarSerragem(Serragem serragem,String nome,String how, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "delete from serragem where serragem_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, serragem.getSerragem_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                 try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'SERRAGEM',now(),?); ";
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
    public void consultarSerragemID(int serragem_id, JTextField txt_serragem_id,JDateChooser jdate_serragem_compra, JTextField txt_serragem_tipo, JTextField txt_serragem_fornecedor , JTextField txt_serragem_metros, JTextField txt_serragem_baias, JDateChooser jdate_serragem_duracao, JTextField txt_serragem_valor, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select * from serragem where serragem_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, serragem_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_serragem_id.setText(rs.getString("serragem_id"));
                jdate_serragem_compra.setDate(rs.getDate("serragem_compra"));
                txt_serragem_tipo.setText(rs.getString("serragem_tipo"));
                txt_serragem_fornecedor.setText(rs.getString("serragem_fornecedor"));
                 txt_serragem_metros.setText(rs.getString("serragem_metros"));
                txt_serragem_baias.setText(rs.getString("serragem_baias"));
                jdate_serragem_duracao.setDate(rs.getDate("serragem_duracao"));
                txt_serragem_valor.setText(rs.getString("serragem_valor"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarSerragem(JTextField txt_serragem_pesquisa, JTable tab_serragem, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select serragem_id as ID, serragem_compra as COMPRA, serragem_tipo as TIPO, serragem_fornecedor as FORNECEDOR, serragem_metros as METROS, serragem_baias as BAIAS, serragem_duracao as DURACAO , serragem_valor as VALOR from serragem where serragem_fornecedor like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_serragem_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tab_serragem.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
