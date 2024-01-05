##Criação de tabelas:

CREATE TABLE Campus (
    cod INTEGER AUTO_INCREMENT,
    nome VARCHAR(30),
    cidade VARCHAR(30),
    email_secretaria VARCHAR(30),
    PRIMARY KEY(cod)
) ENGINE=INNODB;

create table Pesquisador(
	cod integer auto_increment,
	nome varchar(40),
	email varchar(25),
	grau varchar(30),
	especializacao varchar (30),
	campus_cod integer,
	PRIMARY KEY(cod),
	FOREIGN KEY(campus_cod) REFERENCES campus(cod)
)Engine=INNODB;

create table Area(
	cod integer auto_increment,
	nome varchar(30),
	PRIMARY KEY(cod)
)Engine=INNODB;

create table Pesquisa(
	cod integer auto_increment,
	titulo varchar(50),
	datainicio date, 
	datafim date,
	status varchar(15),
	descricao varchar(150),
	PRIMARY KEY(cod)
)Engine=INNODB;
   
create table Documentos(
	cod integer auto_increment,
	tipo varchar(30),
	dataatualizacao date,
	pesquisa_cod integer,
	PRIMARY KEY(cod),
	FOREIGN KEY(pesquisa_cod) REFERENCES Pesquisa(cod)
)Engine=INNODB;

create table Usuario(
	cod integer auto_increment,
	nome varchar (30),
	telefone varchar(15),
	email varchar(30) ,
	ocupacao varchar(30),
	status_acesso varchar(15),
	motivo varchar(50),
	PRIMARY KEY(cod)
)Engine=INNODB;

create table Publicacao(
	cod integer auto_increment,
	titulo varchar (50),
	nomerevista varchar (50),
	datapublicacao date,
	statusrevisao varchar (30),
	documento_cod integer,
	PRIMARY KEY(cod),
	FOREIGN KEY(documento_cod) REFERENCES Documentos(cod)
)Engine=INNODB;

create table Mantedor(
	cod integer auto_increment,
	nome varchar (20),
	PRIMARY KEY(cod)
)Engine=INNODB;

create table Bolsa(
	cod integer auto_increment,
	total float,
	datainicio date,
	datafim date,
	pesquisa_cod integer,
	mantedor_cod integer,
	PRIMARY KEY(cod),
	FOREIGN KEY(pesquisa_cod) REFERENCES Pesquisa(cod),
	FOREIGN KEY(mantedor_cod) REFERENCES Mantedor(cod)
)Engine=INNODB;

create table area_pesquisa(
	area_cod integer,
	pesquisa_cod integer,
	PRIMARY KEY(area_cod, pesquisa_cod),
	FOREIGN KEY(area_cod) REFERENCES Area(cod),
	FOREIGN KEY(pesquisa_cod) REFERENCES Pesquisa(cod)
)Engine=INNODB;

create table pesquisador_pesquisa(
	pesquisador_cod integer,
	pesquisa_cod integer,
	cargo varchar(15),
	PRIMARY KEY(pesquisador_cod, pesquisa_cod),
	FOREIGN KEY(pesquisador_cod) REFERENCES Pesquisador(cod),
	FOREIGN KEY(pesquisa_cod) REFERENCES Pesquisa(cod)
)Engine=INNODB;

create table usuario_documentos(
	usuario_cod integer,
	documento_cod integer,
	PRIMARY KEY(usuario_cod, documento_cod),
	FOREIGN KEY(usuario_cod) REFERENCES Usuario(cod),
	FOREIGN KEY(documento_cod) REFERENCES Documentos(cod)
)Engine=INNODB;

##Inserção de dados
	
INSERT INTO campus (cod, nome, cidade, email_secretaria)
VALUES
    (1,'ICT-UNIFESP', 'São José dos Campos', 'secretaria.sjc@unifesp.br'),
    (2,'Unidade Talim', 'São José dos Campos', 'secretaria.sjc@unifesp.br'),
    (3,'EPPEN', 'Osasco', 'secretaria.osasco@unifesp.br'),
    (4,'EFLCH', 'Guarulhos', 'secretariaguarulhos@unifesp.br'),
    (5,'Unidade José Alencar', 'Diadema', 'secretaria.diadema@unifesp.br'),
    (6,'Campus Baixada Santista', 'Santos', 'secretaria.bs@unifesp.br'),
    (7,'Escola Paulista de Medicina', 'São Paulo', 'secretaria.sp@unifesp.br');

