/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author maiko
 */
public class Cliente extends Pessoa {
    
    private float cliente_debito;
    private int clienteid;

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
    }
    public float getCliente_debito() {
        return cliente_debito;
    }

    public void setCliente_debito(float cliente_debito) {
        this.cliente_debito = cliente_debito;
    }
    public String valorformatado(){
    NumberFormat nf = new DecimalFormat ("#,##0.00", new DecimalFormatSymbols (new Locale ("pt", "BR")));
    return  nf.format(cliente_debito); 
    }
}
