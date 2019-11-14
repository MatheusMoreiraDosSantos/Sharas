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
public class Enderecos {
    private int enderecoid;
   private String cep;
   private String rua;
   private String numero;
   private String Bairro;
   private String estado;
   private String cidde;

    public int getEnderecoid() {
        return enderecoid;
    }

    public void setEnderecoid(int enderecoid) {
        this.enderecoid = enderecoid;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return Bairro;
    }

    public void setBairro(String Bairro) {
        this.Bairro = Bairro;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(Object estado) {
        this.estado = String.valueOf(estado);
    }

    public String getCidde() {
        return cidde;
    }

    public void setCidde(String cidde) {
        this.cidde = cidde;
    }
 
}
