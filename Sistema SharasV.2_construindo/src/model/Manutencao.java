/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Matheus Moreira
 */
public class Manutencao {

    /**
     * @return the manutencao_id
     */
    public int getManutencao_id() {
        return manutencao_id;
    }

    /**
     * @param manutencao_id the manutencao_id to set
     */
    public void setManutencao_id(int manutencao_id) {
        this.manutencao_id = manutencao_id;
    }

    /**
     * @return the manutencao_nome
     */
    public String getManutencao_nome() {
        return manutencao_nome;
    }

    /**
     * @param manutencao_nome the manutencao_nome to set
     */
    public void setManutencao_nome(String manutencao_nome) {
        this.manutencao_nome = manutencao_nome;
    }

    /**
     * @return the manutencao_salario
     */
    public Float getManutencao_salario() {
        return manutencao_salario;
    }

    /**
     * @param manutencao_salario the manutencao_salario to set
     */
    public void setManutencao_salario(Float manutencao_salario) {
        this.manutencao_salario = manutencao_salario;
    }

    /**
     * @return the manutencao_funcao
     */
    public String getManutencao_funcao() {
        return manutencao_funcao;
    }

    /**
     * @param manutencao_funcao the manutencao_funcao to set
     */
    public void setManutencao_funcao(String manutencao_funcao) {
        this.manutencao_funcao = manutencao_funcao;
    }

    /**
     * @return the manutencao_setor
     */
    public int getManutencao_setor() {
        return manutencao_setor;
    }

    /**
     * @param manutencao_setor the manutencao_setor to set
     */
    public void setManutencao_setor(int manutencao_setor) {
        this.manutencao_setor = manutencao_setor;
    }

    
    public String getManutencao_anotacao() {
        return manutencao_anotacao;
    }

    
    public void setManutencao_anotacao(String manutencao_anotacao) {
        this.manutencao_anotacao = manutencao_anotacao;
    }
    private int manutencao_id;
    private String manutencao_nome;
    private Float manutencao_salario;
    private String manutencao_funcao;
    private int manutencao_setor;
    private String manutencao_anotacao;
}
