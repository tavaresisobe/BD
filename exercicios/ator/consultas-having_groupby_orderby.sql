-- 1: Retorne o número de atrizes

select COUNT(nomeart)
from ator as a
where a.sexo = 'f'

-- 2: O nome do artista e o número de filmes em que participou

select a.nomeart , COUNT(p.coda)
from ator as a, personagem as p
where a.coda = p.codf
group by p.coda
order by a.nomeart ;

-- 3: Para cada ator que não ganhou oscar, listar o seu nome, ano de seu filme mais antigo

select a.nomeart, MIN(f.ano)
from ator as a, filme as f, personagem as p
where a.coda = p.coda and p.codf = f.codf and oscar = 0
group by a.nomeart ;

-- 4:Para cada filme, listar o numero de personagens. mostre o nome do filme e  a quantidade

select f.nome, count(p.codf)
from filme as f, personagem as p
where f.codf = p.codf
group by f.codf, f.nome ;

-- 5: Listar para cada ano a quantidade de filmes.

SELECT f.ano, count(f.ano)
FROM Filme as f
GROUP BY f.ano
order by f.ano ;

-- 6: O nome do artista e o número de filmes em que participou, para todo artista que participou de no mínimo 2 filmes

select a.nomeart, count(p.coda)
from ator as a, personagem as p
where a.coda = p.coda
group by a.nomereal
having count(p.coda) > 2 ;
