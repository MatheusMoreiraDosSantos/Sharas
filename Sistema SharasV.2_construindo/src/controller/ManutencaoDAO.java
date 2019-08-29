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
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Manutencao;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class ManutencaoDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarManutencao(Manutencao manutencao, String nome,JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "insert into manutencao(manutencao_nome, manutencao_salario, manutencao_funcao, manutencao_setor, manutencao_anotacao)values(?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, manutencao.getManutencao_nome());
            pst.setFloat(2, manutencao.getManutencao_salario());
            pst.setString(3, manutencao.getManutencao_funcao());
            pst.setInt(4, manutencao.getManutencao_setor());
            pst.setString(5, manutencao.getManutencao_anotacao());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'FUNCIONARIO',now(), (select max(manutencao_id)from manutencao)); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao CADASTRAR no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarManutencao(Manutencao manutencao,String nome ,String how,JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "update  manutencao set manutencao_nome=?,manutencao_salario=?, manutencao_funcao=?,manutencao_setor=? , manutencao_anotacao=? where manutencao_id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, manutencao.getManutencao_nome());
            pst.setFloat(2, manutencao.getManutencao_salario());
            pst.setString(3, manutencao.getManutencao_funcao());
            pst.setInt(4, manutencao.getManutencao_setor());
            pst.setString(5, manutencao.getManutencao_anotacao());
            pst.setInt(6, manutencao.getManutencao_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'FUNCIONARIO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2,how);
                    pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao ALTERAR no log: " + e);
                }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarManutencao(Manutencao manutencao,String nome ,String how,JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "delete from manutencao where manutencao_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, manutencao.getManutencao_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'FUNCIONARIO',now(),?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2,how);
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
    /**
     *
     * @param manutencao_id
     * @param txt_manutencao_id
     * @param txt_manutencao_nome
     * @param txt_manutencao_salario
     * @param txt_manutencao_funcao
     * @param cb_manutencao_setor
     * @param txt_manutencao_anotacao
     * @param JF_Principal1
     */
    public void consultarManutencaoID(int manutencao_id, JTextField txt_manutencao_id, JTextField txt_manutencao_nome, JTextField txt_manutencao_salario, JTextArea txt_manutencao_funcao, JComboBox cb_manutencao_setor, JTextArea txt_manutencao_anotacao, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select * from manutencao where manutencao_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, manutencao_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_manutencao_id.setText(rs.getString("manutencao_id"));
                txt_manutencao_nome.setText(rs.getString("manutencao_nome"));
                txt_manutencao_salario.setText(rs.getString("manutencao_salario"));
                txt_manutencao_funcao.setText(rs.getString("manutencao_funcao"));
                cb_manutencao_setor.setSelectedIndex(rs.getInt("manutencao_setor"));
                txt_manutencao_anotacao.setText(rs.getString("manutencao_anotacao"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarManutencao(JTextField txt_manutencao_pesquisa, JTable tab_manutencao, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select manutencao_id as ID, manutencao_nome as NOME, manutencao_salario as SALARIO, manutencao_funcao as FUNCAO, manutencao_setor as SETOR, manutencao_anotacao as ANOTACAO  from manutencao where manutencao_nome like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_manutencao_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tab_manutencao.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

}
