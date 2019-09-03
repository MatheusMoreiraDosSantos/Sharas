-- MySQL Workbench Synchronization
ALTER TABLE `bd_sharas`.`conta_banco` 
DROP FOREIGN KEY `fk_conta_banco_usuario1`;

ALTER TABLE `bd_sharas`.`criador` 
DROP FOREIGN KEY `criador_endereco`;

ALTER TABLE `bd_sharas`.`conta_banco` 
DROP COLUMN `usuario_usuario_id`,
ADD COLUMN `pessoa_pessoa_id` INT(11) NOT NULL AFTER `conta_banco_tipo`,
ADD INDEX `fk_conta_banco_pessoa1_idx` (`pessoa_pessoa_id` ASC) ,
DROP INDEX `fk_conta_banco_usuario1_idx` ;
;

ALTER TABLE `bd_sharas`.`criador` 
DROP COLUMN `criador_endereco`,
DROP INDEX `criador_endereco_idx` ;
;

ALTER TABLE `bd_sharas`.`rh` 
DROP COLUMN `rh_salario`,
ADD COLUMN `cargo_cargo_id` INT(11) NOT NULL AFTER `pessoa_pessoa_id`,
ADD INDEX `fk_rh_cargo1_idx` (`cargo_cargo_id` ASC) ;
;

ALTER TABLE `bd_sharas`.`conta_banco` 
ADD CONSTRAINT `fk_conta_banco_pessoa1`
  FOREIGN KEY (`pessoa_pessoa_id`)
  REFERENCES `bd_sharas`.`pessoa` (`pessoa_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bd_sharas`.`rh` 
ADD CONSTRAINT `fk_rh_cargo1`
  FOREIGN KEY (`cargo_cargo_id`)
  REFERENCES `bd_sharas`.`cargo` (`cargo_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;