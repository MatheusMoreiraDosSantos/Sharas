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
import model.Misc;
import model.Pessoa;

/**
 *
 * @author maikon.rosa
 */
public class miscDAO {
     Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    Pessoa p = new Pessoa();
    //Ainda sem funcionalidade 
    public void salvarTelefone(Misc telefone){
    try{
        con = Conexao.conectar();
        sql="insert into telefone values (null,?,?,?)";
        pst=con.prepareStatement(sql);
        pst.setString(1, telefone.getTelefone_numero());
        pst.setInt(2, telefone.getTelefonetipo());
        pst.setInt(3, p.getPessoa_id());
        pst.execute();
        Conexao.conectar();       
}catch(SQLException e){
        System.out.println(e); 
}
}
}
