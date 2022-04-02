USE XPTO
--Procedimento para requisição
EXECUTE Requisicao NucleoID, NIF, ISBN;
EXECUTE REQUISICAO 'FR', 457423745, 741;

EXECUTE REQUISICAO 'FR', 256032458, 741; --possui 4 livros

EXECUTE DEVOLUCAO 'FR', 457423745, 741;

--1-Para saber o Total de obras Execute o query a seguir
EXECUTE Total_Obras;

--2-Para saber o Total de obras por Assunto
EXECUTE Obras_Assunto;

--3-Obras mais requisitadas
EXECUTE Obras_Mais_Requisitadas;

--4-Lista dos nucleos, por ordem decrescente de requisi��es
EXECUTE Nucleos_Requisicoes;

--5-Acrescentar novas obras
--SUBSTITUIR O NOME DOS CAMPOS (ISBN, 'Nome', 'Autor', 'Assunto') PELOS DADOS A SEREM INSERIDOS
EXECUTE Adicionar_Obra ISBN, 'Nome', 'Autor', 'Assunto';
GO
UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:Endereço completo da imagem', SINGLE_BLOB) As t1)
WHERE Nome like 'Nome';

EXECUTE Adicionar_Obra 856, 'Steve Jobs', 'Walter Isaacson', 'Biografia';
GO
UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:\Users\jpluc\OneDrive\Documents\UpSkill\mod2_SQL\XPTO\img\Steve-Jobs.JPG', SINGLE_BLOB) As t1)
WHERE Nome like 'Steve Jobs';

--6-Atualizar o numero de exemplares de determinada obra
EXECUTE Exemplares_De_UMA_Obras ISBN;
EXECUTE Exemplares_De_UMA_Obras 369;
EXECUTE Exemplares_De_UMA_Obras 456;
EXECUTE Exemplares_De_UMA_Obras 458;
EXECUTE Exemplares_De_UMA_Obras 741;
EXECUTE Exemplares_De_UMA_Obras 753;
EXECUTE Exemplares_De_UMA_Obras 856;

--7-Transferir um ou mais exemplares de uma obra, de um nucleo para outro
--SUBSTITUIR O NOME DOS CAMPOS ('NucleoID' de Origem, 'NucleoID' de Destino, ISBN, 'Quantidade') PELOS DADOS A SEREM INSERIDOS
EXECUTE Transferir_Obra 'NucleoID', 'NucleoID', ISBN, Quantidade;

EXECUTE Transferir_Obra 'LB', 'PT', 369, 2;

--8-Registar novos leitores
--SUBSTITUIR O NOME DOS CAMPOS ('NIF', 'Nome', 'DataNasc', 'LeitorLogin', 'LeitorSenha') PELOS DADOS A SEREM INSERIDOS
EXECUTE Adicionar_Leitor  'NIF', 'Nome', 'DataNasc', 'LeitorLogin', 'LeitorSenha';

EXECUTE Adicionar_Leitor  '987564123', 'Livia Mouta', '1994-10-17', 'LMouta', 'L56987';

--9-Suspender o acesso
--Suspender MAnualmente
EXECUTE Suspender_Leitor 'NIF';
EXECUTE Suspender_Leitor '256032458';
--Verificar se há inadimplencia e suspende se 3 infrações
EXECUTE Suspender_por_infracao 'NIF';
EXECUTE Suspender_por_infracao '256032458';

--10-Reativar o acesso
EXECUTE Reativar_Leitor 'NIF';
EXECUTE Reativar_Leitor '256032458';

--11-Eliminar leitores
Execute Cancelar_Inscricao 'NIF';
Execute C
ancelar_Inscricao '987564123';
/*********Parte 3**********/
--1- Questao 8 da parte anterior
EXECUTE Adicionar_Leitor  'NIF', 'Nome', 'DataNasc', 'LeitorLogin', 'LeitorSenha';
EXECUTE Adicionar_Leitor  '987564123', 'Livia Mouta', '1994-10-17', 'LMouta', 'L56987';
--2- Questao 11 da parte anterior
EXECUTE Cancelar_Inscricao 'NIF';
Execute Cancelar_Inscricao '987564123';
--3--Pesquisas
/***MENU***/
--1-Obras em geral
--2-Obras por assunto
--3-Por nucleo
EXECUTE Pesquisas 1;
EXECUTE Pesquisas 2,'','Assunto';
EXECUTE Pesquisas 3, 'NucleoID';

EXECUTE Pesquisas 2,'','Romance';
EXECUTE Pesquisas 3, 'PT';
EXECUTE Pesquisas 8, 'PT';


--4.1-
Execute Situacao 'NucleoId'

Execute Situacao 'PT'

--4.2- HISTORICO
EXECUTE Histotico 'PT'; -- por nucleo
EXECUTE Histotico NULL, '2021-06-20'; -- apartir desta data
EXECUTE Histotico NULL, '2021-06-20', '2022-02-20'; --entre estas data
EXECUTE Histotico 'PT', '2021-06-20', '2022-02-20'; --com nucleo e entre datas

