/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import funcoes.F_JF_principal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import net.proteanit.sql.DbUtils;
import view.JF_Principal1;

/**
 *
 * @author PC_Sala
 */
public class Validacoes {
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    F_JF_principal f_principal= new F_JF_principal();
//valida se existe no banco
 public  boolean verificaBanco(JTextField campo,JLabel erro,String tabela,String campo_tabela){
    if(f_principal.camponull(campo, erro)){
        try {
            con = Conexao.conectar();
            sql = "select "+campo_tabela+" from "+tabela+" where "+campo_tabela+" = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            rs = pst.executeQuery();
            if(rs.next()){
                erro.setText("Essa informação já está em uso");
                Conexao.desconectar();
                return(false);
            }
            return (true);
            
        } catch (SQLException e) {
               
             erro.setText("Erro inesperado");
            return(false);
        }
    }
         return (false);
 }
 public  boolean verificaCpf(JTextField campo,JLabel erro){
    if(f_principal.camponull(campo, erro)){
        if(f_principal.cpf(campo, erro))
        try {
            con = Conexao.conectar();
            sql = "select pessoa_cpfcnpj from pessoa where pessoa_cpfcnpj = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            rs = pst.executeQuery();
            if(rs.next()){
                Conexao.desconectar();
                erro.setText("Essa informação já está em uso");
                return(false);
            }
            return (true);
            
        } catch (SQLException e) {
            erro.setText("Erro inesperado");
            return(false);
        }
    }
         return (false);
 }
    
}
