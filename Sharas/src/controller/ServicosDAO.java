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
     pst.setString(3, servico.getServico_nome());
     pst.setFloat(2,servico.getServico_preco());
     pst.execute();
        JOptionPane.showMessageDialog(null,"Servico inserido");
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
      JOptionPane.showMessageDialog(null,"Servico Deletado");
    }catch(Exception e){
        System.out.println(e);
    }
    }
    public void alterarServ(Servico servico,int campo){
     try{
          con = Conexao.conectar();
          switch(campo){
              case 1: sql = "UPDATE servico SET servico_tipo=? WHERE servico_id = ?";break;
              case 2: sql = "UPDATE servico SET servico_nome=? WHERE servico_id = ?";break;
              case 3: sql = "UPDATE servico SET servico_valor=? WHERE servico_id = ?";break;
          }
           pst = con.prepareStatement(sql);
          switch(campo){
              case 1: pst.setString(1,servico.getServico_cat());break;
              case 2: pst.setString(1,servico.getServico_nome());break;
              case 3: pst.setFloat(1, servico.getServico_preco());break;
          }
          pst.setInt(2,servico.getServico_id());
          pst.execute();
        JOptionPane.showMessageDialog(null,"Servico Alterado");
            Conexao.desconectar();
          }catch(SQLException e){
              Conexao.desconectar();
              System.out.println("erro :"+e);
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
  public void carregarNbaias(JTextField b_d,JTextField b_u,JTextField b_da){
  try{
          con = Conexao.conectar();
          sql = "select * from n_baias ";
          pst = con.prepareStatement(sql);
          rs= pst.executeQuery();
          if(rs.next()){
          b_d.setText(rs.getString("D"));
          b_u.setText(rs.getString("U"));
          String n = rs.getString("M");
          b_da.setText(n);
          Conexao.desconectar();
          }
          }catch(SQLException e){
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
  
  }
   public void CarregarBaias(int opt,JTable baias){
      try{
          con = Conexao.conectar();
         switch(opt){
             case 1:sql = "select * from vw_baias ";break;
             case 2:sql = "select * from vw_baias where Status ='Disponivel' OR Status='Manutenção'";break;
             case 3:sql = "select * from vw_baias where Status ='Manutenção' OR Status='Em uso'";break;
             case 4:sql = "select * from vw_baias where Status ='Disponivel' OR Status='Em uso'";break;
             case 5:sql = "select * from vw_baias where Status ='Manutenção' OR Status='Em uso'";break;
             case 6:sql = "select * from vw_baias where Status ='Manutenção'";break;
             case 7:sql = "select * from vw_baias where Status ='Disponivel'";break;
             case 8:sql = "select * from vw_baias where Status ='Em uso'";break;
         }
          pst = con.prepareStatement(sql);
          rs= pst.executeQuery();
          baias.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
          }catch(SQLException e){
              Conexao.desconectar();
              System.out.println("erro :"+e);
          }
   } 
    
    
}
