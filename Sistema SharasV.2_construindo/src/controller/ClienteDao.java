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
import javax.swing.JTable;
import javax.swing.JTextField;
import model.Cliente;
import model.Enderecos;
import net.proteanit.sql.DbUtils;
import view.JF_Contrato;

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
    EnderecoDAO ende = new EnderecoDAO();
    
     public void salvarCliente(Cliente pes, JFrame tela,Enderecos end){
       //Verifica se salvou o endereço corretamente 
         if(ende.salvarEnderecos(end, tela, pes)){ 
             if(pessoa.salvarPessoaf(pes, tela, 2,end)){
                 try{
                 con=Conexao.conectar();
                 sql="insert into cliente values (null,(select pessoa_id from pessoa where pessoa_cpfcnpj=?),0)";
                 pst=con.prepareStatement(sql);
                 pst.setString(1,pes.getPessoa_cpfcnpj());
                 pst.execute();
                    JOptionPane.showMessageDialog(tela, "Cliente Cadastrado");
                 }catch(SQLException e){
                        System.err.println(e);
                     JOptionPane.showMessageDialog(tela, "Cliente Não cadastrado");
                 }
             } else{
                 System.out.println("erro pessoa");
                 JOptionPane.showMessageDialog(tela, "Cliente Não cadastrado");
             }
         }else{
               System.out.println("erro endereco"); 
             JOptionPane.showMessageDialog(tela, "Erro endereços");
         }
     }
 //Deletar cliente
     
       JF_Contrato tela = new JF_Contrato();
  //Carrega os dados da tabela de cliente 
    public void CarregarTabelacli(JTable cli,JTextField pesquisa) {
        try {
            con = Conexao.conectar();
            sql = "select * from tab_cliente where Nome like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" +pesquisa.getText()+ "%");
            rs = pst.executeQuery();
            cli.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(tela, "Erro ao consultar: " + e);
        }

    }
    
}
