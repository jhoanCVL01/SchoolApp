USE [master]
GO
/****** Object:  Database [deploytest]    Script Date: 28/11/2024 18:44:49 ******/
CREATE DATABASE [deploytest]
go
USE [deploytest]
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[CantidadCreditos] [int] NOT NULL,
	[IdProfesor] [int] NOT NULL,
	[IdProgramaAcademico] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Asignatura] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CicloEstudiantil]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CicloEstudiantil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[CreditosMaximos] [int] NOT NULL,
 CONSTRAINT [PK_CicloEstudiantil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entidad]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Nit] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Ciudad] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Entidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[NumeroIdentificacion] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Ciudad] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Celular] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[FechaVinculacion] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdProgramaAcademico] [int] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](100) NOT NULL,
	[Apellidos] [nvarchar](100) NOT NULL,
	[NumeroIdentificacion] [nvarchar](50) NOT NULL,
	[Direccion] [nvarchar](50) NOT NULL,
	[Ciudad] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Celular] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](50) NOT NULL,
	[FechaVinculacion] [date] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramaAcademico]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramaAcademico](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_ProgramaAcademico] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroEstudiantil]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroEstudiantil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEstudiante] [int] NOT NULL,
	[IdCicloEstudiantil] [int] NOT NULL,
	[IdAsignatura] [int] NOT NULL,
 CONSTRAINT [PK_RegistroEstudiantil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 28/11/2024 18:44:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[IdEstudiante] [int] NULL,
	[IdProfesor] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignatura] ON 
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (9, N'Programación Avanzada', N' Curso enfocado en técnicas avanzadas de programación en distintos lenguajes, como Java, C++ y Python. Se abordan conceptos como estructuras de datos y algoritmos.', 3, 7, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (10, N'Bases de Datos', N'Estudio de la creación, gestión y optimización de bases de datos relacionales y no relacionales, así como el uso de SQL y sistemas de gestión de bases de datos.', 3, 7, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (11, N'Sistemas Operativos', N'Introducción a la arquitectura y gestión de sistemas operativos, incluyendo la administración de procesos, memoria y almacenamiento.', 3, 8, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (12, N'Redes de Computadoras', N'Diseño y administración de redes de computadoras, protocolos de comunicación y seguridad en redes.', 3, 8, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (13, N'Desarrollo Web', N'Creación de aplicaciones web interactivas utilizando HTML, CSS, JavaScript y frameworks modernos como Angular o Reac', 3, 9, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (14, N'Ingeniería de Software', N'Métodos y herramientas para el diseño, desarrollo y mantenimiento de software de calidad, incluyendo metodologías ágiles y pruebas de software.', 3, 9, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (15, N'Inteligencia Artificial', N'Introducción a los algoritmos de IA, aprendizaje automático y sus aplicaciones en diferentes industrias.', 3, 10, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (16, N'Seguridad Informática', N'Principios de protección de sistemas, prevención de ataques cibernéticos y técnicas de criptografía', 3, 10, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (17, N'Análisis de Sistemas', N'Estudio de cómo analizar y optimizar los sistemas informáticos para satisfacer las necesidades organizacionales.', 3, 11, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (18, N'Arquitectura de Computadores', N'Diseño y funcionamiento de la arquitectura de hardware y su interacción con el software.', 3, 11, 1, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (19, N'Derecho Constitucional', N'Estudio de los principios fundamentales y estructuras de la constitución, así como los derechos y deberes de los ciudadanos.', 3, 12, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (20, N'Derecho Penal', N'Análisis de los delitos, sus elementos y las sanciones correspondientes, además de los principios del derecho penal.', 3, 12, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (21, N'Derecho Civil', N'Estudio de las normas que regulan las relaciones personales y patrimoniales de los individuos.', 3, 13, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (22, N'Derecho Laboral', N'Estudio de las leyes y normas que regulan la relación entre empleadores y empleados, derechos laborales y obligaciones.
', 3, 13, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (23, N'Derecho Internacional', N'Curso sobre las normas y principios que rigen las relaciones entre Estados y organizaciones internacionales.
', 3, 14, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (24, N'Derecho de Familia', N'Estudio de las normas que regulan el matrimonio, la filiación, la adopción y otros aspectos de la familia.', 3, 14, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (25, N'Derecho Administrativo', N'Análisis de la organización y funciones del sector público y las normas que regulan la relación entre la administración y los ciudadanos.', 3, 15, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (26, N'Teoría del Derecho', N'Reflexión sobre los conceptos y principios fundamentales que sustentan el sistema legal.', 3, 15, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (27, N'Derecho Mercantil', N'Estudio de las leyes que regulan las actividades comerciales y empresariales.', 3, 16, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (28, N'Práctica Judicial', N'Capacitación en procedimientos judiciales y la redacción de documentos legales.', 3, 16, 3, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (29, N'Teoría de la Administración', N'Introducción a las principales teorías de la administración y su aplicación en la gestión organizacional.', 3, 17, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (30, N'Contabilidad Financiera', N'Principios de la contabilidad para el registro, análisis e interpretación de la información financiera de la empresa.', 3, 17, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (31, N'Marketing Estratégico', N'Estudio de técnicas y estrategias para identificar y satisfacer las necesidades del mercado de manera eficaz.', 3, 18, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (32, N'Gestión de Recursos Humanos', N' Técnicas para la selección, capacitación y administración de personal en la organización.', 3, 18, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (33, N'Finanzas Corporativas', N'Análisis y gestión de los recursos financieros de la empresa para maximizar su rentabilidad y valor.', 3, 19, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (34, N'Economía de la Empresa', N' Estudio de los principios económicos aplicados a la toma de decisiones empresariales.', 3, 19, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (35, N'Gestión de Proyectos', N'Principios y técnicas de planificación, ejecución y control de proyectos en el entorno empresarial.', 3, 20, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (36, N'Ética Empresarial', N'Análisis de la responsabilidad ética y social de las empresas y sus impactos en la comunidad.', 3, 20, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (37, N'Análisis de Mercados', N'Métodos para evaluar la demanda, competencia y tendencias de los mercados.', 3, 21, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (38, N'Gestión de la Calidad', N'Implementación de sistemas de gestión de calidad para garantizar la excelencia de los productos y servicios.', 3, 21, 4, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (39, N'Anatomía Humana', N'Estudio de la estructura del cuerpo humano y sus sistemas.', 3, 22, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (40, N'Fisiología', N'Análisis de los procesos y funciones del cuerpo humano en estado de salud.', 3, 22, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (41, N'Farmacología', N'Estudio de los medicamentos, sus efectos, usos y mecanismos de acción en el organismo.', 3, 23, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (42, N'Bioquímica Médica', N'Análisis de los procesos químicos y biológicos en el cuerpo humano.', 3, 23, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (43, N'Patología', N'Estudio de las enfermedades y sus causas, diagnóstico y consecuencias.', 3, 24, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (44, N'Microbiología Médica', N'Estudio de microorganismos y su relación con enfermedades infecciosas', 3, 24, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (45, N'Cirugía General', N'Fundamentos y técnicas de procedimientos quirúrgicos básicos y avanzados.', 3, 25, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (46, N'Medicina Interna', N' Diagnóstico y tratamiento de enfermedades no quirúrgicas en adultos.', 3, 25, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (47, N'Ginecoobstetricia', N'Estudio de la salud de la mujer, embarazo, parto y postparto.', 3, 26, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (48, N'Psiquiatría', N'Estudio de los trastornos mentales y su tratamiento.', 3, 26, 5, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (49, N'Psicología General', N'Introducción a los principales conceptos y teorías de la psicología como ciencia.', 3, 27, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (50, N'Psicología del Desarrollo', N'Estudio de los cambios en el comportamiento humano a lo largo de la vida, desde la infancia hasta la adultez.', 3, 27, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (51, N'Psicología Clínica', N'Técnicas y teorías aplicadas en la evaluación y tratamiento de trastornos mentales y emocionales', 3, 28, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (53, N'Psicología Organizacional', N'Aplicación de principios psicológicos en el entorno laboral para mejorar la productividad y bienestar de los empleados.', 3, 28, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (54, N'Neuropsicología', N'Estudio de la relación entre el cerebro y el comportamiento humano.', 3, 29, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (55, N'Psicología Social', N'Análisis de cómo los individuos interactúan y son influenciados por su entorno social.', 3, 29, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (56, N'Psicometría', N'Técnicas de medición y evaluación de habilidades y características de la personalidad.', 3, 30, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (57, N'Intervención Psicológica', N'Métodos y técnicas para intervenir en situaciones de crisis y en procesos de cambio de comportamiento.', 3, 30, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (58, N'Psicología Educativa', N'Aplicación de la psicología al proceso de enseñanza-aprendizaje y el manejo de dificultades académicas.', 3, 31, 6, 1)
GO
INSERT [dbo].[Asignatura] ([Id], [Nombre], [Descripcion], [CantidadCreditos], [IdProfesor], [IdProgramaAcademico], [Estado]) VALUES (59, N'Ética en Psicología', N'Principios y normas éticas para el ejercicio de la profesión de psicólogo.', 3, 31, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Asignatura] OFF
GO
SET IDENTITY_INSERT [dbo].[CicloEstudiantil] ON 
GO
INSERT [dbo].[CicloEstudiantil] ([Id], [Nombre], [Descripcion], [Estado], [FechaInicio], [FechaFin], [CreditosMaximos]) VALUES (1, N'Ciclo 2024 -1 ', N'primer ciclo 2024', 1, CAST(N'2024-01-02' AS Date), CAST(N'2024-05-02' AS Date), 9)
GO
INSERT [dbo].[CicloEstudiantil] ([Id], [Nombre], [Descripcion], [Estado], [FechaInicio], [FechaFin], [CreditosMaximos]) VALUES (2, N'Ciclo 2024 -2 ', N'segundo ciclo 2024', 1, CAST(N'2024-06-02' AS Date), CAST(N'2024-12-02' AS Date), 9)
GO
INSERT [dbo].[CicloEstudiantil] ([Id], [Nombre], [Descripcion], [Estado], [FechaInicio], [FechaFin], [CreditosMaximos]) VALUES (3, N'Ciclo 2025 -1 ', N'Primer Ciclo 2025', 1, CAST(N'2025-01-01' AS Date), CAST(N'2025-06-01' AS Date), 9)
GO
SET IDENTITY_INSERT [dbo].[CicloEstudiantil] OFF
GO
SET IDENTITY_INSERT [dbo].[Entidad] ON 
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (1, N'Empresa', N'123456789', N'calle 123', N'bogota', N'317554654', N'test@mai.com', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (2, N'Empresa3', N'123456789', N'calle 123', N'bogota', N'317554654', N'test@mai.com', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (3, N'Empresa2', N'123456789', N'calle 123', N'bogota', N'317554654', N'test@mai.com', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (18, N'sadfsdaf', N'wqeqwe', N'23141234', N'1234', N'2314', N'12341234as@asd', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (22, N'cafam', N'78945463', N'calle 123', N'bogota', N'31456', N'123@asdasd', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (24, N'CERESCO', N'78945463', N'calle 73 A sur 80 i 34', N'Bogota', N'3173635692', N'test@mai.com', 1)
GO
INSERT [dbo].[Entidad] ([Id], [Nombre], [Nit], [Direccion], [Ciudad], [Telefono], [Correo], [Estado]) VALUES (25, N'Jonathan', N'101903402', N'dg 65 a # 34 b 54', N'Bogotá', N'3178566278', N'correo@correo.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Entidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Estudiante] ON 
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (13, N'ERIC', N'STEFAN', N'6384531', N'CR 43C 9 39 AP 605 TRASLAPLAZA ', N'MEDELLIN', N'3005971699', N'3005971699', N'redtimlin@gmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (14, N'MANUEL', N'PEREAARAQUE', N'1000395388', N'CL 105 CR 42B 52 IN 102 SANTA CRUZ ', N'MEDELLIN', N'3045582459', N'3045582459', N'johanaraque121@gmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (15, N'ALEJANDRA', N'ROJAS', N'1000746625', N'CR 39 39 SUR 70  ', N'BELLO', N'3023362587', N'3023362587', N'posada11521@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (16, N'MARIA CAMILA', N'PEREZPEREZ', N'1001370794', N'DG 75B 1 289  ', N'MEDELLIN', N'3144920970', N'3144920970', N'mcpp179@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (17, N'CARLOS RONALDO', N'ACOSTAVEGA', N'1001550664', N'CR 32B 16 48 PEREZ ', N'BELLO', N'3044024414', N'3044024414', N'consultoriascarlos0@gmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (18, N'MARIA ALEJANDRA', N'OSORIOMAZO', N'1017208197', N'CL 35 61 12 CENTRO COMERCIAL COMPLEX LOCAL 72 Y 73', N'ITAGUI', N'3016154961', N'3168782912', N'eternallove.med@gmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (19, N'JUAN ESTEBAN', N'RAIGOSALOPERA', N'1017218508', N'CR 75A 89 21  ', N'MEDELLIN', N'3005877551', N'3005877551', N'raigosa0210@gmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (20, N'LEIDY', N'VERA', N'1020411569', N'AV 19B 57 55  ', N'BELLO', N'3177700631', N'3177700631', N'leivero21@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 1)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (21, N'YEISON ANDRES', N'JIMENEZMONTOYA', N'71263186', N'CR 115 39 BC 56 SAN JAVIER ', N'MEDELLIN', N'4912012', N'3146364098', N'odontomedicascolombia@hotmail.com', CAST(N'2024-07-15' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (22, N'ERIC', N'STEFAN', N'6384531', N'CR 43C 9 39 AP 605 TRASLAPLAZA ', N'MEDELLIN', N'3005971699', N'3005971699', N'redtimlin@gmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (23, N'MANUEL', N'PEREAARAQUE', N'1000395388', N'CL 105 CR 42B 52 IN 102 SANTA CRUZ ', N'MEDELLIN', N'3045582459', N'3045582459', N'johanaraque121@gmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (24, N'ALEJANDRA', N'ROJAS', N'1000746625', N'CR 39 39 SUR 70  ', N'BELLO', N'3023362587', N'3023362587', N'posada11521@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (25, N'MARIA CAMILA', N'PEREZPEREZ', N'1001370794', N'DG 75B 1 289  ', N'MEDELLIN', N'3144920970', N'3144920970', N'mcpp179@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (26, N'CARLOS RONALDO', N'ACOSTAVEGA', N'1001550664', N'CR 32B 16 48 PEREZ ', N'BELLO', N'3044024414', N'3044024414', N'consultoriascarlos0@gmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (27, N'MARIA ALEJANDRA', N'OSORIOMAZO', N'1017208197', N'CL 35 61 12 CENTRO COMERCIAL COMPLEX LOCAL 72 Y 73', N'ITAGUI', N'3016154961', N'3168782912', N'eternallove.med@gmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (28, N'JUAN ESTEBAN', N'RAIGOSALOPERA', N'1017218508', N'CR 75A 89 21  ', N'MEDELLIN', N'3005877551', N'3005877551', N'raigosa0210@gmail.com', CAST(N'2024-07-16' AS Date), 1, 3)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (29, N'ERIC', N'STEFAN', N'6384531', N'CR 43C 9 39 AP 605 TRASLAPLAZA ', N'MEDELLIN', N'3005971699', N'3005971699', N'redtimlin@gmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (30, N'MANUEL', N'PEREAARAQUE', N'1000395388', N'CL 105 CR 42B 52 IN 102 SANTA CRUZ ', N'MEDELLIN', N'3045582459', N'3045582459', N'johanaraque121@gmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (31, N'ALEJANDRA', N'ROJAS', N'1000746625', N'CR 39 39 SUR 70  ', N'BELLO', N'3023362587', N'3023362587', N'posada11521@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (32, N'MARIA CAMILA', N'PEREZPEREZ', N'1001370794', N'DG 75B 1 289  ', N'MEDELLIN', N'3144920970', N'3144920970', N'mcpp179@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (33, N'CARLOS RONALDO', N'ACOSTAVEGA', N'1001550664', N'CR 32B 16 48 PEREZ ', N'BELLO', N'3044024414', N'3044024414', N'consultoriascarlos0@gmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (34, N'MARIA ALEJANDRA', N'OSORIOMAZO', N'1017208197', N'CL 35 61 12 CENTRO COMERCIAL COMPLEX LOCAL 72 Y 73', N'ITAGUI', N'3016154961', N'3168782912', N'eternallove.med@gmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (35, N'JUAN ESTEBAN', N'RAIGOSALOPERA', N'1017218508', N'CR 75A 89 21  ', N'MEDELLIN', N'3005877551', N'3005877551', N'raigosa0210@gmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (36, N'LEIDY', N'VERA', N'1020411569', N'AV 19B 57 55  ', N'BELLO', N'3177700631', N'3177700631', N'leivero21@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 4)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (37, N'ERIC', N'STEFAN', N'6384531', N'CR 43C 9 39 AP 605 TRASLAPLAZA ', N'MEDELLIN', N'3005971699', N'3005971699', N'redtimlin@gmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (38, N'MANUEL', N'PEREAARAQUE', N'1000395388', N'CL 105 CR 42B 52 IN 102 SANTA CRUZ ', N'MEDELLIN', N'3045582459', N'3045582459', N'johanaraque121@gmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (39, N'ALEJANDRA', N'ROJAS', N'1000746625', N'CR 39 39 SUR 70  ', N'BELLO', N'3023362587', N'3023362587', N'posada11521@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (40, N'MARIA CAMILA', N'PEREZPEREZ', N'1001370794', N'DG 75B 1 289  ', N'MEDELLIN', N'3144920970', N'3144920970', N'mcpp179@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (41, N'CARLOS RONALDO', N'ACOSTAVEGA', N'1001550664', N'CR 32B 16 48 PEREZ ', N'BELLO', N'3044024414', N'3044024414', N'consultoriascarlos0@gmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (42, N'MARIA ALEJANDRA', N'OSORIOMAZO', N'1017208197', N'CL 35 61 12 CENTRO COMERCIAL COMPLEX LOCAL 72 Y 73', N'ITAGUI', N'3016154961', N'3168782912', N'eternallove.med@gmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (43, N'JUAN ESTEBAN', N'RAIGOSALOPERA', N'1017218508', N'CR 75A 89 21  ', N'MEDELLIN', N'3005877551', N'3005877551', N'raigosa0210@gmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (44, N'LEIDY', N'VERA', N'1020411569', N'AV 19B 57 55  ', N'BELLO', N'3177700631', N'3177700631', N'leivero21@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 5)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (45, N'BEATRIZ ELENA', N'GONZALEZRAMIREZ', N'43091199', N'CR 70 114 27  ', N'MEDELLIN', N'3103797629', N'3103797629', N'bgr1105@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (46, N'MARITZA DEL SOCORRO', N'LOPERARIOS', N'43095102', N'DG 42 F 34 38 FONTIDUEÑO ', N'BELLO', N'5879928', N'3015999257', N'eramoslopera@gmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (47, N'MARIA NIDIA', N'GIRALDO', N'43103884', N'CL 123 43 AA 43  ', N'MEDELLIN', N'521492', N'3002568393', N'nidiagiraldo267@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (48, N'GLORIA ELVIGIA', N'JIMIENEZHERRERA', N'43344929', N'CLL 79BB 96 05 INTERIOR 120 ', N'MEDELLIN', N'3126201563', N'', N'jimenezherreragloria1@gmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (49, N'GLORIA', N'MUNERA', N'43439805', N'CR 49B 26B 50 LA CABAÑA ', N'BELLO', N'3007735963', N'3007735963', N'ismanjaivir@gmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (50, N'BLANCA', N'VELASQUEZCASTAÑEDA', N'43498431', N'CIRCULAR 73 B 76 19 ED SIERRA FUERTE  ', N'MEDELLIN', N'3108413789', N'', N'blancavelasquezc@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (51, N'MARTHA', N'CERONRIVAS', N'43504527', N'CR 54 75 AA SUR 16 CASA 105  ', N'LA ESTRELLA', N'3104340088', N'3104340088', N'martha.ceron10@gmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
INSERT [dbo].[Estudiante] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado], [IdProgramaAcademico]) VALUES (52, N'ALEXANDRA', N'VELEZ', N'43521713', N'CLL 29 C  33  53  ', N'MEDELLIN', N'3012294131', N'3012294131', N'alexavro2009@hotmail.com', CAST(N'2024-07-16' AS Date), 1, 6)
GO
SET IDENTITY_INSERT [dbo].[Estudiante] OFF
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON 
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (7, N'DIEGO ALEXANER', N'LOPERAMUÑOZ', N'1026133235', N'CALLE 139 SUR # 52-25', N'CALDAS', N'4441200;0', N'3046712435', N'chelo.2177@hotmai.com', CAST(N'2024-02-20' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (8, N'SILVIO JOSE', N'ZABALETAVILLARUEL', N'1063563644', N'CALLE 86A # 39A-23', N'BOGOTA', N'4441200', N'3135569048', N'silviozabaleta@gmail.com', CAST(N'2024-02-20' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (9, N'DIEGO', N'FLOREZ', N'71269723', N'CALLE 10 #43-55', N'BOGOTA', N'7777777', N'3007777777', N'diego.florez@pisende.com.co', CAST(N'2024-02-20' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (10, N'ROBINSON JAVIER', N'AVILEZFUENTES', N'11105672', N'CRA 43 A # 39 A - 71', N'MEDELLIN', N'4441200', N'3137584375', N'robinavil82@gmail.com', CAST(N'2024-02-22' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (11, N'ROBERTO ENRRIQUE', N'GUTIERREZGOMEZ', N'98592838', N'CRA 28 # 29 - 145', N'BOGOTA', N'4441200', N'3017927549', N'gutierresroberto655@gmail.com', CAST(N'2024-02-22' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (12, N'NICOLAS MAURICIO', N'BARRERAPUERTA', N'1128387806', N'CALLE 98 D # 80 C - 31', N'MEDELLIN', N'4441200', N'3218773066', N'mauronal1128@gmail.com', CAST(N'2024-02-22' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (13, N'JULIAN UBEIMAR', N'OSORIOGIL', N'15454038', N'CRA 47 47 45', N'BOGOTA', N'5976129', N'3148575161', N'julianosorio3003@gmail.com', CAST(N'2024-02-28' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (14, N'RAMIRO', N'CONTRERASVIDAL', N'3363874', N'CALLE 44 A3 56-89', N'BOGOTA', N'5768900', N'3245678977', N'RAMIRO.3434@GMAIL.COM', CAST(N'2024-03-07' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (15, N'CAMILO', N'RESTREPORESTREPO', N'21431119', N'CALLE 34 32 45', N'AMALFI', N'5678990', N'3216789089', N'CAMILO.RESTREO@GMAIL.COM', CAST(N'2024-03-08' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (16, N'ROBERTO', N'TORREZGAVIRIA', N'156788900', N'CALLE 22 34 67', N'BARBOSA', N'2345678', N'3217899099', N'ROBERTO.4567@GMAIL.COM', CAST(N'2024-03-08' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (17, N'DIEGO MAURICIO', N'ARANGOCARDONA', N'1056775660', N'CALLE 77 F # 91B-50', N'MEDELLIN', N'4441200', N'3103530658', N'mauroarango_6@hotmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (18, N'JULIO CESAR', N'OTEROCORDERO', N'73155734', N'CALLE 79 # 86A-21', N'MEDELLIN', N'4441200', N'3215472968', N'juliocesarotero1968@hotmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (19, N'GILDARDO DE JESUS', N'SALAZARGOMEZ', N'98662343', N'CL 80 87A 63 ROBLEDO EL DIAMANTE', N'MEDELLIN', N'4419348', N'3113812097', N'gildardosalazar11@gmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (20, N'JHON STIVEN', N'MUÑOZVELASQUEZ', N'1128472737', N'CALLE 47 # 63-125 APT 406', N'COPACABANA', N'4441200', N'3104048731', N'stiven120816@gmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (21, N'WILMAR ALEXANDER', N'CARDONASILVA', N'3481910', N'DIAGONAL 45 # 31B-31', N'BOGOTA', N'4441200', N'3225423912', N'alcasi18@gmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (22, N'GERMAN ALONSO', N'GALEANOGALEANO', N'70421945', N'CARRERA 49 # 101-36', N'MEDELLIN', N'4441200', N'3217326621', N'17german.ag@gmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (23, N'CARLOS IGNACIO', N'CASTAÑEDAMUÑETON', N'98582526', N'AVENIDA 42 # 54-27', N'BELLO', N'4441200', N'3233333737', N'carloscasta3218@gmail.com', CAST(N'2024-03-17' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (24, N'MONICA', N'RINCON', N'43190922', N'CR 61 33 51', N'ITAGUI', N'3113725486;3113725486', N'3113725486', N'liderdetransporte@pisende.co', CAST(N'2024-05-15' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (25, N'FRANKLIN ALBEIRO', N'BENJUMEA', N'98542161', N'CR31AA 81A 45', N'BOGOTA', N'3024568392', N'3024568392', N'liderdetransporte@pisende.co', CAST(N'2024-05-15' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (26, N'JUAN CARLOS', N'FRANCO', N'98514416', N'CR 53 73 SUR 40', N'ITAGUI', N'3006466664', N'3006466664', N'liderdetransporte@pisende.co', CAST(N'2024-05-15' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (27, N'ANDRES FELIPE', N'CARDENASLUJAN', N'1017189435', N'CL 98C 85 16', N'MEDELLIN', N'3022495181', N'3022495181', N'LIDERDETRANSPORTE@PISENDE.CO', CAST(N'2024-05-15' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (28, N'DARI PATRICIA', N'BETANCUREPULVEDA', N'43802708', N'CALLE 27 A CRA 57 - 160', N'BELLO', N'3122544935', N'3122544935', N'LIDERDETRANSPOPRTE@PISENDE.CO', CAST(N'2024-05-20' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (29, N'JUAN FELIPE', N'MARINYEPEZ', N'1035857566', N'CR 14 12A 60', N'GIRARDOTA', N'3148754841', N'3148754841', N'TRANSPORTES@PISENDE.CO', CAST(N'2024-05-21' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (30, N'GIOVANY ALBERTO', N'SOSASOSA', N'71708498', N'CR47 93 34', N'MEDELLIN', N'3006741611', N'3006741611', N'TRANSPORTES@PISENDE.CO', CAST(N'2024-05-21' AS Date), 1)
GO
INSERT [dbo].[Profesor] ([Id], [Nombres], [Apellidos], [NumeroIdentificacion], [Direccion], [Ciudad], [Telefono], [Celular], [Correo], [FechaVinculacion], [Estado]) VALUES (31, N'ELENA', N'CARVAJALCRUZ', N'43753537', N'CALLE 64E #116A 90', N'MEDELLIN', N'3243481892', N'3243481892', N'TRANSPORTES@PISENDE.CO', CAST(N'2024-05-21' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Profesor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramaAcademico] ON 
GO
INSERT [dbo].[ProgramaAcademico] ([Id], [Nombre], [Descripcion], [Estado]) VALUES (1, N' Ingeniería de Sistemas y Computación', N'Este programa forma profesionales capaces de diseñar, desarrollar, implementar y gestionar soluciones tecnológicas mediante el uso de software y hardware. Los estudiantes adquieren habilidades en programación, bases de datos, inteligencia artificial y gestión de proyectos informáticos', 1)
GO
INSERT [dbo].[ProgramaAcademico] ([Id], [Nombre], [Descripcion], [Estado]) VALUES (3, N'Derecho', N'Este programa prepara a los estudiantes para interpretar y aplicar las leyes en diversos contextos, como el derecho civil, penal, laboral y administrativo. Los futuros abogados desarrollan habilidades de análisis crítico, argumentación jurídica y resolución de conflictos', 1)
GO
INSERT [dbo].[ProgramaAcademico] ([Id], [Nombre], [Descripcion], [Estado]) VALUES (4, N'Administración de Empresas', N'Forma profesionales con conocimientos en gestión de recursos, liderazgo y estrategias organizacionales. Los estudiantes aprenden sobre marketing, finanzas, recursos humanos y economía para dirigir empresas de manera eficiente y sostenible', 1)
GO
INSERT [dbo].[ProgramaAcademico] ([Id], [Nombre], [Descripcion], [Estado]) VALUES (5, N'Medicina', N'Este programa se centra en formar médicos generales que puedan diagnosticar, tratar y prevenir enfermedades. Incluye conocimientos de anatomía, fisiología, farmacología y prácticas clínicas, preparando a los estudiantes para atender la salud integral de los pacientes', 1)
GO
INSERT [dbo].[ProgramaAcademico] ([Id], [Nombre], [Descripcion], [Estado]) VALUES (6, N'Psicología', N'Ofrece formación en el estudio del comportamiento humano y los procesos mentales. Los estudiantes adquieren herramientas para trabajar en áreas como psicología clínica, educativa, organizacional y social, ayudando a las personas a mejorar su bienestar emocional', 1)
GO
SET IDENTITY_INSERT [dbo].[ProgramaAcademico] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistroEstudiantil] ON 
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (12, 17, 1, 16)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (13, 29, 1, 16)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (14, 16, 1, 13)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (15, 16, 1, 11)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (16, 42, 1, 43)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (17, 14, 1, 12)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (18, 15, 1, 9)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (19, 15, 1, 11)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (20, 15, 1, 13)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (21, 15, 2, 10)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (22, 15, 2, 12)
GO
INSERT [dbo].[RegistroEstudiantil] ([Id], [IdEstudiante], [IdCicloEstudiantil], [IdAsignatura]) VALUES (23, 15, 2, 14)
GO
SET IDENTITY_INSERT [dbo].[RegistroEstudiantil] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 
GO
INSERT [dbo].[TipoUsuario] ([Id], [Nombre], [Descripcion]) VALUES (1, N'Administrador', N'Administrador del sistema')
GO
INSERT [dbo].[TipoUsuario] ([Id], [Nombre], [Descripcion]) VALUES (2, N'Anonimo', N'Usuario para consultas')
GO
INSERT [dbo].[TipoUsuario] ([Id], [Nombre], [Descripcion]) VALUES (3, N'Estudiante', N'Rol Estudiantes')
GO
INSERT [dbo].[TipoUsuario] ([Id], [Nombre], [Descripcion]) VALUES (4, N'Profesor', N'Rol Profesor')
GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([Id], [Username], [Password], [IdTipoUsuario], [IdEstudiante], [IdProfesor]) VALUES (1, N'admin', N'admin', 1, NULL, NULL)
GO
INSERT [dbo].[Usuario] ([Id], [Username], [Password], [IdTipoUsuario], [IdEstudiante], [IdProfesor]) VALUES (2, N'anonym', N'admin', 2, NULL, NULL)
GO
INSERT [dbo].[Usuario] ([Id], [Username], [Password], [IdTipoUsuario], [IdEstudiante], [IdProfesor]) VALUES (18, N'student', N'admin', 3, 15, NULL)
GO
INSERT [dbo].[Usuario] ([Id], [Username], [Password], [IdTipoUsuario], [IdEstudiante], [IdProfesor]) VALUES (19, N'teacher', N'admin', 4, NULL, 7)
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([Id])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_Asignatura_Profesor]
GO
ALTER TABLE [dbo].[Asignatura]  WITH CHECK ADD  CONSTRAINT [FK_Asignatura_ProgramaAcademico] FOREIGN KEY([IdProgramaAcademico])
REFERENCES [dbo].[ProgramaAcademico] ([Id])
GO
ALTER TABLE [dbo].[Asignatura] CHECK CONSTRAINT [FK_Asignatura_ProgramaAcademico]
GO
ALTER TABLE [dbo].[Estudiante]  WITH CHECK ADD  CONSTRAINT [FK_Estudiante_ProgramaAcademico] FOREIGN KEY([IdProgramaAcademico])
REFERENCES [dbo].[ProgramaAcademico] ([Id])
GO
ALTER TABLE [dbo].[Estudiante] CHECK CONSTRAINT [FK_Estudiante_ProgramaAcademico]
GO
ALTER TABLE [dbo].[RegistroEstudiantil]  WITH CHECK ADD  CONSTRAINT [FK_RegistroEstudiantil_Asignatura] FOREIGN KEY([IdAsignatura])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[RegistroEstudiantil] CHECK CONSTRAINT [FK_RegistroEstudiantil_Asignatura]
GO
ALTER TABLE [dbo].[RegistroEstudiantil]  WITH CHECK ADD  CONSTRAINT [FK_RegistroEstudiantil_CicloEstudiantil] FOREIGN KEY([IdCicloEstudiantil])
REFERENCES [dbo].[CicloEstudiantil] ([Id])
GO
ALTER TABLE [dbo].[RegistroEstudiantil] CHECK CONSTRAINT [FK_RegistroEstudiantil_CicloEstudiantil]
GO
ALTER TABLE [dbo].[RegistroEstudiantil]  WITH CHECK ADD  CONSTRAINT [FK_RegistroEstudiantil_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([Id])
GO
ALTER TABLE [dbo].[RegistroEstudiantil] CHECK CONSTRAINT [FK_RegistroEstudiantil_Estudiante]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Estudiante] FOREIGN KEY([IdEstudiante])
REFERENCES [dbo].[Estudiante] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Estudiante]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Profesor] FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[Profesor] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Profesor]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
USE [master]
GO
ALTER DATABASE [deploytest] SET  READ_WRITE 
GO
