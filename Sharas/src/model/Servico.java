/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;
/**
 *
 * @author maikon.rosa
 */
public class Servico {
        private int servico_id;
        private String servico_cat;
        private String servico_nome;
        private float servico_preco;
    public int getServico_id() {
        return servico_id;
    }

    public void setServico_id(int servico_id) {
        this.servico_id = servico_id;
    }

    public String getServico_cat() {
        return servico_cat;
    }

    public void setServico_cat(String servico_cat) {
        this.servico_cat = servico_cat;
    }

    public String getServico_nome() {
        return servico_nome;
    }

    public void setServico_nome(String servico_nome) {
        this.servico_nome = servico_nome;
    }

    public float getServico_preco() {
        return servico_preco;
    }

    public void setServico_preco(float servico_preco) {
        this.servico_preco = servico_preco;
    }
}
