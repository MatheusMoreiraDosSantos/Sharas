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
public class FinanceiroDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    
    public void consultarFinanceiro(int mes,JTextField txt_financeiro_treinamento ,JTextField txt_financeiro_serragem, JTextField txt_financeiro_racao , JTextField txt_financeiro_feno, JTextField txt_financeiro_veterinario , JTextField txt_financeiro_manutencao , JTextField txt_financeiro_ferrajamento,JFrame JF_Principal1) {

        try {
            con = Conexao.conectar();
            sql = "select sum(feno_valor) from feno where MONTH(feno_compra)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                txt_financeiro_feno.setText(String.valueOf(rs.getInt("sum(feno_valor)")));
              

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
         try {
            con = Conexao.conectar();
            sql = "select sum(ferrajamento_valor) from ferrajamento where MONTH(ferrajamento_termino)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_ferrajamento.setText(String.valueOf(rs.getInt("sum(ferrajamento_valor)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
         try {
            con = Conexao.conectar();
            sql = "select sum(manutencao_salario) from manutencao;";
            pst = con.prepareStatement(sql);
            
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_manutencao.setText(String.valueOf(rs.getInt("sum(manutencao_salario)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
         try {
            con = Conexao.conectar();
            sql = "select sum(racao_valor) from racao where MONTH(racao_compra)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_racao.setText(String.valueOf(rs.getInt("sum(racao_valor)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
         
         try {
            con = Conexao.conectar();
            sql = "select sum(serragem_valor) from serragem where MONTH(serragem_compra)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_serragem.setText(String.valueOf(rs.getInt("sum(serragem_valor)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
         
          try {
            con = Conexao.conectar();
            sql = "select sum(treinamento_valor) from treinamento where MONTH(treinamento_inicio)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_treinamento.setText(String.valueOf(rs.getInt("sum(treinamento_valor)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }
          try {
            con = Conexao.conectar();
            sql = "select sum(veterinario_valor) from veterinario where MONTH(veterinario_inicio)=?;";
            pst = con.prepareStatement(sql);
            pst.setInt(1, mes);
            rs = pst.executeQuery();

            if (rs.next()) {
                
              txt_financeiro_veterinario.setText(String.valueOf(rs.getInt("sum(veterinario_valor)")));

            } else {
                JOptionPane.showMessageDialog(JF_Principal1, "Nenhum Registro Encontrado");
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(JF_Principal1, "Erro ao consultar: " + e);
        }

    }
}
