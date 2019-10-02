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
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import model.Cliente;
import model.Pessoa;

/**
 *
 * @author maiko
 */
public class PessoaDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
   
         public int idpessoa(Cliente pessoa){
       try{
            con = Conexao.conectar();
            sql = "select pessoa_id where pessoa_cpfcnpj = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, pessoa.getPessoa_cpfcnpj());
            rs= pst.executeQuery();
            if(rs.next()){
            return rs.getInt(0);
            }
            Conexao.desconectar();
         }catch(Exception e){
             System.out.println(e+"  select");
         }
             System.out.println(pessoa.getPessoa_cpfcnpj());
         return 0;
         }
         public void salvarPessoaj(Cliente pessoa, JFrame jfUsuario,int tipo) {
         try {
            con = Conexao.conectar();
            sql = "INSERT INTO pessoa (pessoa_id , pessoa_ind, pessoa_cpfcnpj, pessoa_nome, pessoa_email,pesoa_cargo)"
                   +" VALUES (NULL, 'pj', ?, ?, ?,?);";
            pst = con.prepareStatement(sql);
            pst.setString(1, pessoa.getPessoa_cpfcnpj());
            pst.setString(2, pessoa.getPessoa_nome());
            pst.setString(3, pessoa.getPessoa_email());
            pst.setInt(4, tipo);
            pst.execute();
            Conexao.desconectar();
        }catch(SQLException e){
                 System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
         }
    
      public void salvarPessoaf(Cliente pessoa, JFrame jfUsuario,int tipo){
         try {
            con = Conexao.conectar();
            sql = "INSERT INTO pessoa (pessoa_id , pessoa_ind, pessoa_cpfcnpj, pessoa_nome, pessoa_email)"
                   +" VALUES (NULL, 'pf', ?, ?, ?,?);";
            pst = con.prepareStatement(sql);
            pst.setString(1, pessoa.getPessoa_cpfcnpj());
            pst.setString(2, pessoa.getPessoa_nome());
            pst.setString(3, pessoa.getPessoa_email());
            pst.setInt(4, tipo);
            pst.execute();
            Conexao.desconectar();
        }catch(SQLException e){
                 System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
    }
          /*    public void alterarPesssoa(JTextField campo,String campotabela,String nome){
         
                  try{
           con = Conexao.conectar();
            sql = "update  pessoa  set "+campotabela+"=? where pessoa_cpfcnpj =?";
            pst = con.prepareStatement(sql);
            pst.setString(1, campo.getText());
            pst.setString(2,usu.id); 
            pst.execute();
             JOptionPane.showMessageDialog(null, nome+" alterado com Sucesso!");
          }catch(SQLException e){                     
          System.out.println(""+e);
          }  
        
        }*/
}
