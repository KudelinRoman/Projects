USE [master]
GO
/****** Object:  Database [autoservis]    Script Date: 11.12.2020 3:48:52 ******/
CREATE DATABASE [autoservis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autoservis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autoservis.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'autoservis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\autoservis_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [autoservis] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autoservis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autoservis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autoservis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autoservis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autoservis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autoservis] SET ARITHABORT OFF 
GO
ALTER DATABASE [autoservis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autoservis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autoservis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autoservis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autoservis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autoservis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autoservis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autoservis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autoservis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autoservis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [autoservis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autoservis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autoservis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autoservis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autoservis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autoservis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autoservis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autoservis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [autoservis] SET  MULTI_USER 
GO
ALTER DATABASE [autoservis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autoservis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autoservis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autoservis] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [autoservis] SET DELAYED_DURABILITY = DISABLED 
GO
USE [autoservis]
GO
/****** Object:  User [user_Read]    Script Date: 11.12.2020 3:48:52 ******/
CREATE USER [user_Read] FOR LOGIN [user_Read] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Hozain]    Script Date: 11.12.2020 3:48:52 ******/
CREATE USER [Hozain] FOR LOGIN [Hozain] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Automehannik]    Script Date: 11.12.2020 3:48:52 ******/
CREATE USER [Automehannik] FOR LOGIN [Automeh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Administrator]    Script Date: 11.12.2020 3:48:52 ******/
CREATE USER [Administrator] FOR LOGIN [Administrir] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user_Read]
GO
/****** Object:  Table [dbo].[Automobils]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automobils](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[engine_capitacity] [real] NOT NULL,
	[engine_power] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[body] [int] NOT NULL,
	[engine] [int] NOT NULL,
	[VIN_code] [nvarchar](17) NOT NULL,
	[State_number] [nvarchar](9) NOT NULL,
 CONSTRAINT [PK_Automobils] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Automobils] UNIQUE NONCLUSTERED 
(
	[VIN_code] ASC,
	[State_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NULL,
	[discount] [int] NOT NULL,
	[phone_number] [nvarchar](11) NOT NULL,
	[passport] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Client] UNIQUE NONCLUSTERED 
(
	[passport] ASC,
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collaborators]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Collaborators](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[patronymic] [nvarchar](50) NULL,
	[address] [nvarchar](50) NOT NULL,
	[passport] [varchar](10) NOT NULL,
	[post] [int] NOT NULL,
	[phone_number] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Collaborators] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Collaborators] UNIQUE NONCLUSTERED 
(
	[passport] ASC,
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[brand] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marks]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[model] [int] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Models]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Oerdering_spares]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oerdering_spares](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[spares] [int] NOT NULL,
	[orderr] [int] NOT NULL,
 CONSTRAINT [PK_Oerdering_spares] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ordering_servuces]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordering_servuces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[collaborator] [int] NOT NULL,
	[service] [int] NOT NULL,
	[orderr] [int] NOT NULL,
 CONSTRAINT [PK_Ordering_servuces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orderr]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderr](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mileage] [int] NOT NULL,
	[date_order] [datetime] NOT NULL,
	[sum] [money] NOT NULL,
	[type_payment] [int] NOT NULL,
	[automobile] [int] NOT NULL,
	[client] [int] NOT NULL,
 CONSTRAINT [PK_Orderr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [money] NOT NULL,
	[guaratee] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spares]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spares](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[manufactur] [int] NOT NULL,
	[number] [int] NOT NULL,
	[date_of_delivery] [datetime] NOT NULL,
	[price] [money] NULL,
	[guarantee] [int] NULL,
 CONSTRAINT [PK_Spares] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_body]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_body](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type_body] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_engines]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_engines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Type_engines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_payment]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Type_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Автомобили]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Автомобили] AS
SELECT engine_capitacity as "Объем двигателя л", engine_power as "Мощьность двигателя лс", Marks.name as "Марка", Models.name as "Модель", Type_body.name as "Кузов", Type_engines.name as "Тип двигателя", VIN_code as "VIN-код", State_number as "Гос. номер"
FROM Automobils 
Inner join Marks on Marks.id = Automobils.mark
Inner join Models on Models.id = Marks.model
Inner join Type_body on Type_body.id = Automobils.body
Inner join Type_engines on Type_engines.id = Automobils.engine
GO
/****** Object:  View [dbo].[Заказ запчастей]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Заказ запчастей] AS
SELECT orderr as "№ заказа", Spares.name as "Наименование", Oerdering_spares.number as "Количество", Manufacturer.country as "Страна изготовитель", Manufacturer.brand as "Бренд"
FROM Oerdering_spares 
Inner join Spares on Spares.id = Oerdering_spares.spares
Inner join Manufacturer on Manufacturer.id = Spares.manufactur
GO
/****** Object:  View [dbo].[Заказ услуг]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Заказ услуг] AS
SELECT orderr as "№ заказа", Service.name as "Услуга", number as "Количество", CONCAT(Collaborators.surname, ' ', Collaborators.name, ' ', Collaborators.patronymic) as "Исполнитель", Post.name as "Должность"
FROM Ordering_servuces 
Inner join Service on Service.id = Ordering_servuces.service
Inner join Collaborators on Collaborators.id = Ordering_servuces.collaborator
Inner join Post on Post.id = Collaborators.post
GO
/****** Object:  View [dbo].[Заказ услуг Automih]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Заказ услуг Automih] AS
SELECT orderr as "№ заказа",CONCAT(Marks.name, ' ', Models.name, ' ', Automobils.engine_capitacity, 'л ', Type_engines.name, ' ', Automobils.State_number) as "Автомобиль", Service.name as "Услуга", number as "Количество", CONCAT(Collaborators.surname, ' ', Collaborators.name, ' ', Collaborators.patronymic) as "Исполнитель", Post.name as "Должность"
FROM Ordering_servuces 
Inner join Service on Service.id = Ordering_servuces.service
Inner join Collaborators on Collaborators.id = Ordering_servuces.collaborator
Inner join Post on Post.id = Collaborators.post
Inner join Orderr on Orderr.id = Ordering_servuces.orderr
Inner join Automobils on Automobils.id = Orderr.automobile
Inner join Type_engines on Type_engines.id = Automobils.engine
Inner join Marks on Marks.id = Automobils.mark
Inner join Models on Models.id = Marks.model
GO
/****** Object:  View [dbo].[Заказы]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Заказы] AS
SELECT Orderr.id as "№ заказа", CONCAT(Marks.name, ' ', Models.name, ' ', Automobils.engine_capitacity, 'л ', Type_engines.name, ' ', Automobils.State_number) as "Автомобиль", CONCAT(Client.surname, ' ', Client.name, ' ', Client.patronymic) as "Клиент",
	 Orderr.date_order as "Дата обращения", Orderr.mileage as "Пробег", Client.discount as "Скидка %", Type_payment.name as "Тип оплаты", Orderr.sum as "Сумма к оплате"
FROM Orderr 
Inner join Automobils on Automobils.id = Orderr.automobile
Inner join Type_engines on Type_engines.id = Automobils.engine
Inner join Marks on Marks.id = Automobils.mark
Inner join Models on Models.id = Marks.model
Inner join Client on Client.id = Orderr.client
Inner join Type_payment on Type_payment.id = Orderr.type_payment
GO
/****** Object:  View [dbo].[Марка-Модель]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Марка-Модель] AS
SELECT Marks.name as "Марка", Models.name as "Модель"
FROM Marks 
Inner join Models on Models.id = Marks.model
GO
/****** Object:  View [dbo].[Сотрудники]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Сотрудники] AS
SELECT surname as "Фамилия", [Collaborators].name as "Имя", patronymic as "Отчество", phone_number as "Номер телефона", Post.name as "Должность"
FROM Collaborators 
Inner join Post on Post.id = [Collaborators].post
GO
ALTER TABLE [dbo].[Automobils]  WITH CHECK ADD  CONSTRAINT [FK_Automobils_Marks] FOREIGN KEY([mark])
REFERENCES [dbo].[Marks] ([id])
GO
ALTER TABLE [dbo].[Automobils] CHECK CONSTRAINT [FK_Automobils_Marks]
GO
ALTER TABLE [dbo].[Automobils]  WITH CHECK ADD  CONSTRAINT [FK_Automobils_Type_body] FOREIGN KEY([body])
REFERENCES [dbo].[Type_body] ([id])
GO
ALTER TABLE [dbo].[Automobils] CHECK CONSTRAINT [FK_Automobils_Type_body]
GO
ALTER TABLE [dbo].[Automobils]  WITH CHECK ADD  CONSTRAINT [FK_Automobils_Type_engines] FOREIGN KEY([engine])
REFERENCES [dbo].[Type_engines] ([id])
GO
ALTER TABLE [dbo].[Automobils] CHECK CONSTRAINT [FK_Automobils_Type_engines]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [FK_Collaborators_Post] FOREIGN KEY([post])
REFERENCES [dbo].[Post] ([id])
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [FK_Collaborators_Post]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Models] FOREIGN KEY([model])
REFERENCES [dbo].[Models] ([id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Models]
GO
ALTER TABLE [dbo].[Oerdering_spares]  WITH CHECK ADD  CONSTRAINT [FK_Oerdering_spares_Orderr1] FOREIGN KEY([orderr])
REFERENCES [dbo].[Orderr] ([id])
GO
ALTER TABLE [dbo].[Oerdering_spares] CHECK CONSTRAINT [FK_Oerdering_spares_Orderr1]
GO
ALTER TABLE [dbo].[Oerdering_spares]  WITH CHECK ADD  CONSTRAINT [FK_Oerdering_spares_Spares] FOREIGN KEY([spares])
REFERENCES [dbo].[Spares] ([id])
GO
ALTER TABLE [dbo].[Oerdering_spares] CHECK CONSTRAINT [FK_Oerdering_spares_Spares]
GO
ALTER TABLE [dbo].[Ordering_servuces]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_servuces_Collaborators] FOREIGN KEY([collaborator])
REFERENCES [dbo].[Collaborators] ([id])
GO
ALTER TABLE [dbo].[Ordering_servuces] CHECK CONSTRAINT [FK_Ordering_servuces_Collaborators]
GO
ALTER TABLE [dbo].[Ordering_servuces]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_servuces_Orderr] FOREIGN KEY([orderr])
REFERENCES [dbo].[Orderr] ([id])
GO
ALTER TABLE [dbo].[Ordering_servuces] CHECK CONSTRAINT [FK_Ordering_servuces_Orderr]
GO
ALTER TABLE [dbo].[Ordering_servuces]  WITH CHECK ADD  CONSTRAINT [FK_Ordering_servuces_Service] FOREIGN KEY([service])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Ordering_servuces] CHECK CONSTRAINT [FK_Ordering_servuces_Service]
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD  CONSTRAINT [FK_Orderr_Automobils] FOREIGN KEY([automobile])
REFERENCES [dbo].[Automobils] ([id])
GO
ALTER TABLE [dbo].[Orderr] CHECK CONSTRAINT [FK_Orderr_Automobils]
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD  CONSTRAINT [FK_Orderr_Client] FOREIGN KEY([client])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Orderr] CHECK CONSTRAINT [FK_Orderr_Client]
GO
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD  CONSTRAINT [FK_Orderr_Type_payment] FOREIGN KEY([type_payment])
REFERENCES [dbo].[Type_payment] ([id])
GO
ALTER TABLE [dbo].[Orderr] CHECK CONSTRAINT [FK_Orderr_Type_payment]
GO
ALTER TABLE [dbo].[Spares]  WITH CHECK ADD  CONSTRAINT [FK_Spares_Manufacturer] FOREIGN KEY([manufactur])
REFERENCES [dbo].[Manufacturer] ([id])
GO
ALTER TABLE [dbo].[Spares] CHECK CONSTRAINT [FK_Spares_Manufacturer]
GO
ALTER TABLE [dbo].[Automobils]  WITH CHECK ADD  CONSTRAINT [FK_Automobils_State_number] CHECK  (([State_number] like '[АВЕКМНОРСТУХ][0-9][0-9][0-9][АВЕКМНОРСТУХ][АВЕКМНОРСТУХ][0-9][0-9][0-9]' OR [State_number] like '[АВЕКМНОРСТУХ][0-9][0-9][0-9][АВЕКМНОРСТУХ][АВЕКМНОРСТУХ][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Automobils] CHECK CONSTRAINT [FK_Automobils_State_number]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client__discount] CHECK  (([discount]>=(0) AND [discount]<=(30)))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client__discount]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client__passport] CHECK  ((len([passport])=(10)))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client__passport]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client__phone] CHECK  ((len([phone_number])=(11)))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client__phone]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client_name]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client_patronymic] CHECK  ((NOT [patronymic] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client_patronymic]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [CK__Client_surname] CHECK  ((NOT [surname] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [CK__Client_surname]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK__Collaborators__passport] CHECK  ((len([passport])=(10)))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK__Collaborators__passport]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK__Collaborators__phone] CHECK  ((len([phone_number])=(11)))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK__Collaborators__phone]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK__Collaborators_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK__Collaborators_name]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK__Collaborators_patronymic] CHECK  ((NOT [patronymic] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK__Collaborators_patronymic]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK__Collaborators_surname] CHECK  ((NOT [surname] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK__Collaborators_surname]
GO
ALTER TABLE [dbo].[Collaborators]  WITH CHECK ADD  CONSTRAINT [CK_Collaborators_phones] CHECK  ((NOT [phone_number] like '%[^0-9]%'))
GO
ALTER TABLE [dbo].[Collaborators] CHECK CONSTRAINT [CK_Collaborators_phones]
GO
ALTER TABLE [dbo].[Manufacturer]  WITH CHECK ADD  CONSTRAINT [CK__Manufacturer_country] CHECK  ((NOT [country] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Manufacturer] CHECK CONSTRAINT [CK__Manufacturer_country]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [CK__Post_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [CK__Post_name]
GO
ALTER TABLE [dbo].[Type_body]  WITH CHECK ADD  CONSTRAINT [CK__Type_body_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Type_body] CHECK CONSTRAINT [CK__Type_body_name]
GO
ALTER TABLE [dbo].[Type_engines]  WITH CHECK ADD  CONSTRAINT [CK__Type_engines_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Type_engines] CHECK CONSTRAINT [CK__Type_engines_name]
GO
ALTER TABLE [dbo].[Type_payment]  WITH CHECK ADD  CONSTRAINT [CK__Type_payment_name] CHECK  ((NOT [name] like '%[^а-яА-Я]%'))
GO
ALTER TABLE [dbo].[Type_payment] CHECK CONSTRAINT [CK__Type_payment_name]
GO
/****** Object:  StoredProcedure [dbo].[info_brand_spares]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[info_brand_spares](@brand nvarchar(50)) as
begin 
	select Spares.id, Spares.name, Spares.number, Spares.price, Spares.date_of_delivery, Spares.guarantee, Manufacturer.brand
	from Spares 
	Inner join Manufacturer on Manufacturer.id = Spares.manufactur
	where Manufacturer.brand = @brand;
end
GO
/****** Object:  StoredProcedure [dbo].[info_marks]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[info_marks](@marka nvarchar(50)) as
begin 
	select Marks.id, Marks.name, Models.name
	from Marks 
	Inner join Models on Models.id = Marks.model
	where Marks.name = @marka;
end
GO
/****** Object:  StoredProcedure [dbo].[info_order_date]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[info_order_date](@d1 date, @d2 date) as
begin 
	select Orderr.id, CONCAT(Client.surname, ' ', Client.name, ' ', Client.patronymic) as "Клиент", 
	CONCAT(Marks.name, ' ', Models.name, ' ', Automobils.engine_capitacity, 'л ', Type_engines.name, ' ', Automobils.State_number) as "Автомобиль", 
	Orderr.mileage as "Пробег", Orderr.date_order as "Дата заказа",
		 Orderr.type_payment as "Тип платежа", Orderr.sum as "Сумма"
	from Orderr 
	Inner join Automobils on Automobils.id = Orderr.automobile
	Inner join Type_engines on Type_engines.id = Automobils.engine
	Inner join Marks on Marks.id = Automobils.mark
	Inner join Models on Models.id = Marks.model
	Inner join Client on Client.id = Orderr.client
	Inner join Type_payment on Type_payment.id = Orderr.type_payment
	where Orderr.date_order between @d1 and @d2;
end
GO
/****** Object:  StoredProcedure [dbo].[info_service_order_by_number]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[info_service_order_by_number](@id_order int) as
begin 
	select Ordering_servuces.id as 'Артикул', Service.name as 'Наименование работы', 
			CONCAT(Collaborators.surname, ' ', Collaborators.name, ' ', Collaborators.patronymic) as 'Исполнитель',
			Service.guaratee as 'Гарантия км', Service.price as 'Цена', Ordering_servuces.number as 'Количество', 
			Client.discount as 'Скидка %',	
			(Service.price* Ordering_servuces.number*Client.discount/100) as 'Сумма скидки Р',
			(Service.price* Ordering_servuces.number*(100-Client.discount)/100) as 'Сумма'
	from Ordering_servuces 
	inner join Service on Service.id = Ordering_servuces.service
	inner join Collaborators on Collaborators.id = Ordering_servuces.collaborator
	inner join Orderr on Orderr.id = Ordering_servuces.orderr
	inner join Client on Client.id = Orderr.client
	where Ordering_servuces.orderr = @id_order
end
GO
/****** Object:  StoredProcedure [dbo].[info_spares_count]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[info_spares_count](@count int) as
begin 
	select Spares.id, Spares.name as "Наименование", Spares.number as "Количесво", Spares.price as "Цена", Spares.date_of_delivery as "Дата поставки",
		 Spares.guarantee as "Гарантия", Manufacturer.brand as "Бренд", Manufacturer.country as "Страна"
	from Spares 
	Inner join Manufacturer on Manufacturer.id = Spares.manufactur
	where Spares.number <= @count;
end
GO
/****** Object:  StoredProcedure [dbo].[info_sparesAutiservis_order_by_number]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[info_sparesAutiservis_order_by_number](@id_order int) as
begin 
	select Spares.id as 'Артикул запчасти (материала)',  Spares.name as 'Наименование запчасти (Материала)', 
			isnull(Spares.guarantee,0) as 'Гарантия, км', Spares.price as 'Цена', 
			Oerdering_spares.number as 'Количество', Client.discount as 'Скидка %',	
			(Spares.price* Oerdering_spares.number*Client.discount/100) as 'Сумма скидки Р',
			(Spares.price* Oerdering_spares.number*(100-Client.discount)/100) as 'Сумма Р'
	from Oerdering_spares 
	inner join Spares on Spares.id = Oerdering_spares.spares
	inner join Orderr on Orderr.id = Oerdering_spares.orderr
	inner join Client on Client.id = Orderr.client
	where Oerdering_spares.orderr = @id_order and isnull(Spares.price,0) <> 0 
end
GO
/****** Object:  StoredProcedure [dbo].[info_sparesClient_order_by_number]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[info_sparesClient_order_by_number](@id_order int) as
begin 
	select Spares.id as 'Артикул запчасти (материала)',  Spares.name as 'Наименование запчасти (Материала)', 
			Oerdering_spares.number as 'Количество'
	from Oerdering_spares 
	inner join Spares on Spares.id = Oerdering_spares.spares
	where Oerdering_spares.orderr = @id_order and isnull(Spares.price,0) = 0 and  isnull(Spares.guarantee, 0)=0
end
GO
/****** Object:  StoredProcedure [dbo].[info_SUM_order_date]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[info_SUM_order_date](@d1 date, @d2 date) as
begin 
	select SUM(Orderr.sum) as "Итоговая сумма за период"
	from Orderr 
	where Orderr.date_order between @d1 and @d2;
end
GO
/****** Object:  StoredProcedure [dbo].[Добавление марки]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Добавление марки](	@nameMarks nvarchar(50), 
										@nameModels nvarchar(50)) as
begin 
	IF NOT EXISTS ( SELECT 1 FROM Models WHERE name = @nameModels)
	BEGIN
		INSERT INTO Models (name) VALUES (@nameModels)
	END
	IF NOT EXISTS ( SELECT 1 FROM Marks WHERE name = @nameMarks 
					AND model = (Select id from Models Where name = @nameModels))
	BEGIN
		insert into Marks (name, model) 
		Values (@nameMarks, (Select id from Models Where name = @nameModels))
	END
end
GO
/****** Object:  StoredProcedure [dbo].[Поставка запчастей]    Script Date: 11.12.2020 3:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Поставка запчастей](	@name nvarchar(30), 
										@contry nvarchar(50), 
										@brand nvarchar(50),
										@number int,
										@price money,
										@guarantee int) as
begin 
--Проверяю наличие записи о производителе (Страна, Бренд)
	IF NOT EXISTS ( SELECT 1 FROM Manufacturer WHERE country = @contry AND brand = @brand )
	BEGIN
	--Если запись не найдена то добавляем ее
		INSERT INTO Manufacturer (country, brand) VALUES (@contry, @brand)
	END
	--Проверяем наличие записи о запчасти (название, производитель, прайс и гарантия)
	--Если отличается один атрибут то необходима новая запись
	IF NOT EXISTS ( SELECT 1 FROM Spares WHERE name = @name 
					AND manufactur = (Select id From Manufacturer Where country=@contry and brand = @brand) 
					AND isnull(price,0) = isnull(@price,0) AND isnull(guarantee,0) = isnull(@guarantee,0))
	BEGIN
	--Добавление записи о запчасти
		insert into Spares (name, manufactur,number, date_of_delivery, price , guarantee) 
		Values (@name, (Select id From Manufacturer Where country=@contry and brand = @brand),
				@number, GETDATE(), @price, @guarantee)
	END
	ELSE 
	BEGIN
	--Если запись была найдена то меняем у нее два параметра: количество и дата поставки
		update Spares
		SET number = number + @number,
			date_of_delivery = GETDATE()
		WHERE id =(SELECT id FROM Spares WHERE name = @name 
					AND manufactur = (Select id From Manufacturer Where country=@contry and brand = @brand) 
					AND isnull(price,0) = isnull(@price,0) AND isnull(guarantee,0) = isnull(@guarantee,0) );
	END
end
GO
USE [master]
GO
ALTER DATABASE [autoservis] SET  READ_WRITE 
GO
