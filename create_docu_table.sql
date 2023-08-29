USE [northwind]
GO

/****** Object:  Table [dbo].[Documentation]    Script Date: 1.11.2019 16.23.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Documentation](
	[DocumentationID] [int] IDENTITY(1,1) NOT NULL,
	[AvailableRoute] [nvarchar](200) NULL,
	[Method] [nvarchar](10) NULL,
	[Description] [nvarchar](2000) NULL,
	[Keycode] [nvarchar](10) NULL,
 CONSTRAINT [PK_Documentation] PRIMARY KEY CLUSTERED 
(
	[DocumentationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 70) ON [PRIMARY]
) ON [PRIMARY]
GO

--drop table Documentation