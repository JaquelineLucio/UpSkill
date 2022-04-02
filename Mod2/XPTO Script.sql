USE [master]
GO

/****** Object:  Database [XPTO]    Script Date: 19/03/2022 23:55:38 ******/
CREATE DATABASE [XPTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XPTO', FILENAME = N'C:\Users\jpluc\XPTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XPTO_log', FILENAME = N'C:\Users\jpluc\XPTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XPTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [XPTO] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [XPTO] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [XPTO] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [XPTO] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [XPTO] SET ARITHABORT OFF 
GO

ALTER DATABASE [XPTO] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [XPTO] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [XPTO] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [XPTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [XPTO] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [XPTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [XPTO] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [XPTO] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [XPTO] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [XPTO] SET  ENABLE_BROKER 
GO

ALTER DATABASE [XPTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [XPTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [XPTO] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [XPTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [XPTO] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [XPTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [XPTO] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [XPTO] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [XPTO] SET  MULTI_USER 
GO

ALTER DATABASE [XPTO] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [XPTO] SET DB_CHAINING OFF 
GO

ALTER DATABASE [XPTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [XPTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [XPTO] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [XPTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [XPTO] SET QUERY_STORE = OFF
GO

ALTER DATABASE [XPTO] SET  READ_WRITE 
GO

/****** Object:  Table [dbo].[Leitores]    Script Date: 19/03/2022 23:56:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Leitores](
	[NIF] [nchar](9) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[DataNasc] [date] NULL,
	[Ativo] [nchar](10) NULL,
	[LeitorLogin] [nchar](50) NULL,
	[LeitorSenha] [nchar](10) NULL,
 CONSTRAINT [PK_Leitores] PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Nucleos]    Script Date: 19/03/2022 23:56:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Nucleos](
	[Id] [nchar](10) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[Cidade] [nvarchar](100) NULL,
 CONSTRAINT [PK_Nucleos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NucleosObras]    Script Date: 20/03/2022 00:20:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NucleosObras](
	[NucleoID] [nchar](10) NOT NULL,
	[ISBN] [int] NOT NULL,
	[Copias] [int] NULL,
 CONSTRAINT [PK_NucleosObras] PRIMARY KEY CLUSTERED 
(
	[NucleoID] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[NucleosObras]  WITH CHECK ADD  CONSTRAINT [FK_NucleosObras_Nucleos] FOREIGN KEY([NucleoID])
REFERENCES [dbo].[Nucleos] ([Id])
GO

ALTER TABLE [dbo].[NucleosObras] CHECK CONSTRAINT [FK_NucleosObras_Nucleos]
GO

ALTER TABLE [dbo].[NucleosObras]  WITH CHECK ADD  CONSTRAINT [FK_NucleosObras_Obras] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Obras] ([ISBN])
GO

ALTER TABLE [dbo].[NucleosObras] CHECK CONSTRAINT [FK_NucleosObras_Obras]
GO

/****** Object:  Table [dbo].[Obras]    Script Date: 19/03/2022 23:57:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Obras](
	[ISBN] [int] NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[Autor] [nvarchar](100) NULL,
	[Assunto] [nvarchar](100) NULL,
	[Capa] [varbinary](max) NULL,
 CONSTRAINT [PK_Obras] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Requisicoes]    Script Date: 20/03/2022 00:21:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Requisicoes](
	[RequisicaoNum] [int] IDENTITY(1,1) NOT NULL,
	[NucleoID] [nchar](10) NOT NULL,
	[NIF] [nchar](9) NOT NULL,
	[ISBN] [int] NOT NULL,
	[DataRequisicao] [date] NULL,
	[DataDevolucao] [date] NULL,
 CONSTRAINT [PK_Requisicoes] PRIMARY KEY CLUSTERED 
(
	[RequisicaoNum] ASC,
	[NucleoID] ASC,
	[NIF] ASC,
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Requisicoes]  WITH CHECK ADD  CONSTRAINT [FK_Requisicoes_Leitores] FOREIGN KEY([NIF])
REFERENCES [dbo].[Leitores] ([NIF])
GO

ALTER TABLE [dbo].[Requisicoes] CHECK CONSTRAINT [FK_Requisicoes_Leitores]
GO

ALTER TABLE [dbo].[Requisicoes]  WITH CHECK ADD  CONSTRAINT [FK_Requisicoes_Nucleos] FOREIGN KEY([NucleoID])
REFERENCES [dbo].[Nucleos] ([Id])
GO

ALTER TABLE [dbo].[Requisicoes] CHECK CONSTRAINT [FK_Requisicoes_Nucleos]
GO

ALTER TABLE [dbo].[Requisicoes]  WITH CHECK ADD  CONSTRAINT [FK_Requisicoes_Obras] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Obras] ([ISBN])
GO

ALTER TABLE [dbo].[Requisicoes] CHECK CONSTRAINT [FK_Requisicoes_Obras]
GO

/***************************************************************/

INSERT INTO Leitores(NIF, Nome, DataNasc, Ativo, LeitorLogin, LeitorSenha) VALUES
('126657658', ‘Gabriel Reis’, ‘1995-10-30’, ‘Ativo’ ,  ‘Greis’ , ’5678’),   
('256032458', ‘Jaqueliene Lucio’,	‘1995-05-30’, ‘Ativo’, ‘JLucio ‘, ‘1234 ‘),  
('456325896', ‘Vitoria Rocha’, ‘2008-06-21’, ‘Ativo’, ‘VRocha ‘,  ‘V7568’), 
('457423745', ‘Marcela Delgado’, ‘1996-06-01’, ‘Ativo’,  ‘MDelgado’,  ‘9012’ ),     
('459874236', ‘Miguel Lucio’, ‘2005-09-19’, ‘Inativo’,  ‘MLucio’, ‘8564’ );

INSERT INTO Nucleo(NucleoID, Nome, Cidade) VALUES
('LB', 'Ler Para Crer', 'Lisboa'),
('FR', 'Viajando no livro', 'Faro'),
('PT', 'Odisseia', 'Porto');

INSERT INTO Obras(ISBN, Nome, Autor, Assunto) VALUES
(456, '1984', 'George Orwell', 'Distopia'),
(741, 'Como Eu Era Antes de Voce', 'Jojo Moyes', 'Romance'),
(369, 'O Poder do Hábito', 'Charles Duhigg', 'Autoajuda');

INSERT INTO Levantamentos(NucleoID, NIF, ISBN, DataRequisicao, DataDevolucao) VALUES
('LB', '256032458', 456, '2021-01-06', '2021-01-14'),
('FR', '126657658', 741, '2021-10-06', '2021-01-20'),
('LB', '256032458', 369, '2021-01-10', '2021-01-14'),
('LB', '256032458', 456, '2021-02-06', '2021-02-14'),
('FR', '126657658', 741, '2021-10-06', '2021-02-20'),
('PT', '457423745', 369, '2021-01-10', '2021-02-14');

----UPDATE para as imagens das capas---------
UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:\Users\jpluc\OneDrive\Documents\UpSkill\mod2_SQL\XPTO\img\O Poder do Hábito.JPG', SINGLE_BLOB) As t1)
WHERE Nome like 'O Poder do Hábito'

UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:\Users\jpluc\OneDrive\Documents\UpSkill\mod2_SQL\XPTO\img\1984.JPG', SINGLE_BLOB) As t1)
WHERE Nome like '1984'

UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:\Users\jpluc\OneDrive\Documents\UpSkill\mod2_SQL\XPTO\img\Como eu era antes de voce.JPG', SINGLE_BLOB) As t1)
WHERE Nome like 'Como eu era antes de voce'
/*---------Parte 1----------*/
--Procedimento para Requisição
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	--Verificar se Nucleo existe
	IF ((SELECT COUNT(*) AS Expr1 FROM NucleosObras WHERE NucleoID = @NucleoID) LIKE 0) 
	BEGIN
		RAISERROR ('Nucleo não encontrado',1,1);
	END
	--verificar se usuario ja esta cadastrado
	ELSE IF ((SELECT COUNT(*) AS Expr1 FROM Leitores WHERE  NIF = @NIF) LIKE 0) 
		BEGIN
			RAISERROR ('Leitor Não Cadastrado',1,1);
		END
	--Verificar se esta ativo
	ELSE IF ((SELECT Ativo FROM Leitores WHERE Leitores.NIF = @NIF) != 'Ativo')
	BEGIN 
		RAISERROR ('O leitor nao esta ativo',1,1); 
	END
	--Verificar se obra existe
	ELSE IF ((SELECT COUNT(*) AS Expr1 FROM NucleosObras WHERE NucleosObras.ISBN LIKE @ISBN) LIKE 0) 
		BEGIN
			RAISERROR ('Obra não encontrada',1,1);
		END
	--Verificar se nucleo possui mais de um exemplar para poder emprestar
	ELSE IF ((SELECT Copias FROM NucleosObras WHERE NucleosObras.ISBN = @ISBN AND NucleosObras.NucleoID = @NucleoID) IN (0,1))
	BEGIN 
		RAISERROR ('Exemplar não disponivel para emprestimo',1,1); 
	END
	--verificar se Leitor ja possui 4 livros emprestados
	ELSE IF ((SELECT COUNT(*) as Livros_Nao_devolvidos FROM Requisicoes WHERE NIF like @NIF AND DataDevolucao is NULL)<4)
		BEGIN
			--se não, insero registro na tabela requisições
			INSERT INTO Requisicoes(NucleoID, NIF, ISBN, DataRequisicao)Values
			(@NucleoID, @NIF, @ISBN, GETDATE())
			--e faz update do numero de obras no nucleo
			UPDATE NucleosObras SET Copias = (Select Copias from NucleosObras Where NucleosObras.ISBN = @ISBN AND NucleosObras.NucleoID = @NucleoID)- 1
			WHERE NucleosObras.NucleoID = @NucleoID AND NucleosObras.ISBN = @ISBN;
		END
	ELSE
		BEGIN
			RAISERROR ('O leitor ja possui 4 livros em emprestimo',1,1); 
		END
END
---------PROCEDIMENTO DE DEVOLUCAO------------
CREATE PROCEDURE [dbo].[Devolucao] 
	-- Add the parameters for the stored procedure here
	@NucleoID nchar(10),
	@NIF nchar(9),
	@ISBN int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   --se não, insero registro na tabela requisições
			UPDATE Requisicoes SET DataDevolucao = GETDATE() WHERE Requisicoes.NucleoID = @NucleoID AND Requisicoes.NIF =  @NIF AND Requisicoes.ISBN =  @ISBN
			--e faz update do numero de obras no nucleo
			UPDATE NucleosObras SET Copias = (Select Copias from NucleosObras Where NucleosObras.ISBN = @ISBN AND NucleosObras.NucleoID = @NucleoID)+ 1
			WHERE NucleosObras.NucleoID = @NucleoID AND NucleosObras.ISBN = @ISBN;
END


/*------parte 2-----------*/
--1-Total de obras
CREATE PROCEDURE Total_Obras
AS
SELECT COUNT(ISBN) AS TotalObras
FROM     Obras;
GO

--2-Total de obras por Assunto
CREATE PROCEDURE Obras_Assunto
AS
	SELECT COUNT(ISBN) AS TotalObras, Assunto
FROM     Obras
GROUP BY Assunto;
GO

--3-Obras mais requisitadas
CREATE PROCEDURE Obras_Mais_Requisitadas
AS
SELECT TOP(10) COUNT(Requisicoes.ISBN) AS qtd, Obras.Nome
FROM     Requisicoes INNER JOIN
                  Obras ON Requisicoes.ISBN = Obras.ISBN
GROUP BY  Obras.Nome
ORDER BY COUNT(Requisicoes.ISBN) DESC
GO

--4-Lista dos nucleos, por ordem decrescente de requisições
CREATE PROCEDURE Nucleos_Requisicoes
AS
SELECT COUNT(Nucleos.Nome) AS NumRequisicoes, Nucleos.Nome, Nucleos.Cidade
FROM     Nucleos INNER JOIN
                  Requisicoes ON Nucleos.Id = Requisicoes.NucleoID
GROUP BY Nucleos.Nome, Nucleos.Cidade
ORDER BY COUNT(Nucleos.Nome) DESC
GO

--5-Acrescentar novas obras (Atualizar Nucleos)
CREATE PROCEDURE Adicionar_Obra 
	@ISBN int,
	@Nome nvarchar(100) =  NULL,
	@Autor nvarchar(100) =  NULL,
	@Assunto nvarchar(100) = NULL,	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Obras (ISBN, Nome, Autor, Assunto) VALUES
	(@ISBN, @Nome, @Autor, @Assunto)

	Insert Into NucleosObras (NucleoID, ISBN, Copias) Values
	('FR', @ISBN, 3),
	('LB', @ISBN, 3),
	('PT', @ISBN, 3);
END
--ex de EXEC EXECUTE Adicionar_Obra 458, 'O Morro dos Ventos Uivantes', 'Emily Brontë', 'Romance';
UPDATE Obras set Capa =(Select * FROM OPENROWSET (BULK 'C:\Users\jpluc\OneDrive\Documents\UpSkill\mod2_SQL\XPTO\img\O-Morro-dos-Ventos-Uivantes.JPG', SINGLE_BLOB) As t1)
WHERE Nome like 'O Morro dos Ventos Uivantes'

--6-Atualizar o numero de exemplares de determinada obra
----Procedimento para total de exemplares de UMA Obras---
CREATE PROCEDURE  Exemplares_De_UMA_Obras
@ISBN int
AS
DECLARE @NONucleo int= (SELECT SUM(NucleosObras.Copias) FROM NucleosObras  WHERE NucleosObras.ISBN = @ISBN  Group By NucleosObras.ISBN);
DECLARE @Emprestado int = (ISNULL((SELECT Count(Requisicoes.ISBN) FROM Requisicoes  WHERE Requisicoes.DataDevolucao IS NULL AND Requisicoes.ISBN = @ISBN  Group By Requisicoes.ISBN), 0))

SELECT Obras.Nome, (@NONucleo + @Emprestado) AS Qtdd
FROM     NucleosObras FULL JOIN 
                  Obras ON NucleosObras.ISBN = Obras.ISBN
				 FULL JOIN
				 Requisicoes ON NucleosObras.ISBN = Requisicoes.ISBN
				  WHERE Obras.ISBN = @ISBN
GROUP BY  Obras.Nome

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Copias int;
	SET @Copias = (Select Copias from NucleosObras Where NucleosObras.ISBN = @ISBN AND NucleosObras.NucleoID = @nucleoOrigemID)
    -- Insert statements for procedure here
	IF ((@Copias-@Quantidade)> 1 )
	BEGIN
	UPDATE NucleosObras SET Copias = @copias-@Quantidade
	WHERE NucleosObras.NucleoID = @nucleoOrigemID AND NucleosObras.ISBN = @ISBN;

	UPDATE NucleosObras SET Copias = (Select Copias from NucleosObras Where NucleosObras.ISBN = @ISBN AND NucleosObras.NucleoID = @nucleoDestinoID) + @Quantidade
	WHERE NucleosObras.NucleoID = @nucleoDestinoID AND NucleosObras.ISBN = @ISBN;
	END

	ELSE 
	BEGIN
	RAISERROR ('Quantidade não disponivel',1,1); 
	END
END
 
--8-Registar novos leitores
CREATE PROCEDURE Adicionar_Leitor
	-- Add the parameters for the stored procedure here
	@NIF nchar(9),
	@Nome nvarchar(100) =  NULL,
	@DataNasc Date =  NULL,
	@LeitorLogin nchar(10) = NULL,
	@LeitorSenha nchar(10) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;
	INSERT INTO Leitores(NIF, Nome, DataNasc, Ativo, LeitorLogin, LeitorSenha) VALUES
	(@NIF, @Nome, @DataNasc, 'Ativo', @LeitorLogin, @LeitorSenha);
END
--9-Suspender o acesso
--Suspender Manualmente
CREATE PROCEDURE Suspender_Leitor
	-- Add the parameters for the stored procedure here
	@NIF nchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF((SELECT Ativo FROM Leitores WHERE NIF LIKE @NIF)='Ativo')
	BEGIN
		UPDATE Leitores SET Ativo = 'Inativo' WHERE NIF LIKE @NIF
	END
	ELSE
	BEGIN
		RAISERROR ('O leitor ja se encontra Inativo', 1, 1)
	END
END
GO

--Verificar se há inadimplencia e suspende se 3 infrações
CREATE PROCEDURE Suspender_por_infracao
	@NIF nchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF((Select Count(DATEDIFF(Day, DataRequisicao, DataDevolucao)) As tempo_emprestimo FROM Requisicoes Where NIF like  @NIF And (DATEDIFF(Day, DataRequisicao, DataDevolucao) > 15))>2)
	BEGIN
		UPDATE Leitores SET Ativo = 'Inativo' WHERE NIF LIKE @NIF
	END
END
GO
--10-Reativar o acesso
CREATE PROCEDURE Reativar_Leitor
	@NIF nchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF((SELECT Ativo FROM Leitores WHERE NIF LIKE @NIF)='Inativo')
	BEGIN
		UPDATE Leitores SET Ativo = 'Ativo' WHERE NIF LIKE @NIF
	END
	ELSE
	BEGIN
		RAISERROR ('O leitor ja se encontra Ativo', 1, 1)
	END
END
GO

--11-Eliminar leitor se a mais de um ano não faz Requisicoes
CREATE PROCEDURE Eliminar_Leitor_Mais_de_um_Ano 
	-- Add the parameters for the stored procedure here
	@NIF nchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF((SELECT MIN(DATEDIFF(DAY,DataRequisicao, GETDATE())) FROM Requisicoes WHERE NIF like @NIF)>365)
	BEGIN 
			IF ((Select Count(NIF) FROM Requisicoes where NIF = @NIF and DataDevolucao is null) > 0)
		BEGIN
					RAISERROR ('O leitor nao pode ser excluido pois ainda possui obras requisitadas',1,1); 
		END
		ELSE 
		BEGIN
			DELETE FROM Leitores
			WHERE NIF = @NIF;
	END	
END	
 
/*----------Parte 3----------*/
--Cadastri do Leitor = 8

--Eliminar Leitor
ALTER PROCEDURE [dbo].[Cancelar_Inscricao]
	-- Add the parameters for the stored procedure here
	@NIF nchar(9)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF ((Select Count(NIF) FROM Requisicoes where NIF = @NIF and DataDevolucao is null) > 0)
	BEGIN
				RAISERROR ('O leitor nao pode ser excluido pois ainda possui obras requisitadas',1,1); 
	END
	ELSE 
	BEGIN
		DELETE FROM Leitores
		WHERE NIF = @NIF;
	END
END


--Pesquisas
ALTER PROCEDURE [dbo].[Pesquisas] 
	@Opcao int,
	@nucleoID nchar(10) = NULL,
	@tema nchar(100) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF (@Opcao =1)
		--1-Obras em geral
		BEGIN 
		SELECT * FROM Obras;
		END
		--2-Obras por assunto
	ELSE IF (@Opcao =2) 
		BEGIN
		SELECT * FROM Obras WHERE Assunto = @tema;
		END
		--3-Por nucleo
	ELSE IF (@Opcao =3) 
		BEGIN
		SELECT NucleosObras.NucleoID, Obras.Nome, NucleosObras.Copias FROM NucleosObras INNER JOIN
						  Obras ON NucleosObras.ISBN = Obras.ISBN
		WHERE  (NucleosObras.NucleoID = @nucleoID);
		END
	ELSE  RAISERROR ('Entrada invalida', 1, 1)
END

--4.1-
CREATE PROCEDURE Situacao
	@NucleoID nchar(10)
AS
BEGIN
	SELECT Obras.Nome AS Obra, Leitores.Nome AS Leitor, Datediff(day, Requisicoes.DataRequisicao, GETDATE()) as Dias,
CASE 
	WHEN (Datediff(day, DataRequisicao, GETDATE())>15) THEN  'Atraso'
	WHEN (Datediff(day, DataRequisicao, GETDATE())>12) THEN  'Devolução URGENTE'
	WHEN (Datediff(day, DataRequisicao, GETDATE())>10) THEN  'Devolver em breve'
	WHEN (Datediff(day, DataRequisicao, GETDATE())<=10) THEN  'Em dia'END AS Situacao
FROM   Requisicoes INNER JOIN
                  Obras ON Requisicoes.ISBN = Obras.ISBN INNER JOIN
                  Leitores ON Requisicoes.NIF = Leitores.NIF
WHERE (Requisicoes.NucleoID = @NucleoID) AND Requisicoes.DataDevolucao is null 
END
GO

--4.2----
CREATE PROCEDURE  Histotico
	 @NucleoID nchar(10) = NULL,
	 @DataInicio DATE = NULL,
	 @DataFim date = NULL
AS
BEGIN
	IF (@NucleoID IS NOT NULL AND @DataInicio IS NULL AND @DataFim IS NULL) --Pelo nucleo id
	BEGIN
		SELECT * FROM Requisicoes
		WHERE NucleoID = @NucleoID
	END
	ELSE IF (@NucleoID IS NULL AND @DataInicio IS NOT NULL AND @DataFim IS NULL) --pela data inicio 
	BEGIN
		SELECT * FROM Requisicoes
		WHERE DataRequisicao BETWEEN @DataInicio AND GETDATE();
	END
	ELSE IF (@NucleoID IS NULL AND @DataInicio IS NOT NULL AND @DataFim IS NOT NULL) --por ambas datas
	BEGIN
		SELECT * FROM Requisicoes
		WHERE DataRequisicao BETWEEN @DataInicio AND @DataFim;
	END
	ELSE IF (@NucleoID IS NOT NULL AND @DataInicio IS NOT NULL AND @DataFim IS NOT NULL) --pelos 3 parametros
	BEGIN
		SELECT * FROM Requisicoes
		WHERE NucleoID = @NucleoID And DataRequisicao BETWEEN @DataInicio AND @DataFim 
	END
	ELSE
		BEGIN 
			RAISERROR ('Insiro pelo menos um parametro de filtro',1,1)
		END
END

