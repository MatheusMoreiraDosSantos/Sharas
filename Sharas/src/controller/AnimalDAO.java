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
import javax.swing.JTable;
import javax.swing.JTextField;
import model.Animal;
import model.Cliente;
import model.P_c;
import net.proteanit.sql.DbUtils;

/**
 *
 * @author Matheus Moreira
 */
public class AnimalDAO {
 
    Connection con;
    String sql;
    PreparedStatement pst;
    ResultSet rs;

    //Métodos
    //SALVAR
    public void salvarAnimal(Animal animal) {
        try {
            con = Conexao.conectar();
            sql = "insert into animal values(null,?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1, animal.getAnimal_nome());
            pst.setString(2, animal.getAnimal_registro());
            pst.setInt(3, animal.getAnimal_proprietario());
            pst.setDate(4, animal.getAnimal_nascimento());
            pst.setString(5, animal.getAnimal_sexo());
            pst.execute();
            JOptionPane.showMessageDialog(null, "Cadastrado com Sucesso!");
           Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao Cadastrar: " + e);
        }
    }

    

    //ALTERAR
    public void alterarAnimal(Animal animal,int escolha) {
        try {
            con = Conexao.conectar();
           switch(escolha){
               case 1:  sql = "update  animal set animal_nome=? where animal_id=?" ;break;
               case 2:sql = "update  animal set  animal_proprietario=? where animal_id=?";break;
               case 3:  sql = "update  animal set  animal_nascimento=? where animal_id=?";break;
               case 4:  sql = "update  animal set  animal_sexo=? where animal_id=?" ;break;
           }
            pst = con.prepareStatement(sql);
         switch(escolha){
             case 1:  pst.setString(1, animal.getAnimal_nome());break;
             case 2:  pst.setInt(1, animal.getAnimal_proprietario()); break;
             case 3:  pst.setDate(1, animal.getAnimal_nascimento()); break;
             case 4:  pst.setString(4, animal.getAnimal_sexo()); break;
         }
            pst.setInt(2, animal.getAnimal_id());
            pst.execute();
            JOptionPane.showMessageDialog(null, "Alterado com Sucesso!");
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao Alterar: " + e);
        }
    }

    //APAGAR
    public void apagarAnimal(Animal animal) {
        try {
            con = Conexao.conectar();
            sql = "delete from animal where animal_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, animal.getAnimal_id());
            if (JOptionPane.showConfirmDialog(null, "Deseja Deletar?", "Atenção", JOptionPane.YES_NO_CANCEL_OPTION) == 0) {
                pst.execute();
                JOptionPane.showMessageDialog(null, "Deletado com Sucesso!");
                Conexao.desconectar();
            }
        } catch (Exception e) {
            JOptionPane.showConfirmDialog(null, "Erro ao deletar: " + e);
        }

    }


    public void carregaTab(JTextField txtPesquisa, JTable tabAnimal) {
        try {
            con = Conexao.conectar();
            sql = "select Código,Animal,Registro,Proprietario from  vw_animal where Animal like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + txtPesquisa.getText() + "%");
            rs = pst.executeQuery();
            tabAnimal.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao consultar: " + e);
        }

    }

    //Carregar proprietarios
      public void selectCli(JComboBox cb) {
          try {
            con = Conexao.conectar();
            sql = "select pessoa_id,pessoa_nome from pessoa where pesoa_cargo =2 ";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            cb.removeAllItems();
            cb.addItem(new P_c(0,"Selecione..."));
           while(rs.next()){
           cb.addItem(new P_c(rs.getInt("pessoa_id"),rs.getString("pessoa_nome")));
           }
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro" + e);
        }
    }
      public void carregartabCavalo_cli(Cliente cliente,JTextField pesquisa,JTable cavalo){
       try {
            con = Conexao.conectar();
            sql = "select Código,Animal,Registro from vw_animal where cd_p=? and Animal like ?" ;
            pst = con.prepareStatement(sql);
            pst.setString(1,cliente.getPessoa_cpfcnpj());
            pst.setString(2, "%" + pesquisa.getText() + "%");
            rs = pst.executeQuery();
            cavalo.setModel(DbUtils.resultSetToTableModel(rs));
            Conexao.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao consultar: " + e);
        }
      
      }
}
