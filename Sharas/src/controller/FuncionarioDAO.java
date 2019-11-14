/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import javax.swing.*;
import model.Enderecos;
import model.Funcionarios;
import net.proteanit.sql.DbUtils;
import view.JF_funcionarios;

/**
 *
 * @author Matheus Moreira
 */
public class FuncionarioDAO {

    Connection con;
    String sql;
    
PreparedStatement pst;
ResultSet rs;
PessoaDAO pessoa = new PessoaDAO();
    Enderecos end = new Enderecos();
    //Métodos
    //SALVAR
    public void salvarFuncionario(Funcionarios func,JFrame tela) {
//Chama a função para salvar pessoas , se retornar verdadeira é por que foi registrado.
end.setCep("0");
end.setNumero("000");
if(pessoa.salvarPessoaf(func, tela, 1,end)){
        try {
            //inicia a inserção na tabela de rh 
          con = Conexao.conectar();
            sql="insert into rh values(null,?,null,(select pessoa_id from pessoa where pessoa_cpfcnpj=?) ,? )";
            pst = con.prepareStatement(sql);
            pst.setDate(1, func.getFuncionario_inicio());
            pst.setString(2, func.getPessoa_cpfcnpj());
            pst.setInt(3, func.getFuncionario_cargo());
           pst.execute();
           JOptionPane.showMessageDialog(tela, "Cadastrado com Sucesso!");
           Conexao.desconectar();
        } catch (Exception e) {
            Conexao.desconectar();
            JOptionPane.showMessageDialog(tela, "Erro ao Cadastrar: " + e);
        }
}else{
        JOptionPane.showMessageDialog(tela, "erro pessoa");
}

    }
    //Para carregar os dados da tabela 
    public void carregarFuncionario(JTable tabela,JTextField pesquisa,JFrame tela) {
     //tesse if ainda não esta em uso porem se tirar ele vai dar ruim   
        if(pesquisa!=null){
        try {
            con = Conexao.conectar();
            sql="select * from vw_funcionario where (Nome like ?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%"+pesquisa.getText()+"%");
             rs=pst.executeQuery();
           tabela.setModel(DbUtils.resultSetToTableModel(rs));
           Conexao.desconectar();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(tela, "Erro ao Consultar: " + e);
        }
      }else{//codigo ainda em fase de construção 
           try{
          con = Conexao.conectar();
          sql="select * from vw_funcionarios";
          rs=pst.executeQuery();
         tabela.setModel(DbUtils.resultSetToTableModel(rs));
          Conexao.desconectar();
       }catch(SQLException e){
        System.out.println(e);
       }}
    }
    //Altera dados de pessoa 
           public void AlterarPessoa(Funcionarios pessoa,int campo){
              String id="";
           try{
           con = Conexao.conectar();
           //utiliza o case para saber qual dado ira modificar   
           switch(campo){
               case 1: sql="update rh set cargo_cargo_id  =? where rg_id = ?";id="Cargo";break;
               case 2:sql="update rh set pessoa_cpfcnpj  =? where rg_id= ?";id="Data";break;
               default: System.err.print("erro inesperado");
             }
           //prepara o sql selecionado 
           pst = con.prepareStatement(sql);
           switch(campo){
               //para indentifica qual pst ira utilizar 
               case 1: pst.setInt(1,pessoa.getFuncionario_cargo() );break;
               case 2: pst.setDate(1, pessoa.getFuncionario_inicio());break;
               default: System.err.print("erro inesperado");
           }
           //pst  para usar como id
           pst.setInt(2, pessoa.getFuncionario_id());
           pst.execute();
           JOptionPane.showMessageDialog(null, ""+id+" alterado");
           Conexao.desconectar();
           }catch(SQLException e){
           
           }
        }
//Deleta o funcionario
           public void Deletarfun(Funcionarios func,JDialog tela){
  //Primeiro faz o DELETE do funcionario
           try{
           con = Conexao.conectar();
           sql="DELETE FROM rh WHERE rg_id=?";
           pst = con.prepareStatement(sql);
           pst.setInt(1,func.getFuncionario_id());
           pst.execute();
           Conexao.desconectar();
           //chama a função para deletar a Pessoa , ainda em construção porem já funciona
            if(pessoa.Deletarfun(func)){
                JOptionPane.showMessageDialog(null, "deletado com sucesso");
                tela.dispose();
                JF_funcionarios tela_fun = new JF_funcionarios();
                carregarFuncionario(tela_fun.tab_func, null, tela_fun);
            }else{
                JOptionPane.showMessageDialog(null, "Erro ao deletar");
            }
           }catch(SQLException e){
               JOptionPane.showMessageDialog(null, "Erro ao deletar");
               System.out.println(e);
           }
     }
}
