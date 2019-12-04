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
public class P_c {
    private int pessoa_id ;
    private String pessoa_nome;
 
    public P_c(int pessoa_id,String pessoa_nome){
        this.pessoa_id=pessoa_id;
        this.pessoa_nome = pessoa_nome;
   }
        public int getPesssoa_id() {
        return pessoa_id;
    }

    public void setPessoa_id(int pessoa_id) {
        this.pessoa_id = pessoa_id;
    }
    @Override
    public String toString() {
        return this.pessoa_nome;
    }
    public String getPessoa_nome() {
        return pessoa_nome;
    }

    public void setPessoa_nome(String pessoa_nome) {
        this.pessoa_nome = pessoa_nome;
    }
}
