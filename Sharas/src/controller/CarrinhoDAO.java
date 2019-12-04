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
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import model.Carrinho;
import net.proteanit.sql.DbUtils;


/**
 *
 * @author maikon.rosa
 */
public class CarrinhoDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //carrega os dados da tabela de produto
       public void InseriCarrinho(Carrinho carrinho,boolean v){
            try{
        con = Conexao.conectar();
        sql = "insert into carrinho values (?,?);";
        pst = con.prepareStatement(sql);
        pst.setInt(1, carrinho.getCarrinhoid());
        pst.setInt(2, carrinho.getServico_id());
        pst.execute();       
        Conexao.desconectar();
    }catch(SQLException e){
        Conexao.desconectar();
          System.err.println(e);
    }
     
  
        }
           public void zerarcarrinho(Carrinho carrinho){
      try{
        con = Conexao.conectar();
            sql = "DELETE FROM `carrinho` WHERE carrinhoid>0";
            pst = con.prepareStatement(sql);
            pst.execute();
            carrinho.zerarCarrinho();
            Conexao.desconectar();
    }catch(SQLException e){
          System.err.println(e);
          Conexao.desconectar();
    }
}
 public boolean  verificaAlojamento(Carrinho carrinho){
 
     try{
        con = Conexao.conectar();    
        sql="SELECT IF(dispo>0,dispo,0)as n from n_baia";
        pst = con.prepareStatement(sql);
        rs=pst.executeQuery();
        if(rs.next()){
            if(rs.getInt("n")>0){
                Conexao.desconectar();
                return (true);
            } else {
                 Conexao.desconectar();
                return (false);
            }
        }
        sql = "UPDATE `baia` SET `baia_status`=2 WHERE (SELECT baia.baia_id from baia WHERE baia.baia_status = 1 limit 1) limit 1 ";
               return (false);
   }catch(SQLException e){
          System.err.println(e);
          return (false);
    }
           }

          public void carregarCarrinho(JTable cli,JLabel total){
      try{
        con = Conexao.conectar();
            sql = "select * from vw_carrinho";
            pst = con.prepareStatement(sql);
            rs=pst.executeQuery();
            cli.setModel(DbUtils.resultSetToTableModel(rs));
            sql = "SELECT SUM(Valor) FROM vw_carrinho";
           pst = con.prepareStatement(sql);
           rs=pst.executeQuery();
           if(rs.next()){
            total.setText(""+rs.getFloat(1));
           }
            Conexao.desconectar();
    }catch(SQLException e){
        Conexao.desconectar();
          System.err.println(e);
    }
        }
public void DeletaItem(Carrinho carrinho){
        System.err.println(""+carrinho.getCarrinhoid());
    try{
        con = Conexao.conectar();
            sql = "DELETE FROM `carrinho` WHERE carrinhoid=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, carrinho.getCarrinhoid());
            pst.execute();
            Conexao.desconectar();
    }catch(SQLException e){
          System.err.println(e);
          Conexao.desconectar();
    }
}

}
