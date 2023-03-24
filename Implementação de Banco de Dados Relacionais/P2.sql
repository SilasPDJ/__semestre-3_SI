CREATE TABLE pacientes (
nome varchar (80) NOT NULL,
cpf varchar (11) PRIMARY KEY NOT NULL UNIQUE,
endereço varchar (80),
bairro varchar (80),
telefone varchar (30)
);

select * from pacientes where nome="Ana Maria de Oliveira Freitas" LIMIT 1;
SET autocommit = ON;
show triggers;