-- 1

select nome, count(m2.medico_cod) as conta
from medico as m, medicoclinica as m2
where m.cod = m2.medico_cod
group by nome
order by conta DESC

-- 2

select nome, count(m2.medico_cod) as conta
from medico as m, medicoclinica as m2
where m.cod = m2.medico_cod
group by nome
having conta > 1

-- 3:

select c.nome
from clinica as c, consulta as c2
where c.cod = c2.clinica_cod
group by nome 
having AVG(hora) > 20

-- 4:

select c.nome, e.nome
from  clinica as c, especialidade as e, especialidadeclinica as e2
where c.cod = e2.clinica_cod and e.cod = e2.especialidade_cod
group by e.nome

-- 5:

select c.nome, count(e2.clinica_cod) as contador
from clinica as c, especialidade as e, especialidadeclinica as e2
where c.cod = e2.clinica_cod and e.cod = e2.especialidade_cod
group by c.nome

-- 6:

select c.nome
from clinica as c, medico as m, consulta as c2 
where c.cod = c2.clinica_cod and m.cod = c2.medico_cod and m.nome = 'Arthur'

-- 7:

select e.nome 
from medico as m, especialidade as e, medicoespecialidade as m2
where m.cod = m2.medico_cod and e.cod = m2.especialidade_cod and m.nome = 'Andre'
