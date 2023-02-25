Create DataBase RevisaoSemestre5
Go
Use RevisaoSemestre5
Go


Create Table Aluno (
RA		int				not null,
Nome	varchar(100)	not null,
Idade	int				not null
Primary key(RA)
)
Go

Create Table Disciplina(
Codigo			int				not null,
Nome			varchar(80)		not null,
Carga_Horaria	int				not null
Primary Key(Codigo)
)
Go

Create Table Curso(
Codigo		int			not null,
Nome		varchar(50)	not null,
Area		int			not null
Primary Key(Codigo)
)
Go
Alter Table  Curso Alter Column Area varchar(50)

Create Table Titulacao(
Codigo		int			not null,
Titulo		varchar(40)	not null
Primary Key(Codigo)
)
Go
 
Create Table Professor (
Registro	int			 not null,
Nome		varchar(100) not null,
TitulacaoCodigo	int			 not null	
Primary Key(Registro)
Foreign Key (TitulacaoCodigo)
	References Titulacao(Codigo)
)
Go

Create Table Aluno_Disciplina(
AlunoRa				int		not null,
DisciplinaCodigo	int		not null
Primary Key (AlunoRa, DisciplinaCodigo)
Foreign Key(AlunoRa)
	References Aluno(RA),
Foreign Key(DisciplinaCodigo)
	References Disciplina(Codigo)
)
Go

Create Table Curso_Disciplina(
CursoCodigo			int		not null,
DisciplinaCodigo	int		not null
Primary Key(CursoCodigo, DisciplinaCodigo)
Foreign Key(CursoCodigo)
	References Curso(Codigo),
Foreign Key (DisciplinaCodigo)
	References Disciplina(Codigo)
)
Go

Create Table Disciplina_Professor(
DisciplinaCodigo		int		not null,
ProfessorRegistro		int		not null
Primary Key(DisciplinaCodigo, ProfessorRegistro)
Foreign Key(DisciplinaCodigo)
	References Disciplina(Codigo),
Foreign Key(ProfessorRegistro)
	References Professor(Registro)
)
Go

Insert Into Aluno Values 
(3416,	'DIEGO PIOVESAN DE RAMOS',	18),
(3423,	'LEONARDO MAGALHÃES DA ROSA',	17),
(3434,	'LUIZA CRISTINA DE LIMA MARTINELI',	20),
(3440,	'IVO ANDRÉ FIGUEIRA DA SILVA',	25),
(3443,	'BRUNA LUISA SIMIONI',	37),
(3448,	'THAÍS NICOLINI DE MELLO',	17),
(3457,	'LÚCIO DANIEL TÂMARA ALVES',	29),
(3459,	'LEONARDO RODRIGUES',	25),
(3465,	'ÉDERSON RAFAEL VIEIRA',	19),
(3466,	'DAIANA ZANROSSO DE OLIVEIRA',	21),
(3467,	'DANIELA MAURER',	23),
(3470,	'ALEX SALVADORI PALUDO',	42),
(3471,	'VINÍCIUS SCHVARTZ',	19),
(3472,	'MARIANA CHIES ZAMPIERI',	18),
(3482,	'EDUARDO CAINAN GAVSKI',	19),
(3483,	'REDNALDO ORTIZ DONEDA',	20),
(3499,	'MAYELEN ZAMPIERON',	22)

Insert Into Disciplina Values
(1,	'Laboratório de Banco de Dados',	80),
(2,	'Laboratório de Engenharia de Software',	80),
(3,	'Programação Linear e Aplicações',	80),
(4,	'Redes de Computadores',	80),
(5,	'Segurança da informação',	40),
(6,	'Teste de Software',	80),
(7,	'Custos e Tarifas Logísticas',	80),
(8,	'Gestão de Estoques',	40),
(9,	'Fundamentos de Marketing',	40),
(10,	'Métodos Quantitativos de Gestão',	80),
(11,	'Gestão do Tráfego Urbano',	80),
(12,	'Sistemas de Movimentação e Transporte',	40)

Insert Into Professor Values
(1111,	'Leandro',	2),
(1112,	'Antonio',	2),
(1113,	'Alexandre',	3),
(1114,	'Wellington',	2),
(1115,	'Luciano',	1),
(1116,	'Edson',	2),
(1117,	'Ana',	2),
(1118,	'Alfredo',	1),
(1119,	'Celio',	2),
(1120,	'Dewar',	3),
(1121,	'Julio',	1)

Insert Into Curso Values 
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil')

Insert Into Titulacao Values
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor')

