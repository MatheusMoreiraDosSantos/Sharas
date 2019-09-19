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
import model.Animal;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class AnimalDAO {

    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarAnimal(Animal animal, String nome,String how ,JFrame jfUsuario) {

        try {
            con = Conexao.conectar();
            sql = "insert into animal (animal_nome, animal_registro, animal_proprietario,animal_criador,animal_nascimento,animal_sexo,animal_pelagem,animal_modalidade,animal_treinador,animal_veterinario)values(?,?,?,?,?,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, animal.getAnimal_nome());
            pst.setString(2, animal.getAnimal_registro());
            pst.setString(3, animal.getAnimal_proprietario());
            pst.setString(4, animal.getAnimal_criador());
            pst.setDate(5, animal.getAnimal_nascimento());
            pst.setString(6, animal.getAnimal_sexo());
            pst.setString(7, animal.getAnimal_pelagem());
            pst.setString(8, animal.getAnimal_modalidade());
            pst.setString(9, animal.getAnimal_treinador());
            pst.setString(10, animal.getAnimal_veterinario());
            pst.execute();

            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('CRIOU',?,'ANIMAL',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2 ,how);
                pst.execute();

                JOptionPane.showMessageDialog(jfUsuario, "Cadastrado com Sucesso!");

                Conexao.desconectar();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar no log: " + e);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao Cadastrar: " + e);
        }

    }

    //ALTERAR
    public void alterarAnimal(Animal animal, String nome,String how ,JFrame jfUsuario) {
        try {
            con = Conexao.conectar();
            sql = "update  animal set animal_nome=?, animal_registro=?, animal_proprietario=?,animal_criador=?,animal_nascimento=?,animal_sexo=?,animal_pelagem=?,animal_modalidade=?,animal_treinador=?,animal_veterinario=? where animal_id=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, animal.getAnimal_nome());
            pst.setString(2, animal.getAnimal_registro());
            pst.setString(3, animal.getAnimal_proprietario());
            pst.setString(4, animal.getAnimal_criador());
            pst.setDate(5, animal.getAnimal_nascimento());
            pst.setString(6, animal.getAnimal_sexo());
            pst.setString(7, animal.getAnimal_pelagem());
            pst.setString(8, animal.getAnimal_modalidade());
            pst.setString(9, animal.getAnimal_treinador());
            pst.setString(10, animal.getAnimal_veterinario());
            pst.setInt(11, animal.getAnimal_id());
            pst.execute();

            JOptionPane.showMessageDialog(jfUsuario, "Alterado com Sucesso!");
            try {
                sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('ALTEROU',?,'ANIMAL',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2 ,how);
                pst.execute();

            } catch (Exception e) {
                JOptionPane.showMessageDialog(jfUsuario, "Erro ao Alterar no log: " + e);
            }

            Conexao.desconectar();

        } catch (Exception e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarAnimal(Animal animal, String nome,String how,JFrame jfUsuario) {

        try {
            con = Conexao.conectar();
            sql = "delete from animal where animal_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, animal.getAnimal_id());

            if (JOptionPane.showConfirmDialog(jfUsuario, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(jfUsuario, "Deletado com Sucesso!");
                try {
                    sql = "insert into log (log_acao, log_usuario, log_entidade, log_time, log_how) values ('EXCLUIU',?,'ANIMAL',now(), ?); ";
                pst = con.prepareStatement(sql);
                pst.setString(1, nome);
                pst.setString(2 ,how);
                pst.execute();

                } catch (Exception e) {
                    JOptionPane.showMessageDialog(jfUsuario, "Erro ao Excluir no log: " + e);
                }
                Conexao.desconectar();
            }

        } catch (Exception e) {
            JOptionPane.showConfirmDialog(jfUsuario, "Erro ao deletar: " + e);
        }

    }

    //CONSULTAR POR NOME
    public void consultarAnimalNome(JTextField txtPesquisa, JTable tabAnimal, JFrame jfUsuario) {

        try {
            con = Conexao.conectar();
            sql = "select animal_id as ID, animal_nome as Nome, animal_sexo as Sexo, animal_proprietario as Proprietario from animal where animal_nome like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txtPesquisa.getText() + "%");
            rs = pst.executeQuery();
            tabAnimal.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao consultar: " + e);
        }

    }

    //CONSULTAR POR ID
    public void consultarAnimalID(int animal_id, JTextField txtanimalid, JTextField txtnomeanimal, JTextField txtregistro, JTextField txtproprietario, JTextField txtcriador, JDateChooser txtnascimento, JTextField txtsexo, JTextField txtpelagem, JTextField txtmodalidade, JTextField txttreinador, JTextField txtveterinario, JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select * from animal where animal_id=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, animal_id);
            rs = pst.executeQuery();

            if (rs.next()) {
                txtanimalid.setText(String.valueOf(rs.getInt("animal_id")));
                txtnomeanimal.setText(rs.getString("animal_nome"));
                txtregistro.setText(rs.getString("animal_registro"));
                txtproprietario.setText(rs.getString("animal_proprietario"));
                txtcriador.setText(rs.getString("animal_criador"));
                txtnascimento.setDate(rs.getDate("animal_nascimento"));
                txtsexo.setText(rs.getString("animal_sexo"));
                txtpelagem.setText(rs.getString("animal_pelagem"));
                txtmodalidade.setText(rs.getString("animal_modalidade"));
                txttreinador.setText(rs.getString("animal_treinador"));
                txtveterinario.setText(rs.getString("animal_veterinario"));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
