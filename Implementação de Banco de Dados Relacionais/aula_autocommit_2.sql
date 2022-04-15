/* Mudando o delimitador de comandos, para que possamos utilizar o ;(ponto e virgula) no final de cada linha em nossa procedure */

DELIMITER $$

 

/* Caso ela ja exista, apagamos a procedure para depois criarmos novamente */

DROP PROCEDURE IF EXISTS `spInsere` $$

 

/* Aqui damos inicio à criação da procedure. A Sintaxe é a seguinte: CREATE PROCEDURE `nomeprocedure` (lista de parametros separados por virgula)

  Os parametros tem o seguinte formato: IN nomeparametro tipo Esse IN indica que esse parâmetro sera de entrada, ou seja, sera atravez dele que serão passados dados para nossa procedure.

  Tambem poderiamos ter ao invés de IN, um ou mais parametros OUT, caso quisessemos enviar dados de dentro da procedure para fora, mas no caso do arquivo utilizei somente selects mesmo

  para passar as mensagens para fora da procedure.

*/

CREATE PROCEDURE `spInsere`(IN n VARCHAR(100), IN r VARCHAR(100))

 

/* Aqui inicia-se o corpo da procedure */

BEGIN

/* Abaixo fica a declaração da variavel excessao que sera um inteiro pequeno e é inicializada com 0; A segunda linha declare indica que quando ocorrer alguma excessão em algum comando,

essa variável excessao será preenchida com o valor 1, tornando possivel verificar se houve algum problema.*/

  DECLARE excessao SMALLINT DEFAULT 0;

  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET excessao = 1;

 

/* Aqui verificamos se os parâmetros não estão vazios, para não inserirmos campos em branco no banco. Caso ambos estejam preenchidos, inicio a transaction com o comando START TRANSACTION. */

  IF (n <> "" AND r <> "") THEN

    START TRANSACTION;

 

    /* aqui inserimos o nome passado por parâmetro na tabela cliente */

    INSERT INTO cliente VALUES(null, n);

 

    /* Caso a variavel contenha 1, ou seja, caso tenha ocorrido algum erro Retornamos uma mensagem de erro, atravez da variavel Msg, e logo em seguida executamos o comando ROLLBACK. Esse comando

    que é o responsavel por desfazer toda e qualquer alteração que tenhamos feito no banco. */

    IF excessao = 1

    THEN

      SELECT 'Erro ao inserir na tabela cliente' AS Msg;

      ROLLBACK;

    ELSE

      /* Caso excessao ainda seja 0, ele continua aqui, onde executamos o proximo comando cuja função é retornar o ultimo ID(chave primaria) que foi inserido na tabela cliente e o guarda na variavel @idCliente */

      SELECT DISTINCT LAST_INSERT_ID() INTO @idCliente FROM cliente;

      /* De novo, caso tenha ocorrido erro, imprime mensagem e execura um ROLLBACK */

      IF excessao = 1

      THEN

        SELECT 'Erro ao selecionar o ultim ID inserido' AS Msg;

        ROLLBACK;

      ELSE

        /* Aqui iremos inserir os dados na tabela endereco, utilizando a variavel com o id do ultimo cliente inserido, que pegamos no comando SELECT acima, e tambem o parametro contendo a rua.         */

        INSERT INTO endereco VALUES(null, @idCliente, r);

        /* caso tenha erro, mensagem e ROLLBACK */

        IF excessao = 1

        THEN

          SELECT 'Erro ao inserir na tabela  endereco' AS Msg;

          ROLLBACK;

        ELSE

          /* Se chegamos até esse ponto da procedure, é por que todos os comandos foram bem sucedidos então podemos executar o comando COMMIT. O COMMIT diz ao banco que todos os comandos foram executados

          com sucesso e pode finalizar a transação.

          */

          SELECT 'Cadastro efetuado com sucesso' AS Msg;

          COMMIT;

        END IF;

      END IF;

    END IF;

  ELSE

    /* Como estão faltando parametros, estão vazios, imprime-se a mensagem a seguir.*/

    SELECT 'Parametros necessarios' AS Msg;

  END IF;

 

/* aqui finalizamos a procedure*/

END $$

 

/* Nesse pondo indicamos que agora usaremos novamente o delimitador ;(ponto e virgula) para separar comandos */

DELIMITER ;