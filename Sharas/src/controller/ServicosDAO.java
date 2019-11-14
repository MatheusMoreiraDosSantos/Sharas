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
import javax.swing.JTable;
import javax.swing.JTextField;
import model.Servico;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author maikon.rosa
 */
public class ServicosDAO {
      Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    public void adicionarServicos(Servico servico){
    try{
     con=Conexao.conectar();
     sql="INSERT INTO servico VALUES (NULL,?,?,?)";
     pst = con.prepareStatement(sql);
     pst.setString(1, servico.getServico_cat());
     pst.setString(2, servico.getServico_nome());
     pst.setFloat(3,servico.getServico_preco());
     pst.execute();
    }catch(Exception e){
        System.out.println(e);
    }
    
    }
    public void apagarervico(Servico servico){
     try{
     con=Conexao.conectar();
     sql="Delete from servico where servico_id = ?";
     pst = con.prepareStatement(sql);
     pst.setInt(1, servico.getServico_id());
     pst.execute();
    }catch(Exception e){
        System.out.println(e);
    }
    }
    public void CarregarTabelaServ(JTable tab_serv,JTextField pesquisa){
       try{
          con = Conexao.conectar();
          sql = "select * from vw_servicos  where Nome like ?";
          pst = con.prepareStatement(sql);
          pst.setString(1, "%"+pesquisa.getText()+"%");
          rs= pst.executeQuery();
          tab_serv.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
          }catch(SQLException e){
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
      }
        
    
    
    
}
