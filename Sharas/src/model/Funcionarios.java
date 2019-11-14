/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import com.toedter.calendar.JDateChooser;
import java.sql.Date;
import javax.swing.JLabel;
import javax.swing.JTextField;
/**
 *
 * @author Matheus Moreira
 */
public class Funcionarios extends Pessoa{
   private static  int funcionario_id;
   private static float funcionario_salario  ;
   private String funcionario_funcao;
   private Date funcionario_inicio;
   private int funcionarios_horas_dia;
   private int funcionario_cargo;

    public int getFuncionario_id() {
        return funcionario_id;
    }

    public void setFuncionario_id(int funcionario_id) {
        this.funcionario_id = funcionario_id;
    }

    public float getFuncionario_salario() {
        return funcionario_salario;
    }

    public void setFuncionario_salario(float funcionario_salario) {
      this.funcionario_salario = funcionario_salario;
    }

    public String getFuncionario_funcao() {
        return funcionario_funcao;
    }

    public void setFuncionario_funcao(String funcionario_funcao) {
        this.funcionario_funcao = funcionario_funcao;
    }

    public Date getFuncionario_inicio() {
        return funcionario_inicio;
    }

    public void setFuncionario_inicio(Date funcionario_inicio) {
      
        this.funcionario_inicio = funcionario_inicio;
    } 
    

    public int getFuncionarios_horas_dia() {
        return funcionarios_horas_dia;
    }

    public void setFuncionarios_horas_dia(int funcionarios_horas_dia) {
        this.funcionarios_horas_dia = funcionarios_horas_dia;
    }

    public int getFuncionario_cargo() {
        return funcionario_cargo;
    }

    public void setFuncionario_cargo(int funcionario_cargo) {
        this.funcionario_cargo = funcionario_cargo;
    }

}
