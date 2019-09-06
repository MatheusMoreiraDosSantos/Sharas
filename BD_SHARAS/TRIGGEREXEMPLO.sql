DROP TRIGGER IF EXISTS `animal_AFTER_INSERT`;
CREATE TRIGGER `animal_AFTER_INSERT` AFTER INSERT ON `animal` FOR EACH ROW INSERT INTO log                                   -- tabela de logs
   ( log_sql, log_undo, log_acao, log_entidade, log_usuario, log_time) 
 VALUES
   (
   CONCAT(
     "INSERT INTO log (animal_id, animal_nome, animal_registro, animal_criador, animal_nasc, animal_sexo, animal_pelagem, animal_proprietario, animal_local, animal_status) VALUES (",
     CAST( NEW.animal_id AS CHAR ), ",",
     "'", NEW.animal_nome, "'", ",",
     "'", NEW.animal_registro, "'", ",",
     CAST( NEW.animal_criador AS CHAR ), ",",
     CAST( NEW.animal_nasc AS CHAR ), ",",
     "'", NEW.animal_sexo, "'", ",",
     "'", NEW.animal_pelagem, "'", ",",
     CAST( NEW.animal_proprietario AS CHAR ), ",",
     CAST( NEW.animal_local AS CHAR ), ",",
     CAST( NEW.animal_status AS CHAR ), ",",
     ")" 
   ),    																					 
   CONCAT( 'DELETE FROM animal WHERE animal_id=', CAST( NEW.animal_id AS CHAR ) ),
   'INSERCAO',
   'ANIMAL',
   session_user(),
   current_timestamp()
   );
