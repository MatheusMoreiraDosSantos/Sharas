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
import model.Treinamento;
import net.proteanit.sql.DbUtils;

public class TreinamentoDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarTreinamento(Treinamento treinamento, String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select animal_nome from animal where animal_nome = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, treinamento.getTreinamento_animal());
            rs = pst.executeQuery();
            if (rs.next()) {
                try {
                    con = Conexao.conectar();
                    sql = "insert into treinamento (treinamento_animal,treinamento_treinador ,treinamento_inicio, treinamento_termino,treinamento_modalidade,treinamento_valor)values(?,?,?,?,?,?)";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, treinamento.getTreinamento_animal());
                    pst.setString(2, treinamento.getTreinamento_treinador());
                    pst.setDate(3, treinamento.getTreinamento_inicio());
                    pst.setDate(4, treinamento.getTreinamento_termino());
                    pst.setString(5, treinamento.getTreinamento_modalidade());
                    pst.setFloat(6, treinamento.getTreinamento_valor());
                    pst.execute();

                    JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
                    try {
                        sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'TREINAMENTO',now(), ?); ";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, nome);
                        pst.setString(2, how);
                        pst.execute();

                        Conexao.desconectar();
                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
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
    public void alterarTreinamento(Treinamento treinamento, String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexao.conectar();
            sql = "update  treinamento set treinamento_animal=?,treinamento_treinador=?, treinamento_inicio=?, treinamento_termino=?,treinamento_modalidade=?,treinamento_valor=? where treinamento_id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, treinamento.getTreinamento_animal());
            pst.setString(2, treinamento.getTreinamento_treinador());
            pst.setDate(3, treinamento.getTreinamento_inicio());
            pst.setDate(4, treinamento.getTreinamento_termino());
            pst.setString(5, treinamento.getTreinamento_modalidade());
            pst.setFloat(6, treinamento.getTreinamento_valor());
            pst.setInt(7, treinamento.getTreinamento_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'TREINAMENTO',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2, how);
                pst.execute();

                Conexao.desconectar();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
            }
            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarTreinamento(Treinamento treinamento, String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "delete from treinamento where treinamento_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, treinamento.getTreinamento_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'TREINAMENTO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                    Conexao.desconectar();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
                }
                Conexao.desconectar();
            }

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(JF_Principal1, "Erro ao deletar: " + e);
        }

    }

    //CONSULTAR POR NOME
    public void consultarTreinamento(JTextField txtpesquisatreinamento, JTable tabtreinamento, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select treinamento_id as ID, treinamento_treinador as Treinador,treinamento_animal as Nome, treinamento_inicio as Inicio, treinamento_termino as Termino from treinamento where treinamento_animal like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txtpesquisatreinamento.getText() + "%");
            rs = pst.executeQuery();
            tabtreinamento.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    //CONSULTAR POR ID
    public void consultarTreinamentoID(int treinamento_id, JTextField txttreinamentoid, JTextField txtanimal, JTextField txtTreinador, JDateChooser txttreinamentoinicio, JDateChooser txttreinamentotermino, JTextField txttreinamentomodalidade, JTextField txttreinamentovalor, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select * from treinamento where treinamento_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, treinamento_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txttreinamentoid.setText(String.valueOf(rs.getInt("treinamento_id")));
                txtanimal.setText(rs.getString("treinamento_animal"));
                txtTreinador.setText(rs.getString("treinamento_treinador"));
                txttreinamentoinicio.setDate(rs.getDate("treinamento_inicio"));
                txttreinamentotermino.setDate(rs.getDate("treinamento_termino"));
                txttreinamentomodalidade.setText(rs.getString("treinamento_modalidade"));
                txttreinamentovalor.setText(rs.getString("treinamento_valor"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
