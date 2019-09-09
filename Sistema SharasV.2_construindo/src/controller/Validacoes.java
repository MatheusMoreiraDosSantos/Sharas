/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import funcoes.F_JF_principal;
import funcoes.F_email;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import model.Misc;
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
  Misc misc = new Misc();
    F_JF_principal f_principal= new F_JF_principal();
    
//valida se existe no banco
 
 public boolean emailEnvio(JTextField campo,JLabel erro){
         try {
            con = Conexao.conectar();
            sql = "select pessoa_email from pessoa where pessoa_email = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            rs = pst.executeQuery();
            if(rs.next()){
                Conexao.desconectar();
                return(true);
            }
           
            erro.setText("Email não cadastrado");
            Conexao.desconectar(); 
            return (false);
        } catch (SQLException e) {
             erro.setText("Erro inesperado");
             Conexao.desconectar();
             return(false);
        }
   
    }
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
 public void Telefone(){
   try{
       for (String ddd : misc.getDdd()) {
           System.out.println(""+ddd);
       }
   }catch(Exception e){
   } 

 }
    public static void main(String[] args) {
    
    }
   

    
    
}