INSERT INTO pesquisador (cod, nome, email, grau, especializacao, campus_cod)
VALUES
    (1, 'Daniela', 'daniela@unifesp.br', 'Mestrado', 'Big Data', 1),
    (2, 'Rafael', 'rafael@unifesp.br', 'Mestrado', 'Inteligência Artificial', 1),
    (3, 'Maria', 'maria@unifesp.br', 'Doutorado', 'Neurociência', 7),
    (4, 'Pedro', 'pedro@unifesp.br', 'Bacharelado', 'Química', 5),
    (5, 'Carla', 'carla@unifesp.br', 'Mestrado', 'Anatomia', 6),
    (6, 'Lucas', 'lucas@unifesp.br', 'Doutorado', 'Ortopedia', 7),
    (7, 'Juliana', 'juliana@unifesp.br', 'Bacharelado', 'Ciências Biologicas', 5),
    (8, 'Fernando', 'fernando@unifesp.br', 'Mestrado', 'Economia', 1),
    (9, 'Amanda', 'amanda@unifesp.br', 'Doutorado', 'Física', 1),
    (10, 'Alvaro', 'alvaro@unifesp.br', 'Pós-Doutorado', 'Estrutura de Dados', 1);

INSERT INTO area (cod, nome)
VALUES
    (1, 'Computação'),
    (2, 'Biotecnologia'),
    (3, 'Engenharia Biomédica'),
    (4, 'Física Quântica'),
    (5, 'Ecologia'),
    (6, 'Arquitetura Sustentável'),
    (7, 'Neurociência Computacional'),
    (8, 'Economia Ambiental'),
    (9, 'Inteligência Artificial'),
    (10, 'Bioinformática');

INSERT INTO pesquisa (cod, titulo, datainicio, datafim, status, descricao)
VALUES
    (1, 'Utilizando Imagens para detectar desmatamento', '2010-03-21', '2011-12-31', 'Em andamento', 'A vigente pesquisa visa explorar o potencial da inteligencia artificial para detectar desmatemento em imagens de satélite'),
    (2, 'Pesquisa sobre Energia Renovável', '2015-01-10', '2016-06-30', 'Concluída', 'Estudo sobre a eficiência de diferentes fontes de energia renovável'),
    (3, 'Estudo de Comportamento Animal', '2018-05-15', '2019-11-30', 'Em andamento', 'Observações sobre o comportamento de determinadas espécies'),
    (4, 'Impacto das Mudanças Climáticas', '2022-02-01', '2023-12-31', 'Planejamento', 'Avaliação do impacto das mudanças climáticas em regiões específicas'),
    (5, 'Pesquisa em Inteligência Artificial', '2019-09-01', '2020-06-30', 'Concluída', 'Desenvolvimento de algoritmos de aprendizado de máquina'),
    (6, 'Estudo de Novas Tecnologias na Medicina', '2021-04-15', '2022-11-30', 'Em andamento', 'Investigação sobre o uso de tecnologias emergentes na área médica'),
    (7, 'Exploração Espacial', '2017-08-01', '2018-05-31', 'Concluída', 'Pesquisa sobre tecnologias para exploração espacial'),
    (8, 'Estudo de Sustentabilidade Urbana', '2020-08-15', '2022-03-31', 'Em andamento', 'Análise das práticas de sustentabilidade em ambientes urbanos'),
    (9, 'Pesquisa em Genética Humana', '2016-03-01', '2017-12-31', 'Concluída', 'Investigação sobre os padrões genéticos em populações humanas'),
    (10, 'Desenvolvimento de Vacina Antiviral', '2023-01-10', '2024-12-31', 'Planejamento', 'Projeto para desenvolver uma vacina contra vírus emergentes');

INSERT INTO documentos (cod, tipo, dataatualizacao, pesquisa_cod)
VALUES
    (1, 'Relatorio', '2018-05-31', 7),
    (2, 'Relatorio', '2019-11-04', 3),
    (3, 'Artigo Científico', '2018-05-31', 7),
    (4, 'Tese de Doutorado', '2023-12-15', 10),
    (5, 'Relatorio Técnico', '2017-12-10', 2),
    (6, 'Apresentação de Conferência', '2022-02-28', 6),
    (7, 'Relatorio Preliminar', '2019-06-25', 4),
    (8, 'Artigo de Revisão', '2020-11-08', 8),
    (9, 'Relatorio Final', '2018-05-31', 7),
    (10, 'Manual Técnico', '2016-09-12', 1);

