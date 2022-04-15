create database atividades02;
use atividades02;
# ------------------ usuário padrão
create table Usuario( # Aluno, Funcionário, Professor
	COD_usuario int PRIMARY KEY auto_increment,
    nome_usuario varchar(50),
    end_usuario varchar(100),
    fone_usuario varchar(13),
    sexo_usuario char(1),
    CPF_usuario varchar(12),
    RG_usuario varchar(11),
	Dt_nascto_usuario date,
    situacao_usuario varchar(18),
    email_usuario varchar(50)
);
# ---------- Tabela referenciada por aluno
create table Curso(
	COD_curso int PRIMARY KEY AUTO_INCREMENT,
    nome_curso varchar(50),
    tipo_curso varchar(30)
);

# ------------------------------------------ TIPOS DE USUARIO
create table Aluno(
	COD_usuario int,
	RA int,
	DT_ingresso date DEFAULT(CURRENT_DATE),
    DT_previsto_termino date,
    COD_curso int,
	FOREIGN KEY(cod_usuario) REFERENCES Usuario(COD_usuario),
	CONSTRAINT fk_Cod_curso FOREIGN KEY(COD_curso) REFERENCES Curso(COD_curso)
);
create table Funcionario(
	COD_usuario int,
	COD_funcional int,
    cargo varchar(50),
	DT_admissao date DEFAULT(CURRENT_DATE),
    DT_desligamento date,
    FOREIGN KEY(cod_usuario) REFERENCES Usuario(COD_usuario)
);
create table Professor(
	COD_usuario int,
	COD_funcional int,
    titulacao varchar(50),
	DT_admissao date DEFAULT(CURRENT_DATE),
    DT_desligamento date,
    FOREIGN KEY(cod_usuario) REFERENCES Usuario(COD_usuario)
);
# --------------------------------------------------------------
create table  Reserva(
	NUM_reserva int PRIMARY KEY AUTO_INCREMENT,
    DT_limite date,
    situacao_reserva varchar(30),
    COD_usuario int,
    FOREIGN KEY(COD_usuario) REFERENCES Professor(COD_usuario)
);
create table Obra(
	ISBN int PRIMARY KEY AUTO_INCREMENT,
	titulo_original varchar(50),
    idioma_original varchar(30),
    genero varchar(30),
    classificacao varchar(30)
);
create table Reserva_Obra(
	NUM_reserva int,
    ISBN int,
	FOREIGN KEY (NUM_reserva) REFERENCES Reserva(NUM_reserva),
    FOREIGN KEY (ISBN) REFERENCES Obra(ISBN),
    situacao_item_reserva varchar(30)
);
create table Autor(
 	COD_autor int PRIMARY KEY AUTO_INCREMENT,
	nome_autor varchar(100),
    nacionalidade_autor varchar(50)
);
create table Participacao_obra(
	ISBN int,
    COD_autor int,
	FOREIGN KEY (ISBN) REFERENCES Obra(ISBN),
	FOREIGN KEY (COD_autor) REFERENCES Autor(COD_autor),
    tipo_participacao varchar(50)
);
# -------------------------------------------------------
create table Editora(
	COD_editora int PRIMARY KEY AUTO_INCREMENT,
	nome_edit varchar(100),
    end_edit varchar(200),
    fone_edit varchar(14),
    cnpj_edit varchar(18),
    contato_edit varchar(50),
    nacionalidade varchar(30)
);
# ----------
create table Exemplar(
	NUM_exemplar int PRIMARY KEY AUTO_INCREMENT,
	ISBN int,
    FOREIGN KEY (ISBN) REFERENCES Obra(ISBN),
    num_edicao int,
    idioma_exemplar varchar(30),
	ano_publicacao int,
    qtd_pags int,
    tipo_exemplar varchar(50),
    tipo_midia varchar(50),
    VL_exemplar decimal(15,2),
    prazo_devolucao date,
    tipo_aquisicao varchar(30),
    situacao_exemplar varchar(30),
	COD_editora int,
    FOREIGN KEY (COD_editora) REFERENCES Editora(COD_editora)
);
create table Emprestimo(
	NUM_emprestimo int PRIMARY KEY AUTO_INCREMENT,
	DT_retirada date,
    COD_usuario int,
    VL_total_multa decimal(15,2),
    situacao_emprest varchar(30),
    NUM_reserva int,
    
    FOREIGN KEY (COD_usuario) REFERENCES Usuario(COD_usuario),
    FOREIGN KEY (NUM_reserva) REFERENCES Reserva(NUM_reserva)
);
create table Itens_Emprestimo(
	NUM_emprestimo int, 
    NUM_exemplar int,
    ISBN int,
    FOREIGN KEY (NUM_emprestimo) REFERENCES Emprestimo(NUM_emprestimo),
    FOREIGN KEY (NUM_exemplar) REFERENCES Exemplar(NUM_exemplar),
    FOREIGN KEY (ISBN) REFERENCES Exemplar(ISBN)
);
