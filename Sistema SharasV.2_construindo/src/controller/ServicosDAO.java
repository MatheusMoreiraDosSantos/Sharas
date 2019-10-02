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
    
        public  void carrinho(JTable tabela, int valor,JTextField total){
            int n =0;  
            System.out.println(valor);
            try{
               con=Conexao.conectar();
               sql="SELECT * FROM vw_servico_produto";
               pst= con.prepareStatement(sql);
               rs=pst.executeQuery();
               if(rs.next()){
               sql="insert into produto_servico values (?,?)";
               n = rs.getInt(1);
               pst= con.prepareStatement(sql);
               pst.setInt(1,rs.getInt(1));
               pst.setInt(2, valor);
               pst.execute();
               sql="select * from carrinho where Compra = ? ";
               pst= con.prepareStatement(sql);
               pst.setInt(1, rs.getInt(1));
               rs=pst.executeQuery();
               System.out.println("chegou aqui 1");
               if(rs.next()){
                   System.out.println("chegou aqui");
               tabela.setModel(DbUtils.resultSetToTableModel(rs));
               sql="select sum(Valor)from carrinho WHERE Compra = ?";
               pst= con.prepareStatement(sql);
               pst.setInt(1, n);
               rs=pst.executeQuery();
               if(rs.next()){
               total.setText("R$"+rs.getFloat(1));
               }
               }
               }
              
        }catch(SQLException e ){
           
        }
}
    
    
}