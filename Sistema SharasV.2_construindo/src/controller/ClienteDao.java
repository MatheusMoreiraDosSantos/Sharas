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
import model.Enderecos;

/**
 *
 * @author maiko
 */
public class ClienteDao {
     Connection con;
    String sql1;
    String sql2;
    PreparedStatement pst;
    ResultSet rs;
    PessoaDAO pessoa = new PessoaDAO();
    EnderecoDAO ende = new EnderecoDAO();
    //Adiciona o novo Cliente , ainda precisa de ajuste 
     public void salvarCliente(Cliente pes, JFrame tela,Enderecos end){
         //Verifica se salvou o endereço corretamente 
         if(ende.salvarEnderecos(end, tela, pes)){
             
         try {
            con = Conexao.conectar();
            sql1="insert into pessoa values (null,'PF',?,?,?,2)";
            pst = con.prepareStatement(sql1);
            pst.setString(1, pes.getPessoa_cpfcnpj());
            pst.setString(2,pes.getPessoa_nome());
            pst.setString(3, pes.getPessoa_email());
            pst.execute();
              JOptionPane.showMessageDialog(tela, "Cadastro realizado!");
            Conexao.desconectar();
        }catch(SQLException e){
                 System.out.println(""+e);
                 JOptionPane.showMessageDialog(tela, "Erro ao cadastrar!");
                 Conexao.desconectar();
        }
         }else{
             JOptionPane.showMessageDialog(tela, "Erro endereços");
         }
     }
    
}
