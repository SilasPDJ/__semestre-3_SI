# estão em uso as tabelas: piloto diplomas ex anterior
USE atividades;
# -------------------------------------------- parte 2
CREATE TABLE autor(
	cod_autor int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(100)
);
CREATE TABLE editora(
	cod_editora int PRIMARY KEY AUTO_INCREMENT,
    endereco_CEP varchar(10),
    endereco_rua varchar(100),
    endereco_bairro varchar(50),
    endereco_cidade varchar(50),
    endereco_estado char(2)
);

CREATE TABLE livro (
	cod_livro int PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(60) NOT NULL,
	autor_cod int,
	editora_cod int,
	CONSTRAINT FK_autor_cod FOREIGN KEY (autor_cod) REFERENCES autor(cod_autor),
	CONSTRAINT FK_editora_cod FOREIGN KEY (editora_cod) REFERENCES editora(cod_editora)
) ;
# -----------------------------------------------------------------------------------------
# -------------------------------------------- parte 3
-- SEGUNDA FORMA NORMAL
# atributos de uma tabela devem ser totalmente dependentes da PK
# ProjEmpr
CREATE TABLE ProjetoEmpr(
	cod_proj int PRIMARY KEY AUTO_INCREMENT,
	tipo_proj varchar(20),
	descricao_proj varchar(200),
    data_inicio date DEFAULT(CURRENT_DATE) NOT NULL,
    data_fim date
);

CREATE TABLE Empregados(
	cod_empr int PRIMARY KEY AUTO_INCREMENT,
	nome_empr varchar(200),
	categoria_cod int, 
    FOREIGN KEY(categoria_cod) REFERENCES Categorias(cod_categoria_empr)
	# 1 categoria pertence a até N empregados
);
CREATE TABLE Categorias(
	cod_categoria_empr int PRIMARY KEY AUTO_INCREMENT,
    descricao_categoria varchar(200),
    salariocategoria decimal(15,2)
);

CREATE TABLE ProjetoEmpregados(
	cod_participacao int PRIMARY KEY AUTO_INCREMENT,
    proj__cod_proj int,
    empr__cod_empr int,
	CONSTRAINT fk_cod_proj FOREIGN KEY(proj__cod_proj) REFERENCES ProjetoEmpr(cod_proj),
    CONSTRAINT fk_cod_empr FOREIGN KEY(empr__cod_empr) REFERENCES Empregados(cod_empr)
);
# ---------------------------------------------------------------------------------------------------
# -------------------------------------------- parte 4
CREATE TABLE Funcionario( 
	func_codigo int PRIMARY KEY AUTO_INCREMENT,
	func_nome varchar(100),
	func_datanascimento date,
	id_endereco int,
    cod_cargo int, 
    cod_banco int,
	FOREIGN KEY (id_endereco) REFERENCES FuncEndereco(id_endereco),
    FOREIGN KEY (cod_cargo) REFERENCES Cargos(cod_cargo),
    FOREIGN KEY (cod_banco) REFERENCES AgenciaFuncionarios(id)
); # 1 funcionario pode ter somente 1 endereço
CREATE TABLE FuncEndereco(
	id_endereco int PRIMARY KEY AUTO_INCREMENT,
    func_endereco_CEP varchar(10),
    func_endereco_rua varchar(100),
    func_endereco_bairro varchar(50),
    func_endereco_cidade varchar(50),
    func_endereco_estado char(2)
);
CREATE TABLE Cargos(
	cod_cargo int PRIMARY KEY AUTO_INCREMENT,
    nome_cargo varchar(50),
    salario_minimo_cargo decimal(15,2)
);
CREATE TABLE AgenciaFuncionarios(
	id int PRIMARY KEY AUTO_INCREMENT,
    cod_agencia varchar(10) NOT NULL,
    cod_conta int,
    nome_banco varchar(50)
);
CREATE TABLE Pagamentos(
	# vários funcionarios podem ter vários pagamentos
	cod_pagmnt int PRIMARY KEY AUTO_INCREMENT,
    pagmnt_ref_periodo_inicio date, 	# pagamento referente à data_inicio
    pagmnt_ref_periodo_fim date, 		# pagamento referente à data_fim
	valor_bruto decimal(15,2),
    valor_descontos decimal(15,2),
    funcionario_codigo int,
    CONSTRAINT fk_funcionario_codigo FOREIGN KEY(funcionario_codigo) REFERENCES Funcionario(func_codigo)
); # valor-pagto-liquido Será removido, pois não se adequa à 3FN, o atributo citado pode ser calculado através de outros
