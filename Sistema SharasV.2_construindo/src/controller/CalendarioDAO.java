/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Calendario;
import model.Sessao;

/**
 *
 * @author Matheus Moreira
 */
public class CalendarioDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    Sessao sessao = new Sessao();

    //Métodos
    //SALVAR
    public void salvarCalendario(Calendario calendario, String nome, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "insert into calendario (calendario_data , calendario_anotacao)values(?,?)";
            pst = con.prepareStatement(sql);
            pst.setDate(1, calendario.getCalendario_data());
            pst.setString(2, calendario.getCalendario_anotacao());

            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Cadastrado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CRIOU',?,'CALENDARIO',now(), (select max(calendario_id)from calendario)); ";
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

    }

    //ALTERAR
    public void alterarCalendario(Calendario calendario, String nome, String how, JFrame JF_Principal1) {
        try {
            con = Conexao.conectar();
            sql = "update  calendario set calendario_data=?, calendario_anotacao=? where calendario_id=?";
            pst = con.prepareStatement(sql);
            pst.setDate(1, calendario.getCalendario_data());
            pst.setString(2, calendario.getCalendario_anotacao());
            pst.setInt(3, calendario.getCalendario_id());
            pst.execute();

            JOptionPane.showMessageDialog(JF_Principal1, "Alterado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'CALENDARIO',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2, how);
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
    public void apagarCalendario(Calendario calendario, String nome, String how, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "delete from calendario where calendario_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, calendario.getCalendario_id());

            if (JOptionPane.showConfirmDialog(JF_Principal1, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(JF_Principal1, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'CALENDARIO',now(), ?); ";
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
    public void consultarCalendarioDATA(Date calendario_data, JTextField txt_calendario_id, JTextArea txt_calendario_anotacao, JButton btn_excluir_calendario, JButton btn_alterar_calendario, JButton btn_cadastrar_calendario, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select * from calendario where calendario_data=?";
            pst = con.prepareStatement(sql);
            pst.setDate(1, calendario_data);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_calendario_id.setText(rs.getString("calendario_id"));
                txt_calendario_anotacao.setText(rs.getString("calendario_anotacao"));
                btn_excluir_calendario.setEnabled(true);
                btn_alterar_calendario.setEnabled(true);
                btn_cadastrar_calendario.setEnabled(false);
                Conexao.desconectar();
            } else {
                //JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
                txt_calendario_id.setText("");
                txt_calendario_anotacao.setText("");
                btn_excluir_calendario.setEnabled(false);
                btn_alterar_calendario.setEnabled(false);
                btn_cadastrar_calendario.setEnabled(true);
                Conexao.desconectar();
            }

        } catch (SQLException e) {
            Conexao.desconectar();
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }

    // Anotação pessoais 
    //salvar    
    public boolean salvarAgenda(Calendario calendario) {
        try {
            con = Conexao.conectar();
            sql = "insert into agenda values (null,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, calendario.getCalendario_anotacao());
            pst.setDate(3, calendario.getCalendario_data());
            pst.setInt(2, sessao.getId_usuario());
            pst.execute();
            Conexao.desconectar();
            return (true);
        } catch (SQLException e) {
            Conexao.desconectar();
            JOptionPane.showMessageDialog(null, "erro ao salvar" + e);
            return (false);
        }
    }

    //selecionar
    public void Selecionaragenda(JTextArea texto, Calendario calendario) {
        try {
            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
            String dataFormatada = formato.format(calendario.getCalendario_data());
            con = Conexao.conectar();
            sql = "SELECT Texto,Textoid from vw_agenda WHERE ID = ? and Data = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, sessao.getId_usuario());
            pst.setString(2, dataFormatada);
            rs = pst.executeQuery();
            int cont = 0;

            texto.append("-------*Data:" + dataFormatada + "*\n");
            while (rs.next()) {
                cont++;
                calendario.setCalendario_id(rs.getInt("Textoid"));
                texto.append( "Anotação  "+ cont + "°:\n" + rs.getString("Texto") + "\n"
                        + "______________________\n");
            }
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro al salvar na agenda :" + e);
        }
    }

    public void excluirAgenda(Calendario calendario) {
        try {
            con = Conexao.conectar();
            sql = "Delete from agenda where agenda_id = ? ";
            pst = con.prepareStatement(sql);
            pst.setInt(1, calendario.getCalendario_id());
            pst.execute();
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro al salvar na agenda :" + e);
        }
    }
}