Insert Into Aluno_Disciplina(DisciplinaCodigo, AlunoRa) Values 
(1,	3416),
(4,	3416),
(1,	3423),
(2,	3423),
(5,	3423),
(6,	3423),
(2,	3434),
(5,	3434),
(6,	3434),
(1,	3440),
(5,	3443),
(6,	3443),
(4,	3448),
(5,	3448),
(6,	3448),
(2,	3457),
(4,	3457),
(5,	3457),
(6,	3457),
(1,	3459),
(6,	3459),
(7,	3465),
(11,	3465),
(8,	3466),
(11,	3466),
(8,	3467),
(12,	3467),
(8,	3470),
(9,	3470),
(11,	3470),
(12,	3470),
(7,	3471),
(7,	3472),
(12,	3472),
(9,	3482),
(11,	3482),
(8,	3483),
(11,	3483),
(12,	3483),
(8,	3499)

Insert Into Disciplina_Professor Values
(1,	1111),
(2,	1112),
(3,	1113),
(4,	1114),
(5,	1115),
(6,	1116),
(7,	1117),
(8,	1118),
(9,	1117),
(10,	1119),
(11,	1120),
(12,	1121)

Insert Into Curso_Disciplina(DisciplinaCodigo, CursoCodigo) Values 
(1,	1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	2),
(8,	2),
(9,	2),
(10,2),
(11,2),
(12,2)

--Como fazer as listas de chamadas, com RA e nome por disciplina ?
Select Aluno.RA As ra, Aluno.Nome As Nome, Disciplina.Nome As Disciplina
From Aluno Inner Join Aluno_Disciplina
On Aluno.RA = Aluno_Disciplina.AlunoRa
Inner Join Disciplina
On Disciplina.Codigo = Aluno_Disciplina.DisciplinaCodigo
Order By Aluno.Nome

--Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores
--que as ministram
Select Disciplina.Nome, Professor.Nome
From Disciplina Inner Join Disciplina_Professor
On Disciplina.Codigo = Disciplina_Professor.DisciplinaCodigo
Inner Join Professor
On Professor.Registro = Disciplina_Professor.ProfessorRegistro

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o nome do curso
Select Disciplina.Nome, Curso.Nome
From Disciplina Inner Join Curso_Disciplina
On Disciplina.Codigo = Curso_Disciplina.Disciplinacodigo
Inner Join Curso
On Curso.Codigo = Curso_Disciplina.CursoCodigo

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne sua área
Select Disciplina.Nome, Curso.Area
From Disciplina Inner Join Curso_Disciplina
On Disciplina.Codigo = Curso_Disciplina.Disciplinacodigo
Inner Join Curso
On Curso.Codigo = Curso_Disciplina.CursoCodigo

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor 
--que a ministra
Select Disciplina.Nome, Titulacao.Titulo
From Disciplina Inner Join Disciplina_Professor
On Disciplina.Codigo = Disciplina_Professor.DisciplinaCodigo
Inner Join Professor
On Professor.Registro = Disciplina_Professor.ProfessorRegistro
Inner Join Titulacao
On Titulacao.Codigo = Professor.TitulacaoCodigo

--Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados 
--em cada uma delas
Select Disciplina.Nome, Count(Aluno_Disciplina.AlunoRa) As quantAlunos
From Aluno Inner Join Aluno_Disciplina
On Aluno.RA = Aluno_Disciplina.AlunoRa
Inner Join Disciplina
On Disciplina.Codigo = Aluno_Disciplina.DisciplinaCodigo
Group By Disciplina.Nome

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  
--Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados
 Select Case When Count(Aluno_Disciplina.AlunoRa)>4
		Then Disciplina.Nome
		End As Disciplina,
		Case When Count(Aluno_Disciplina.AlunoRa)>4
		Then Professor.Nome
		End As Professor
From Aluno_Disciplina Inner Join Disciplina
On Aluno_Disciplina.DisciplinaCodigo = Disciplina.Codigo
Inner Join Disciplina_Professor
On Disciplina.Codigo = Disciplina_Professor.DisciplinaCodigo
Inner Join Professor
On Professor.Registro = Disciplina_Professor.ProfessorRegistro
Group By Disciplina.Nome, Professor.Nome

--Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados 
--que ministram aula nele. A coluna de ve se chamar quantidade
Select Curso.Nome, Count(Distinct(Professor.Registro)) As quantidade
FRom Professor Inner Join Disciplina_Professor
On Professor.Registro = Disciplina_Professor.ProfessorRegistro
Inner Join Disciplina
On Disciplina.Codigo = Disciplina_Professor.DisciplinaCodigo
Inner Join Curso_Disciplina
On Curso_Disciplina.DisciplinaCodigo = Disciplina.Codigo
Inner Join Curso
On Curso.Codigo = Curso_Disciplina.CursoCodigo
Group By Curso.Nome