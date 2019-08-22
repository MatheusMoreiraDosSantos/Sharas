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
public class Serragem {

    /**
     * @return the serragem_id
     */
    public int getSerragem_id() {
        return serragem_id;
    }

    /**
     * @param serragem_id the serragem_id to set
     */
    public void setSerragem_id(int serragem_id) {
        this.serragem_id = serragem_id;
    }

    /**
     * @return the serragem_compra
     */
    public Date getSerragem_compra() {
        return serragem_compra;
    }

    /**
     * @param serragem_compra the serragem_compra to set
     */
    public void setSerragem_compra(Date serragem_compra) {
        this.serragem_compra = serragem_compra;
    }

    /**
     * @return the serragem_tipo
     */
    public String getSerragem_tipo() {
        return serragem_tipo;
    }

    /**
     * @param serragem_tipo the serragem_tipo to set
     */
    public void setSerragem_tipo(String serragem_tipo) {
        this.serragem_tipo = serragem_tipo;
    }

    /**
     * @return the serragem_fornecedor
     */
    public String getSerragem_fornecedor() {
        return serragem_fornecedor;
    }

    /**
     * @param serragem_fornecedor the serragem_fornecedor to set
     */
    public void setSerragem_fornecedor(String serragem_fornecedor) {
        this.serragem_fornecedor = serragem_fornecedor;
    }

    /**
     * @return the serragem_metros
     */
    public Float getSerragem_metros() {
        return serragem_metros;
    }

    /**
     * @param serragem_metros the serragem_metros to set
     */
    public void setSerragem_metros(Float serragem_metros) {
        this.serragem_metros = serragem_metros;
    }

    /**
     * @return the serragem_bais
     */
    public int getSerragem_bais() {
        return serragem_bais;
    }

    /**
     * @param serragem_bais the serragem_bais to set
     */
    public void setSerragem_bais(int serragem_bais) {
        this.serragem_bais = serragem_bais;
    }

    /**
     * @return the serragem_duracao
     */
    public Date getSerragem_duracao() {
        return serragem_duracao;
    }

    /**
     * @param serragem_duracao the serragem_duracao to set
     */
    public void setSerragem_duracao(Date serragem_duracao) {
        this.serragem_duracao = serragem_duracao;
    }

    /**
     * @return the serragem_valor
     */
    public Float getSerragem_valor() {
        return serragem_valor;
    }

    /**
     * @param serragem_valor the serragem_valor to set
     */
    public void setSerragem_valor(Float serragem_valor) {
        this.serragem_valor = serragem_valor;
    }
    private int serragem_id;
    private Date serragem_compra;
    private String serragem_tipo;
    private String serragem_fornecedor;
    private Float serragem_metros;
    private int serragem_bais;
    private Date serragem_duracao;
    private Float serragem_valor;
}
