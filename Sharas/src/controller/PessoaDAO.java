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
  //Recupera pessoa id se nesceserario
         public int idpessoa(Pessoa pessoa){
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
         public boolean salvarPessoaj(Pessoa pessoa, JFrame jfUsuario,int tipo,Enderecos end) {
         try {
            con = Conexao.conectar();
            sql = "INSERT INTO pessoa  VALUES (NULL, 'PJ', ?, ?, ?,?,(SELECT ID from idendderecoo WHERE c = ? and n = ? ));";
            pst = con.prepareStatement(sql);
            pst.setString(1, pessoa.getPessoa_cpfcnpj());
            pst.setString(2, pessoa.getPessoa_nome());
            pst.setString(3, pessoa.getPessoa_email());
            pst.setInt(4, tipo);
            pst.execute();
            Conexao.desconectar();
            return(true);
        }catch(SQLException e){
                 System.out.println("Pessoa erro"+e);
           return(false);
        }
         }
    
             public boolean salvarPessoaf(Pessoa pessoa, JFrame jfUsuario,int tipo,Enderecos end) {
       //Insere na tabela os dados de pessoas e retorna verdadeiro ou falos caso não de erro 
                 try {
            con = Conexao.conectar();
            sql ="INSERT INTO pessoa  VALUES (NULL, 'PF', ?, ?, ?,?,(SELECT ID from idenddereco WHERE c = ? and n = ? ));";
            pst = con.prepareStatement(sql);
            pst.setString(1, pessoa.getPessoa_cpfcnpj());
            pst.setString(2, pessoa.getPessoa_nome());
            pst.setString(3, pessoa.getPessoa_email());
            pst.setInt(4, tipo);
            pst.setString(5, end.getCep());
            pst.setString(6, end.getNumero());
            pst.execute();
            Conexao.desconectar();
            return(true);
        }catch(SQLException e){
                 System.out.println(""+e);
           return(false);
        }
        }
    //Alterar pessoas 
           public void AlterarPessoa(Pessoa pessoa,int campo){
         String id="";//String que retorna o nome do campo que foi alterado
           try{//inicio do try para tratar erros 
           con = Conexao.conectar();//abrir conexão 
             switch(campo){//inicio do switch que vai tratar qual campo alterar,de acordo com o numero passado em campo
               case 1: sql="update pessoa set pessoa_nome  =? where pessoa_cpfcnpj = ?";id="Nome";break;//altera o nome na tabela  
               case 2:sql="update pessoa set pessoa_email  =? where pessoa_cpfcnpj = ?";id="E-mail";break;//altera o email 
               default: System.err.print("erro inesperado");//unica forma de chegar aqui é passando parametro errado
             }
           pst = con.prepareStatement(sql);//Prepara o comando para executar no banco   
           switch(campo){//inicio do switch que ira ver qual dado enviar para a query 
               case 1: pst.setString(1, pessoa.getPessoa_nome());break;//NOME
               case 2: pst.setString(1, pessoa.getPessoa_email());break;//EMAIL
               default: System.err.print("erro inesperado");
           }
           pst.setString(2, pessoa.getPessoa_cpfcnpj());//CPF no segundo parametro
           pst.execute();//executa a query 
           JOptionPane.showMessageDialog(null, ""+id+" alterado");//Mostra o campo alterado 
           Conexao.desconectar();//desconecta o banco 
           }catch(SQLException e){//Fim do TRY inicio do Catch onde sera tratado algo se der errado
           JOptionPane.showMessageDialog(null, e);
           }
         }
       //Deletar retorna verdadeiro ou falso se deletou ou não 
       public boolean Deletarfun(Pessoa pessoa){
           try{
           con = Conexao.conectar();
           sql="DELETE FROM pessoa WHERE pessoa_cpfcnpj =?";
           pst = con.prepareStatement(sql);
           pst.setString(1,pessoa.getPessoa_cpfcnpj());
           pst.execute();
           Conexao.desconectar();
           return(true);
           }catch(SQLException e){
               System.err.println(e);
               return (false);
           }
        }
}
