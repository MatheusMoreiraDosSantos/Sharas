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
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import model.Cargo;
import view.JF_Principal1;

/**
 *
 * @author maikon.rosa
 */
public class CargoDAO {
      Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;
    //Carrega os cargos em combobox 
    public void selectCargo(JComboBox cb) {
       /* try {
            con = Conexao.conectar();
            sql = "SELECT cargo_id,cargo_nome from cargo ";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
           cb.removeAllItems();
            cb.addItem(new Cargo(0,"Selecione..."));
           while(rs.next()){
              cb.addItem(new Cargo(rs.getInt("cargo_id"),rs.getString("cargo_nome")));
           }
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro" + e);
        }*/
    }
}

