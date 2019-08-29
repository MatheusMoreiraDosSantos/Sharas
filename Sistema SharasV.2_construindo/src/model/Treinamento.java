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
public class Treinamento {

    /**
     * @return the treinamento_id
     */
    public int getTreinamento_id() {
        return treinamento_id;
    }

    /**
     * @param treinamento_id the treinamento_id to set
     */
    public void setTreinamento_id(int treinamento_id) {
        this.treinamento_id = treinamento_id;
    }

    /**
     * @return the treinamento_animal
     */
    public String getTreinamento_animal() {
        return treinamento_animal;
    }

    /**
     * @param treinamento_animal the treinamento_animal to set
     */
    public void setTreinamento_animal(String treinamento_animal) {
        this.treinamento_animal = treinamento_animal;
    }

    /**
     * @return the treinamento_inicio
     */
    public Date getTreinamento_inicio() {
        return treinamento_inicio;
    }

    /**
     * @param treinamento_inicio the treinamento_inicio to set
     */
    public void setTreinamento_inicio(Date treinamento_inicio) {
        this.treinamento_inicio = treinamento_inicio;
    }

    /**
     * @return the treinamento_termino
     */
    public Date getTreinamento_termino() {
        return treinamento_termino;
    }

    /**
     * @param treinamento_termino the treinamento_termino to set
     */
    public void setTreinamento_termino(Date treinamento_termino) {
        this.treinamento_termino = treinamento_termino;
    }

    /**
     * @return the treinamento_modalidade
     */
    public String getTreinamento_modalidade() {
        return treinamento_modalidade;
    }

    /**
     * @param treinamento_modalidade the treinamento_modalidade to set
     */
    public void setTreinamento_modalidade(String treinamento_modalidade) {
        this.treinamento_modalidade = treinamento_modalidade;
    }

    /**
     * @return the treinamento_valor
     */
    public Float getTreinamento_valor() {
        return treinamento_valor;
    }

    /**
     * @param treinamento_valor the treinamento_valor to set
     */
    public void setTreinamento_valor(Float treinamento_valor) {
        this.treinamento_valor = treinamento_valor;
    }

    /**
     * @return the treinamento_treinador
     */
    public String getTreinamento_treinador() {
        return treinamento_treinador;
    }

    /**
     * @param treinamento_treinador the treinamento_treinador to set
     */
    public void setTreinamento_treinador(String treinamento_treinador) {
        this.treinamento_treinador = treinamento_treinador;
    }

    
     private int treinamento_id;
    private String treinamento_animal;
    private Date treinamento_inicio;
    private Date treinamento_termino;
    private String treinamento_modalidade;
    private Float treinamento_valor;
    private String treinamento_treinador;
}
