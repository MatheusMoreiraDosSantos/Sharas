/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author maikon.rosa
 */
public class Cargo {
    private int cargo_id;
    private String cargo_nome;
    private String cargo_desc;
    private float salario;
   public Cargo(int cargo_id,String cargo_nome){
   this.cargo_id=cargo_id;
   this.cargo_nome = cargo_nome;
   }
    public int getCargo_id() {
        return cargo_id;
    }

    public void setCargo_id(int cargo_id) {
        this.cargo_id = cargo_id;
    }
    @Override
    public String toString() {
        return this.cargo_nome;
    }
    public String getCargo_nome() {
        return cargo_nome;
    }

    public void setCargo_nome(String cargo_nome) {
        this.cargo_nome = cargo_nome;
    }

    public String getCargo_desc() {
        return cargo_desc;
    }

    public void setCargo_desc(String cargo_desc) {
        this.cargo_desc = cargo_desc;
    }

    public float getSalario() {
        return salario;
    }

    public void setSalario(float salario) {
        this.salario = salario;
    }
}
