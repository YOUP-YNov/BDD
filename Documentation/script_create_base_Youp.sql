USE [Youp]
GO

/****** Object:  Table [dbo].[BLOG_Article]    Script Date: 28/10/2014 18:32:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Article](
	[Article_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Blog_id] [bigint] NOT NULL,
	[TitreArticle] [nvarchar](50) NOT NULL,
	[ImageChemin] [nvarchar](200) NULL,
	[ContenuArticle] [nvarchar](4000) NOT NULL,
	[Evenement_id] [bigint] NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL,
	[Actif] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Blog]    Script Date: 28/10/2014 18:32:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Blog](
	[Blog_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[TitreBlog] [nvarchar](50) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[Categorie_id] [bigint] NOT NULL,
	[Actif] [bit] NOT NULL,
	[Promotion] [bit] NOT NULL,
	[Theme_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Commentaire]    Script Date: 28/10/2014 18:32:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Commentaire](
	[Commentaire_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Article_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NULL,
	[ContenuCommentaire] [nvarchar](4000) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL,
	[Actif] [bit] NOT NULL,
 CONSTRAINT [PK_COmmentaire] PRIMARY KEY CLUSTERED 
(
	[Commentaire_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_HashTagArticle]    Script Date: 28/10/2014 18:32:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_HashTagArticle](
	[HashTagArticle_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Article_id] [bigint] NOT NULL,
	[Mots] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HashTagArticle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Like]    Script Date: 28/10/2014 18:32:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Like](
	[Like_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[Article_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Like_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Publicite]    Script Date: 28/10/2014 18:32:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Publicite](
	[Publicite_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Blog_id] [bigint] NOT NULL,
	[Largeur] [int] NOT NULL,
	[Hauteur] [int] NOT NULL,
	[ContenuPublicite] [nvarchar](4000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Publicite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Theme]    Script Date: 28/10/2014 18:32:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Theme](
	[Theme_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Couleur] [nvarchar](100) NOT NULL,
	[ImageChemin] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Theme_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[BLOG_Visite]    Script Date: 28/10/2014 18:32:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BLOG_Visite](
	[Visite_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Blog_Id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Visite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[CONNECT_Authentification]    Script Date: 28/10/2014 18:32:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CONNECT_Authentification](
	[Authentification_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[Token] [nvarchar](100) NULL,
	[DateValidation] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Authentification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[EVE_Etat]    Script Date: 28/10/2014 18:32:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EVE_Etat](
	[Etat_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Etat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[EVE_Evenement]    Script Date: 28/10/2014 18:32:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EVE_Evenement](
	[Evenement_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[LieuEvenement_id] [bigint] NOT NULL,
	[Categorie_id] [bigint] NOT NULL,
	[DateEvenement] [datetime] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NOT NULL,
	[DateFinInscription] [datetime] NOT NULL,
	[TitreEvenement] [nvarchar](50) NOT NULL,
	[DescriptionEvenement] [nvarchar](4000) NULL,
	[MinimumParticipant] [int] NULL,
	[MaximumParticipant] [int] NULL,
	[Statut] [nvarchar](50) NULL,
	[Prix] [money] NOT NULL,
	[Premium] [bit] NOT NULL,
	[DateMiseEnAvant] [datetime] NOT NULL,
	[Etat_id] [bigint] NOT NULL,
	[Nom] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Evenement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[EVE_EvenementPhoto]    Script Date: 28/10/2014 18:32:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EVE_EvenementPhoto](
	[EvenementPhoto_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[Adresse] [nvarchar](400) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EvenementPhoto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[EVE_HashTagEvenement]    Script Date: 28/10/2014 18:32:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EVE_HashTagEvenement](
	[HashTagEvenement_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[Mots] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HashTagEvenement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[EVE_LieuEvenement]    Script Date: 28/10/2014 18:32:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EVE_LieuEvenement](
	[LieuEvenement_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ville] [nvarchar](100) NOT NULL,
	[CodePostale] [nvarchar](10) NULL,
	[Adresse] [nvarchar](200) NOT NULL,
	[Longitude] [decimal](20, 10) NULL,
	[Latitude] [decimal](20, 10) NULL,
	[Pays] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LieuEvenement_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[FOR_Forum]    Script Date: 28/10/2014 18:32:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FOR_Forum](
	[Forum_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Forum_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[FOR_HashTagTopic]    Script Date: 28/10/2014 18:32:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FOR_HashTagTopic](
	[HashTagTopic_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Topic_id] [bigint] NOT NULL,
	[Mots] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HashTagTopic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[FOR_Message]    Script Date: 28/10/2014 18:32:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FOR_Message](
	[Message_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Topic_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[DatePoste] [datetime] NOT NULL,
	[ContenuMessage] [nvarchar](4000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[FOR_Sujet]    Script Date: 28/10/2014 18:32:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FOR_Sujet](
	[Sujet_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Forum_id] [bigint] NOT NULL,
	[Nom] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sujet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[FOR_Topic]    Script Date: 28/10/2014 18:32:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FOR_Topic](
	[Topic_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Sujet_id] [bigint] NOT NULL,
	[Nom] [nvarchar](200) NOT NULL,
	[DescriptifTopic] [nvarchar](500) NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[Resolu] [bit] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HC_Connexion]    Script Date: 28/10/2014 18:32:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HC_Connexion](
	[Connexion_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Device_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[DateConnexion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Connexion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HC_Device]    Script Date: 28/10/2014 18:32:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HC_Device](
	[Device_id] [bigint] IDENTITY(1,1) NOT NULL,
	[LibelleDevice] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Device_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HR_Historique]    Script Date: 28/10/2014 18:32:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HR_Historique](
	[Historique_id] [bigint] IDENTITY(1,1) NOT NULL,
	[MotsClefs] [nvarchar](200) NOT NULL,
	[Site_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Historique_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HR_Signaler]    Script Date: 28/10/2014 18:32:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HR_Signaler](
	[Signaler_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[TypeSignal_id] [bigint] NOT NULL,
	[NumeroSignale] [bigint] NOT NULL,
	[Raison] [nvarchar](500) NOT NULL,
	[Site_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Signaler_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HR_Site]    Script Date: 28/10/2014 18:32:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HR_Site](
	[Site_id] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeSite] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Site_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[HR_TypeSignal]    Script Date: 28/10/2014 18:32:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HR_TypeSignal](
	[TypeSignal_id] [bigint] IDENTITY(1,1) NOT NULL,
	[LibelleType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeSignal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Amis]    Script Date: 28/10/2014 18:32:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Amis](
	[Amis_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[UtilisateurAmi_id] [bigint] NOT NULL,
	[Valide] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Amis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Appreciation]    Script Date: 28/10/2014 18:32:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Appreciation](
	[Appreciation_id] [bigint] IDENTITY(1,1) NOT NULL,
	[UtilisateurNote_id] [bigint] NOT NULL,
	[UtilisateurCommente_id] [bigint] NOT NULL,
	[Commentaire] [nvarchar](200) NOT NULL,
	[Note] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Appreciation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Categorie]    Script Date: 28/10/2014 18:32:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Categorie](
	[Categorie_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Categorie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Question]    Script Date: 28/10/2014 18:32:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Question](
	[Question_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[Question] [nvarchar](400) NOT NULL,
	[DateQuestion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Utilisateur]    Script Date: 28/10/2014 18:32:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Utilisateur](
	[Utilisateur_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Pseudo] [nvarchar](50) NOT NULL,
	[MotDePasse] [nvarchar](100) NOT NULL,
	[DateInscription] [datetime] NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Sexe] [bit] NOT NULL,
	[AdresseMail] [nvarchar](100) NOT NULL,
	[DateNaissance] [datetime] NOT NULL,
	[Ville] [nvarchar](100) NULL,
	[CodePostal] [nvarchar](10) NULL,
	[PhotoChemin] [nvarchar](200) NULL,
	[Situation] [nvarchar](200) NULL,
	[Actif] [bit] NOT NULL,
	[Partenaire] [bit] NOT NULL,
	[Presentation] [nvarchar](500) NULL,
	[Metier] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Utilisateur_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Utilisateur_Aime_Categorie]    Script Date: 28/10/2014 18:32:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Utilisateur_Aime_Categorie](
	[Aime_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[Categorie_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Aime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Utilisateur_Invite_Evenement]    Script Date: 28/10/2014 18:32:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Utilisateur_Invite_Evenement](
	[Invite_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[UtilisateurPropose_id] [bigint] NOT NULL,
	[UtilisateurEstInvite_id] [bigint] NOT NULL,
	[DateInvite] [datetime] NOT NULL,
	[Repondu] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Invite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Utilisateur_Note_Evenement]    Script Date: 28/10/2014 18:32:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Utilisateur_Note_Evenement](
	[Notation_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[Commentaire] [int] NOT NULL,
	[Note] [int] NULL,
	[DateCommentaire] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Notation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Object:  Table [dbo].[UT_Utilisateur_Participe_Evenement]    Script Date: 28/10/2014 18:32:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UT_Utilisateur_Participe_Evenement](
	[Participe_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Evenement_id] [bigint] NOT NULL,
	[Utilisateur_id] [bigint] NOT NULL,
	[DateInscription] [datetime] NOT NULL,
	[DateAnnulation] [datetime] NOT NULL,
	[Annulation] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Participe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[BLOG_Article]  WITH CHECK ADD FOREIGN KEY([Blog_id])
REFERENCES [dbo].[BLOG_Blog] ([Blog_id])
GO

ALTER TABLE [dbo].[BLOG_Article]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[BLOG_Blog]  WITH CHECK ADD FOREIGN KEY([Categorie_id])
REFERENCES [dbo].[UT_Categorie] ([Categorie_id])
GO

ALTER TABLE [dbo].[BLOG_Blog]  WITH CHECK ADD FOREIGN KEY([Theme_id])
REFERENCES [dbo].[BLOG_Theme] ([Theme_id])
GO

ALTER TABLE [dbo].[BLOG_Blog]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[BLOG_Commentaire]  WITH CHECK ADD FOREIGN KEY([Article_id])
REFERENCES [dbo].[BLOG_Article] ([Article_id])
GO

ALTER TABLE [dbo].[BLOG_Commentaire]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[BLOG_HashTagArticle]  WITH CHECK ADD FOREIGN KEY([Article_id])
REFERENCES [dbo].[BLOG_Article] ([Article_id])
GO

ALTER TABLE [dbo].[BLOG_Like]  WITH CHECK ADD FOREIGN KEY([Article_id])
REFERENCES [dbo].[BLOG_Article] ([Article_id])
GO

ALTER TABLE [dbo].[BLOG_Like]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[BLOG_Publicite]  WITH CHECK ADD FOREIGN KEY([Blog_id])
REFERENCES [dbo].[BLOG_Blog] ([Blog_id])
GO

ALTER TABLE [dbo].[BLOG_Visite]  WITH CHECK ADD FOREIGN KEY([Blog_Id])
REFERENCES [dbo].[BLOG_Blog] ([Blog_id])
GO

ALTER TABLE [dbo].[BLOG_Visite]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[CONNECT_Authentification]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[EVE_Evenement]  WITH CHECK ADD FOREIGN KEY([Categorie_id])
REFERENCES [dbo].[UT_Categorie] ([Categorie_id])
GO

ALTER TABLE [dbo].[EVE_Evenement]  WITH CHECK ADD FOREIGN KEY([Etat_id])
REFERENCES [dbo].[EVE_Etat] ([Etat_id])
GO

ALTER TABLE [dbo].[EVE_Evenement]  WITH CHECK ADD FOREIGN KEY([LieuEvenement_id])
REFERENCES [dbo].[EVE_LieuEvenement] ([LieuEvenement_id])
GO

ALTER TABLE [dbo].[EVE_Evenement]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[EVE_EvenementPhoto]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[EVE_HashTagEvenement]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[FOR_HashTagTopic]  WITH CHECK ADD FOREIGN KEY([Topic_id])
REFERENCES [dbo].[FOR_Topic] ([Topic_id])
GO

ALTER TABLE [dbo].[FOR_Message]  WITH CHECK ADD FOREIGN KEY([Topic_id])
REFERENCES [dbo].[FOR_Topic] ([Topic_id])
GO

ALTER TABLE [dbo].[FOR_Message]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[FOR_Sujet]  WITH CHECK ADD FOREIGN KEY([Forum_id])
REFERENCES [dbo].[FOR_Forum] ([Forum_id])
GO

ALTER TABLE [dbo].[FOR_Topic]  WITH CHECK ADD FOREIGN KEY([Sujet_id])
REFERENCES [dbo].[FOR_Sujet] ([Sujet_id])
GO

ALTER TABLE [dbo].[FOR_Topic]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[HC_Connexion]  WITH CHECK ADD FOREIGN KEY([Device_id])
REFERENCES [dbo].[HC_Device] ([Device_id])
GO

ALTER TABLE [dbo].[HC_Connexion]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[HR_Historique]  WITH CHECK ADD FOREIGN KEY([Site_id])
REFERENCES [dbo].[HR_Site] ([Site_id])
GO

ALTER TABLE [dbo].[HR_Signaler]  WITH CHECK ADD FOREIGN KEY([Site_id])
REFERENCES [dbo].[HR_Site] ([Site_id])
GO

ALTER TABLE [dbo].[HR_Signaler]  WITH CHECK ADD FOREIGN KEY([TypeSignal_id])
REFERENCES [dbo].[HR_TypeSignal] ([TypeSignal_id])
GO

ALTER TABLE [dbo].[HR_Signaler]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Amis]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Amis]  WITH CHECK ADD FOREIGN KEY([UtilisateurAmi_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Appreciation]  WITH CHECK ADD FOREIGN KEY([UtilisateurNote_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Appreciation]  WITH CHECK ADD FOREIGN KEY([UtilisateurCommente_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Question]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[UT_Question]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Aime_Categorie]  WITH CHECK ADD FOREIGN KEY([Categorie_id])
REFERENCES [dbo].[UT_Categorie] ([Categorie_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Aime_Categorie]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Invite_Evenement]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Invite_Evenement]  WITH CHECK ADD FOREIGN KEY([UtilisateurPropose_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Invite_Evenement]  WITH CHECK ADD FOREIGN KEY([UtilisateurEstInvite_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Note_Evenement]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Note_Evenement]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Participe_Evenement]  WITH CHECK ADD FOREIGN KEY([Evenement_id])
REFERENCES [dbo].[EVE_Evenement] ([Evenement_id])
GO

ALTER TABLE [dbo].[UT_Utilisateur_Participe_Evenement]  WITH CHECK ADD FOREIGN KEY([Utilisateur_id])
REFERENCES [dbo].[UT_Utilisateur] ([Utilisateur_id])
GO


