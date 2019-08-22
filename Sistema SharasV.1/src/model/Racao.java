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
public class Racao {

    /**
     * @return the racao_compra
     */
    public Date getRacao_compra() {
        return racao_compra;
    }

    /**
     * @param racao_compra the racao_compra to set
     */
    public void setRacao_compra(Date racao_compra) {
        this.racao_compra = racao_compra;
    }

    /**
     * @return the racao_id
     */
    public int getRacao_id() {
        return racao_id;
    }

    /**
     * @param racao_id the racao_id to set
     */
    public void setRacao_id(int racao_id) {
        this.racao_id = racao_id;
    }

    /**
     * @return the raca_compra
     */
    

    /**
     * @return the racao_duracao
     */
    public Date getRacao_duracao() {
        return racao_duracao;
    }

    /**
     * @param racao_duracao the racao_duracao to set
     */
    public void setRacao_duracao(Date racao_duracao) {
        this.racao_duracao = racao_duracao;
    }

    /**
     * @return the racao_fornecedor
     */
    public String getRacao_fornecedor() {
        return racao_fornecedor;
    }

    /**
     * @param racao_fornecedor the racao_fornecedor to set
     */
    public void setRacao_fornecedor(String racao_fornecedor) {
        this.racao_fornecedor = racao_fornecedor;
    }

    /**
     * @return the racao_quantidade
     */
    public int getRacao_quantidade() {
        return racao_quantidade;
    }

    /**
     * @param racao_quantidade the racao_quantidade to set
     */
    public void setRacao_quantidade(int racao_quantidade) {
        this.racao_quantidade = racao_quantidade;
    }

    /**
     * @return the racao_valor
     */
    public Float getRacao_valor() {
        return racao_valor;
    }

    /**
     * @param racao_valor the racao_valor to set
     */
    public void setRacao_valor(Float racao_valor) {
        this.racao_valor = racao_valor;
    }

    /**
     * @return the racao_descricao
     */
    public String getRacao_descricao() {
        return racao_descricao;
    }

    /**
     * @param racao_descricao the racao_descricao to set
     */
    public void setRacao_descricao(String racao_descricao) {
        this.racao_descricao = racao_descricao;
    }
    private int racao_id;
    private Date racao_compra;
    private Date racao_duracao;
    private String racao_fornecedor;
    private int racao_quantidade;
    private Float racao_valor;
    private String racao_descricao;
}
