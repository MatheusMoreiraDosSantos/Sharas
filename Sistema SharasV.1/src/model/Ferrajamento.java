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
public class Ferrajamento {

    /**
     * @return the ferrajamento_id
     */
    public int getFerrajamento_id() {
        return ferrajamento_id;
    }

    /**
     * @param ferrajamento_id the ferrajamento_id to set
     */
    public void setFerrajamento_id(int ferrajamento_id) {
        this.ferrajamento_id = ferrajamento_id;
    }

    /**
     * @return the ferrajamento_inicio
     */
    public Date getFerrajamento_inicio() {
        return ferrajamento_inicio;
    }

    /**
     * @param ferrajamento_inicio the ferrajamento_inicio to set
     */
    public void setFerrajamento_inicio(Date ferrajamento_inicio) {
        this.ferrajamento_inicio = ferrajamento_inicio;
    }

    /**
     * @return the ferrajamento_termino
     */
    public Date getFerrajamento_termino() {
        return ferrajamento_termino;
    }

    /**
     * @param ferrajamento_termino the ferrajamento_termino to set
     */
    public void setFerrajamento_termino(Date ferrajamento_termino) {
        this.ferrajamento_termino = ferrajamento_termino;
    }

    /**
     * @return the ferrajamento_ferrador
     */
    public String getFerrajamento_ferrador() {
        return ferrajamento_ferrador;
    }

    /**
     * @param ferrajamento_ferrador the ferrajamento_ferrador to set
     */
    public void setFerrajamento_ferrador(String ferrajamento_ferrador) {
        this.ferrajamento_ferrador = ferrajamento_ferrador;
    }

    /**
     * @return the ferrajamento_animal
     */
    public String getFerrajamento_animal() {
        return ferrajamento_animal;
    }

    /**
     * @param ferrajamento_animal the ferrajamento_animal to set
     */
    public void setFerrajamento_animal(String ferrajamento_animal) {
        this.ferrajamento_animal = ferrajamento_animal;
    }

    /**
     * @return the ferrajamento_valor
     */
    public Float getFerrajamento_valor() {
        return ferrajamento_valor;
    }

    /**
     * @param ferrajamento_valor the ferrajamento_valor to set
     */
    public void setFerrajamento_valor(Float ferrajamento_valor) {
        this.ferrajamento_valor = ferrajamento_valor;
    }

    /**
     * @return the ferrajamento_descricao
     */
    public String getFerrajamento_descricao() {
        return ferrajamento_descricao;
    }

    /**
     * @param ferrajamento_descricao the ferrajamento_descricao to set
     */
    public void setFerrajamento_descricao(String ferrajamento_descricao) {
        this.ferrajamento_descricao = ferrajamento_descricao;
    }

   

    private int ferrajamento_id;
    private Date ferrajamento_inicio;
    private Date ferrajamento_termino;
    private String ferrajamento_ferrador;
    private String ferrajamento_animal;
    private Float ferrajamento_valor;
    private String ferrajamento_descricao;
}
