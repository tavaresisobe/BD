## Listar os pesquisadores e sua especialidade:
	
SELECT nome, especializacao FROM Pesquisador;

## Listar o nome de pesquisadores com pesquisa na área de Computação:
	
SELECT p.nome
FROM pesquisador as p, pesquisa p2, pesquisador_pesquisa as pp, area as a, area_pesquisa as ap
WHERE p.cod = pp.pesquisador_cod
AND p2.cod = pp.pesquisa_cod
AND p2.cod = ap.pesquisa_cod
AND a.cod = ap.area_cod AND a.nome = 'Computação'

## Listar o nome de pesquisadores associados a mais de uma pesquisa:
	
SELECT p.nome AS pesquisador, COUNT(pp.pesquisador_cod) AS qtd_pesquisas
FROM Pesquisador as p
JOIN pesquisador_pesquisa as pp ON p.cod = pp.pesquisador_cod
GROUP BY p.cod
HAVING COUNT(pp.pesquisa_cod) > 1;

## Listar o nome de pesquisadores que cursaram Mestrado:

select p.nome as nome
from pesquisador as p
where p.grau = "Mestrado"

## Listar usuários cadastrados sem acesso a documentos:

SELECT u.nome AS usuario
FROM Usuario as u
LEFT JOIN usuario_documentos ud ON u.cod = ud.usuario_cod
WHERE ud.documento_cod IS NULL;

## Listar o nome de pesquisadores cadastrados sem pesquisa:

SELECT p.nome AS pesquisador
FROM Pesquisador p
LEFT JOIN pesquisador_pesquisa pp ON p.cod = pp.pesquisador_cod
WHERE pp.pesquisador_cod IS NULL;

## Listar o título de todas pesquisas cadastradas, e contar o número de documentos associados, ordenados decrescentemente pela quantidade:

SELECT p.titulo, COUNT(d.cod) AS qtd_documentos
FROM Pesquisa as p
LEFT JOIN Documentos d ON p.cod = d.pesquisa_cod
GROUP BY  p.titulo
ORDER BY qtd_documentos DESC;

## Listar o nome de pesquisadores associados ao campus SJC (ICT-UNIFESP):

SELECT p.nome
FROM pesquisador as p
INNER JOIN Campus as c ON p.campus_cod = c.cod AND c.nome = 'ICT-UNIFESP'

## Listar todos os usuários juntamente com a quantidade de documentos aos quais têm acesso:
	
SELECT u.nome, count(ud.usuario_cod) AS qtd_de_acessos
FROM usuario as u 
LEFT JOIN usuario_documentos as ud ON u.cod = ud.usuario_cod
GROUP BY u.cod
ORDER BY qtd_de_acessos DESC;

## Listar todas as pesquisas, e para aquelas que recebem bolsa, listar o valor total recebido seguido do mantedor:

SELECT p.titulo, b.total as valor, m.nome
FROM pesquisa as p 
LEFT JOIN bolsa as b ON p.cod = b.pesquisa_cod
LEFT JOIN mantedor as m ON b.mantedor_cod = m.cod
ORDER BY valor DESC;

## Listar o título das pesquisas que recebem bolsa maior que a média de outras pesquisas:

SELECT p.titulo
FROM pesquisa as p
INNER JOIN bolsa as b ON p.cod = b.pesquisa_cod AND b.total > (SELECT AVG(total) FROM bolsa as b2)
