-- 1: os dados de todas as atrizes
SELECT a.*
FROM Ator as a
WHERE sexo = 'f';

-- 2: o nome, nacionalidade e sexo dos artistas
SELECT a.nomereal, a.nacionalidade, a.sexo  
FROM Ator as a ;

-- 3: o nome e o número de oscars indicados ou recebidos; 
SELECT a.nomereal, a.indicacoesOscar, a.oscar
FROM Ator as a ;

-- 4: o código dos filmes onde houve pelo menos um artista com cachê não maior que 3000
SELECT distinct codf
FROM PERSONAGEM
WHERE cache <=3000 ;

-- 5: o nome dos personagens desempenhados por Demi Moore
SELECT p.personagem
FROM PERSONAGEM as p, Ator as a
WHERE p.coda = a.coda
AND a.nomeart = 'DemiMoore';

-- 6: o nome dos filmes desempenhados por Demi Moore
SELECT f.nome
FROM Ator as a, Filme as f, PERSONAGEM as p
WHERE p.codf = f.codf and p.coda = a.coda and a.nomeart = 'DemiMoore' ;

-- 7: o nome artístico completo de todas as atrizes chamadas Jessica
SELECT a.nomeart
FROM Ator as a
WHERE a.nomereal LIKE 'Jessica%';

-- 8: o nome artístico dos artistas entre 30 e 40 anos
SELECT a.nomeart
FROM Ator as a
WHERE a.idade >= 30 and idade <= 40 ;

-- 9: o nome dos artistas que tem duas indicações a mais que oscar ganhos
SELECT a.nomereal
FROM Ator as a
WHERE a.indicacoesOscar - a.oscar >= 2 ;

-- 10: o nome de todos os artistas em ordem alfabética
SELECT a.nomereal
FROM Ator as a
ORDER BY a.nomereal ASC ;

-- 11: a lista das atrizes por ordem de idade (iniciando pelos mais velhos), e dentro da idade, ordenada alfabéticamente
SELECT a.nomereal
FROM Ator as a
WHERE a.sexo = 'f'
ORDER BY a.idade DESC ;

-- 12: o nome artístico e nacionalidade de todas as pessoas envolvidas em filmes
SELECT a.nomeart, a.nacionalidade
FROM Ator as a, Filme as f
WHERE EXISTS
(SELECT *
FROM Ator
WHERE a.coda = f.codf);
