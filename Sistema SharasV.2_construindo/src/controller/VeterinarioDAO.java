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

import model.Veterinario;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class VeterinarioDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    /*private int veterinario_id;
    private String veterinario_animal;
    private String veterinario_nome;
    private Date   veterinario_inicio;
    private Date   veterinario_termino;
    private String veterinario_diagnostico;
    private String veterinario_tratamento;
    private Float veterinario_valor;
     */
    //SALVAR
    public void salvarVeterinario(Veterinario veterinario, String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "select animal_nome from animal where animal_nome = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, veterinario.getVeterinario_animal());
            rs = pst.executeQuery();
            if (rs.next()) {
                try {
                    con = Conexoes.conectar();
                    sql = "insert into veterinario(veterinario_animal, veterinario_nome, veterinario_inicio, veterinario_termino, veterinario_diagnostico, veterinario_tratamento, veterinario_valor)values(?,?,?,?,?,?,?)";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, veterinario.getVeterinario_animal());
                    pst.setString(2, veterinario.getVeterinario_nome());
                    pst.setDate(3, veterinario.getVeterinario_inicio());
                    pst.setDate(4, veterinario.getVeterinario_termino());
                    pst.setString(5, veterinario.getVeterinario_diagnostico());
                    pst.setString(6, veterinario.getVeterinario_tratamento());
                    pst.setFloat(7, veterinario.getVeterinario_valor());
                    pst.execute();

                    JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
                    try {
                        sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CRIOU',?,'VETERINARIO',now(), ?); ";
                        pst = con.prepareStatement(sql);
                        pst.setString(1, nome);
                        pst.setString(2, how);
                        pst.execute();

                        Conexoes.desconectar();
                    } catch (Exception e) {
                        JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
                    }
                    Conexoes.desconectar();

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
public void alterarVeterinario(Veterinario veterinario, String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexoes.conectar();
            sql = "update  veterinario set veterinario_animal=?, veterinario_nome=?,veterinario_inicio=?, veterinario_termino=?,veterinario_diagnostico=? , veterinario_tratamento=?, veterinario_valor=? where veterinario_id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, veterinario.getVeterinario_animal());
            pst.setString(2, veterinario.getVeterinario_nome());
            pst.setDate(3, veterinario.getVeterinario_inicio());
            pst.setDate(4, veterinario.getVeterinario_termino());
            pst.setString(5, veterinario.getVeterinario_diagnostico());
            pst.setString(6, veterinario.getVeterinario_tratamento());
            pst.setFloat(7, veterinario.getVeterinario_valor());
            pst.setInt(8, veterinario.getVeterinario_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'VETERINARIO',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2, how);
                pst.execute();

                Conexoes.desconectar();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
            }
            Conexoes.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarVeterinario(Veterinario veterinario, String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "delete from veterinario where veterinario_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, veterinario.getVeterinario_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'VETERINARIO',now(), ?); ";
                    pst = con.prepareStatement(sql);
                    pst.setString(1, nome);
                    pst.setString(2, how);
                    pst.execute();

                    Conexoes.desconectar();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(JF_Principal1, "Erro ao Cadastrar no log: " + e);
                }
                Conexoes.desconectar();
            }

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(JF_Principal1, "Erro ao deletar: " + e);
        }

    }

    //CONSULTAR POR Numero
    public void consultarVeterinarioID(int Veterinario_id, JTextField txt_veterinario_id, JTextField txt_veterinario_animal, JTextField txt_veterinario_nome, JDateChooser jdate_veterinario_inicio, JDateChooser jdate_veterinario_termino, JTextArea txt_veterinario_diagnostico, JTextArea txt_veterinario_tratamento, JTextField txt_veterinario_valor, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select * from veterinario where veterinario_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, Veterinario_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_veterinario_id.setText(rs.getString("veterinario_id"));
                txt_veterinario_animal.setText(rs.getString("veterinario_animal"));
                txt_veterinario_nome.setText(rs.getString("veterinario_nome"));
                jdate_veterinario_inicio.setDate(rs.getDate("veterinario_inicio"));
                jdate_veterinario_termino.setDate(rs.getDate("veterinario_termino"));
                txt_veterinario_diagnostico.setText(rs.getString("veterinario_diagnostico"));
                txt_veterinario_tratamento.setText(rs.getString("veterinario_tratamento"));
                txt_veterinario_valor.setText(rs.getString("veterinario_valor"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    public void consultarVeterinario(JTextField txt_veterinario_pesquisa, JTable tab_vaterinario, JFrame JF_Principal1) {

        try {
            con = Conexoes.conectar();
            sql = "select veterinario_id as ID, veterinario_animal as ANIMAL, veterinario_nome as NOME, veterinario_inicio as INICIO, veterinario_termino as TERMINO, veterinario_diagnostico as DIAGNOSTICO  from veterinario where veterinario_animal like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txt_veterinario_pesquisa.getText() + "%");
            rs = pst.executeQuery();
            tab_vaterinario.setModel(DbUtils.resultSetToTableModel(rs));
            Conexoes.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
