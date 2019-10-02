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
import javax.swing.JRadioButton;
import model.Cliente;

/**
 *
 * @author maiko
 */
public class ClienteDao {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    PessoaDAO pessoa = new PessoaDAO();
     public void salvarCliente(Cliente pes, JFrame jfUsuario,JRadioButton f,JRadioButton j){
         if(f.isSelected()){
         pessoa.salvarPessoaf(pes, jfUsuario, 2);
         }else{
         pessoa.salvarPessoaj(pes, jfUsuario, 2);
         }
       int id = pessoa.idpessoa(pes);
            if(id>0){
             try {
            con = Conexao.conectar();
            sql = "INSERT INTO pessoa (pessoa_id , pessoa_nome, cliente_debito)"
                   +" VALUES (NULl, ?, 0);";
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.execute();
            Conexao.desconectar();
        }catch(SQLException e){
                 System.out.println(""+e);
                 JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar!");
        }
        }else{
            JOptionPane.showMessageDialog(jfUsuario, "Erro ao cadastrar pessoa!");
            }
         
         }
    
}
