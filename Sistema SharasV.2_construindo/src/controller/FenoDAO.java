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
import javax.swing.JTextField;
import model.Feno;
import model.Serragem;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class FenoDAO {
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarFeno(Feno feno, String nome,JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "insert into feno (feno_quantidade, feno_qualidade, feno_fornecedor, feno_valor, feno_compra,feno_duracao)values(?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(1, feno.getFeno_quantidade());
            pst.setInt(2, feno.getFeno_qualidade());
            pst.setString(3, feno.getFeno_fornecedor());
            pst.setFloat(4, feno.getFeno_valor());
            pst.setDate(5, feno.getFeno_compra());
            pst.setDate(6, feno.getFeno_duracao());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'FENO',now(),(select max(feno_id)from feno)); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarFeno(Feno feno,String nome , String how,JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "update  feno set feno_quantidade=?, feno_qualidade=?, feno_fornecedor=?, feno_valor=?, feno_compra=?,feno_duracao=? where feno_id=?";
            pst = con.prepareStatement(sql);
           pst.setInt(1, feno.getFeno_quantidade());
            pst.setInt(2, feno.getFeno_qualidade());
            pst.setString(3, feno.getFeno_fornecedor());
            pst.setFloat(4, feno.getFeno_valor());
            pst.setDate(5, feno.getFeno_compra());
            pst.setDate(6, feno.getFeno_duracao());
            pst.setInt(7, feno.getFeno_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'FENO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2 ,how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao alterar no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarFeno(Feno feno,String nome , String how,JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "delete from feno where feno_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1,feno.getFeno_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'FENO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2 ,how);
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
    public void consultarFenoID(int feno_id, JTextField txt_feno_id,JTextField txt_feno_quantidade, JComboBox cb_feno_qualidade, JTextField txt_feno_fornecedor, JTextField txt_feno_valor, JDateChooser jdata_feno_compra, JDateChooser jdata_feno_duracao, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select * from feno where feno_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, feno_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_feno_id.setText(rs.getString("feno_id"));
                txt_feno_quantidade.setText(rs.getString("feno_quantidade"));
                cb_feno_qualidade.setSelectedIndex(rs.getInt("feno_qualidade"));
                 txt_feno_fornecedor.setText(rs.getString("feno_fornecedor"));
                txt_feno_valor.setText(rs.getString("feno_valor"));
                jdata_feno_compra.setDate(rs.getDate("feno_compra"));
                jdata_feno_duracao.setDate(rs.getDate("feno_duracao"));
                

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarFeno(JTextField txt_feno_pesquisa, JTable tab_feno, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select feno_id as ID, feno_quantidade as QUANTIDADE, feno_qualidade as QUALIDADE , feno_fornecedor as FORNECEDOR, feno_valor as VALOR, feno_compra COMPRA, feno_duracao as DURACAO  from feno where feno_fornecedor like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_feno_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tab_feno.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
