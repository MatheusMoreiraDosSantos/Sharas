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
import javax.swing.JOptionPane;
import javax.swing.text.View;
import model.Carrinho;
import model.Cliente;
import model.Contrato;

/**
 *
 * @author PC_Sala
 */
public class ContratoDAO {
      Connection con;
    String sql,sql2;
    PreparedStatement pst;
    ResultSet rs;
    
    public void venda_produto(Contrato contrato){

        try{
    con = Conexao.conectar();
    sql="select servico_id from carrinho";
    pst=con.prepareStatement(sql);
    rs=pst.executeQuery();
    sql="insert into item_contrato values(?,?)";
    pst=con.prepareStatement(sql);
    pst.setInt(2,contrato.getContratoid());
    while(rs.next()){
       pst.setInt(1, rs.getInt(1));
       pst.execute();
    }
    Conexao.desconectar();
    JOptionPane.showMessageDialog(null, "se é o bixao memo");
    }catch(SQLException e){
        System.err.println("venda_produto erro "+e);
    }
    
    }
    public void Finalizar(Cliente cliente,Contrato contrato){
    try{
    con = Conexao.conectar();
        System.out.println(cliente.getClienteid());
    sql="insert into contrato(cliente_id,contrato_valor) values (?,(SELECT SUM(Valor) FROM vw_carrinho))";
    pst=con.prepareStatement(sql);
    pst.setInt(1, cliente.getClienteid());
    pst.execute();
    sql="select contrato_id from contrato ORDER by contrato_id desc limit 1";
    pst=con.prepareStatement(sql);
    rs=pst.executeQuery();
    if(rs.next()){
        contrato.setContratoid(rs.getInt(1));
        venda_produto(contrato);
    }
    }catch(SQLException e){
    System.err.println("Venda erro : "+e);
    }
    }
}
