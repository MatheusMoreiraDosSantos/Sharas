/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Aluno 02
 */
public class Usuario {

    /**
     * @return the usuario_notificacao
     */
    public String getUsuario_notificacao() {
        return usuario_notificacao;
    }

    /**
     * @param usuario_notificacao the usuario_notificacao to set
     */
    public void setUsuario_notificacao(String usuario_notificacao) {
        this.usuario_notificacao = usuario_notificacao;
    }

    /**
     * @return the usuario_status
     */
    public int getUsuario_status() {
        return usuario_status;
    }

    /**
     * @param usuario_status the usuario_status to set
     */
    public void setUsuario_status(int usuario_status) {
        this.usuario_status = usuario_status;
    }
    //Atributos

    private int usu_id;
    private String usu_login;
    private String usu_senha;
    private String usu_senha_confirmada;
    private int usuario_status;
    private String usuario_notificacao;

    public String getUsu_senha_confirmada() {
        return usu_senha_confirmada;
    }

    public void setUsu_senha_confirmada(String usu_senha_confirmada) {
        this.usu_senha_confirmada = usu_senha_confirmada;
    }
    private int usu_tipo;

    //Métodos
    /**
     * @return the usu_id
     */
    public int getUsu_id() {
        return usu_id;
    }

    /**
     * @param usu_id the usu_id to set
     */
    public void setUsu_id(int usu_id) {
        this.usu_id = usu_id;
    }

    /**
     * @return the usu_login
     */
    public String getUsu_login() {
        return usu_login;
    }

    /**
     * @param usu_login the usu_login to set
     */
    public void setUsu_login(String usu_login) {
        this.usu_login = usu_login;
    }

    /**
     * @return the usu_senha
     */
    public String getUsu_senha() {
        return usu_senha;
    }

    /**
     * @param usu_senha the usu_senha to set
     */
    public void setUsu_senha(String usu_senha) {
        this.usu_senha = usu_senha;
    }

    /**
     * @return the usu_tipo
     */
    public int getUsu_tipo() {
        return usu_tipo;
    }

    /**
     * @param usu_tipo the usu_tipo to set
     */
    public void setUsu_tipo(int usu_tipo) {
        this.usu_tipo = usu_tipo;
    }

}
