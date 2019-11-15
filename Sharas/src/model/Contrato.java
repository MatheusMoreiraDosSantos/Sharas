/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;
/**
 *
 * @author PC_Sala
 */
public class Contrato {
   private int contratoid ;
   private int clienteid;
   private int servicoid;
   private float contratovalor;
   private Date contratoData;

    public int getContratoid() {
        return contratoid;
    }

    public void setContratoid(int contratoid){
        this.contratoid = contratoid;
    }

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
    }

    public int getServicoid() {
        return servicoid;
    }

    public void setServicoid(int servicoid) {
        this.servicoid = servicoid;
    }

    public float getContratovalor() {
        return contratovalor;
    }

    public void setContratovalor(float contratovalor) {
        this.contratovalor = contratovalor;
    }

    public Date getContratoData() {
        return contratoData;
    }

    public void setContratoData(Date contratoData) {
        this.contratoData = contratoData;
    }
}
