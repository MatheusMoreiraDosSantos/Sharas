/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;
/**
 *
 * @author maikon.rosa
 */
public class servicos {
    private int compraid;
    private int clienteid;
    private Date data ;
    private float valor;
   private int produtoid;
    public int codigo[];
    public int getProdutoid() {
        return produtoid;
    }

    public void setProdutoid(int produtoid) {
        int cont=0;
        for(int i = 0;i<codigo.length;i++){
           int n = codigo[i];
            if(produtoid == n){
                cont++;   }    
        }
        if(cont==0){
        this.produtoid = produtoid;
        }
    }
    public int getCompraid() {
        return compraid;
    }

    public void setCompraid(int compraid) {
        this.compraid = compraid;
    }

    public int getClienteid() {
        return clienteid;
    }

    public void setClienteid(int clienteid) {
        this.clienteid = clienteid;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
    
}
