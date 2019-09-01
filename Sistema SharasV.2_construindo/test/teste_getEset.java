
import model.Usuario;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author maikon.rosa
 */
public class teste_getEset {
    public void teste(Usuario usu){
        System.out.println("Nome : "+usu.getPessoa_nome()+"\n"
                                      +"Login :"+usu.getUsuario_login()+"\n"
                                      + "Cpf : "+usu.getPessoa_cpfcnpj()+"\n"
                                       +"Senha:"+usu.getUsuario_senha()+"\n");
    
    }
}
