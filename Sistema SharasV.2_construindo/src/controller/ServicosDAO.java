/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import funcoes.F_email;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.*;

import model.Sessao;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author maiko
 */
public class ServicosDAO {
       Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    F_email fmail = new F_email();
    Sessao sessao = new Sessao();
    //Verifica o login e se causo achar algo salva na sessão 
    public  void Carregarproduto(JTable tabela){
        try{
                con=Conexao.conectar();
                sql="SELECT * from vw_produto";
                pst= con.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next()){
                    tabela.setModel(DbUtils.resultSetToTableModel(rs));
                }
                
                
        }catch(SQLException e ){
           
        }
}
    public  void Carregarcliente(JTable tabela){
        try{
                con=Conexao.conectar();
                sql="SELECT * from vw_cliente ";
                pst= con.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next()){
                    tabela.setModel(DbUtils.resultSetToTableModel(rs));
                }
                
                
        }catch(SQLException e ){
           
        }
}
    
        public  void carrinho(JTable tabela, int valor){
                System.out.println(valor);
            try{
               con=Conexao.conectar();
               sql="SELECT * FROM vw_servico_produto";
               pst= con.prepareStatement(sql);
               rs=pst.executeQuery();
               if(rs.next()){
              sql="insert into produto_servico values ?,?";
              System.out.println(rs.getInt(1));
              pst= con.prepareStatement(sql);
               pst.setInt(1,rs.getInt(0));
               pst.setInt(2, valor);
               pst.execute();
               sql="select * from produto_servico where servicoid ="+rs.getInt(1)+"";
               pst= con.prepareStatement(sql);
               rs=pst.executeQuery();
               if(rs.next()){
               tabela.setModel(DbUtils.resultSetToTableModel(rs));
               }
               }
              
        }catch(SQLException e ){
           
        }
}
    
    
}