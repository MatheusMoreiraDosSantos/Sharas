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
public class Pessoa {
    private int pessoa_id;
    private String  pessoa_ind;
    private static String pessoa_cpfcnpj;
    private static  String pessoa_nome;
    private String pessoa_email;
    private int pessoa_cargo;

    public int getPessoa_id() {
        return pessoa_id;
    }

    public void setPessoa_id(int pessoa_id) {
        this.pessoa_id = pessoa_id;
    }

    public String getPessoa_ind() {
        return pessoa_ind;
    }

    public void setPessoa_ind(String pessoa_ind) {
        this.pessoa_ind = pessoa_ind;
    }

    public String getPessoa_cpfcnpj() {
        return pessoa_cpfcnpj;
    }

    public void setPessoa_cpfcnpj(String pessoa_cpfcnpj) {
       String CPF="";
        for(int i=0;i<pessoa_cpfcnpj.length();i++){
           char v = pessoa_cpfcnpj.charAt(i);
           if(v !='.' && v !='-')
               CPF=CPF+v;
       }
        this.pessoa_cpfcnpj = (CPF.substring(0, 3) + "." + CPF.substring(3, 6) + "." +
            CPF.substring(6, 9) + "-" + CPF.substring(9, 11));
    }

    public String getPessoa_nome() {
        return pessoa_nome;
    }

    public void setPessoa_nome(String pessoa_nome) {
        this.pessoa_nome = pessoa_nome;
    }

    public String getPessoa_email() {
        return pessoa_email;
    }

    public void setPessoa_email(String pessoa_email) {
        this.pessoa_email = pessoa_email;
    }

    public int getPessoa_cargo() {
        return pessoa_cargo;
    }

    public void setPessoa_cargo(int pessoa_cargo) {
        this.pessoa_cargo = pessoa_cargo;
    }
}
