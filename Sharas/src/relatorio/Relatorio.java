/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package relatorio;

import controller.Conexao;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author maiko
 */
public class Relatorio {
  
    public static void Gerar() {
   Connection con = Conexao.conectar();
    String src = "C:\\Users\\maiko\\Desktop\\ds2\\SHARAS\\sharas\\src\\relatorio\\contrato.jasper"
            ;
    
    JasperPrint jasper = null;
        try {
            jasper = JasperFillManager.fillReport(src, null, con);
        } catch (JRException ex) {
            //Logger.getLogger(Relatorio.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Erro "+ex);
        }
        JasperViewer view = new JasperViewer(jasper,false);
        view.setVisible(true);
       
    
    
    }
}
