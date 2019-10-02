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
    
        public  void insereproduto(JTable tabela){
        try{
               con=Conexao.conectar();
               sql="insert  carrinho values ? ";
            
            
            
                
                sql="insert into carrinho values ? ";
                pst= con.prepareStatement(sql);
                rs = pst.executeQuery();
                if(rs.next()){
                    tabela.setModel(DbUtils.resultSetToTableModel(rs));
                }
                
                
        }catch(SQLException e ){
           
        }
}
    
    
}