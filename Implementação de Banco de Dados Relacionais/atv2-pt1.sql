create database atividades;
USE atividades;
# ----------------------------
# Os dados foram inseridos utilizando a interface do workbench
# ---- EX1
create table PILOTO (
num_cad int PRIMARY KEY auto_increment,
nome varchar(200),
cpf char(11), #somente números
salario decimal(15,2),
diploma char(2),
descricao varchar(30)
);

# --------
# Foram encontradas as seguintes anomalias:
# - Mais de um registro por nome, por causa dos diferentes diplomas
# - Chego à conclusão de que seja necessário criar outra tabela chamada Diplomas
# - tabela "Diplomas" existe para se referir às qualificações do PILOTO
# ----------------------------

create table DIPLOMAS(
id_diploma int PRIMARY KEY auto_increment,
diploma char(2),
descricao varchar(30)
);

alter table PILOTO drop column diploma;
alter table PILOTO drop column descricao;

create table PILOTO_DIPLOMAS(
id int PRIMARY KEY auto_increment,
PILOTO__num_cad int,
DIPLOMA__id int,

CONSTRAINT FK_PILOTO FOREIGN KEY (PILOTO__num_cad) REFERENCES PILOTO(num_Cad), 
CONSTRAINT FK_DIPLOMA FOREIGN KEY (DIPLOMA__id) REFERENCES DIPLOMAS(id_diploma) 
);

# para inserir dados pelo workbench
select * from DIPLOMAS;
select * from PILOTO;
select * from PILOTO_DIPLOMAS;


SELECT PILOTO__num_cad, p.nome, d.descricao FROM PILOTO_DIPLOMAS JOIN PILOTO as p JOIN DIPLOMAS as d
ON p.num_cad = PILOTO__num_cad AND d.id_diploma = DIPLOMA__id
ORDER BY d.descricao;

