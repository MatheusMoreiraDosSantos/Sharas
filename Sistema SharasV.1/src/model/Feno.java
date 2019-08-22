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
 * 
 */
public class Feno {

    /**
     * @return the feno_id
     */
    public int getFeno_id() {
        return feno_id;
    }

    /**
     * @param feno_id the feno_id to set
     */
    public void setFeno_id(int feno_id) {
        this.feno_id = feno_id;
    }

    /**
     * @return the feno_quantidade
     */
    public int getFeno_quantidade() {
        return feno_quantidade;
    }

    /**
     * @param feno_quantidade the feno_quantidade to set
     */
    public void setFeno_quantidade(int feno_quantidade) {
        this.feno_quantidade = feno_quantidade;
    }

    /**
     * @return the feno_qualidade
     */
    public int getFeno_qualidade() {
        return feno_qualidade;
    }

    /**
     * @param feno_qualidade the feno_qualidade to set
     */
    public void setFeno_qualidade(int feno_qualidade) {
        this.feno_qualidade = feno_qualidade;
    }

    /**
     * @return the feno_fornecedor
     */
    public String getFeno_fornecedor() {
        return feno_fornecedor;
    }

    /**
     * @param feno_fornecedor the feno_fornecedor to set
     */
    public void setFeno_fornecedor(String feno_fornecedor) {
        this.feno_fornecedor = feno_fornecedor;
    }

    /**
     * @return the feno_valor
     */
    public Float getFeno_valor() {
        return feno_valor;
    }

    /**
     * @param feno_valor the feno_valor to set
     */
    public void setFeno_valor(Float feno_valor) {
        this.feno_valor = feno_valor;
    }

    /**
     * @return the feno_compra
     */
    public Date getFeno_compra() {
        return feno_compra;
    }

    /**
     * @param feno_compra the feno_compra to set
     */
    public void setFeno_compra(Date feno_compra) {
        this.feno_compra = feno_compra;
    }

    /**
     * @return the feno_duracao
     */
    public Date getFeno_duracao() {
        return feno_duracao;
    }

    /**
     * @param feno_duracao the feno_duracao to set
     */
    public void setFeno_duracao(Date feno_duracao) {
        this.feno_duracao = feno_duracao;
    }
    private int feno_id;
    private int feno_quantidade;
    private int feno_qualidade;
    private String feno_fornecedor;
    private Float feno_valor;
    private Date feno_compra;
    private Date feno_duracao;
}
