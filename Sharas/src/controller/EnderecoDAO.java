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

/**
 *
 * @author maikon.rosa
 */
//Codigo em construção ainda não está sendo utilizado
public class EnderecoDAO {
     Connection con;
    String sql1;
    String sql2;
    PreparedStatement pst;
    ResultSet rs;
      public boolean salvarEnderecos(Enderecos end, JFrame tela,Cliente cli){
          try {  
            con = Conexao.conectar();
            sql1="SELECT ID from idenddereco WHERE c= ? and n = ? ";
            pst = con.prepareStatement(sql1);
            pst.setString(1, end.getNumero());
            pst.setString(2,end.getCep());
            rs=pst.executeQuery();
            if(rs.next()){
                System.out.print("achou");
             Conexao.desconectar();
                return (true);
            }else{    
            sql1="insert into endereco values (null,?,?,?,?,?,?)";
            pst = con.prepareStatement(sql1);
            pst.setString(1, end.getNumero());
            pst.setString(2,end.getCep());
            pst.setString(3,end.getRua());
            pst.setString(4,end.getBairro());
            pst.setString(5,end.getCidde());
            pst.setString(6,end.getEstado());
            pst.execute();
              Conexao.desconectar();
            return(true);
            }
        }catch(SQLException e){    
            System.out.println("endereco erro"+e);
                 JOptionPane.showMessageDialog(tela, "Erro ao cadastrar!");
                 Conexao.desconectar();
                 return(false);
        }
}
}
