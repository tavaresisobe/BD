-- 1: Obter as especialidades do Dr Paulo

select e.nome as especialidade_Paulo
from medico as m, especialidade as e, medicoespecialidade as m2 
where m.cod = m2.medico_cod and e.cod = m2.especialidade_cod and m.nome = 'Paulo'

-- 2: Obter as datas das consultas do dr Arthur

select c.`data` as data_Arthur, c.hora as hora_Arthur
from medico as m, consulta as c
where m.cod = c.medico_cod and m.nome = 'Arthur'

-- 3: Selecione o nome do médico, o nome e endereço da clínica para todas as consultas que possuem especialidade ‘CLINICO GERAL’.

select m.nome as nome_medico, c.nome as nome_clinica, c.endereco as endereco_clinica
from medico as m, clinica as c, especialidade as e, consulta as c2
where m.cod = c2.medico_cod and c.cod = c2.clinica_cod and e.cod = c2.especialidade_cod and e.nome = 'CLiNiCO GERAL'

-- 5: Mostre o nome e o endereço das clínicas que possuem consulta marcada para 30/03/2010;

select c.nome as nome_clinica, c.endereco as endereco_clinica 
from clinica as c, consulta as c2
where c.cod = c2.clinica_cod and c2.`data` = '2010/03/30'

-- 6: Recuperar nome dos médicos que atendem na Clínica Bem Estar;

select m.nome as nome_medico
from medico as m, clinica as c, consulta as c2  
where m.cod = c2.medico_cod and c.cod = c2.clinica_cod and c.nome = 'clinica bem estar'

-- 7: Exiba o nome e endereço das clínicas onde o médico André trabalha;

select c.nome as nome_clinica, c.endereco as endereco_clinica
from medico as m, clinica as c, consulta as c2
where m.cod = c2.medico_cod and c.cod = c2.clinica_cod and m.nome = 'Andre'

-- 8: Insira 2 clinicas

iNSERT iNTO clinica VALUES (11, 'clinica timaaooo', 'itaquerao');
iNSERT iNTO clinica VALUES (12, 'clinica chiqueiro', 'allianz parque');

-- 9 Insira 2 médicos

iNSERT iNTO medico VALUES (11,'Neymar', '1234-5678');
iNSERT iNTO medico VALUES (12,'Renato Augusto', '8765-4321');

-- 10: Liste o Nome das Clinicas e suas especialidades

select c.nome as nome_clinica, e.nome as especialidade_clinica 
from clinica as c, especialidade as e, especialidadeclinica as e2  
where c.cod = e2.clinica_cod and e.cod = e2.especialidade_cod
group by c.nome


-- 11: Liste o Nome de todas as clinicas e suas Especialidade.Clinicas que não
-- possuem especialidade devem aparecer. Ordenar o resultado pelo nome da
-- Clinica e Especialidade.

select c.nome, e.nome 
from clinica as c
left join especialidadeclinica as e2 on c.cod = e2.clinica_cod left join 
especialidade as e on e2.especialidade_cod = e.cod

-- 12: Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.

select m.nome, c.`data` as data, c.hora as hora
from medico as m
left join consulta as c on m.cod = c.medico_cod
-- group by nome

-- 13: Liste para cada médico, o seu nome e a quantidade de consultas que ele possui.

select m.nome as nome_medico, count(c.medico_cod) as num_consultas
from medico as m, consulta as c
where m.cod = c.medico_cod
group by m.nome
order by num_consultas desc

-- 14: Liste para cada médico, o seu nome e a quantidade de consultas que ele possui. Médicos que não possuem consulta também devem aparecer no resultado.

select m.nome as nome_medico, count(c.medico_cod) as num_consultas
from medico as m
left join consulta as c on m.cod = c.medico_cod
group by m.nome

-- 16: Listar nomes das Clinicas que tem especialidade

select c.nome
from clinica as c 
inner join especialidadeclinica as e2 on c.cod = e2.clinica_cod inner join
especialidade as e on e2.especialidade_cod = e.cod 

-- 17: Listar nomes dos médicos que não tem consulta

select m.nome
from medico as m
where m.cod not in (select c.medico_cod
					from consulta as c)
					
-- 18: Listar nomes dos médicos que atendem na Clinica ortocentro
					
select m.nome 
from medico as m
inner join consulta as c2 on m.cod = c2.medico_cod inner join
clinica as c on c.cod = c2.clinica_cod and c.nome = 'ortocentro'

-- outro metodo:

select m.nome
from medico as m, clinica as c, consulta as c2  
where m.cod = c2.medico_cod and c.cod = c2.clinica_cod and c.nome = 'ortocentro'

-- 19: Crie a tabela Folha_pagto e insira os dados:

CREATE TABLE Folha_Pagto (medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod));

INSERT INTO Folha_Pagto VALUES (1,1,100);
INSERT INTO Folha_Pagto values (1,2,150);
INSERT INTO Folha_Pagto values (2,3,100);
INSERT INTO Folha_Pagto values (2, 4, 150);
INSERT INTO Folha_Pagto values (3,5,50);

-- 20: Listar nomes dos médicos que recebem valor da consulta maior que a média:

select m.nome
from medico as m
inner join folha_pagto as f on m.cod = f.medico_cod and f.valor > (select AVG(valor) from folha_pagto fp)

-- 21: Listar nome dos médidos que não estão na folha de pagto

select m.nome 
from medico as m
left join folha_pagto as f on m.cod = f.medico_cod
where f.medico_cod IS NULL;

-- 22: Listar nome dos médicos e para aqueles que estão na folha de pagto, listar a média de salário

select m.nome, AVG(f.valor) as medio_consulta
from medico as m
left join folha_pagto as f on m.cod = f.medico_cod
group by m.nome

-- teste: listando médicos e a quantidade de consultas que ambos possuem

select m.nome, count (c.medico_cod) as QtdConsultas
from medico as m, consulta as c
where m.cod = c.medico_cod
group by m.nome
having QtdConsultas > 0