INSERT INTO usuario (cod, nome, telefone, email, ocupacao, status_acesso, motivo)
VALUES
    (1, 'Jose', '1111-1111', 'jose@embraer.com', 'CEO EMBRAER', 'Ativo', 'Interesse em oferecer uma bolsa aos pesquisadores'),
    (2, 'Maria', '2222-2222', 'maria@itau.com', 'Engenheira Itau', 'Ativo', 'Acesso regular ao sistema'),
    (3, 'Carlos', '3333-3333', 'carlos@unifesp.com', 'Pesquisador', 'Inativo', 'Afastamento temporário'),
    (4, 'Ana', '4444-4444', 'ana@unip.com', 'Reitora', 'Ativo', 'Atualização de permissões'),
    (5, 'Roberto', '5555-5555', 'roberto@microsft.com', 'CEO Microsoft', 'Ativo', 'Participação em projeto específico'),
    (6, 'Laura', '1313-1313', 'laura@microsoft.com', 'Engenheira de Software', 'Ativo', 'Desenvolvimento de novas funcionalidades'),
    (7, 'Alex', '1414-1414', 'alex@microsoft.com', 'Analista de Dados', 'Inativo', 'Licença médica temporária'),
    (8, 'Camila', '2121-2121', 'camila@openia.com', 'Coordenadora de Projetos', 'Ativo', 'Gerenciamento de projetos de inovação'),
    (9, 'Tiago', '1616-1616', 'tiago@microsoft.com', 'Desenvolvedor', 'Ativo', 'Implementação de melhorias no sistema'),
    (10, 'Sophie', '1717-1717', 'sophie@openia.com', 'Pesquisadora de IA', 'Ativo', 'Colaboração em projetos de pesquisa');

INSERT INTO publicacao (cod, titulo, nomerevista, datapublicacao, statusrevisao, documento_cod)
VALUES
    (1, 'Exploração Espacial', 'Science', '2018-05-31', 'Revisado', 1),
    (2, 'Machine Learning Avançado', 'Journal of Artificial Intelligence Research', '2020-10-15', 'Aguardando Revisão', 10),
    (3, 'Sustentabilidade Urbana em Metrópoles', 'Environmental Science & Technology', '2019-07-20', 'Publicado', 8),
    (4, 'Avanços em Genética Humana', 'Nature Genetics', '2022-02-28', 'Rejeitado', 6);

INSERT INTO mantedor (cod, nome)
VALUES
    (1, 'CNPq'),
    (2, 'FAPESP'),
    (3, 'IEL'),
    (4, 'CNPEM'),
    (5, 'IDSM'),
    (6, 'IMPA'),
    (7, 'RNP'),
    (8, 'Capes'),
    (9, 'Finep'),
    (10, 'CGEE');

INSERT INTO bolsa (cod, total, datainicio, datafim, pesquisa_cod, mantedor_cod)
VALUES
    (1, 5.000, '2010-03-21', '2011-12-31', 1, 1),
    (2, 100.000, '2015-01-10', '2016-06-30', 2, 1),
    (3, 12.000, '2020-08-15', '2022-03-31', 8, 9),
    (4, 23.000, '2023-01-10', '2024-12-31', 10, 4);

INSERT INTO area_pesquisa (area_cod, pesquisa_cod)
VALUES
    (1, 1),
    (2, 4),
    (3, 2),
    (4, 6),
    (5, 1),
    (6, 3),
    (7, 4),
    (8, 6),
    (9, 2),
    (10, 2);

INSERT INTO pesquisador_pesquisa (pesquisador_cod, pesquisa_cod, cargo)
VALUES
    (1, 1, 'Autor'),
    (2, 4, 'Autor'),
    (3, 2, 'Autor'),
    (4, 6, 'Autor'),
    (5, 1, 'Colaborador'),
    (6, 3, 'Autor'),
    (7, 4, 'Colaborador'),
    (8, 6, 'Autor'),
    (9, 2, 'Colaborador'),
    (10, 2, 'Autor');

INSERT INTO usuario_documentos (usuario_cod, documento_cod)
VALUES
    (1, 1),
    (1, 4),
    (1, 2),
    (4, 6),
    (5, 1),
    (1, 3),
    (7, 4),
    (5, 6),
    (9, 2),
    (2, 2);
