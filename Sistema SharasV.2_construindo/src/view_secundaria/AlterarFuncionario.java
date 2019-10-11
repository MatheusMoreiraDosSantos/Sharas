/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view_secundaria;

import controller.CargoDAO;
import controller.FuncionarioDAO;
import controller.PessoaDAO;
import funcoes.Validacoes;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import model.Cargo;
import model.Funcionarios;

/**
 *
 * @author maikon.rosa
 */
public class AlterarFuncionario extends javax.swing.JDialog {

    /**
     * Creates new form AlterarFuncionario
     */
    public AlterarFuncionario(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        CargoDAO cargo= new CargoDAO();
        cargo.selectCargo(func_cargo);
        func_nome.setText(func.getPessoa_nome());
        func_email.setText(func.getPessoa_email());
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        nome_erro = new javax.swing.JLabel();
        email_erro = new javax.swing.JLabel();
        Cargo_erro = new javax.swing.JLabel();
        data_erro = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        func_nome = new javax.swing.JTextField();
        func_email = new javax.swing.JTextField();
        func_cargo = new javax.swing.JComboBox<>();
        func_data = new com.toedter.calendar.JDateChooser();
        Cad_func = new javax.swing.JButton();
        md_nome = new javax.swing.JCheckBox();
        md_email = new javax.swing.JCheckBox();
        md_cargo = new javax.swing.JCheckBox();
        md_data = new javax.swing.JCheckBox();
        Cad_func1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Alterar funcionario");

        nome_erro.setFont(new java.awt.Font("Tw Cen MT", 2, 14)); // NOI18N
        nome_erro.setForeground(new java.awt.Color(255, 0, 0));
        nome_erro.setMaximumSize(new java.awt.Dimension(14, 16));

        email_erro.setFont(new java.awt.Font("Tw Cen MT", 2, 14)); // NOI18N
        email_erro.setForeground(new java.awt.Color(255, 0, 0));
        email_erro.setMaximumSize(new java.awt.Dimension(14, 16));

        Cargo_erro.setFont(new java.awt.Font("Tw Cen MT", 2, 14)); // NOI18N
        Cargo_erro.setForeground(new java.awt.Color(255, 0, 0));
        Cargo_erro.setMaximumSize(new java.awt.Dimension(14, 16));

        data_erro.setFont(new java.awt.Font("Tw Cen MT", 2, 14)); // NOI18N
        data_erro.setForeground(new java.awt.Color(255, 0, 0));
        data_erro.setMaximumSize(new java.awt.Dimension(14, 16));

        jLabel2.setFont(new java.awt.Font("Tw Cen MT", 2, 24)); // NOI18N
        jLabel2.setText("Funcionarios ");

        func_nome.setFont(new java.awt.Font("Tw Cen MT", 0, 17)); // NOI18N
        func_nome.setEnabled(false);

        func_email.setFont(new java.awt.Font("Tw Cen MT", 0, 17)); // NOI18N
        func_email.setEnabled(false);

        func_cargo.setFont(new java.awt.Font("Tw Cen MT", 0, 17)); // NOI18N
        func_cargo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        func_data.setFont(new java.awt.Font("Tw Cen MT", 0, 17)); // NOI18N
        func_data.setEnabled(false);

        Cad_func.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Cad_func.setForeground(new java.awt.Color(0, 153, 153));
        Cad_func.setText("Alterar ");
        Cad_func.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Cad_funcActionPerformed(evt);
            }
        });

        md_nome.setText("Mudar nome :");
        md_nome.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                md_nomeMouseClicked(evt);
            }
        });

        md_email.setText("Mudar Email :");
        md_email.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                md_emailMouseClicked(evt);
            }
        });

        md_cargo.setText("Mudar Cargo :");

        md_data.setText("Mudar data : ");
        md_data.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                md_dataMouseClicked(evt);
            }
        });
        md_data.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                md_dataActionPerformed(evt);
            }
        });

        Cad_func1.setFont(new java.awt.Font("Tw Cen MT", 0, 24)); // NOI18N
        Cad_func1.setForeground(new java.awt.Color(255, 0, 0));
        Cad_func1.setText("Deletar ");
        Cad_func1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                Cad_func1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(27, 27, 27)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addComponent(md_nome, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(md_data, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(Cad_func, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(Cad_func1, javax.swing.GroupLayout.PREFERRED_SIZE, 127, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addComponent(func_nome, javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(func_email, javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(func_cargo, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(func_data, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(nome_erro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(email_erro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(Cargo_erro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(data_erro, javax.swing.GroupLayout.PREFERRED_SIZE, 257, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(md_email, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(md_cargo, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(29, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(md_nome)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(func_nome, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(nome_erro, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(md_email)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(func_email, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(email_erro, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(6, 6, 6)
                .addComponent(md_cargo)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(func_cargo, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(Cargo_erro, javax.swing.GroupLayout.PREFERRED_SIZE, 21, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(md_data)
                .addGap(1, 1, 1)
                .addComponent(func_data, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(data_erro, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Cad_func, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Cad_func1, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(23, 23, 23))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
Validacoes campo = new Validacoes();
Funcionarios func = new Funcionarios();
FuncionarioDAO funcDao = new FuncionarioDAO(); 
    PessoaDAO pessoa = new PessoaDAO();
    private void Cad_funcActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Cad_funcActionPerformed
        if(md_nome.isSelected()){//começo nome
        if(campo.CampoTexto(func_nome, nome_erro)){
            func.setPessoa_nome(func_nome.getText());
            pessoa.AlterarPessoa(func, 1);
        }}//fim nome
       if(md_email.isSelected()){//inicio email 
           if(campo.campoEmail(func_email, email_erro)){
                    func.setPessoa_email(func_email.getText());
                    pessoa.AlterarPessoa(func, 2);
        }} //fim email  
        if(md_cargo.isSelected()){//inicio combo
         if(campo.Campoescolha(func_cargo, Cargo_erro)){
                 Cargo cg = (Cargo)func_cargo.getSelectedItem();
                 func.setFuncionario_cargo(cg.getCargo_id());     
                 funcDao.AlterarPessoa(func, 1);
          }}//fim combo       
       if(md_data.isSelected()){//inicio data
             if(campo.Campodata(func_data, data_erro)){
                            func.setFuncionario_inicio(campo.data);
                            funcDao.AlterarPessoa(func,2);
       }} //fim data           
                  
                   
              
       
        

    }//GEN-LAST:event_Cad_funcActionPerformed

    private void md_dataActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_md_dataActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_md_dataActionPerformed

    private void Cad_func1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_Cad_func1ActionPerformed
              String opcoes[] = {"Sim", "Não"};
        int opc = JOptionPane.showOptionDialog(null, "Deseja Deletar"+func.getPessoa_nome()+"", "Confirmação"
                       , JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, opcoes, opcoes[1]);
        if (opc == 0)
            funcDao.Deletarfun(func,this);
        
        // TODO add your handling code here:
    }//GEN-LAST:event_Cad_func1ActionPerformed

    private void md_nomeMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_md_nomeMouseClicked
        habilitacampo(func_nome, md_nome);
        // TODO add your handling code here:
    }//GEN-LAST:event_md_nomeMouseClicked

    private void md_emailMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_md_emailMouseClicked
       habilitacampo(func_nome, md_nome);
        // TODO add your handling code here:
    }//GEN-LAST:event_md_emailMouseClicked

    private void md_dataMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_md_dataMouseClicked
         if(md_data.isSelected())
              func_data.setEnabled(true);
          else
               func_data.setEnabled(false);
        // TODO add your handling code here:
    }//GEN-LAST:event_md_dataMouseClicked
public void habilitacampo(JTextField campo,JCheckBox cf){
          if(cf.isSelected())
              campo.setEnabled(true);
          else
              campo.setEnabled(false);
          
}
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(AlterarFuncionario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AlterarFuncionario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AlterarFuncionario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AlterarFuncionario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the dialog */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                AlterarFuncionario dialog = new AlterarFuncionario(new javax.swing.JFrame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    @Override
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton Cad_func;
    private javax.swing.JButton Cad_func1;
    private javax.swing.JLabel Cargo_erro;
    private javax.swing.JLabel data_erro;
    private javax.swing.JLabel email_erro;
    private javax.swing.JComboBox<String> func_cargo;
    private com.toedter.calendar.JDateChooser func_data;
    private javax.swing.JTextField func_email;
    private javax.swing.JTextField func_nome;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JCheckBox md_cargo;
    private javax.swing.JCheckBox md_data;
    private javax.swing.JCheckBox md_email;
    private javax.swing.JCheckBox md_nome;
    private javax.swing.JLabel nome_erro;
    // End of variables declaration//GEN-END:variables
}
