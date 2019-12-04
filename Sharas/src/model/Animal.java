/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Matheus Moreira
 */
public class Animal {

    /**
     * @return the animal_id
     */
    public int getAnimal_id() {
        return animal_id;
    }

    /**
     * @param animal_id the animal_id to set
     */
    public void setAnimal_id(int animal_id) {
        this.animal_id = animal_id;
    }

    /**
     * @return the animal_nome
     */
    public String getAnimal_nome() {
        return animal_nome;
    }

    /**
     * @param animal_nome the animal_nome to set
     */
    public void setAnimal_nome(String animal_nome) {
        this.animal_nome = animal_nome;
    }

    /**
     * @return the animal_registro
     */
    public String getAnimal_registro() {
        return animal_registro;
    }

    /**
     * @param animal_registro the animal_registro to set
     */
    public void setAnimal_registro(String animal_registro) {
        this.animal_registro = animal_registro;
    }

    /**
     * @return the animal_proprietario
     */
    public int getAnimal_proprietario() {
        return animal_proprietario;
    }

    /**
     * @param animal_proprietario the animal_proprietario to set
     */
    public void setAnimal_proprietario(int animal_proprietario) {
        this.animal_proprietario = animal_proprietario;
    }

   
    
    /**
     * @return the animal_nascimento
     */
    public Date getAnimal_nascimento() {
      ;
        return animal_nascimento;
    }

    /**
     * @param animal_nascimento the animal_nascimento to set
     */
    public void setAnimal_nascimento(Date animal_nascimento) {
       
        this.animal_nascimento = animal_nascimento;
    }

    /**
     * @return the animal_sexo
     */
    public String getAnimal_sexo() {
        return animal_sexo;
    }

    /**
     * @param animal_sexo the animal_sexo to set
     */
    public void setAnimal_sexo(String animal_sexo) {
        this.animal_sexo = animal_sexo;
    }


    private int animal_id;
    private String animal_nome;
    private String animal_registro;
    private int  animal_proprietario;
    private Date animal_nascimento;
    private String animal_sexo;

    
  
    
}
