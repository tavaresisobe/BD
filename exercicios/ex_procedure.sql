-- 1: Crie uma tabela Empregado com id, nome e salario. o id deve ser com auto incremento:

 create table empregado ( id integer auto_increment, nome varchar(20), salario float, primary key(id));

-- 2: Criar uma procedure Insere10  para inserir 10 tuplas na tabela Empregado:

DELIMITER $$
CREATE PROCEDURE InserePessoas()
BEGIN
DECLARE conta INT;
DECLARE v1 CHAR(20);
DECLARE salario float;
SET conta = 1;
SET v1 = 'nome'; SET salario = 1000;
WHILE (conta <=10) DO
    INSERT INTO empregado(nome, salario)
    VALUES(concat(v1,conta),salario*conta);
    SET conta=conta+1;
END WHILE;
END $$
DELIMITER ;
Call InserePessoas();

-- 3: Criar uma procedure que retorne a quantidade de empregados inseridos na tabela Empregado

DELIMITER $$
create procedure ContaEmpregados(out id INT)
begin
	select count (*) into id
	from empregado; 
end $$
DELIMITER ;

call ContaEmpregados(@id);
select @id