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
     public float pagarDeb(Cliente cli,float valor){
         float parapagar;
         float troco=0;   
         try{
                 con=Conexao.conectar();
                 sql="Select  cliente_deb from cliente WHERE clienteid=? ";
                 pst=con.prepareStatement(sql);
                 pst.setInt(1,cli.getClienteid());
                 rs=pst.executeQuery();
                 if(rs.next()){
                        parapagar=rs.getFloat("cliente_deb");
                        troco = valor-parapagar;
                      if(troco>=0){
                        sql="UPDATE cliente SET cliente_deb= 0 WHERE clienteid=?";
                        pst=con.prepareStatement(sql);
                        pst.setInt(1,cli.getClienteid());
                        pst.execute();
                        return troco;    
                      }else{
                      troco=troco*-1;
                        sql="UPDATE cliente SET cliente_deb= ? WHERE clienteid=?";
                        pst=con.prepareStatement(sql);
                        pst.setFloat(1, troco);
                        pst.setInt(2,cli.getClienteid());
                        pst.execute();
                      }
                      
                 }
                 
                Conexao.desconectar();
                 return 0;
                 }catch(SQLException e){
                        System.err.println(e);
                     JOptionPane.showMessageDialog(null, "Erro no Pagamento");
                      Conexao.desconectar();
                     return 0;
                 }
     }
     public void delCliente(Cliente pes){
       //Verifica se salvou o endereço corretamente 
                 try{
                 con=Conexao.conectar();
                 sql="Delete from cliente where clienteid=?";
                 pst=con.prepareStatement(sql);
                 pst.setInt(1,pes.getClienteid());
                 pst.execute();
                       JOptionPane.showMessageDialog(null, "Cliente  deletado");
                 }catch(SQLException e){
                        System.err.println(e);
                     JOptionPane.showMessageDialog(null, "Cliente Não deletado");
                 }
     }
   
    //Carregar dados de cliente para alterar 
       public void Alterarcliente(Cliente cli,Enderecos end,JTextField nome,JTextField cpf,JTextField email,JTextField cep){
         try {
            con = Conexao.conectar();
            sql = "select * from vw_cli where id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, cli.getClienteid());
            rs = pst.executeQuery();
            if(rs.next()){
                cli.setPessoa_nome(rs.getString(2));
                cli.setPessoa_cpfcnpj(rs.getString(3));
                cli.setPessoa_email(rs.getString(4));
                end.setCep(rs.getString(5));
                end.setRua(rs.getString(6));
                end.setNumero(rs.getString(7));
                end.setBairro(rs.getString(8));
                end.setEstado(rs.getString(9));
                end.setCidde(rs.getString(10));
            }
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao consultar: " + e);
        }
       
       }
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
            JOptionPane.showMessageDialog(null, "Erro ao consultar: " + e);
        }

    }
    
}
