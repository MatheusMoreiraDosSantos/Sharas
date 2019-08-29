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
public class Veterinario {

    /**
     * @return the veterinario_animal
     */
    public String getVeterinario_animal() {
        return veterinario_animal;
    }

    /**
     * @param veterinario_animal the veterinario_animal to set
     */
    public void setVeterinario_animal(String veterinario_animal) {
        this.veterinario_animal = veterinario_animal;
    }

    /**
     * @return the veterinario_id
     */
    public int getVeterinario_id() {
        return veterinario_id;
    }

    /**
     * @param veterinario_id the veterinario_id to set
     */
    public void setVeterinario_id(int veterinario_id) {
        this.veterinario_id = veterinario_id;
    }

    /**
     * @return the veterinario_nome
     */
    public String getVeterinario_nome() {
        return veterinario_nome;
    }

    /**
     * @param veterinario_nome the veterinario_nome to set
     */
    public void setVeterinario_nome(String veterinario_nome) {
        this.veterinario_nome = veterinario_nome;
    }

    /**
     * @return the veterinario_inicio
     */
    public Date getVeterinario_inicio() {
        return veterinario_inicio;
    }

    /**
     * @param veterinario_inicio the veterinario_inicio to set
     */
    public void setVeterinario_inicio(Date veterinario_inicio) {
        this.veterinario_inicio = veterinario_inicio;
    }

    /**
     * @return the veterinario_termino
     */
    public Date getVeterinario_termino() {
        return veterinario_termino;
    }

    /**
     * @param veterinario_termino the veterinario_termino to set
     */
    public void setVeterinario_termino(Date veterinario_termino) {
        this.veterinario_termino = veterinario_termino;
    }

    /**
     * @return the veterinario_diagnostico
     */
    public String getVeterinario_diagnostico() {
        return veterinario_diagnostico;
    }

    /**
     * @param veterinario_diagnostico the veterinario_diagnostico to set
     */
    public void setVeterinario_diagnostico(String veterinario_diagnostico) {
        this.veterinario_diagnostico = veterinario_diagnostico;
    }

    /**
     * @return the veterinario_tratamento
     */
    public String getVeterinario_tratamento() {
        return veterinario_tratamento;
    }

    /**
     * @param veterinario_tratamento the veterinario_tratamento to set
     */
    public void setVeterinario_tratamento(String veterinario_tratamento) {
        this.veterinario_tratamento = veterinario_tratamento;
    }

    /**
     * @return the veterinario_valor
     */
    public Float getVeterinario_valor() {
        return veterinario_valor;
    }

    /**
     * @param veterinario_valor the veterinario_valor to set
     */
    public void setVeterinario_valor(Float veterinario_valor) {
        this.veterinario_valor = veterinario_valor;
    }
    private int veterinario_id;
    private String veterinario_animal;
    private String veterinario_nome;
    private Date   veterinario_inicio;
    private Date   veterinario_termino;
    private String veterinario_diagnostico;
    private String veterinario_tratamento;
    private Float veterinario_valor;
    
}
