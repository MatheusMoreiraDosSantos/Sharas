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
 private float contratoValor;

    public float getContratoValor() {
        return contratoValor;
    }

    public void setContratoValor(float contratoValor) {
        this.contratoValor = contratoValor;
    }
    public String getDescontoTipo() {
        return descontoTipo;
    }

    public void setDescontoTipo(String descontoTipo) {
       if(descontoTipo=="0")
          this.descontoTipo = "Sem desconto"; 
       else
           this.descontoTipo = descontoTipo;
    }

    public float getDescontoValor() {
        return descontoValor;
    }

    public void setDescontoValor(float descontoValor) {
        this.descontoValor = descontoValor;
    }

    public String getDescontomotivo() {
        return descontomotivo;
    }

    public void setDescontomotivo(String descontomotivo) {
        this.descontomotivo = descontomotivo;
    }
   private String descontoTipo;
   private float descontoValor;
   private String descontomotivo;

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
