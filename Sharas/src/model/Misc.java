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
public class Misc  {
    private int telefoneid;
    private String telefone_numero;
    private int telefonetipo;
    private int telefonepessoa;
    public static String[] ddds;

    public static String[] getDdd() {
       String[]  ddds={"11","12","13","14","15","16","17","18","19","21","22","24","27","28","31","32","33","34","35"
         ,"37","38","41","42","43","44","47","48","49","51","53","54","55","61","62"
       ,"63","64","65","66","67","68","69","71","73","74","75","77","79","81","82","83","84","85","85","86"
       ,"87","88","89","91","92","93","94","95","96","97","98","99"};
        return ddds;
    }
    public int getTelefoneid() {
        return telefoneid;
    }
    public void setTelefoneid(int telefoneid) {
        this.telefoneid = telefoneid;
    }

    public String getTelefone_numero() {
        return telefone_numero;
    }

    public void setTelefone_numero(String telefone_numero) {
        this.telefone_numero = telefone_numero;
    }

    public int getTelefonetipo() {
        return telefonetipo;
    }

    public void setTelefonetipo(int telefonetipo) {
        this.telefonetipo = telefonetipo;
    }

    public int getTelefonepessoa() {
        return telefonepessoa;
    }

    public void setTelefonepessoa(int telefonepessoa) {
        this.telefonepessoa = telefonepessoa;
    }
  
    
}
