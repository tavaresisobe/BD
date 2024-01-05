/*-- USE GustavoIsobe;
if exists DROP TABLE Ator;
if exists DROP TABLE Filme;
if exists DROP TABLE PERSONAGEM;  
*/

CREATE TABLE Ator(
    coda int auto_increment,
    nomeart varchar (30),
    nomereal varchar (30),
    nacionalidade varchar(30),
    sexo char,
    idade int,
    indicacoesOscar int,
    oscar int,
    PRIMARY KEY (coda)
);

CREATE TABLE Filme(
    codf int NOT NULL,
    nome varchar(30),
    ano int,
    orcamento int,
    tempo int,
    PRIMARY KEY (codf)
);

CREATE TABLE PERSONAGEM(
    coda int,
    codf int,
    personagem varchar(30),
    cache int,
    primary key (coda, codf)
);
alter table PERSONAGEM
add FOREIGN KEY(coda) REFERENCES Ator(coda);


INSERT into Ator (nomeart, nomereal, nacionalidade, sexo, idade, indicacoesOscar, oscar)
values('DemiMoore','MariadaSilva', 'USA', 'f', 32, 0, 0),
        ('BradPitt', 'JoaoPaulo', 'USA', 'f', 28, 1, 0),
        ('DustinHoffman', 'DustinHoffman', 'USA', 'f', 36, 2, 0),
        ('JessicaLange', 'JessicaLange', 'USA', 'f', 42, 4, 2),
        ('SoniaBraga', 'SoniaBraga', 'Brasil', 'f', 45, 0, 0);

INSERT into Filme (nome, ano, orcamento, tempo)
values('Ajurada', 1996, 1000000, 18),
        ('ALetraEscarlate', 1995, 10000000, 24),
        ('Seven', 1995, 1500000, 20),
        ('Tootsie', 1982, 50000, 16),
        ('Tieta', 1995, 200000, 18);

INSERT into PERSONAGEM (coda, codf, personagem, cache)
values(1,1, 'Mary', 3000),
        (1,2, 'Sandy', 5000),
        (2,3, 'John', 5000),
        (3,4, 'Mary', 1000),
        (4,4,'Tootsie', 2000),
        (5,5,'Tieta', 500);
   
UPDATE Ator
SET sexo = 'm'
WHERE nomeart = 'BradPitt';
