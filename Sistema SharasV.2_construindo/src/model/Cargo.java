/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.NumberFormat;

/**
 *
 * @author maiko
 */
public class Cargo {
    private int cargoid;
    private String cargonome;
    private String cargodesc;
    private float salariobase;

    public String getCargonome() {
        return cargonome;
    }

    public void setCargonome(String cargonome) {
        this.cargonome = cargonome;
    }

    public int getCargoid() {
        return cargoid;
    }

    public void setCargoid(int cargoid) {
        this.cargoid = cargoid;
    }

    public String getCargodesc() {
        return cargodesc;
    }

    public void setCargodesc(String cargodesc) {
        this.cargodesc = cargodesc;
    }

    public String getSalariobase() {
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        String salario = nf.format(salariobase);
        return salario;
    }

    public void setSalariobase(float salariobase) { 
        this.salariobase = salariobase;
    }
}
