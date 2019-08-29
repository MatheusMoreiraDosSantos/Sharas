/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Matheus Moreira
 */
public class Pastagem {

    /**
     * @return the pastagem_data
     */
    public Date getPastagem_data() {
        return pastagem_data;
    }

    /**
     * @param pastagem_data the pastagem_data to set
     */
    public void setPastagem_data(Date pastagem_data) {
        this.pastagem_data = pastagem_data;
    }

    /**
     * @return the pastagem_id
     */
    public int getPastagem_id() {
        return pastagem_id;
    }

    /**
     * @param pastagem_id the pastagem_id to set
     */
    public void setPastagem_id(int pastagem_id) {
        this.pastagem_id = pastagem_id;
    }

    /**
     * @return the pastagem_numero
     */
    public int getPastagem_numero() {
        return pastagem_numero;
    }

    /**
     * @param pastagem_numero the pastagem_numero to set
     */
    public void setPastagem_numero(int pastagem_numero) {
        this.pastagem_numero = pastagem_numero;
    }

    /**
     * @return the pastagem_quantidade
     */
    public int getPastagem_quantidade() {
        return pastagem_quantidade;
    }

    /**
     * @param pastagem_quantidade the pastagem_quantidade to set
     */
    public void setPastagem_quantidade(int pastagem_quantidade) {
        this.pastagem_quantidade = pastagem_quantidade;
    }

    /**
     * @return the pastegem_qualidade
     */
    public int getPastegem_qualidade() {
        return pastegem_qualidade;
    }

    /**
     * @param pastegem_qualidade the pastegem_qualidade to set
     */
    public void setPastegem_qualidade(int pastegem_qualidade) {
        this.pastegem_qualidade = pastegem_qualidade;
    }

    /**
     * @return the pastagem_anotacao
     */
    public String getPastagem_anotacao() {
        return pastagem_anotacao;
    }

    /**
     * @param pastagem_anotacao the pastagem_anotacao to set
     */
    public void setPastagem_anotacao(String pastagem_anotacao) {
        this.pastagem_anotacao = pastagem_anotacao;
    }
    private Date pastagem_data;
    private int pastagem_id;
    private int pastagem_numero;
    private int pastagem_quantidade;
    private int pastegem_qualidade;
    private String pastagem_anotacao;
}
