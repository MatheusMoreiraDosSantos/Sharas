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
public class Calendario {

    /**
     * @return the calendario_id
     */
    public int getCalendario_id() {
        return calendario_id;
    }

    /**
     * @param calendario_id the calendario_id to set
     */
    public void setCalendario_id(int calendario_id) {
        this.calendario_id = calendario_id;
    }

    /**
     * @return the calendario_data
     */
    public Date getCalendario_data() {
        return calendario_data;
    }

    /**
     * @param calendario_data the calendario_data to set
     */
    public void setCalendario_data(Date calendario_data) {
        this.calendario_data = calendario_data;
    }

    /**
     * @return the calendario_anotacao
     */
    public String getCalendario_anotacao() {
        return calendario_anotacao;
    }

    /**
     * @param calendario_anotacao the calendario_anotacao to set
     */
    public void setCalendario_anotacao(String calendario_anotacao) {
        this.calendario_anotacao = calendario_anotacao;
    }
    private static int calendario_id;
    private Date calendario_data;
    private String calendario_anotacao;
}
