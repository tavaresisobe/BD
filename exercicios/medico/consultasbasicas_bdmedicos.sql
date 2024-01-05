-- 1: Para cada médico contar em quantas clinicas eles atendem. Resposta ordenada em ordem alfabética.

select nome, count(m2.medico_cod) as conta
from medico as m, medicoclinica as m2
where m.cod = m2.medico_cod
group by nome
order by conta DESC

-- 2: Listar o nome dos médicos que tem 2 especialidades

select nome, count(m2.medico_cod) as conta
from medico as m, medicoclinica as m2
where m.cod = m2.medico_cod
group by nome
having conta > 1

-- 3: Selecionar o nome da Clinica em que a media de horario das consultas é maior que 20.

select c.nome
from clinica as c, consulta as c2
where c.cod = c2.clinica_cod
group by nome 
having AVG(hora) > 20

-- 4: Para cada clinica, listar o nome das suas especialidades, ordenado pelo nome da clinica.

select c.nome, e.nome
from  clinica as c, especialidade as e, especialidadeclinica as e2
where c.cod = e2.clinica_cod and e.cod = e2.especialidade_cod
group by e.nome

-- 5: Para cada clínica, listar quantas especialidades ela atende.

select c.nome, count(e2.clinica_cod) as contador
from clinica as c, especialidade as e, especialidadeclinica as e2
where c.cod = e2.clinica_cod and e.cod = e2.especialidade_cod
group by c.nome

-- 6: Buscar o nome das clinicas em que atendem o médico Arthur

select c.nome
from clinica as c, medico as m, consulta as c2 
where c.cod = c2.clinica_cod and m.cod = c2.medico_cod and m.nome = 'Arthur'

-- 7: Buscar as especialidades do médico Andre

select e.nome 
from medico as m, especialidade as e, medicoespecialidade as m2
where m.cod = m2.medico_cod and e.cod = m2.especialidade_cod and m.nome = 'Andre'
