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
import model.Pastagem;
import net.proteanit.sql.DbUtils;

public class PastagemDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarPastagem(Pastagem pastagem,String nome ,JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "insert into pastagem (pastagem_numero,pastagem_quantidade ,pastagem_qualidade,pastagem_anotacao, pastagem_data)values(?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(1, pastagem.getPastagem_numero());
            pst.setInt(2, pastagem.getPastagem_quantidade());
            pst.setInt(3, pastagem.getPastegem_qualidade());
            pst.setString(4, pastagem.getPastagem_anotacao());
            pst.setDate(5, pastagem.getPastagem_data());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CADASTROU',?,'PASTO',now(), (select max(pastagem_id)from pastagem)); ";
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
    public void alterarPastagem(Pastagem pastagem,String nome ,String how ,JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "update  pastagem set pastagem_numero=?,pastagem_quantidade=?, pastagem_qualidade=?,pastagem_anotacao=? , pastagem_data=? where pastagem_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, pastagem.getPastagem_numero());
            pst.setInt(2, pastagem.getPastagem_quantidade());
            pst.setInt(3, pastagem.getPastegem_qualidade());
            pst.setString(4, pastagem.getPastagem_anotacao());
            pst.setDate(5, pastagem.getPastagem_data());
            pst.setInt(6, pastagem.getPastagem_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'PASTO',now(), ?); ";
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
    public void apagarPastagem(Pastagem pastagem,String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "delete from pastagem where pastagem_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, pastagem.getPastagem_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                  try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'PASTO',now(), ?); ";
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
    public void consultarPastagemID(int pastagem_id,JTextField txtpastagemid, JTextField txtpastagemquantidade, JComboBox cbpastagemnumero, JComboBox cbpastagemqualidade,JTextArea txtpastagemanotacao,JDateChooser jdate_pastagem_data, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select * from pastagem where pastagem_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, pastagem_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txtpastagemid.setText(rs.getString("pastagem_id"));
                cbpastagemnumero.setSelectedIndex(rs.getInt("pastagem_numero"));
                txtpastagemquantidade.setText(String.valueOf(rs.getInt("pastagem_quantidade")));
                cbpastagemqualidade.setSelectedIndex(rs.getInt("pastagem_qualidade"));
                txtpastagemanotacao.setText(rs.getString("pastagem_anotacao"));
                jdate_pastagem_data.setDate(rs.getDate("pastagem_data"));
                
            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
    
    
    public void consultarPastagem(JTextField txtpesquisapastagem, JTable  tabpastagem, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select pastagem_id as ID, pastagem_numero as NUMERO,pastagem_qualidade as QUALIDADE, pastagem_anotacao as ANOTACAO  from pastagem where pastagem_numero like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txtpesquisapastagem.getText() + "%");
            rs = pst.executeQuery();
            tabpastagem.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
    
}
